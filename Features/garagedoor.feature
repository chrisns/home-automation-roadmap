Feature: Garage door motorcycle

  Scenario: Opening front door
    Given I turn on the ignition to the motorcycle
    Then the garage door opens
    And the garage lights turn on

  Scenario: Closing garage door
    Given I turn off the ignition to the motorcycle
    Then the garage door closes
    And the garage lights turn off

  Scenario: Opening front door (proximity)
    Given I enter the proximity range with the ignition turned on the motorcycle
    Then the garage door opens
    And the garage lights turn on

  Scenario: Closing garage door (proximity)
    Given I exit the proximity range with the ignition turned on the motorcycle
    Then the garage door closes
    And the garage lights turn off
