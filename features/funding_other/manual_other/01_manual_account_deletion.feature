Feature: Dashboard Manual - Account Deletion
    In order to deactivated my account
    As a customer
    I want to delete my account

  @C133875
  Scenario: Verify account deletion with incorrect password 5 times
    Given I am a registered customer with following details:
      | userID   | autocaea |
      | password | 1234Test |
    And I filling in form login with the following details:
      | userID   | autocaea |
      | password | 1234Test |
    And I click login
    And I click later
    And I will see card account 'active'
    When I click tab other
    And I click menu delete account
    And I continue to verification delete account
    And I fill 5 times incorrect password account deletion
    Then my account should be block

  @C133876 
  Scenario: Check and approve in console after user request delete account
    Given I am customer who was requested account deletion
    When I go to console of account deletion
    Then I will see my request in the console
    And I will approve the request

  Scenario: Re-login after account delete
    Given I am a customer with my account has been deleted
    When I try to login
    Then I should see pop up with text 'Data Yang Dimasukkan Salah' displayed
    And I can click button try again

  @C133878
  Scenario: Register customer individual after delete account with same ID number
    Given I am a customer with account already deleted
    And I already do the registration 1
    And I try to login
    When I choose Giro Account
    And I choose legality business type 'individual'
    And I submit my legality type
    And I upload my eKTP photo
    And I fill my identity details with id number same
    And I submit my information identity details
    Then I will notify my information identity details has successfully submitted
    And I will direct to page capture selfie