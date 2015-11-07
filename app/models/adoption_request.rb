class AdoptionRequest < ActiveRecord::Base
  belongs_to :owner
  belongs_to :pet
  has_many :comments, :as => :commentable
end
