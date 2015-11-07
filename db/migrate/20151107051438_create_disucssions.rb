class CreateDisucssions < ActiveRecord::Migration
  def change
    create_table :disucssions do |t|
      t.string :topic
      t.text :content
      t.string :type
      t.string :breed

      t.timestamps null: false
    end
  end
end
