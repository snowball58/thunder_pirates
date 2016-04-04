class AddNofExperiencesToVolunteers < ActiveRecord::Migration
  def change
    add_column :volunteers, :NofExperiences, :integer
  end
end
