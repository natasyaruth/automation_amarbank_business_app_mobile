Feature: Dashboard Manual - Survey and Rating
    In order give feedback after Limit activated
    As a Customer
    I want to give rating and feedback

    
    Scenario: Checking survey limit active in speadsheet
        Given I already give survey rating
        And survey is generated to spreadsheet
        When I check in spreadsheet
        Then I will see the survey rating

    
    Scenario: Checking survey limit rejected in speadsheet
        Given I already give survey rating
        And survey is generated to spreadsheet
        When I check in spreadsheet
        Then I will see the survey rating


    Scenario: Give 5 rating limit active after customer ignore give rating after limit active
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
        And I will see pop up rating survey limit activated
        And I give '4' ratings for activated limit
        And I sent feedback survey
        Then I will see snackbar my survey is sent
        And I will see card limit 'active'

    Scenario: Give 2 rating limit active
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
        And I will see pop up rating survey limit activated
        And I give '2' ratings
        And I will see comment box to give feedback
        And I fill feedback survey 'Not really good'
        And I click Kirim Penilaian        
        Then I will see toastbar my survey is sent      
        And I will see limit active

    