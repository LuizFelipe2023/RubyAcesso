class AddIsAdminToUsers < ActiveRecord::Migration[8.1]
  def change
    add_column :users, :isAdmin, :boolean, default: false, null: false
  end
end
