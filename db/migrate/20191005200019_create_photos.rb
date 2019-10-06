class CreatePhotos < ActiveRecord::Migration[5.2]
  def change
    create_table :photos do |t|

      t.text :text
      t.integer :user_id
      t.integer :post_id
      t.timestamps
end
  
      add_index :photos,  [:user_id, :post_id]
      add_index :photos,  :post_id

  end
end
