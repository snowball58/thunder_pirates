Feature: Text and check box input on skills page
    Skills form should have all required input fields
    Valid inputs are saved to database

Background:
    Given the experience page is loaded
    And the Continue button is clicked
    And the skills page is loaded

Scenario:
    When I check multilingual_speaker
    And the Continue button is clicked
    And the skills page is loaded
    Then multilingual_speaker is checked

Scenario:
    When I check multilingual_reader
    And the Continue button is clicked
    And the skills page is loaded
    Then multilingual_reader is checked

Scenario:
    When I check impaired_experience
    And the Continue button is clicked
    And the skills page is loaded
    Then impaired_experience is checked

Scenario:
    When I check handicapped_experience
    And the Continue button is clicked
    And the skills page is loaded
    Then handicapped_experience is checked

Scenario:
    When speaking_languages is filled in with Some Text
    And the Continue button is clicked
    And the skills page is loaded
    Then speaking_languages contains Some Text

Scenario:
    When reading_languages is filled in with Some Text
    And the Continue button is clicked
    And the skills page is loaded
    Then reading_languages contains Some Text

Scenario:
    When impaired_capacity is filled in with Some Text
    And the Continue button is clicked
    And the skills page is loaded
    Then impaired_capacity contains Some Text

Scenario:
    When handicapped_capacity is filled in with Some Text
    And the Continue button is clicked
    And the skills page is loaded
    Then handicapped_capacity contains Some Text