class ReferenceId < ActiveRecord::Migration
  def up
    add_column :Reference, :uniqueID, :string
    add_column :Reference, :VolunteerId, :string
  end
  def down
    remove_column :Reference, :uniqueID, :string
    remove_column :Reference, :VolunteerId, :string
  end
end
