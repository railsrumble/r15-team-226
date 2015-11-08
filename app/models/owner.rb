class Owner < ActiveRecord::Base

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
  has_many :pets, dependent: :destroy
  has_many :attachments, :as => :attachable
  has_many :messages_as_sender, class_name: "Message", foreign_key: :sender_id
  has_many :messages_as_receiver, class_name: "Message", foreign_key: :receiver_id
  dragonfly_accessor :image

  def messages
    self.messages_as_sender + self.messages_as_receiver
  end
  has_many :adoption_requests



  def name_or_email
    (first_name && last_name)? (first_name + " " + last_name) : email
  end
end
