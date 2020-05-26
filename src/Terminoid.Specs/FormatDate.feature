Feature: Formatting a date into a human readable form, relative to right now

Scenario: Formatting a date from just a few seconds ago
    Given I have a date from a few seconds ago
    When I format the date
    Then it should read 'just now'

Scenario: Formatting a date from between one and two minutes ago
    Given I have a date from a minute and a half ago
    When I format the date
    Then it should read '1 minute ago'