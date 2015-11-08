class Comment < ActiveRecord::Base
  belongs_to :commentable, :polymorphic => true
  has_many :attachments, :as => :attachable
  belongs_to :user, :class_name => Owner
end
