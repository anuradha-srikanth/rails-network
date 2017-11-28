class AddProfileIdToProjects < ActiveRecord::Migration[5.1]
  def change
    add_column :projects, :profile_id, :integer
  end
end
