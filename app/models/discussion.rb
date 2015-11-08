class Discussion < ActiveRecord::Base
  has_many :comments, :as => :commentable
  has_many :attachments, :as => :attachable, dependent: :destroy
  accepts_nested_attributes_for :attachments
  belongs_to :owner, class_name: 'Owner', foreign_key: :owner_id
end
