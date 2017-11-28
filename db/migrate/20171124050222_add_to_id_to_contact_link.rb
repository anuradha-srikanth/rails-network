class AddToIdToContactLink < ActiveRecord::Migration[5.1]
  def change
    add_column :contact_links, :to_id, :integer
  end
end
