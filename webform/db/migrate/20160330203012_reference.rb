class Reference < ActiveRecord::Migration
  def up
    create_table :references do |t|
      t.string  :Signature_4
      t.string	:Date_4
      t.string	:VolunteerName
      t.string	:Howlonghaveyouknownthisperson
      t.string	:Capableincrisissituation
      t.string	:Cableincrisissituationwhy
      t.string	:Doesthispersonusuallyexercisegoodjudgment
      t.string	:Goodjudgmentelaborate
      t.string	:Doyouhaveanyhesitationaboutthispersonworkinginthiscapacity
      t.string	:PertinentInformation
      t.string	:ReferenceName
    end
  end

  def down
    drop_table :references
  end
end
