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

namespace :db do
  desc "ensures all records have a time stamp"
  task assignDate: :environment do
    Volunteer.where(date_modified: nil).each do |record|
      record.date_modified = Time.now
      record.save
    end
    Reference.where(date_modified: nil).each do |record|
      record.date_modified = Time.now
      record.save
    end
  end
  
  desc "erases incomplete applications older than 24 hours"
  task shortEraseData: :environment do
    Volunteer.where('(EmergencyName IS NULL or EmergencyName = ?) and date_modified < ? ', '', (Time.now - (60*60*24))).delete_all
    Reference.where('(Howlonghaveyouknownthisperson IS NULL or Howlonghaveyouknownthisperson = ?) and date_modified < ? ', '', (Time.now - (60*60*24))).delete_all
  end
  
  desc "erases completed applications older than 30 days"
  task longEraseData: :environment do
    Volunteer.where('date_modified < ? ', (Time.now - (60*60*24*30))).delete_all
    Reference.where('date_modified < ? ', (Time.now - (60*60*24*30))).delete_all
  end

end