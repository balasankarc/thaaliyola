class UsersController < ApplicationController
    include ApplicationHelper
    before_action :set_user, only: [:show, :edit, :update, :destroy,:password_reset, :reset_password, :issue, :return]

    # GET /users
    # GET /users.json
    def index
        @current_user=session[:user]
        if not @current_user.nil?
            if User.where('username = ?',@current_user).first.admin==true
                @users = User.all
            end
        end
    end

    def reset_password
        @oldpassword=params[:user][:currentpassword]
        @old_sha = Digest::SHA1.hexdigest(@oldpassword)
        if @old_sha!=@user.password
            @user.errors.add(:Error, " : Current Password Incorrect" )
            render "password_reset"

      else
            @newpassword = params[:user][:newpassword]
            @newpassword_confirmation = params[:user][:newpassword_confirmation]
            if @newpassword!=@newpassword_confirmation
                notice="Passwords donot match"
                signinnotice(notice)
            else            
                if @user.update_attribute(:password, Digest::SHA1.hexdigest(params[:user][:newpassword]))
                    notice="Password Updated"
                    signinnotice(notice)
                    redirect_to @user
                end
            end
        end
     end

    def sign_up
        @users = User.all
    end

    def sign_out
        session.delete(:user)
        notice="Logged Out Succesfully"
        signinnotice(notice)
        @currenturl=request.referrer
        respond_to do |format|
            format.html { redirect_to @currenturl,notice:notice}
        end
    end

    def success
    end

    def issue
        @book = Book.find(params[:user][:book][:id])
        if @book
            if not @user.books.where(:id=>@book.id).empty?
                notice="Book already issued"
                redirect_to @user, notice:notice
            else
           Issuing.create(:book=>@book, :user=>@user, :dateofissue=>DateTime.now(), :dateofreturn=>14.days.from_now) 
            respond_to do |format|
                notice="Book Issued"
            format.html { redirect_to @user,notice:notice}
            end
            end
        else
            notice="Book Not Found"
            redirect_to @user, notice:notice
        end
    end

    def return
         @book = Book.find(params[:user][:book][:id])
         @issuing = Issuing.where(:book_id=>@book.id, :user_id=>@user.id).first
        if @issuing
            @issuing.delete
            respond_to do |format|
                notice="Book Returned"
            format.html { redirect_to @user,notice:notice}
            end
        else
            notice="Book Not Found"
            redirect_to @user, notice:notice
        end
    end


    def login
    end
    def sign_in
        @username=params[:user][:username]
        @password=params[:user][:password]
        @sha_password = Digest::SHA1.hexdigest(@password)
        @currenturl=request.referrer
        @user=User.where('username LIKE ?',@username)
        if @user.empty?
            notice="Incorrect Username"
        else
            @pword=@user.first.password
            if @pword==@sha_password
                notice="Login Successful"
                session[:user]=@username
            else
                notice="Incorrect password"
            end
        end
        signinnotice(notice)
        respond_to do |format|
            format.html { redirect_to @currenturl,notice:notice }
            format.json { render action: 'show', status: :created, location: sign_in_path }
        end
    end

    # GET /users/1
    # GET /users/1.json
    def show
    end

    # GET /users/new
    def new
        @user = User.new
    end

    # GET /users/1/edit
    def edit
    end

    # POST /users
    # POST /users.json
    def create
        username=params[:user][:username]
        password=params[:user][:password]
        password_confirmation=params[:user][:password_confirmation]
        @sha_password = Digest::SHA1.hexdigest(password)
        @sha_password_confirmation = Digest::SHA1.hexdigest(password_confirmation)
        @parameters=user_params
        @parameters[:password]=@sha_password
        @parameters[:password_confirmation]=@sha_password_confirmation
        @user = User.new(@parameters)
            notice="User Succesfully Created"
            signinnotice(notice)
            if @user.save
puts "Errors = "
puts @user.errors.full_messages
                session[:user]=username
                puts "Session" + session[:user]
                redirect_to @user
            else
                respond_to do |format|
                format.html{render action: 'new'}
                format.html{render json: @user.errors, status: :unprocessable_entity }
                end
            end
    end

    # PATCH/PUT /users/1
    # PATCH/PUT /users/1.json
    def update
                respond_to do |format|
            if @user.update(user_params)
         notice="Details Saved"
        signinnotice(notice)
       format.html { redirect_to @user, notice:notice }
                format.json { head :no_content }
            else
                format.html { render action: 'edit' }
                format.json { render json: @user.errors, status: :unprocessable_entity }
            end
        end
    end

    # DELETE /users/1
    # DELETE /users/1.json
    def destroy
        @user.destroy
        session.delete(:user)
        respond_to do |format|
            format.html { redirect_to root_path }
            format.json { head :no_content }
        end
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
        @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
        params.require(:user).permit(:username, :password, :password_confirmation, :librarian, :admin, :admissionnumber, :address, :email, :phone, :name, :currentpassword, :newpassword, :newpassword_confirmation, :book, :profpic)
    end
end
