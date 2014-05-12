class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy]

  # GET /books
  # GET /books.json
  def index
    @books = Book.find(:all, :conditions =>['name LIKE ?', "%#{params[:begins]}%"])
    @notice=""
  end

  # GET /books/1
  # GET /books/1.json
  def show
  end

  # GET /books/new
  def new
    @book = Book.unscoped.new
    @book.authors.build
  end

  # GET /books/1/edit
  def edit
  end

  # POST /books
  # POST /books.json
  def create

=begin
      @parameters=book_params
      @parameters['serial']='tobegenerated' #TODO
      @author = @parameters['author']
      @books_by_author = Book.find(:all, :conditions => ["author= ?",@author])
      @book = Book.new(serial: "asdf",name: @parameters['name'],category: @parameters['category'],row: @parameters['row'],shelf: @parameters['shelf'])
      if @books_by_author.empty?
          @author_create = @book.author.build(:name => @author)
          @author.save
      end
=end
@book = Book.new(book_params)
@author = params[:book][:author][:name]
   respond_to do |format|
      if @book.save
 @author_exist=Author.find(:all, :conditions => ["name = ?",@author.to_s])

if @author_exist.empty?
    @notice="reached"
   @author_created=@book.authors.create(:name=>@author.to_s)
   @author_created.save
else
    @book.authors = @author_exist
end

@str=""
Author.all.each do |f|
   @str = @str+f.name
end

      
       format.html { redirect_to @book,notice:@str}
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
    @book.destroy
    respond_to do |format|
      format.html { redirect_to books_url }
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
