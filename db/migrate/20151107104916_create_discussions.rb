class CreateDiscussions < ActiveRecord::Migration
  def change
    create_table :discussions do |t|
      t.string :topic
      t.text :content
      t.string :discussion_type
      t.string :breed

      t.timestamps null: false
    end
  end
end
