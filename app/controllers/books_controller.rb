class BooksController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, :with => :not_found
    def not_found
        render :template=>"/error/404_book.html.erb", :status=>404
    end

    before_action :set_book, only: [:show, :edit, :update, :destroy]
   
    # GET /books
    # GET /books.json
    def index        
        if params.has_key?(:begins)
            @books = Book.where('name LIKE ?',"#{params[:begins]}%")
        elsif params.has_key?(:contains)
            @books = Book.where("name LIKE ?", "%#{params[:contains]}%").paginate(page: params[:page], per_page: 5)
        else
            @books=Book.paginate(page: params[:page], per_page: 20)
        end
    end

    # GET /books/1
    # GET /books/1.json
    def show
    end

    # GET /books/new
    def new
        @book = Book.new
        @book.authors.build
        @book.categories.build
        @book.users.build
    end

    # GET /books/1/edit
    def edit
    end

    # POST /books
    # POST /books.json
    def create
        @language = params[:book][:language][:name]
        @language_exist = Language.where("name = ?",@language.to_s)
        if @language_exist.empty?
            @language_created=Language.new(:name=>@language.to_s)
            @book=@language_created.books.build(book_params)
            @language_created.save
        else
            @book=Book.new(book_params)
            @book.language=@language_exist.first
        end

        @authors = params[:book][:author][:name].to_s.split(";")
        @category = params[:book][:category][:name]
        respond_to do |format|
            if @book.save
                @authors.each do |author|
                @author_exist=Author.where("name = ?",author.to_s)

                if @author_exist.empty?
                    @author_created=@book.authors.create(:name=>author.to_s)
                    @author_created.save
                else
                    @book.authors<<@author_exist
                end
                end
                @category_exist = Category.where("name = ?",@category.to_s)
                if @category_exist.empty?
                    @category_created=@book.categories.create(:name=>@category.to_s)
                    @category_created.save
                else
                    @book.categories<<@category_exist
                end

                format.html { redirect_to @book,notice:"Book Succesfully Created",debugnotice:@debugnotice}
                format.json { render action: 'show', status: :created, location: @book }
            else
                format.html { render action: 'new' }
                format.json { render json: @book.errors, status: :unprocessable_entity }
            end
        end
    end

    # PATCH/PUT /books/1
    # PATCH/PUT /books/1.json
    def update
        @authors = params[:book][:author][:name].to_s.split(";")
        if params[:book][:author][:name]!=""
        Authorship.where(:book_id=>@book.id).each do |auth|
            auth.delete
        end
        else
            params[:book].delete(:author)
        end
        @authors.each do |author|
                @author_exist=Author.where("name = ?",author.to_s)

                if @author_exist.empty?
                    @author_created=@book.authors.create(:name=>author.to_s)
                    @author_created.save
                else
                    @book.authors<<@author_exist
                end
                end

        respond_to do |format|
            if @book.update(book_params)
                format.html { redirect_to @book, notice: 'Book was successfully updated.' }
                format.json { head :no_content }
            else
                format.html { render action: 'edit' }
                format.json { render json: @book.errors, status: :unprocessable_entity }
            end
        end
    end

    # DELETE /books/1
    # DELETE /books/1.json
    def destroy
        @str=""
        @book.authors.each do |a|
            if a.books.count == 1
                a.destroy
            end
        end
        @book.destroy
        respond_to do |format|
            format.html { redirect_to books_path,notice: @str }
            format.json { head :no_content }
        end
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_book
        @book = Book.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def book_params
        params.require(:book).permit(:serial, :name,:author,:category, :shelf, :row, :language, :id, :cover)
    end
end
