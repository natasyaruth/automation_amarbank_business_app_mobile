Feature: Manual Check Dashboard
  In order to execute testing manual in Dashboard
  As a QA
  I need to create test case before execute testing manual

  # ACCOUNT DELETION

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

  # BLOCKING AMOUNT

  Scenario: Validate active amount, blocking amount and total amount after receive amount > 500.000 in account individual
    Given I am a customer and my individual account recently accepted from CRM SMB
    When I receive amount or top up amount Rp 600.000,-
    And I access main Dashboard
    Then I will see my active amount is Rp 100.000,-
    And my blocking amount is Rp 500.000,-
    And my total amount is Rp 600.000,-
    And I click detail amount
    And I will see my active amount is Rp 100.000,-
    And my blocking amount is Rp 500.000,-
    And my total amount is Rp 600.000,-

  Scenario: Validate active amount, blocking amount and total amount after receive amount < 500.000 in account individual
    Given I am a customer and my individual account recently accepted from CRM SMB
    When I receive amount or top up amount Rp 400.000,-
    And I access main Dashboard
    Then I will see my active amount is Rp 0,-
    And my blocking amount is Rp 400.000,-
    And my total amount is Rp 400.000,-
    And I click detail amount
    And I will see my active amount is Rp 0,-
    And my blocking amount is Rp 400.000,-
    And my total amount is Rp 400.000,-

  Scenario: Validate active amount, blocking amount and total amount after receive amount > 1.000.000 in account business
    Given I am a customer and my business account recently accepted from CRM SMB
    When I receive amount or top up amount Rp 1.100.000,-
    And I access main Dashboard
    Then I will see my active amount is Rp 100.000,-
    And my blocking amount is Rp 1.000.000,-
    And my total amount is Rp 1.100.000,-
    And I click detail amount
    And I will see my active amount is Rp 100.000,-
    And my blocking amount is Rp 1.000.000,-
    And my total amount is Rp 1.100.000,-

  Scenario: Validate active amount, blocking amount and total amount after receive amount < 1.000.000 in account business
    Given I am a customer and my business account recently accepted from CRM SMB
    When I receive amount or top up amount Rp 900.000,-
    And I access main Dashboard
    Then I will see my active amount is Rp 0,-
    And my blocking amount is Rp 900.000,-
    And my total amount is Rp 900.000,-
    And I click detail amount
    And I will see my active amount is Rp 0,-
    And my blocking amount is Rp 900.000,-
    And my total amount is Rp 900.000,-

  Scenario: Validate active amount, blocking amount and total amount after receive amount 100.000 gradually in account individual
    Given I am a customer and my individual account recently accepted from CRM SMB
    When I receive amount or top up amount Rp 100.000,-
    And I access main Dashboard
    Then I will see my active amount is Rp 0,-
    And my blocking amount is Rp 100.000,-
    And my total amount is Rp 100.000,-
    And I click detail amount
    And I will see my active amount is Rp 0,-
    And my blocking amount is Rp 100.000,-
    And my total amount is Rp 100.000,-
    When I receive again amount or top up amount Rp 100.000,-
    And I access main Dashboard
    Then I will see my active amount is Rp 0,-
    And my blocking amount is Rp 200.000,-
    And my total amount is Rp 200.000,-
    And I click detail amount
    And I will see my active amount is Rp 0,-
    And my blocking amount is Rp 200.000,-
    And my total amount is Rp 200.000,-
    When I receive again amount or top up amount Rp 100.000,-
    And I access main Dashboard
    Then I will see my active amount is Rp 0,-
    And my blocking amount is Rp 300.000,-
    And my total amount is Rp 300.000,-
    And I click detail amount
    And I will see my active amount is Rp 0,-
    And my blocking amount is Rp 300.000,-
    And my total amount is Rp 300.000,-
    When I receive again amount or top up amount Rp 100.000,-
    And I access main Dashboard
    Then I will see my active amount is Rp 0,-
    And my blocking amount is Rp 400.000,-
    And my total amount is Rp 400.000,-
    And I click detail amount
    And I will see my active amount is Rp 0,-
    And my blocking amount is Rp 400.000,-
    And my total amount is Rp 400.000,-
    When I receive again amount or top up amount Rp 100.000,-
    And I access main Dashboard
    Then I will see my active amount is Rp 0,-
    And my blocking amount is Rp 500.000,-
    And my total amount is Rp 500.000,-
    And I click detail amount
    And I will see my active amount is Rp 0,-
    And my blocking amount is Rp 500.000,-
    And my total amount is Rp 500.000,-
    When I receive again amount or top up amount Rp 100.000,-
    And I access main Dashboard
    Then I will see my active amount is Rp 100.000,-
    And my blocking amount is Rp 500.000,-
    And my total amount is Rp 600.000,-
    And I click detail amount
    And I will see my active amount is Rp 100.000,-
    And my blocking amount is Rp 500.000,-
    And my total amount is Rp 600.000,-

  Scenario: Validate active amount, blocking amount and total amount after receive amount 100.000 gradually in account business
    Given I am a customer and my individual account recently accepted from CRM SMB
    When I receive amount or top up amount Rp 100.000,-
    And I access main Dashboard
    Then I will see my active amount is Rp 0,-
    And my blocking amount is Rp 100.000,-
    And my total amount is Rp 100.000,-
    And I click detail amount
    And I will see my active amount is Rp 0,-
    And my blocking amount is Rp 100.000,-
    And my total amount is Rp 100.000,-
    When I receive again amount or top up amount Rp 100.000,-
    And I access main Dashboard
    Then I will see my active amount is Rp 0,-
    And my blocking amount is Rp 200.000,-
    And my total amount is Rp 200.000,-
    And I click detail amount
    And I will see my active amount is Rp 0,-
    And my blocking amount is Rp 200.000,-
    And my total amount is Rp 200.000,-
    When I receive again amount or top up amount Rp 100.000,-
    And I access main Dashboard
    Then I will see my active amount is Rp 0,-
    And my blocking amount is Rp 300.000,-
    And my total amount is Rp 300.000,-
    And I click detail amount
    And I will see my active amount is Rp 0,-
    And my blocking amount is Rp 300.000,-
    And my total amount is Rp 300.000,-
    When I receive again amount or top up amount Rp 100.000,-
    And I access main Dashboard
    Then I will see my active amount is Rp 0,-
    And my blocking amount is Rp 400.000,-
    And my total amount is Rp 400.000,-
    And I click detail amount
    And I will see my active amount is Rp 0,-
    And my blocking amount is Rp 400.000,-
    And my total amount is Rp 400.000,-
    When I receive again amount or top up amount Rp 100.000,-
    And I access main Dashboard
    Then I will see my active amount is Rp 0,-
    And my blocking amount is Rp 500.000,-
    And my total amount is Rp 500.000,-
    And I click detail amount
    And I will see my active amount is Rp 0,-
    And my blocking amount is Rp 500.000,-
    And my total amount is Rp 500.000,-
    When I receive again amount or top up amount Rp 100.000,-
    And I access main Dashboard
    Then I will see my active amount is Rp 0,-
    And my blocking amount is Rp 600.000,-
    And my total amount is Rp 600.000,-
    And I click detail amount
    And I will see my active amount is Rp 0,-
    And my blocking amount is Rp 600.000,-
    And my total amount is Rp 600.000,-
    When I receive again amount or top up amount Rp 100.000,-
    And I access main Dashboard
    Then I will see my active amount is Rp 0,-
    And my blocking amount is Rp 700.000,-
    And my total amount is Rp 700.000,-
    And I click detail amount
    And I will see my active amount is Rp 0,-
    And my blocking amount is Rp 700.000,-
    And my total amount is Rp 700.000,-
    When I receive again amount or top up amount Rp 100.000,-
    And I access main Dashboard
    Then I will see my active amount is Rp 0,-
    And my blocking amount is Rp 800.000,-
    And my total amount is Rp 800.000,-
    And I click detail amount
    And I will see my active amount is Rp 0,-
    And my blocking amount is Rp 800.000,-
    And my total amount is Rp 800.000,-
    When I receive again amount or top up amount Rp 100.000,-
    And I access main Dashboard
    Then I will see my active amount is Rp 0,-
    And my blocking amount is Rp 900.000,-
    And my total amount is Rp 900.000,-
    And I click detail amount
    And I will see my active amount is Rp 0,-
    And my blocking amount is Rp 900.000,-
    And my total amount is Rp 900.000,-
    When I receive again amount or top up amount Rp 100.000,-
    And I access main Dashboard
    Then I will see my active amount is Rp 0,-
    And my blocking amount is Rp 1.000.000,-
    And my total amount is Rp 1.000.000,-
    And I click detail amount
    And I will see my active amount is Rp 0,-
    And my blocking amount is Rp 1.000.000,-
    And my total amount is Rp 1.000.000,-
    When I receive again amount or top up amount Rp 100.000,-
    And I access main Dashboard
    Then I will see my active amount is Rp 100.000,-
    And my blocking amount is Rp 1.000.000,-
    And my total amount is Rp 1.100.000,-
    And I click detail amount
    And I will see my active amount is Rp 100.000,-
    And my blocking amount is Rp 1.000.000,-
    And my total amount is Rp 1.100.000,-