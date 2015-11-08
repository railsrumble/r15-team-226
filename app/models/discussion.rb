class Discussion < ActiveRecord::Base
  has_many :comments, :as => :commentable
  has_many :attachments, :as => :attachable, dependent: :destroy
  accepts_nested_attributes_for :attachments
  belongs_to :owner, class_name: 'Owner', foreign_key: :owner_id
  def self.get_discussions(params)
    pet_params = filtering_params(params)
    results = self.where(nil)
    pet_params.each do |key, value|
      results = results.where(key => value) if value.present?
    end
    results
  end
  def self.filtering_params(params)
    params.slice(:discussion_type, :breed)
  end
end
