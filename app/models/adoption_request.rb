class AdoptionRequest < ActiveRecord::Base
  belongs_to :owner
  belongs_to :pet
  has_many :comments, :as => :commentable
  has_many :adoption_responses, dependent: :destroy
  accepts_nested_attributes_for :pet
end
