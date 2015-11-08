class AdoptionResponse < ActiveRecord::Base
  belongs_to :adoption_request
  belongs_to :owner
end
