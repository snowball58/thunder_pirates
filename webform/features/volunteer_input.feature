Feature: Text and check box input on volunteer page
	Volunteer form should have all required input fields
	Valid inputs are saved to database

Background:
    Given the index page is loaded
    And the Continue button is clicked
	
Scenario: 
    Given the volunteer page is loaded
    When name is filled in with Steven Snow
    And the Continue button is clicked
    And the volunteer page is loaded
    Then name contains Steven Snow
    
Scenario: 
    Given the volunteer page is loaded
    When birth is filled in with 10/17/1994
    And the Continue button is clicked
    And the volunteer page is loaded
    Then birth contains 10/17/1994
    
Scenario: 
    Given the volunteer page is loaded
    When email is filled in with stevensnow58@gmail.com
    And the Continue button is clicked
    And the volunteer page is loaded
    Then email contains stevensnow58@gmail.com
    
Scenario: 
    Given the volunteer page is loaded
    When home_phone is filled in with (555)555-5555
    And the Continue button is clicked
    And the volunteer page is loaded
    Then home_phone contains (555)555-5555
    
Scenario: 
    Given the volunteer page is loaded
    When cell_phone is filled in with (555)555-5555
    And the Continue button is clicked
    And the volunteer page is loaded
    Then cell_phone contains (555)555-5555
    
Scenario: 
    Given the volunteer page is loaded
    When street is filled in with 2201 Ezra Ct.
    And the Continue button is clicked
    And the volunteer page is loaded
    Then street contains 2201 Ezra Ct.
    
Scenario: 
    Given the volunteer page is loaded
    When city is filled in with College Station
    And the Continue button is clicked
    And the volunteer page is loaded
    Then city contains College Station
    
Scenario: 
    Given the volunteer page is loaded
    When state is filled in with Texas
    And the Continue button is clicked
    And the volunteer page is loaded
    Then state contains Texas
    
Scenario: 
    Given the volunteer page is loaded
    When zip is filled in with 77777
    And the Continue button is clicked
    And the volunteer page is loaded
    Then zip contains 77777
    
Scenario: 
    Given the volunteer page is loaded
    When county is filled in with Brazos
    And the Continue button is clicked
    And the volunteer page is loaded
    Then county contains Brazos
    
Scenario: 
    Given the volunteer page is loaded
    When additional is filled in with Do stuff and things
    And the Continue button is clicked
    And the volunteer page is loaded
    Then additional contains Do stuff and things
    
Scenario: 
    Given the volunteer page is loaded
    When times is filled in with Tuesday at 5am
    And the Continue button is clicked
    And the volunteer page is loaded
    Then times contains Tuesday at 5am
    
Scenario:
    Given the volunteer page is loaded
    When I check family
    And the Continue button is clicked
    And the volunteer page is loaded
    Then family is checked
    
Scenario:
    Given the volunteer page is loaded
    When I uncheck family
    And the Continue button is clicked
    And the volunteer page is loaded
    Then family is unchecked
    
Scenario:
    Given the volunteer page is loaded
    When I check ambassador
    And the Continue button is clicked
    And the volunteer page is loaded
    Then ambassador is checked
    
Scenario:
    Given the volunteer page is loaded
    When I uncheck ambassador
    And the Continue button is clicked
    And the volunteer page is loaded
    Then ambassador is unchecked
    
Scenario:
    Given the volunteer page is loaded
    When I check virtual
    And the Continue button is clicked
    And the volunteer page is loaded
    Then virtual is checked
    
Scenario:
    Given the volunteer page is loaded
    When I uncheck virtual
    And the Continue button is clicked
    And the volunteer page is loaded
    Then virtual is unchecked
    
Scenario:
    Given the volunteer page is loaded
    When I check medical
    And the Continue button is clicked
    And the volunteer page is loaded
    Then medical is checked
    
Scenario:
    Given the volunteer page is loaded
    When I uncheck medical
    And the Continue button is clicked
    And the volunteer page is loaded
    Then medical is unchecked
    
Scenario:
    Given the volunteer page is loaded
    When I check counseling
    And the Continue button is clicked
    And the volunteer page is loaded
    Then counseling is checked
    
Scenario:
    Given the volunteer page is loaded
    When I uncheck counseling
    And the Continue button is clicked
    And the volunteer page is loaded
    Then counseling is unchecked
    
Scenario:
    Given the volunteer page is loaded
    When I check outlying
    And the Continue button is clicked
    And the volunteer page is loaded
    Then outlying is checked
    
Scenario:
    Given the volunteer page is loaded
    When I uncheck outlying
    And the Continue button is clicked
    And the volunteer page is loaded
    Then outlying is unchecked
    
Scenario:
    Given the volunteer page is loaded
    When I check additional2
    And the Continue button is clicked
    And the volunteer page is loaded
    Then additional2 is checked
    
Scenario:
    Given the volunteer page is loaded
    When I uncheck additional2
    And the Continue button is clicked
    And the volunteer page is loaded
    Then additional2 is unchecked