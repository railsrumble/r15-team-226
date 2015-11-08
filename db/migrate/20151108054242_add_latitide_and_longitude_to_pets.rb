class AddLatitideAndLongitudeToPets < ActiveRecord::Migration
  def change
    add_column :pets, :latitude, :string
    add_column :pets, :longitude, :string
  end
end
