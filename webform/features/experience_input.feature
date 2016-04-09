Feature: Text and check box input on experience page
    Experience form should have all required input fields
    Valid inputs are saved to database

Background:
    Given the index page is loaded
    And the Continue button is clicked
    And the experience page is loaded

Scenario:
    When length_of_time_1 is filled in with Some Time
    And the Continue button is clicked
    And the experience page is loaded
    Then length_of_time_1 contains Some Time

Scenario:
    When organization_1 is filled in with Some Organization
    And the Continue button is clicked
    And the experience page is loaded
    Then organization_1 contains Some Organization

Scenario:
    When responsibilities_1 is filled in with Some Responsibilities
    And the Continue button is clicked
    And the experience page is loaded
    Then responsibilities_1 contains Some Responsibilities

Scenario:
    When I check child_abuse_check
    And the Continue button is clicked
    And the experience page is loaded
    Then child_abuse_check is checked

Scenario:
    When I check foster_care_check
    And the Continue button is clicked
    And the experience page is loaded
    Then foster_care_check is checked

Scenario:
    When I check criminal_check
    And the Continue button is clicked
    And the experience page is loaded
    Then criminal_check is checked

Scenario:
    When I check agency_check
    And the Continue button is clicked
    And the experience page is loaded
    Then agency_check is checked

Scenario:
    When child_abuse_text is filled in with Some Text
    And the Continue button is clicked
    And the experience page is loaded
    Then child_abuse_text contains Some Text

Scenario:
    When foster_care_text is filled in with Some Text
    And the Continue button is clicked
    And the experience page is loaded
    Then foster_care_text contains Some Text

Scenario:
    When criminal_text is filled in with Some Text
    And the Continue button is clicked
    And the experience page is loaded
    Then criminal_text contains Some Text

Scenario:
    When agency_text is filled in with Some Text
    And the Continue button is clicked
    And the experience page is loaded
    Then agency_text contains Some Text