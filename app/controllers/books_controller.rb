class BooksController < ApplicationController
    before_action :set_book, only: [:show, :edit, :update, :destroy]

    # GET /books
    # GET /books.json
    def index
        @notice=""
        if params[:begins] == ""
            @books=Book.all
            @notice="No"
        else
            @books = Book.find(:all, :conditions =>['name LIKE ?', "#{params[:begins]}%"])
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
    end

    # GET /books/1/edit
    def edit
    end

    # POST /books
    # POST /books.json
    def create

        @book = Book.new(book_params)
        @author = params[:book][:author][:name]
        respond_to do |format|
            if @book.save
                @author_exist=Author.find(:all, :conditions => ["name = ?",@author.to_s])

                if @author_exist.empty?
                    @author_created=@book.authors.create(:name=>@author.to_s)
                    @author_created.save
                else
                    @book.authors = @author_exist
                end

                format.html { redirect_to @book,notice:"Book Succesfully Created"}
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
        params.require(:book).permit(:serial, :name, :category, :shelf, :row)
    end
end
