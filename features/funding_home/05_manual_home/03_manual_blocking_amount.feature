Feature: Dashboard Manual - Blocking amount
    In order to detail amount of customer
    As a customer
    I want to see my amount divided into active amount, blocking amount and total amount
    So that I'm not confused with my information amount

  @C133879
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

  @C133880
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

  @C133881
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

  @C133882
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

  @C133883
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

  @C133884
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