class Message < ActiveRecord::Base
  belongs_to :sender, class_name: 'Owner',:foreign_key => "sender_id"
  belongs_to :receiver, class_name: 'Owner',:foreign_key => "receiver_id"
  has_many :attachments, :as => :attachable, dependent: :destroy
  accepts_nested_attributes_for :attachments


  def self.user_sent_walk_requests(current_owner)
    where(subject: 'Walk request', sender_id: current_owner.id)
  end


  def self.user_received_walk_requests(current_owner)
    where(subject: 'Walk request', receiver_id: current_owner.id)
  end
end
