class Pet < ActiveRecord::Base
  belongs_to :owner
  has_many :attachments, :as => :attachable
  has_many :adoption_requests
  accepts_nested_attributes_for :attachments

  #auto-fetch address
  reverse_geocoded_by :latitude, :longitude#, :address => :area
  after_validation :reverse_geocode

  def self.get_pets(pet_params)
    self.where(:breed => pet_params[:breed],:area => pet_params[:area], :pet_type => pet_params[:pet_type] )
  end

end
