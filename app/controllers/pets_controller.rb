class PetsController < ApplicationController
  before_action :set_pet, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_owner!, only: [:new, :edit, :update, :destroy, :create]
  #before_filter :get_current_user_location, :only => [:new]

  # GET /pets
  # GET /pets.json
  def index
    @pets = params[:my_pets] ? current_owner.pets : Pet.all
  end

  # GET /pets/1
  # GET /pets/1.json
  def show
  end

  # GET /pets/new
  def new
    @pet = Pet.new
  end

  # GET /pets/1/edit
  def edit
  end

  # POST /pets
  # POST /pets.json
  def create
    p "======================"
    p pet_params
    @pet = Pet.new(pet_params)
    respond_to do |format|
      if @pet.save
        format.html { redirect_to owner_dashboard_path, notice: 'Pet was successfully created.' }
        format.json { render :show, status: :created, location: @pet }
      else
        format.html { render :new }
        format.json { render json: @pet.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pets/1
  # PATCH/PUT /pets/1.json
  def update
    respond_to do |format|
      if @pet.update(pet_params)
        format.html { redirect_to owner_dashboard_path, notice: 'Pet was successfully updated.' }
        format.json { render :show, status: :ok, location: @pet }
      else
        format.html { render :edit }
        format.json { render json: @pet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pets/1
  # DELETE /pets/1.json
  def destroy
    @pet.destroy
    respond_to do |format|
      format.html { redirect_to owner_dashboard_path, notice: 'Pet was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  #get pets in particular location
  def get_pets
  p "=================params=================="
  p params
  pets = {}
  #@pets = Pet.near(params["address"])
  #@pets = Pet.get_pets(params)
  #[current_user.latitude, current_user.longitude], 50, :order => :distance
  #pets = Pet.near([params["latitude"],params["longitude"]])
  pets = Pet.get_pets(params)
  p "======RESULT PETS++++++++++++++++++++"
  p pets
  p "=======count======="
  pet_image_urls = pets.collect{|p| p.attachments.first.try(:file_uid).to_s}
  pets_hash = ActiveSupport::JSON.decode pets.to_json(include: [:attachments])
  pets_hash.each_with_index do |pets_item, index|
			pets_item[:pet_image_url] = pet_image_urls[index]
  end
  r = get_location_name_exactly(params["latitude"],params["longitude"])
  respond_to do |format|
    #add latitude and longitude to result
			format.json { render json: {pets: pets_hash.to_json, location: r, lat: params["latitude"], lng: params["longitude"] } } #, lat: lat, lng: lng
		end
  end

  def get_location_name
    result = get_location_name_exactly("#{params[:lat]}","#{params[:lng]}")
    respond_to do |format|
      #add latitude and longitude to result
  			format.json { render json: {result: result.to_json} } #, lat: lat, lng: lng
  		end
  end

  def get_pet_details
    p "=========params================="
    p params
    result = Pet.find(params["id"])
    pet_image_url = result.attachments.first.try(:file).try(:url).to_s
    result = ActiveSupport::JSON.decode result.to_json(include: [:attachments])
    respond_to do |format|
      #add latitude and longitude to result
  			format.json { render json: {pet: result.to_json, image: pet_image_url} } #, lat: lat, lng: lng
  		end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pet
      @pet = Pet.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pet_params
      params.require(:pet).permit(:pet_type, :breed, :gender, :age, :name, :area, :color, :location, :owner_id, attachments_attributes: [:file])
    end

    def get_location_name_exactly(lat,lng)
      result = Geocoder.search([lat,lng])
      result[0].data["formatted_address"]
    end
end
