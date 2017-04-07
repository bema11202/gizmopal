Feature: Locate gizmo every five minutes up to 100 times
  As a PM, I should be able to locate my gizmo every 5 minutes

  Scenario: Locate gizmo every five minutes upto 100 times
    Given I have successfully pair the gizmo
    Then I should be able to locate the gizmo every five minutes upto 100 times
    Then The test should end

