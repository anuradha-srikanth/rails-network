class CreateContactLinks < ActiveRecord::Migration[5.1]
  def change
    create_table :contact_links do |t|

      t.timestamps
    end
  end
end
