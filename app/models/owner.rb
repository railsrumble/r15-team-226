class Owner < ActiveRecord::Base

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
  has_many :pets, dependent: :destroy
  has_many :attachments, :as => :attachable
  has_many :messages_as_sender, class_name: "Message", foreign_key: :sender_id
  has_many :messages_as_receiver, class_name: "Message", foreign_key: :receiver_id
  has_many :adoption_requests
  has_many :discussions, dependent: :destroy

  def messages
    (messages_as_sender.order('created_at desc') + messages_as_receiver.order('created_at desc')).sort_by(&:created_at).reverse!
  end

  def name_or_email
    (first_name && last_name)? (first_name + " " + last_name) : email
  end
end
