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
    Volunteer.where('date_modified < ? ', (Time.now - (60*60*24))).delete_all
    Reference.where('date_modified < ? ', (Time.now - (60*60*24))).delete_all
  end
  
  desc "erases completed applications older than 30 days"
  task longEraseData: :environment do
    Volunteer.where('date_modified < ? ', (Time.now - (60*60*24*30))).delete_all
    Reference.where('date_modified < ? ', (Time.now - (60*60*24*30))).delete_all
  end

end