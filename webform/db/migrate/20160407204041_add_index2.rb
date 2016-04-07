class AddIndex2 < ActiveRecord::Migration
  def up
    add_index :volunteers, :EmergencyName
    add_index :references, :Howlonghaveyouknownthisperson
  end
  def down
    remove_index :volunteers, :EmergencyName
    remove_index :references, :Howlonghaveyouknownthisperson
  end
end
