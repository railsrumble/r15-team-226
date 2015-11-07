class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :subject
      t.text :content
      t.integer :sender_id
      t.integer :receiver_id
      t.boolean :read

      t.timestamps null: false
    end
  end
end
