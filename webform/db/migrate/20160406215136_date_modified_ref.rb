class DateModifiedRef < ActiveRecord::Migration
  def up
    add_column :references, :date_modified, :datetime
  end
  def down
    remove_column :references, :date_modified, :datetime
  end
end
