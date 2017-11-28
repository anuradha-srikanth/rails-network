class AddProfileIdToExperiences < ActiveRecord::Migration[5.1]
  def change
    add_column :experiences, :profile_id, :integer
  end
end
