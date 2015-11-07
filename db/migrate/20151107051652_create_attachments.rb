class CreateAttachments < ActiveRecord::Migration
  def change
    create_table :attachments do |t|
      t.integer :attachable_id
      t.type :attachable

      t.timestamps null: false
    end
  end
end
