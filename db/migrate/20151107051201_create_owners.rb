class CreateOwners < ActiveRecord::Migration
  def change
    create_table :owners do |t|
      t.string :first_name
      t.string :last_name
      t.string :email,              null: false, default: ""
      t.string :contact_number

      t.timestamps null: false
    end
  end
end
