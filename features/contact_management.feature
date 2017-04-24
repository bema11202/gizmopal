Feature: Contact management
  As a primary caregiver, I should be able to add, edit and delete
  caregivers and other contacts



    Scenario: Manage caregivers and contacts
      Given I have successfully paired the gizmo
      Then I should not be able to add a caregiver without a name or phone number
      Then I should be able to add a caregiver
      Then I should be able to edit caregiver information
      Then I should be able to convert a caregiver into a contact
      Then I should be able to delete a caregiver
      Then I should not be able to add a contact without a name or phone number
      Then I should be able to add a contact
      Then I should be able to delete a contact
