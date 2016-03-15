class User
    attr_accessor :first_name
    attr_accessor :last_name
    attr_accessor :address
    attr_accessor :address_2
    attr_accessor :city
    attr_accessor :state
    attr_accessor :zip_code
    attr_accessor :age
    
    def initialize
        @first_name = "first"
        @last_name = 'last'
        @address = 'addr'
        @address_2 = 'addr2'
        @city = 'city?'
        @state = 'Texas!'
        @zip_code = '77840'
        @age = '20'
    end
end