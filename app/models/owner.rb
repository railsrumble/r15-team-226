class Owner < ActiveRecord::Base
  has_many :pets, dependent: :destroy
  has_many :attachments, :as => :attachable
end
