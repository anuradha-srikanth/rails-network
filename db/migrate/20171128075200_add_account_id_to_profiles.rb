class AddAccountIdToProfiles < ActiveRecord::Migration[5.1]
  def change
    add_column :profiles, :account_id, :integer
  end
end
