class VolunteerId < ActiveRecord::Migration
  def up
    add_column :volunteers, :uniqueID, :string
  end
  def down
    remove_column :volunteers, :uniqueID, :string
  end
end
