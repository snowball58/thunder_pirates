Feature: Volunteer form
	Volunteer form should have all required input fields

Scenario: Enter input
	Given the volunteer page is loaded
	When I press the continue button
	Then the inputs of each field should be reflected in the parameters
	Then the next page is displayed
	Then the same page is not displayed
