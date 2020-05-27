Feature: Formatting a size in bytes to a concise shorthand

Scenario: Passing in the size via positional argument
    Given I have a size of 123 bytes
    When I pass the size as a positional argument
    Then the formatted size should read '123 B'

Scenario: Piping in the size
    Given I have a size of 123 bytes
    When I pipe the size to the formatter
    Then the formatted size should read '123 B'

Scenario Outline: Formatting a variety of whole sizes in different byte units
    Given I have a size of <size> bytes
    When I format the size
    Then the formatted size should read '<formattedSize>'
    Examples:
    | size   | formattedSize |
    | 123    | 123 B         |
    | 123KB  | 123 KB        |
    | 123MB  | 123 MB        |
    | 123GB  | 123 GB        |
    | 123TB  | 123 TB        |
    | 123PB  | 123 PB        |

Scenario Outline: Formatting fractional sizes will format with one decimal place by default
    Given I have a size of <size> bytes
    When I format the size
    Then the formatted size should read '<formattedSize>'
    Examples:
    | size   | formattedSize |
    | 1.25KB | 1.2 KB        |

