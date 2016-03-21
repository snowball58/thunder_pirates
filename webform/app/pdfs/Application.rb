#Scotty's House Volunteer WebForm
#This class written in 2016 by Matthew Wiecek matthewwiecek@tamu.edu
#To the extent possible under law, the author(s) have dedicated all copyright and related and neighboring rights to this software to the public domain worldwide. This software is distributed without any warranty.
#You should have received a copy of the CC0 Public Domain Dedication along with this software. If not, see <http://creativecommons.org/publicdomain/zero/1.0/>.

class Application
    def initialize
        
    end
    #page 1
    #strings
    attr_reader :date
    attr_reader :name
    attr_reader :dateOfBirth
    attr_reader :emailAddr
    attr_reader :phoneNumber
    attr_reader :mailingAddr
    #if not nill, then box is checked
    attr_reader :familyCare
    attr_reader :medicalVolunteer
    attr_reader :ambassador
    attr_reader :programCounseling
    attr_reader :virtualVolunteer
    attr_reader :addtVolunteer
    attr_reader :outlyingAmbassador
    #strings
    attr_reader :county
    attr_reader :addtVolunteerSpecify
    attr_reader :daysTimesVolunteer
    
    #page2
    #strings
    attr_reader :howLearnScotty
    attr_reader :whatYouGain
    #box checked if not nil
    attr_reader :classCredit
    #strings
    attr_reader :instructor
    #box checked if not nil
    attr_reader :organizationCredit
    #strings
    attr_reader :org
    #box checked if not nil
    attr_reader :other
    #strings
    attr_reader :explainOther
    #box checked if not nil
    attr_reader :employed
    #strings
    attr_reader :nameEmployer
    
    #page3
    #to be continued
end