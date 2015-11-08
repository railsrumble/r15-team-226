class AddImgeUidToOwners < ActiveRecord::Migration
  def change
    add_column :owners, :image_uid, :string
  end
end
