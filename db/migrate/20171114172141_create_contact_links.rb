class CreateContactLinks < ActiveRecord::Migration[5.1]
  def change
    create_table :contact_links do |t|

      t.timestamps
    end
    add_index :contact_links, :to_id
    add_index :contact_links, :from_id
    add_index :contact_links, [:to_id, :from_id], unique: true
  end
end
