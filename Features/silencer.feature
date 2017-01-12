Feature: Silencer

  Scenario:
    Given I command Alexa to "silence alerts for 5 minutes"
    When I open the front door
    Then The hallway sonos speakers will not announce "Front door open"
    Then I wait 4 minutes
    And I open the front door
    Then The hallway sonos speakers will not announce "Front door open"
    Then I wait 2 minutes
    And I open the front door
    Then The hallway sonos speakers announce "Front door open"
