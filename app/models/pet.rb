class Pet < ActiveRecord::Base
  belongs_to :owner
  has_many :attachments, :as => :attachable
  has_many :adoption_requests
  accepts_nested_attributes_for :attachments

  #auto-fetch address
  geocoded_by  :area#, :latitude, :longitude #:address => :area
  #after_validation :reverse_geocode
  after_validation :geocode

  def self.get_pets(params)

    pet_params = filtering_params(params)
    results = self.where(nil)
    pet_params.each do |key, value|
      results = results.where(key => value) if value.present?
    end
    results
  end
  def self.filtering_params(params)
    params.slice(:pet_type, :breed, :color)
  end

end
