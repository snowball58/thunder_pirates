Feature: Text input on emergency_notification page
    Emergency_notification form should have all required input fields
    Valid inputs are saved to database

Background:
    Given the index page is loaded
    And the Continue button is clicked
    And the emergency_notification page is loaded
    And emergency_name is filled in with Some Text
    And emergency_primary_phone is filled in with Some Text
    And emergency_address is filled in with Some Text
    And emergency_relationship is filled in with Some Text
    And the Continue button is clicked
    And the emergency_notification page is loaded

Scenario:
    Then emergency_name contains Some Text

Scenario:
    Then emergency_primary_phone contains Some Text

Scenario:
    Then emergency_address contains Some Text

Scenario:
    Then emergency_relationship contains Some Text