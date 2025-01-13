Feature: In-app CSAT on the main dashboard
    In order to give feedback after limit rejected
    As a Customer
    I want to give rating and feedback

  
   
Scenario: User dismissed onboarding page and returns to the main dashboard
    Given I am a registered customer with following details:
      | userID   | trys5524 |
      | password | Eca12345 |
    When I filling in form login with the following details:
      | userID   | trys5524 |
      | password | Eca12345 |
    And I click login
    And I click later
    Then I will see pop up rating survey default main dashboard

  Scenario: User blocked by the first filter and returns to the main dashboard
    Given I am a registered customer with following details:
      | userID   | trys5524 |
      | password | Eca12345 |
    When I filling in form login with the following details:
      | userID   | trys5524 |
      | password | Eca12345 |
    And I click login
    And I click later
    And I was blocked by the first filter for loan apply
    And I go back to the main dashboard
    Then I will see pop up rating survey default main dashboard

    
  Scenario: User provides a 5-star rating in the in-app CSAT prompt
    Given I am a registered customer with following details:
        | userID      | autocaea |
        | password    | 1234Test |
        | userIDstg   | staga29c |
        | passwordStg | 1234Test |
    And activate config CSAT Survey in firebase
        And I filling in form login with the following details:
            | userID      | autocaea |
            | password    | 1234Test |
            | userIDstg   | staga29c |
            | passwordStg | 1234Test |
    And I click login
    And I click later in pop up biometric
    And I will see pop up rating survey default main dashboard
    And I give '5' ratings
    And I sent feedback survey
    Then I will see pop up rating in play store
    When I click button "Beri rating" di playstore
    Then I redirect to playstore
    And I give rating on playstore


    Scenario: User provides a 4-star rating in the in-app CSAT prompt
        Given I am a registered customer with following details:
            | userID      | autocaea |
            | password    | 1234Test |
            | userIDstg   | staga29c |
            | passwordStg | 1234Test |
        And activate config CSAT Survey in firebase
        And I filling in form login with the following details:
            | userID      | autocaea |
            | password    | 1234Test |
            | userIDstg   | staga29c |
            | passwordStg | 1234Test |
        And I click login
        And I click later 
        And I will see pop up rating survey default main dashboard
        And I give '4' ratings
        And I sent feedback survey
        Then I will see snackbar my survey is sent
        And I am on maindashboard page

    Scenario: User provides a 3-star rating in the in-app CSAT prompt
        Given I am a registered customer with following details:
            | userID      | autocaea |
            | password    | 1234Test |
            | userIDstg   | staga29c |
            | passwordStg | 1234Test |
        And activate config CSAT Survey in firebase
        And I filling in form login with the following details:
            | userID      | autocaea |
            | password    | 1234Test |
            | userIDstg   | staga29c |
            | passwordStg | 1234Test |
        And I click login
        And I click later 
        And I will see pop up rating survey default main dashboard
        And I give '3' ratings
        And I will see field text feedback survey
        And I fill feedback survey 'sorry not good'
        And I sent feedback survey
        Then I will see snackbar my survey is sent
        And I am on maindashboard page
