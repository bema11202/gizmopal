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
    Then I should be able to set an activity
    Then I should be prompted to start the activity
    Then I the number of steps should match the number of steps set in the app
    Then I should be notify once I have completed an activity
    Then I should be able to edit activity steps goal
    Then I should be able to turn the activity tracker ON and OFF

  Scenario: 2.9 Activity tracking
    Then I should be able to power the gizmo OFF

  Scenario: 2.9 Gizmo power off
    Then I should be able to power the gizmo OFF

  Scenario: 2.10 Gizmo general functionality
    Then I should be able to view the gizmo software version
    Then I should be able to check for gizmo software update
    Then I should be able to update gizmo software if an update exist
    Then I should be able to view the gizmo model number
    Then I should be able to factory reset the gizmo

  Scenario: 3 Search for the gizmo
    Then I should be able to locate the gizmo on the map
    Then I should be able to get directions to the gizmo

  Scenario: 4 Gizmo history
    Then I should be able to view the gizmo calling history
    Then I should be able to view the gizmo location history
    Then I should be able to view the gizmo activity history
    Then I should be able to view the gizmo to-do history
    Then I should be able to view the gizmo all-history history
    Then I should be able to clear gizmo history

  Scenario: 5.1 First time activation

  Scenario: 6.1 Primary and contact to gizmo

  Scenario: 6.2 Gizmo to primary and contact

  Scenario: 7.2 Security PIN setup
    Then I should be able to setup a security PIN
    Then I should make sure the security PIN is 4 digits long
    Then I should make sure the security PIN is not 0000 or four consecutive numbers
    Then The security PIN should be required
    Then I should be able to edit the security PIN
    Then I should be able to delete the security PIN

  Scenario: 7.4 Help
    Then I should be able to view help page for gizmo1 and gizmo2
    Then I should be redirected to the correct gizmo help page

  Scenario: 7.5 Feedback
    Then I should be able to send app feedback

  Scenario: 7.5 Privacy policy
    Then I should be able to view the app privacy policy

  Scenario: 7.7 Terms and conditions
    Then I should be able to view the app terms and conditions

  Scenario: 7.9 Add another gizmo
    Then I should be able to pair another gizmo




















