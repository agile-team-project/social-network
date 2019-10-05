# frozen_string_literal: true

class AddComment < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.string :photo
      t.text :text
      t.string :video
      t.integer :post_id
      t.integer :user_id
     # t.datetime :create_at, null: false
     # t.datetime :update_at, null: false
     # t.index ['post_id'], name: 'index_comments_on_post_id'
     # t.index ['user_id'], name: 'index_comments_on_user_id'
      t.timestamps
    end
    add_index :comments, :post_id
    add_index :comments, %i[user_id post_id]
    add_index :comments, :user_id
  end
end
