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

ActiveRecord::Schema.define(version: 20160412020509) do

  create_table "auth_users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "auth_users", ["email"], name: "index_auth_users_on_email", unique: true
  add_index "auth_users", ["reset_password_token"], name: "index_auth_users_on_reset_password_token", unique: true

  create_table "references", force: :cascade do |t|
    t.string   "Signature_4"
    t.string   "Date_4"
    t.string   "VolunteerName"
    t.string   "Howlonghaveyouknownthisperson"
    t.string   "Capableincrisissituation"
    t.string   "Cableincrisissituationwhy"
    t.string   "Doesthispersonusuallyexercisegoodjudgment"
    t.string   "Goodjudgmentelaborate"
    t.string   "Doyouhaveanyhesitationaboutthispersonworkinginthiscapacity"
    t.string   "PertinentInformation"
    t.string   "ReferenceName"
    t.string   "uniqueID"
    t.string   "VolunteerId"
    t.datetime "date_modified"
  end

  add_index "references", ["Howlonghaveyouknownthisperson"], name: "index_references_on_Howlonghaveyouknownthisperson"
  add_index "references", ["date_modified"], name: "index_references_on_date_modified"
  add_index "references", ["uniqueID"], name: "index_references_on_uniqueID"

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

  create_table "volunteers", force: :cascade do |t|
    t.string   "County"
    t.string   "FamilyCare"
    t.string   "Ambassador"
    t.string   "Other"
    t.string   "Organization1"
    t.string   "Responsibilities1"
    t.string   "Organization2"
    t.string   "Responsibilities2"
    t.string   "Organization3"
    t.string   "Responsibilities3"
    t.string   "Organization4"
    t.string   "Responsibilities4"
    t.string   "Organization5"
    t.string   "Responsibilities5"
    t.string   "Signature"
    t.string   "Date"
    t.string   "Signature_2"
    t.string   "Date_2"
    t.string   "Signature_3"
    t.string   "Date_3"
    t.string   "Name"
    t.string   "DateofApplication"
    t.string   "DateofBirth"
    t.string   "EmailAddress"
    t.string   "PhoneNumbers"
    t.string   "MailingAddress"
    t.string   "VirtualVolunteer"
    t.string   "OutlyingCountyAmbassadorProgram"
    t.string   "MedicalVolunteer"
    t.string   "ProgramCounselingInternship"
    t.string   "AdditionalVolunteerOpportunities"
    t.string   "IfyouhaveselectedAdditionalVolunteerOpportunitiespleasespecify"
    t.string   "DaysTimesyouwillbeavailabletovolunteer"
    t.string   "HowdidyoulearnaboutScottysHouseandourVolunteerProgram"
    t.string   "Whatwouldyouliketogainfromyourvolunteerexperience"
    t.string   "ClassCredit"
    t.string   "NameofInstructor"
    t.string   "OrganizationCredit"
    t.string   "NameofOrganization"
    t.string   "OtherPleaseexplain"
    t.string   "CurrentlyEmployed"
    t.string   "NameofEmployer"
    t.string   "LengthofTime1"
    t.string   "LengthofTime2"
    t.string   "LengthofTime3"
    t.string   "LengthofTime4"
    t.string   "LengthofTime5"
    t.string   "ExperiencewithChildAbuseYES"
    t.string   "ExperiencewithChildAbuse"
    t.string   "ExperiencewithFosterCareYES"
    t.string   "ExperiencewithChildAbuseNO"
    t.string   "ExperiencewithFosterCare"
    t.string   "ExperiencewithCourtYES"
    t.string   "ExperiencewithFosterCareNO"
    t.string   "ExperiencewithCourtNO"
    t.string   "CriminalJuvenileorFamilyCourtSystem"
    t.string   "ExperiencewithChildServiceYES"
    t.string   "ExperiencewithChildServiceNO"
    t.string   "OtherChildServiceAgencies"
    t.string   "SpeakotherlanguageYES"
    t.string   "SpeakotherlanguageNO"
    t.string   "Speaklanguage"
    t.string   "LiterateotherlanguageYES"
    t.string   "LiterateotherlanguageNO"
    t.string   "Literatelanguage"
    t.string   "ExperiencewithblinddeafpersonsYES"
    t.string   "ExperiencewithblinddeafpersonsNO"
    t.string   "Experiencewithblinddeafpersons"
    t.string   "ExperiencewithhandicappersonsYES"
    t.string   "ExperiencewithhandicappersonsNO"
    t.string   "Experiencewithhandicappersons"
    t.string   "EmergencyName"
    t.string   "EmergencyPhone"
    t.string   "EmergencyAddress"
    t.string   "EmergencyRelationship"
    t.string   "uniqueID"
    t.integer  "NofExperiences"
    t.datetime "date_modified"
    t.string   "HomePhone"
    t.string   "CellPhone"
    t.string   "Street"
    t.string   "City"
    t.string   "State"
    t.string   "Zip"
  end

  add_index "volunteers", ["EmergencyName"], name: "index_volunteers_on_EmergencyName"
  add_index "volunteers", ["date_modified"], name: "index_volunteers_on_date_modified"
  add_index "volunteers", ["uniqueID"], name: "index_volunteers_on_uniqueID"

end
