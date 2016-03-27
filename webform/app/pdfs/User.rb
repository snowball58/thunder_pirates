#Scotty's House Volunteer WebForm
#This class written in 2016 by Matthew Wiecek matthewwiecek@tamu.edu
#To the extent possible under law, the author(s) have dedicated all copyright and related and neighboring rights to this software to the public domain worldwide. This software is distributed without any warranty.
#You should have received a copy of the CC0 Public Domain Dedication along with this software. If not, see <http://creativecommons.org/publicdomain/zero/1.0/>.

class User
    attr_accessor :first_name
    attr_accessor :middle_initial
    attr_accessor :last_name
    attr_accessor :address
    attr_accessor :address_2
    attr_accessor :city
    attr_accessor :state
    attr_accessor :zip_code
    attr_accessor :age
    
    def initialize
        @first_name = "first"
        @middle_initial = 'mid'
        @last_name = 'last'
        @address = 'addr'
        @address_2 = 'addr2'
        @city = 'city?'
        @state = 'Texas!'
        @zip_code = '77840'
        @age = '20'
    end
end