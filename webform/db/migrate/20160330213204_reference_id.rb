class ReferenceId < ActiveRecord::Migration
  def up
    add_column :references, :uniqueID, :string
    add_column :references, :VolunteerId, :string
  end
  def down
    remove_column :references, :uniqueID, :string
    remove_column :references, :VolunteerId, :string
  end
end
