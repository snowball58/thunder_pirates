class VolunteerId < ActiveRecord::Migration
  def up
    add_column :Volunteer, :uniqueID, :string
  end
  def down
    remove_column :Volunteer, :uniqueID, :string
  end
end
