class AdoptionRequestsController < ApplicationController
  before_action :set_adoption_request, only: [:show, :edit, :update, :destroy]

  # GET /adoption_requests
  # GET /adoption_requests.json
  def index
    @adoption_requests = AdoptionRequest.all
  end

  # GET /adoption_requests/1
  # GET /adoption_requests/1.json
  def show
  end

  # GET /adoption_requests/new
  def new
    @adoption_request = AdoptionRequest.new
    @adoption_request.build_pet
  end

  # GET /adoption_requests/1/edit
  def edit
  end

  # POST /adoption_requests
  # POST /adoption_requests.json
  def create
    @adoption_request = AdoptionRequest.new(adoption_request_params)

    respond_to do |format|
      if @adoption_request.save
        format.html { redirect_to adoption_requests_path, notice: 'Adoption request was successfully created.' }
        format.json { render :show, status: :created, location: @adoption_request }
      else
        format.html { render :new }
        format.json { render json: @adoption_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /adoption_requests/1
  # PATCH/PUT /adoption_requests/1.json
  def update
    respond_to do |format|
      if @adoption_request.update(adoption_request_params)
        format.html { redirect_to @adoption_request, notice: 'Adoption request was successfully updated.' }
        format.json { render :show, status: :ok, location: @adoption_request }
      else
        format.html { render :edit }
        format.json { render json: @adoption_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /adoption_requests/1
  # DELETE /adoption_requests/1.json
  def destroy
    @adoption_request.destroy
    respond_to do |format|
      format.html { redirect_to adoption_requests_url, notice: 'Adoption request was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_adoption_request
      @adoption_request = AdoptionRequest.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def adoption_request_params
      params.require(:adoption_request).permit(:owner_id, :pet_id, :status, pet_attributes: [:pet_type, :breed, :gender, :age, :name, :area, :color, :location, :owner_id, attachments_attributes: [:file]])
    end
end
