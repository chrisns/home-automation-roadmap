Feature: Door opening

  Scenario: Opening front door
    Given I open the front door
    Then the hallway sonos speakers announce "Front door open"
    And the magic mirror interfaces display a banner "front door open"

  Scenario: Front door left open
    Given I open the front door
    And I wait 5 minutes
    Then the hallway sonos speakers announce "Front door open"