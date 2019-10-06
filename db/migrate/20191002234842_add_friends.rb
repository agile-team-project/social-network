# frozen_string_literal: true

class AddFriends < ActiveRecord::Migration[5.2]
  def change
    create_table :friends do |t|
      t.integer :user_id
      t.integer :friend_id

      t.timestamps
    end
    add_index :friends, :user_id
    add_index :friends, :friend_id
  end
end
