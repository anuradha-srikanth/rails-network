class RemoveUsernameFromAccounts < ActiveRecord::Migration[5.1]
  def change
    remove_column :accounts, :username, :string
  end
end
