class CreateLikes < ActiveRecord::Migration[5.0]
  def change
    create_table :likes do |t|
      t.integer :user_id, null: false
      t.integer :content_id, null: false
      t.index :user_id
      t.index :content_id
      t.index [:user_id, :content_id], unique: true
      t.timestamps
    end
  end
end
