class Reference < ActiveRecord::Migration
  def up
    create_table :Reference do |t|
      t.string  :'Does this person usually exercise good judgment'
      t.string	:'Signature_4'
      t.string	:'Date_4'
      t.string	:'Print Name'
      t.string	:'Volunteer Name'
      t.string	:'How long have you known this person'
      t.string	:'Capable in crisis situation'
      t.string	:'Cable in crisis situation, why'
      t.string	:'Good judgment, elaborate'
      t.string	:'Do you have any hesitation about this person working in this capacity'
      t.string	:'Pertinent Information'
    end
  end

  def down
    drop_table :Reference
  end
end
