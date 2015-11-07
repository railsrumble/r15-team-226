class Pet < ActiveRecord::Base
  belongs_to :owner
  has_many :attachments, :as => :attachable
  has_many :adoption_requests
end
