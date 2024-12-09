Feature: Unified Loan Account Giro Dashboard
  As a user
  I want to access a single unified dashboard


    Background: User must login to home da
        Given I am a registered customer w
            | userID      | bots937a |
            | password    | Test1234 |
            | userIDstg   | stag76ee |
            | passwordStg | Test1234 |
        When I filling in form login with
            | userID      | bots937a |
            | password    | Test1234 |
            | userIDstg   | stag76ee |
            | passwordStg | Test1234 |
        And I click login
        And I click later


    
  Scenario: Display unified dashboard tabs
    Given user logged into the apps
    When user on main dashboard
    Then user should see two tabs labeled "Account Giro" and "Loan"


  Scenario: Default tab selection
    Given user have an active loan
    When user on main dashboard
    Then user on the "Loan" tab should be displayed by default


Scenario: Move tab to Giro
    Given user am on the "Loan" tab
    When user switch to the "Account Giro" tab
    Then user on the "Account Giro" tab 


