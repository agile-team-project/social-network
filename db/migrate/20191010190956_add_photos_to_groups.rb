class AddPhotosToGroups < ActiveRecord::Migration[5.2]
  def change
    add_column :groups, :group_banner, :string
    add_column :groups, :group_avatar, :string
  end
end
