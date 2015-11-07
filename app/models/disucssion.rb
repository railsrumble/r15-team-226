class Disucssion < ActiveRecord::Base
  has_many :comments, :as => :commentable
  has_many :attachments, :as => :attachable
end
