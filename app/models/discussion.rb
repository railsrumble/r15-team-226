class Discussion < ActiveRecord::Base
  has_many :comments, :as => :commentable
  has_many :attachments, dependent: :destroy
  accepts_nested_attributes_for :attachments
end
