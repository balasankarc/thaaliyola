class IssuingsController < ApplicationController
  before_action :set_issuing, only: [:show, :edit, :update, :destroy]

  # GET /issuings
  # GET /issuings.json
  def index
    @issuings = Issuing.all
  end

  # GET /issuings/1
  # GET /issuings/1.json
  def show
  end

  # GET /issuings/new
  def new
    @issuing = Issuing.new
  end

  # GET /issuings/1/edit
  def edit
  end

  # POST /issuings
  # POST /issuings.json
  def create
    @issuing = Issuing.new(issuing_params)

    respond_to do |format|
      if @issuing.save
        format.html { redirect_to @issuing, notice: 'Issuing was successfully created.' }
        format.json { render action: 'show', status: :created, location: @issuing }
      else
        format.html { render action: 'new' }
        format.json { render json: @issuing.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /issuings/1
  # PATCH/PUT /issuings/1.json
  def update
    respond_to do |format|
      if @issuing.update(issuing_params)
        format.html { redirect_to @issuing, notice: 'Issuing was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @issuing.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /issuings/1
  # DELETE /issuings/1.json
  def destroy
    @issuing.destroy
    respond_to do |format|
      format.html { redirect_to issuings_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_issuing
      @issuing = Issuing.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def issuing_params
      params.require(:issuing).permit(:book_id, :user_id)
    end
end
