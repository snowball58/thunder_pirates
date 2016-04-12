Feature: Text box, radio buttons and check box input on experience page
    Experience form should have all required input fields
    Valid inputs are saved to database

Background:
    Given the index page is loaded
    And the Continue button is clicked
    And the general_info page is loaded
    
Scenario: 
	When program_source is filled in with "Facebook"
	And the Continue button is clicked
	And the general_info page is loaded	
	Then program_source contains "Facebook" 
	
Scenario:
	When experience_gain is filled in with "Empathy"
	And the Continue button is clicked
	And the general_info page is loaded	
	Then experience_gain contains "Empathy"
	
Scenario:
	When I choose "class_credit" from the "reason" options
	And the Continue button is clicked
	And the general_info page is loaded	
	Then "org_credit" from the "reason" options should not be chosen
	And "other" from the "reason" options should not be chosen
	
Scenario:
	When I choose "yes" from the "employed" options
	And the Continue button is clicked
	And the general_info page is loaded	
	Then "no" from the "employed" options should not be chosen

