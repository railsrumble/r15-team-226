class DashboardController < ApplicationController
  before_action :authenticate_owner!, only: [:dashboard]
  layout 'application'
  def index
    render :index
  end

  def dashboard
    @current_owner_pets = current_owner.pets
    @current_owner_sent_walk_requests = Message.user_sent_walk_requests(current_owner)
    @current_owner_received_walk_requests = Message.user_received_walk_requests(current_owner)
  end


  def homepage
    render :layout => 'dashboard'

  end

  #Get Google map
  def find
    p "=======+PARAMS===IN === FIND==========="
    p params
    if params["location"].present?
      location = Geocoder.search(params["location"]).first
      @lat = location.geometry["location"]["lat"]
      @lng = location.geometry["location"]["lng"]
    end
    render :layout => 'find'
  end

  def get_current_user_location
    respond_to do |format|
			if Rails.env.production?
				geo_data = request.location
				geo_data = Geocoder.search(request.remote_ip).first if geo_data.blank?
			else
				if cookies["user_searching_address"]
					geo_data = Geocoder.search(cookies["user_searching_address"]).first
				else
          p "=====else====else========"
          #ip = request.remote_ip
          ip = request.ip
          ip =  ip == "127.0.0.1" ? "49.205.65.108" : ip
					geo_data = Geocoder.search(ip).first
          p "==========geo_data"
          p geo_data
				end
			end
			if geo_data.nil?
				geo_data = Geocoder.search("Hyderabad, India").first
			end
			coords = { "lattitude" => geo_data.latitude, "longitude" => geo_data.longitude, "address" => geo_data.address }
      p "=coords========================="
      p coords
			#session[:location] = [geo_data.city, geo_data.country_code].compact.join(', ')
			format.json { render json: coords.to_json }
		end
  end

end
