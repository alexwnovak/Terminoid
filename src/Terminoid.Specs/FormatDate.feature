Feature: Formatting a date into a human readable form, relative to right now

Scenario: Piping in the date
    Given I have a date from 5 seconds ago
    When I pipe the date to the formatter
    Then it should read 'just now'

Scenario: Formatting a date from 5 seconds ago
    Given I have a date from 5 seconds ago
    When I format the date
    Then it should read 'just now'

Scenario: Formatting a date from between one and two minutes ago
    Given I have a date from 90 seconds ago
    When I format the date
    Then it should read '1 minute ago'

Scenario: Formatting a date from between two minutes and 60 minutes ago
    Given I have a date from 30 minutes ago
    When I format the date
    Then it should read '30 minutes ago'

Scenario: Formatting a date from between one and two hours ago
    Given I have a date from 90 minutes ago
    When I format the date
    Then it should read '1 hour ago'

Scenario: Formatting a date from between one hour and 24 hours ago
    Given I have a date from 12 hours ago
    When I format the date
    Then it should read '12 hours ago'

Scenario: Formatting a date from between one and two days ago
    Given I have a date from 36 hours ago
    When I format the date
    Then it should read 'yesterday'

Scenario: Formatting a date from between two and seven days ago
    Given I have a date from 4 days ago
    When I format the date
    Then it should read '4 days ago'

Scenario: Formatting a date from between one and two weeks ago
    Given I have a date from 10 days ago
    When I format the date
    Then it should read 'last week'

Scenario: Formatting a date from between two weeks and one month ago
    Given I have a date from 21 days ago
    When I format the date
    Then it should read '3 weeks ago'

Scenario: Formatting a date from between one and two months ago
    Given I have a date from 45 days ago
    When I format the date
    Then it should read 'last month'

Scenario: Formatting a date from between two and 12 months ago
    Given I have a date from 180 days ago
    When I format the date
    Then it should read '6 months ago'

Scenario: Formatting a date from between one and two years ago
    Given I have a date from 545 days ago
    When I format the date
    Then it should read 'last year'

Scenario: Formatting a date from between two and 10 years ago
    Given I have a date from 5 years ago
    When I format the date
    Then it should read '5 years ago'

Scenario: Formatting a date from between 10 and 20 years ago
    Given I have a date from 15 years ago
    When I format the date
    Then it should read 'last decade'

Scenario: Formatting a date from between 20 and 100 years ago
    Given I have a date from 50 years ago
    When I format the date
    Then it should read '5 decades ago'

Scenario: Formatting a date from between 100 and 200 years ago
    Given I have a date from 150 years ago
    When I format the date
    Then it should read 'last century'

Scenario: Formatting a date from between 200 and 1000 years ago
    Given I have a date from 500 years ago
    When I format the date
    Then it should read '5 centuries ago'

Scenario: Formatting a date from between 1000 and 2000 years ago
    Given I have a date from 1500 years ago
    When I format the date
    Then it should read 'last millennium'

Scenario: Formatting a date from more than 2000 years ago
    Given I have a date from 2001 years ago
    When I format the date
    Then it should read 'more than a millennia ago'