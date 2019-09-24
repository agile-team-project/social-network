class AddGroup < ActiveRecord::Migration[5.2]
  def change
    create_table :groups do |t|
      t.string :name
      t.timestamps
    end
    create_table :groups_users do |t|
      t.integer :group_id
      t.integer :user_id
      t.timestamps
    end
    add_index :groups_users, :group_id
    add_index :groups_users, :user_id
  end
end
