class Reference < ActiveRecord::Migration
  def up
    create_table :Reference do |t|
      t.string  :'Does this person usually exercise good judgment'
    end
  end

  def down
    drop_table :Reference
  end
end
