# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20160330213204) do

  create_table "references", force: :cascade do |t|
    t.string "Does this person usually exercise good judgment"
    t.string "Signature_4"
    t.string "Date_4"
    t.string "Print Name"
    t.string "Volunteer Name"
    t.string "How long have you known this person"
    t.string "Capable in crisis situation"
    t.string "Cable in crisis situation, why"
    t.string "Good judgment, elaborate"
    t.string "Do you have any hesitation about this person working in this capacity"
    t.string "Pertinent Information"
    t.string "uniqueID"
    t.string "VolunteerId"
  end

  create_table "volunteers", force: :cascade do |t|
    t.string "Date of Application"
    t.string "Date of Birth"
    t.string "Email Address"
    t.string "Phone Numbers"
    t.string "Mailing Address"
    t.string "County"
    t.string "Family Care"
    t.string "Ambassador"
    t.string "Virtual Volunteer"
    t.string "Outlying County Ambassador Program"
    t.string "Medical Volunteer"
    t.string "Program/Counseling Internship"
    t.string "Additional Volunteer Opportunities"
    t.string "If you have selected Additional Volunteer Opportunities please specify"
    t.string "DaysTimes you will be available to volunteer"
    t.string "How did you learn about Scottys House and our Volunteer Program"
    t.string "What would you like to gain from your volunteer experience"
    t.string "Name of Instructor"
    t.string "Name of Organization"
    t.string "Other Please explain"
    t.string "Name of Employer"
    t.string "Class Credit"
    t.string "Organization Credit"
    t.string "Other"
    t.string "Currently Employed"
    t.string "Length of Time1"
    t.string "Experience with Child Abuse"
    t.string "Experience with Foster Care"
    t.string "Criminal Juvenile or Family Court System"
    t.string "Other Child Service Agencies"
    t.string "Organization1"
    t.string "Responsibilities1"
    t.string "Length of Time2"
    t.string "Organization2"
    t.string "Responsibilities2"
    t.string "Length of Time3"
    t.string "Organization3"
    t.string "Responsibilities3"
    t.string "Length of Time4"
    t.string "Organization4"
    t.string "Responsibilities4"
    t.string "Length of Time5"
    t.string "Organization5"
    t.string "Responsibilities5"
    t.string "Experience with Child Abuse (yes)"
    t.string "Experience with Foster Care (yes)"
    t.string "Experience with Child Abuse (no)"
    t.string "Signature"
    t.string "Date"
    t.string "Signature_2"
    t.string "Date_2"
    t.string "Signature_3"
    t.string "Date_3"
    t.string "Experience with Court (yes)"
    t.string "Experience with Foster Care (no)"
    t.string "Experience with Child Service (yes)"
    t.string "Experience with Child Service (no)"
    t.string "Name"
    t.string "Speak other language (yes)"
    t.string "Speak other language (no)"
    t.string "Speak language"
    t.string "Literate language"
    t.string "Literate other language (no)"
    t.string "Literate other language (yes)"
    t.string "Experience with blind/deaf persons (yes)"
    t.string "Experience with blind/deaf persons (no)"
    t.string "Experience with blind/deaf persons"
    t.string "Experience with handicap persons (yes)"
    t.string "Experience with handicap persons (no)"
    t.string "Experience with handicap persons"
    t.string "Emergency Name"
    t.string "Emergency Phone"
    t.string "Emergency Address"
    t.string "Emergency Relationship"
    t.string "uniqueID"
  end

end
