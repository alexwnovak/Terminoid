Feature: Formatting a size in bytes to a concise shorthand

Scenario: Formatting a size of 123 bytes
    Given I have a size of 123 bytes
    When I format the size
    Then the formatted size should be '123 B'
