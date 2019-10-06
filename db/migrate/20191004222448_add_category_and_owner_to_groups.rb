class AddCategoryAndOwnerToGroups < ActiveRecord::Migration[5.2]
  def change
    add_column :groups, :category, :string
    add_column :groups, :owner_id, :integer

  end
end
