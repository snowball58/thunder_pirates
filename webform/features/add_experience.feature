Feature: Add a new experience field to the experience form

Scenario: General Info click continue
        Given the experience page is loaded
        And there is 1 experience field
        When the Add Experience button is clicked
        Then there should be 2 experience fields showing
