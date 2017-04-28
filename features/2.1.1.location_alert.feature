Feature: As a caregiver, I should be able to add a location alert to my gizmo app


  Background:
    Given I have successfully pair the gizmo

  Scenario: 2.1.1.1 Add a location alert
    Then I should be able to add a location alert
    Then I should be able to edit alert date and time
    Then I should be able to edit alert location
    Then I should be able to turn location alert off
    Then I should be able to turn location alert back on
    Then I should not be able to add more than five location alerts

    Scenario: 2.1.2.1 Add a location check
      Then I should be able to add a location check time
      Then I should be able to edit the location check time and date
      Then Then I should be able to delete the location check

    Scenario: 2.1.3.1 Find my gizmo
      Then I should be able to find my gizmo

  #manual
  Scenario: 2.2.1 Quiet time
    Then I should be able to set quiet time
    Then I should be able to edit quiet time
    Then I should be able to add multiple quiet times
    Then I should be able to add five days quiet time
    Then I should be able to delete a quiet time

  Scenario: 2.2.1a Gizmo volume
    Then I should be able to set gizmo volume to 0
    Then I should be able to set gizmo volume to 7
    Then I should be able to set gizmo volume to 5
    Then I should be able to set gizmo volume to max 7
    Then I should be able to change gizmo volume during a call
    Then I should be able to change gizmo volume to zero while the gizmo is turned off

  Scenario: 2.2.2 Quiet mode
    Then I should be able to turn the quiet mode on
    Then I should be able to turn the quiet mode OFF
    Then I should be able to select a different ringtone
    Then I should be able to select the silence mode

  Scenario: 2.2.3 Touch sounds
    Then I should be able to turn the touch sounds OFF
    Then I should be able to turn the touch sounds back ON

  Scenario: 2.2.4 Fun sounds functionality
    Then I should be able to set the fun sound to any fun sound
    Then I should be able to turn the fun sounds to no sound

  Scenario: 2.2.2.1 Gizmo themes
    Then I should be able to set the gizmo to any theme
    Then I should be able to set the gizmo to a new theme

  Scenario: 2.2.2.2 Watch face
    Then I should be able to set any watch face
    Then I should be able to update the watch face

  Scenario: 2.3 Auto answer
    Then I should be able to turn auto answer ON
    Then I should be able to turn auto answer OFF

  Scenario: 2.4 Battery life
    Then I should be able to check gizmo battery life
    Then I should be able to see the % of battery life remaining

  Scenario: 2.6 Gizmo messages
    Then I should be able to send up to 30 character messages to the gizmo
    Then I should be able to send message to the gizmo while it's OFF
    Then I should be able to send quick messages to the gizmo

  Scenario: 2.7 To-do list
    Then I should not be able to add a to-do list
    Then I should be able to edit a to-do list
    Then I should be able to set the to-do alarm to sound until dismissed
    Then I should be able to create a to-do task that repeats daily
    Then I should be able to create a to-do task that repeats weekly
    Then I should be able to create a to-do task that repeats mothly
    Then I should be able to convert a daily to-do task to weekly
    Then I should be able to convert a weekly to-do task to monthly
    Then I should be able to delete a to-do task

  Scenario: 2.8 Activity tracking







