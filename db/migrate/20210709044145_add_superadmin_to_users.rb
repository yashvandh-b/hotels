class AddSuperadminToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :superadmin, :boolean, default: false
  end
end
