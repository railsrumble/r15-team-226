class AddDefaultValueToReadAttribute < ActiveRecord::Migration
  def self.up
    change_column :messages, :read, :boolean, :default => false
  end
  def self.down
    change_column :messages, :read, :boolean
  end
end
