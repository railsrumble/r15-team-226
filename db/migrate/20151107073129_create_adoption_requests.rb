class CreateAdoptionRequests < ActiveRecord::Migration
  def change
    create_table :adoption_requests do |t|
      t.references :owner, index: true, foreign_key: true
      t.references :pet, index: true, foreign_key: true
      t.string :status

      t.timestamps null: false
    end
  end
end
