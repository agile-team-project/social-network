class AddPost < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.integer :user_id
      t.text :text
      t.integer :group_id
      t.string :photo
      t.string :video

      t.timestamps
    end
    add_index :posts, :user_id
    add_index :posts, :group_id
  end
end
