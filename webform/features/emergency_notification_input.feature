Feature: Text input on emergency_notification page
    Emergency_notification form should have all required input fields
    Valid inputs are saved to database

Background:
    Given the skills page is loaded
    And the Continue button is clicked
    And the emergency_notification page is loaded

Scenario:
    When emergency_name is filled in with Some Text
    And the Continue button is clicked
    And the skills page is loaded
    Then emergency_name contains Some Text

Scenario:
    When emergency_primary_phone is filled in with Some Text
    And the Continue button is clicked
    And the skills page is loaded
    Then emergency_primary_phone contains Some Text

Scenario:
    When emergency_address is filled in with Some Text
    And the Continue button is clicked
    And the skills page is loaded
    Then emergency_address contains Some Text

Scenario:
    When emergency_relationship is filled in with Some Text
    And the Continue button is clicked
    And the skills page is loaded
    Then emergency_relationship contains Some Text