Feature: Nightlights

  Scenario: Stair lighting on
    Given "sunset - 1 hour" occurs
    Then the stair lighting turns on

  Scenario: Stair lighting off
    Given "sunrise + 1 hour" occurs
    Then the stair lighting turns off
