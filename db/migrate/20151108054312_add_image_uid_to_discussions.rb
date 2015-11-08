class AddImageUidToDiscussions < ActiveRecord::Migration
  def change
    add_column :discussions, :image_uid, :string
  end
end
