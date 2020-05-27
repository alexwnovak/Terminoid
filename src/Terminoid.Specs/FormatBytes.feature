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
    | 1.25MB | 1.2 MB        |
    | 1.25GB | 1.2 GB        |
    | 1.25TB | 1.2 TB        |
    | 1.25PB | 1.2 PB        |

Scenario Outline: Formatting fractional sizes and specifying how many decimal places
    Given I have a size of <size> bytes
    When I format the size with <places> decimal places
    Then the formatted size should read '<formattedSize>'
    Examples:
    | size       | places | formattedSize |
    | 1.25KB     | 2      | 1.25 KB       |
    | 1.256MB    | 3      | 1.256 MB      |
    | 1.2567GB   | 4      | 1.2567 GB     |
    | 1.25678TB  | 5      | 1.25678 TB    |
    | 1.256789PB | 6      | 1.256789 PB   |