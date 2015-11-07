class Message < ActiveRecord::Base
  belongs_to :sender, class_name: 'Owner',:foreign_key => "sender_id"
  belongs_to :receiver, class_name: 'Owner',:foreign_key => "receiver_id"
  has_many :attachments, :as => :attachable, dependent: :destroy
  accepts_nested_attributes_for :attachments
end
