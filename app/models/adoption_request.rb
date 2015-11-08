class AdoptionRequest < ActiveRecord::Base
  belongs_to :owner
  belongs_to :pet
  has_many :comments, :as => :commentable
  has_many :adoption_responses, dependent: :destroy
  accepts_nested_attributes_for :pet


  def created_by_current_owner?(current_owner)
    owner == current_owner
  end

  def accepted?
    status == "Accepted" ? true : false
  end
end
