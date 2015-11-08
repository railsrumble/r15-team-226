class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


  def after_sign_in_path_for(resource)
    owner_dashboard_path
  end

  def after_sign_out_path_for(resource)
    root_path
  end

  private

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
