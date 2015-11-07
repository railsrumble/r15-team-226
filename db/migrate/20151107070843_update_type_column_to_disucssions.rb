class UpdateTypeColumnToDisucssions < ActiveRecord::Migration
  def change
    change_table :disucssions do |t|
      t.rename :type, :disucssion_type
    end
  end
end
