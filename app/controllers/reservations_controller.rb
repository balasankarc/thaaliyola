class ReservationsController < ApplicationController
  before_action :set_reservation, only: [:show, :edit, :update, :destroy]

  def reserve_book
      @book = Book.find(params[:book])
      @user = User.find(params[:user])
      @noofavailable = 0
      Book.where("bookunique = ?",@book.bookunique.to_s).each do |b|
          if Issuing.where("book_id = ?",b.id).empty?
              @noofavailable += 1
          end
      end
      if @noofavailable > 0
          Reservation.create(:book => @book, :user => @user, :available => true)
          notice = "Book available and reserved. You have 2 weeks to collect it before reservation expires"
      else
          notice = "Book not available but reserved. You will be notified via mail when it becomes available"
          Reservation.create(:book => @book, :user => @user, :available => false)
      end
      respond_to do |format|
        format.html { redirect_to @book,notice:notice}
      end
  end

  # GET /reservations
  # GET /reservations.json
  def index
    @reservations = Reservation.all
  end

  # GET /reservations/1
  # GET /reservations/1.json
  def show
  end

  # GET /reservations/new
  def new
    @reservation = Reservation.new
  end

  # GET /reservations/1/edit
  def edit
  end

  # POST /reservations
  # POST /reservations.json
  def create
    @book = Book.find(params[:book])
    puts "here:"
    puts @book.id
    @reservation = Reservation.new(reservation_params)

    respond_to do |format|
      if @reservation.save
        format.html { redirect_to @reservation, notice: 'Reservation was successfully created.' }
        format.json { render action: 'show', status: :created, location: @reservation }
      else
        format.html { render action: 'new' }
        format.json { render json: @reservation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reservations/1
  # PATCH/PUT /reservations/1.json
  def update
    respond_to do |format|
      if @reservation.update(reservation_params)
        format.html { redirect_to @reservation, notice: 'Reservation was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @reservation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reservations/1
  # DELETE /reservations/1.json
  def destroy
    @reservation.destroy
    respond_to do |format|
      format.html { redirect_to reservations_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reservation
      @reservation = Reservation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def reservation_params
      params.require(:reservation).permit(:user_id, :book_id)
    end
end
