class CreateAdoptionResponses < ActiveRecord::Migration
  def change
    create_table :adoption_responses do |t|
      t.integer :adoption_request_id
      t.integer :owner_id

      t.timestamps null: false
    end
  end
end
