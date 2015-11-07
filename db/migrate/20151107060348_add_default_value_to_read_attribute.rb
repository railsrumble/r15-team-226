class AddDefaultValueToReadAttribute < ActiveRecord::Migration
  def change
    change_column :messages, :read, :boolean, :default => false
  end
end
