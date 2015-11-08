class AdoptionResponsesController < ApplicationController
  before_action :set_adoption_response, only: [:show, :edit, :update, :destroy]

  # GET /adoption_responses
  # GET /adoption_responses.json
  def index
    @adoption_responses = AdoptionResponse.all
  end

  # GET /adoption_responses/1
  # GET /adoption_responses/1.json
  def show
  end

  # GET /adoption_responses/new
  def new
    @adoption_response = AdoptionResponse.new
  end

  # GET /adoption_responses/1/edit
  def edit
  end

  # POST /adoption_responses
  # POST /adoption_responses.json
  def create
    @adoption_request = AdoptionRequest.find(params[:adoption_request_id]) if params.has_key? 'adoption_request_id'
    @adoption_response = @adoption_request.adoption_responses.new(adoption_response_params) if params.has_key? 'adoption_request_id'
    respond_to do |format|
      if @adoption_response.save
        format.html { redirect_to @adoption_response, notice: 'Adoption response was successfully created.' }
        format.json { render :show, status: :created, location: @adoption_response }
        format.js
      else
        format.html { render :new }
        format.json { render json: @adoption_response.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /adoption_responses/1
  # PATCH/PUT /adoption_responses/1.json
  def update
    respond_to do |format|
      if @adoption_response.update(adoption_response_params)
        format.html { redirect_to @adoption_response, notice: 'Adoption response was successfully updated.' }
        format.json { render :show, status: :ok, location: @adoption_response }
      else
        format.html { render :edit }
        format.json { render json: @adoption_response.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /adoption_responses/1
  # DELETE /adoption_responses/1.json
  def destroy
    @adoption_response.destroy
    respond_to do |format|
      format.html { redirect_to adoption_responses_url, notice: 'Adoption response was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_adoption_response
      @adoption_response = AdoptionResponse.find(params[:id])

    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def adoption_response_params
      params.require(:adoption_response).permit(:adoption_request_id, :owner_id)
    end
end
