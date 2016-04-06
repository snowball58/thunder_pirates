class AddNofExperiencesToVolunteers < ActiveRecord::Migration
  def up
    add_column :volunteers, :NofExperiences, :integer
  end
  def down
    remove_column :volunteers, :NofExperiences, :integer
  end
end
