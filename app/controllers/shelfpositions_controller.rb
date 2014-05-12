class ShelfpositionsController < ApplicationController
  before_action :set_shelfposition, only: [:show, :edit, :update, :destroy]

  # GET /shelfpositions
  # GET /shelfpositions.json
  def index
    @shelfpositions = Shelfposition.all
  end

  # GET /shelfpositions/1
  # GET /shelfpositions/1.json
  def show
  end

  # GET /shelfpositions/new
  def new
    @shelfposition = Shelfposition.new
  end

  # GET /shelfpositions/1/edit
  def edit
  end

  # POST /shelfpositions
  # POST /shelfpositions.json
  def create
    @shelfposition = Shelfposition.new(shelfposition_params)

    respond_to do |format|
      if @shelfposition.save
        format.html { redirect_to @shelfposition, notice: 'Shelfposition was successfully created.' }
        format.json { render action: 'show', status: :created, location: @shelfposition }
      else
        format.html { render action: 'new' }
        format.json { render json: @shelfposition.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /shelfpositions/1
  # PATCH/PUT /shelfpositions/1.json
  def update
    respond_to do |format|
      if @shelfposition.update(shelfposition_params)
        format.html { redirect_to @shelfposition, notice: 'Shelfposition was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @shelfposition.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /shelfpositions/1
  # DELETE /shelfpositions/1.json
  def destroy
    @shelfposition.destroy
    respond_to do |format|
      format.html { redirect_to shelfpositions_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shelfposition
      @shelfposition = Shelfposition.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def shelfposition_params
      params.require(:shelfposition).permit(:book_id, :shelf_id)
    end
end
