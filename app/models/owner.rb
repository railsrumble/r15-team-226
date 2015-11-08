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
  has_many :adoption_requests
  has_many :discussions, dependent: :destroy

  has_many :adoption_responses

  def messages
    #(messages_as_sender.order('created_at desc') + messages_as_receiver.order('created_at desc')).sort_by(&:created_at).reverse!
    @arel_message = Message.arel_table
    @messages ||= Message.includes(:sender, :receiver).where(@arel_message[:sender_id].eq(self.id).or(@arel_message[:receiver_id].eq(self.id)))
  end
  def conversation_users
    messages.collect{|m| (m.sender_id == self.id) ? m.receiver : m.sender }.uniq
  end

  def name_or_email
    (first_name && last_name)? (first_name + " " + last_name) : email
  end
  def conversations(user_id)
    messages.update_all(:read => true)
    messages.select{|m| m.sender_id == user_id || m.receiver_id == user_id}
  end


end
