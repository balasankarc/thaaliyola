class LanguagedivisionsController < ApplicationController
  before_action :set_languagedivision, only: [:show, :edit, :update, :destroy]

  # GET /languagedivisions
  # GET /languagedivisions.json
  def index
    @languagedivisions = Languagedivision.all
  end

  # GET /languagedivisions/1
  # GET /languagedivisions/1.json
  def show
  end

  # GET /languagedivisions/new
  def new
    @languagedivision = Languagedivision.new
  end

  # GET /languagedivisions/1/edit
  def edit
  end

  # POST /languagedivisions
  # POST /languagedivisions.json
  def create
    @languagedivision = Languagedivision.new(languagedivision_params)

    respond_to do |format|
      if @languagedivision.save
        format.html { redirect_to @languagedivision, notice: 'Languagedivision was successfully created.' }
        format.json { render action: 'show', status: :created, location: @languagedivision }
      else
        format.html { render action: 'new' }
        format.json { render json: @languagedivision.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /languagedivisions/1
  # PATCH/PUT /languagedivisions/1.json
  def update
    respond_to do |format|
      if @languagedivision.update(languagedivision_params)
        format.html { redirect_to @languagedivision, notice: 'Languagedivision was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @languagedivision.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /languagedivisions/1
  # DELETE /languagedivisions/1.json
  def destroy
    @languagedivision.destroy
    respond_to do |format|
      format.html { redirect_to languagedivisions_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_languagedivision
      @languagedivision = Languagedivision.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def languagedivision_params
      params.require(:languagedivision).permit(:book_id, :language_id)
    end
end
