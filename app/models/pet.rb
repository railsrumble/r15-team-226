class Pet < ActiveRecord::Base
  belongs_to :owner
  has_many :attachments, :as => :attachable
  has_many :adoption_requests
  accepts_nested_attributes_for :attachments

  #auto-fetch address
  geocoded_by  :area#, :latitude, :longitude #:address => :area
  #after_validation :reverse_geocode
  after_validation :geocode

  def self.get_pets(pet_params)
    
  end

end
