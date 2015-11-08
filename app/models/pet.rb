class Pet < ActiveRecord::Base
  belongs_to :owner
  has_many :attachments, :as => :attachable
  has_many :adoption_requests
  accepts_nested_attributes_for :attachments

end
