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
class Volunteer < ActiveRecord::Migration
  def up
    create_table :volunteers do |t|
      t.string  :County
      t.string	:FamilyCare
      t.string	:Ambassador
      t.string	:Other
      t.string	:Organization1
      t.string	:Responsibilities1
      t.string	:Organization2
      t.string	:Responsibilities2
      t.string	:Organization3
      t.string	:Responsibilities3
      t.string	:Organization4
      t.string	:Responsibilities4
      t.string	:Organization5
      t.string	:Responsibilities5
      t.string	:Signature
      t.string	:Date
      t.string	:Signature_2
      t.string	:Date_2
      t.string	:Signature_3
      t.string	:Date_3
      t.string	:Name
      t.string	:DateofApplication
      t.string	:DateofBirth
      t.string	:EmailAddress
      t.string	:PhoneNumbers
      t.string	:MailingAddress
      t.string	:VirtualVolunteer
      t.string	:OutlyingCountyAmbassadorProgram
      t.string	:MedicalVolunteer
      t.string	:ProgramCounselingInternship
      t.string	:AdditionalVolunteerOpportunities
      t.string	:IfyouhaveselectedAdditionalVolunteerOpportunitiespleasespecify
      t.string	:DaysTimesyouwillbeavailabletovolunteer
      t.string	:HowdidyoulearnaboutScottysHouseandourVolunteerProgram
      t.string	:Whatwouldyouliketogainfromyourvolunteerexperience
      t.string	:ClassCredit
      t.string	:NameofInstructor
      t.string	:OrganizationCredit
      t.string	:NameofOrganization
      t.string	:OtherPleaseexplain
      t.string	:CurrentlyEmployed
      t.string	:NameofEmployer
      t.string	:LengthofTime1
      t.string	:LengthofTime2
      t.string	:LengthofTime3
      t.string	:LengthofTime4
      t.string	:LengthofTime5
      t.string	:ExperiencewithChildAbuseYES
      t.string	:ExperiencewithChildAbuse
      t.string	:ExperiencewithFosterCareYES
      t.string	:ExperiencewithChildAbuseNO
      t.string	:ExperiencewithFosterCare
      t.string	:ExperiencewithCourtYES
      t.string	:ExperiencewithFosterCareNO
      t.string	:ExperiencewithCourtNO
      t.string	:CriminalJuvenileorFamilyCourtSystem
      t.string	:ExperiencewithChildServiceYES
      t.string	:ExperiencewithChildServiceNO
      t.string	:OtherChildServiceAgencies
      t.string	:SpeakotherlanguageYES
      t.string	:SpeakotherlanguageNO
      t.string	:Speaklanguage
      t.string	:LiterateotherlanguageYES
      t.string	:LiterateotherlanguageNO
      t.string	:Literatelanguage
      t.string	:ExperiencewithblinddeafpersonsYES
      t.string	:ExperiencewithblinddeafpersonsNO
      t.string	:Experiencewithblinddeafpersons
      t.string	:ExperiencewithhandicappersonsYES
      t.string	:ExperiencewithhandicappersonsNO
      t.string	:Experiencewithhandicappersons
      t.string	:EmergencyName
      t.string	:EmergencyPhone
      t.string	:EmergencyAddress
      t.string	:EmergencyRelationship
    end
  end

  def down
    drop_table :volunteers
  end
end