class Volunteer < ActiveRecord::Migration
  def up
    create_table :Volunteer do |t|
      t.string  :'Date of Application'
    end
  end

  def down
    drop_table :Volunteer
  end
end