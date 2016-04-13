require_relative 'rails_helper'
require 'rake'
load File.expand_path("../../lib/tasks/db.rake", __FILE__)
# make sure you set correct relative path 
Rake::Task.define_task(:environment)
#require 'byebug'

describe 'rake Task' do
    let!(:old_incomplete_record) { Volunteer.create(:date_modified => Time.now - (60*60*25)) }
    let!(:old_complete_record) { Volunteer.create(:date_modified => Time.now - (60*60*24*61), :EmergencyName => 'dude') }
    let!(:recent_incomplete_record) { Volunteer.create(:date_modified => Time.now) }
    let!(:recent_complete_record) { Volunteer.create(:date_modified => Time.now, :EmergencyName => 'dude') }
    let!(:old_incomplete_reference) { Reference.create(:date_modified => Time.now - (60*60*25)) }
    let!(:old_complete_reference) { Reference.create(:date_modified => Time.now - (60*60*24*61), :Howlonghaveyouknownthisperson => '12')}
    let!(:recent_incomplete_reference) { Reference.create(:date_modified => Time.now) }
    let!(:recent_complete_reference) { Reference.create(:date_modified => Time.now, :Howlonghaveyouknownthisperson => '12') }
    let!(:blank_record) { Volunteer.create() }
    let!(:blank_ref) { Reference.create() }
    
    it 'add timestamp to blank documents' do
        Rake::Task['db:assignDate'].invoke
        Volunteer.find_each do |vol|
            expect(vol.date_modified).not_to be_nil
        end
        Reference.find_each do |vol|
            expect(vol.date_modified).not_to be_nil
        end
    end

    it 'wipe old incomplete records' do
        Rake::Task['db:shortEraseData'].invoke
        Volunteer.where('EmergencyName IS NULL and date_modified IS NOT NULL') do |rec|
            expect(rec.date_modified).to be > Time.now - (60*60*24)
        end
        Reference.where('Howlonghaveyouknownthisperson IS NULL and date_modified IS NOT NULL') do |rec|
            expect(rec.date_modified).to be > Time.now - (60*60*24)
        end
    end
    it 'wipe old complete records' do
        Rake::Task['db:longEraseData'].invoke
        Volunteer.find_each do |rec|
            if rec.date_modified != nil
                expect(rec.date_modified).to be > Time.now - (60*60*24*60)
            end
        end
        Reference.find_each do |rec|
            if rec.date_modified != nil
                expect(rec.date_modified).to be > Time.now - (60*60*24*60)
            end
        end
    end
end