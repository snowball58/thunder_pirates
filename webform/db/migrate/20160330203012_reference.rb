# Scotty's House Volunteer WebForm
# Written in 2016 by: 
# Gustavo Estrela
# Logan Ford
# Patrick Herrington
# Noemie Nakamura
# Steven Snow
# Matthew Wiecek
# To the extent possible under law, the author(s) have dedicated all copyright and related and neighboring rights to this software to the public domain worldwide. This software is distributed without any warranty.
# You should have received a copy of the CC0 Public Domain Dedication along with this software. If not, see <http://creativecommons.org/publicdomain/zero/1.0/>.
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
