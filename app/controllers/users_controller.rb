class UsersController < ApplicationController
    include ApplicationHelper
  before_action :set_user, only: [:show, :edit, :update, :destroy]

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
    @username=params[:user][:username]
    @password=params[:user][:password]
    @sha_password = Digest::SHA1.hexdigest(@password)
    @parameters=user_params
    @parameters[:password]=@sha_password
    @user = User.new(@parameters)
    respond_to do |format|
      if @user.save
        session[:user]=@username
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render action: 'show', status: :created, location: @user }
      else
        format.html { render action: 'new' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
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
    respond_to do |format|
      format.html { redirect_to users_url }
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
      params.require(:user).permit(:username, :password, :librarian, :admin, :admissionnumber, :address, :email, :phone)
    end
end
