Feature: Formatting a size in bytes to a concise shorthand

Scenario: Passing in the size via positional argument
    Given I have a size of 123 bytes
    When I pass the size as a positional argument
    Then the formatted size should read '123 B'

Scenario: Piping in the size
    Given I have a size of 123 bytes
    When I pipe the size to the formatter
    Then the formatted size should read '123 B'

Scenario: Formatting a size of 123 bytes
    Given I have a size of 123 bytes
    When I format the size
    Then the formatted size should read '123 B'
