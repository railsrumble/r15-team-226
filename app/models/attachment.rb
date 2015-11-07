class Attachment < ActiveRecord::Base
  dragonfly_accessor :file
  belongs_to :attachable, :polymorphic => true
  has_many :comments, :as => :commentable
end
