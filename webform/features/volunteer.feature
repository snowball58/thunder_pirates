Feature: Continue button directs to the next page
	Volunteer form should have all required input fields
	Continue button should send user to next page
	
Scenario: Index click continue
	Given the index page is loaded
	When the Continue button is clicked
	Then the Volunteer Application title is displayed

Scenario: Volunteer click continue
	Given the volunteer page is loaded
	When the Continue button is clicked
	Then the General Information title is displayed
	
Scenario: General Info click continue
	Given the general_info page is loaded
	When the Continue button is clicked
	Then the Experience title is displayed
	
Scenario: Experience click continue
	Given the experience page is loaded
	When the Continue button is clicked
	Then the Skills and Special Abilities title is displayed
	
Scenario: Skills click continue
	Given the skills page is loaded
	When the Continue button is clicked
	Then the Emergency Notification title is displayed
	
Scenario: Emergency click continue
	Given the emergency_notification page is loaded
	When the Continue button is clicked
	Then the References title is displayed
