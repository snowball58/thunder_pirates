require_relative '../tasks/db.rake'
require_relative 'rails_helper'
require 'rake'
#require 'byebug'

describe 'rake Task' do
    let!(:old_incomplete_record) { Volunteer.create(:date_modified => Time.now - (60*60*25)) }
    let!(:old_complete_record) { Volunteer.create(:date_modified => Time.now - (60*60*24*31), :EmergencyName => 'dude') }
    let!(:recent_incomplete_record) { Volunteer.create(:date_modified => Time.now) }
    let!(:recent_complete_record) { Volunteer.create(:date_modified => Time.now, :EmergencyName => 'dude') }
    let!(:old_incomplete_reference) { Reference.create(:date_modified => Time.now - (60*60*25)) }
    let!(:old_complete_reference) { Reference.create(:date_modified => Time.now - (60*60*24*31), Howlonghaveyouknownthisperson => '12')}
    let!(:recent_incomplete_reference) { Reference.create(:date_modified => Time.now) }
    let!(:recent_complete_reference) { Reference.create(:date_modified => Time.now, Howlonghaveyouknownthisperson => '12') }
    let!(:blank_record) { Volunteer.create() }
    let!(:blank_ref) { Reference.create() }
    
    describe 'add timestamp to blank documents' do
        Rake::Task[db:assignDate].invoke
        
    end

    describe 'wipe old incomplete records' do
        Rake::Task[db:shortEraseData].invoke
        
    end
    describe 'wipe old complete records' do
        Rake::Task[db:longEraseData].invoke
        
    end
end