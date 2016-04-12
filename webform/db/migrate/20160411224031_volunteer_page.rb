class VolunteerPage < ActiveRecord::Migration
  def up
    add_column :volunteers, :HomePhone, :string
    add_column :volunteers, :CellPhone, :string
    add_column :volunteers, :Street, :string
    add_column :volunteers, :City, :string
    add_column :volunteers, :State, :string
    add_column :volunteers, :Zip, :string
  end
  def down
    remove_column :volunteers, :HomePhone, :string
    remove_column :volunteers, :CellPhone, :string
    remove_column :volunteers, :Street, :string
    remove_column :volunteers, :City, :string
    remove_column :volunteers, :State, :string
    remove_column :volunteers, :Zip, :string
  end
end
