class DateModified < ActiveRecord::Migration
  def up
    add_column :volunteers, :date_modified, :datetime
  end
  def down
    remove_column :volunteers, :date_modified, :datetime
  end
end
