class AddComment < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.string :photo
      t.text :text
      t.string :video
      t.integer :post_id
      t.timestamps
    end
    add_index :comments, :post_id
  end
end
