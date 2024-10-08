Feature: User Should See Main Dashboard Active Card On Account Opening Individu
    In main dashboard
    As a customer
    I need to see main dashbord status

    Background: Login to app
        Given I am a registered customer with following details:
            | userID      | pent5a1e |
            | password    | Test1234 |
            | userIDstg   | stag76ee |
            | passwordStg | Test1234 |
        When I filling in form login with the following details:
            | userID      | pent5a1e |
            | password    | Test1234 |
            | userIDstg   | stag76ee |
            | passwordStg | Test1234 |
        And I click login

    @C136608
    Scenario: User validate Active Card main dashboard Acc Opening Individu
        Given I am on main dashboard
        And I click later in pop up biometric
        Then I will see main dashboard with widget 'active'
        And I see my active amount, blocking amount and total amount is masked

    @C161966
    Scenario: Copy account number   
        Given I am on main dashboard
        And I click later in pop up biometric
        And I will see main dashboard with widget 'active'
        When I copy my account number
        Then I will see snackbar success copy account number
        And snackbar success copy account number will dissapear after 3-4 seconds