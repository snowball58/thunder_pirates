class AddIndex < ActiveRecord::Migration
  def up
    add_index :volunteers, :date_modified
    add_index :references, :date_modified
    add_index :volunteers, :uniqueID
    add_index :references, :uniqueID
  end
  def down
    remove_index :volunteers, :date_modified
    remove_index :references, :date_modified
    remove_index :volunteers, :uniqueID
    remove_index :references, :uniqueID
  end
end
