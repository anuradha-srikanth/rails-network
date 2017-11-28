class AddFromIdToContactLink < ActiveRecord::Migration[5.1]
  def change
    add_column :contact_links, :from_id, :integer
  end
end
