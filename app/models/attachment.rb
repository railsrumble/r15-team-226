class Attachment < ActiveRecord::Base
  belongs_to :attachable, :polymorphic => true
  has_many :comments, :as => :commentable
end
