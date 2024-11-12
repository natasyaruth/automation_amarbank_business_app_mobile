Feature: User Should See Main Dashboard Active Card On Account Opening Bisnis
    In main dashboard
    As a customer
    I need to see main dashbord status

    @C136607
    Scenario: User validate Active Card main dashboard Acc Opening Bisnis
        Given I am a registered customer with following details:
            | userID      | pang6f17 |
            | password    | Test1234 |
            | userIDstg   | stagb6ff |
            | passwordStg | 1234Test |
        When I filling in form login with the following details:
            | userID      | pang6f17 |
            | password    | Test1234 |
            | userIDstg   | stagb6ff |
            | passwordStg | 1234Test |
        And I click login
        And I click later in pop up biometric
        Then I will see main dashboard with widget 'active'
        And I see my active amount, blocking amount and total amount is masked