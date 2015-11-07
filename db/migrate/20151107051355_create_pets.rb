class CreatePets < ActiveRecord::Migration
  def change
    create_table :pets do |t|
      t.string :type
      t.string :breed
      t.string :gender
      t.integer :age
      t.string :name
      t.text :area
      t.string :color
      t.text :location

      t.timestamps null: false
    end
  end
end
