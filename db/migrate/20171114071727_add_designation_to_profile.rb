class AddDesignationToProfile < ActiveRecord::Migration[5.1]
  def change
    add_column :profiles, :designation, :string
  end
end
