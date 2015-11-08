class Discussion < ActiveRecord::Base
  has_many :comments, :as => :commentable
  has_many :attachments, :as => :attachable, dependent: :destroy
  accepts_nested_attributes_for :attachments
  dragonfly_accessor :image
end
