class AddAdminopToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :adminop, :string
  end
end
