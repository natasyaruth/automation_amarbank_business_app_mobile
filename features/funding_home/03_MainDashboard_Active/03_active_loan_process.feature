Feature: User Should See Main Dashboard Active Card On Loan Process
    In main dashboard
    As a customer
    I need to see main dashbord status

    Background: User must login to main dashboard
        Given I am a registered customer w
            | userID      | pent5a1e |
            | password    | Test1234 |
            | userIDstg   | stag76ee |
            | passwordStg | Test1234 |
        When I filling in form login with
            | userID      | pent5a1e |
            | password    | Test1234 |
            | userIDstg   | stag76ee |
            | passwordStg | Test1234 |
        And I click login
        And I click later

    @C109163
    Scenario: User validate Active Card main dashboard All Active Limit
        Given user on main dashboard
        When user should see value limit active
        Then user should see activity loan wording
        And user should see card balance

    @C109164
    Scenario: User validate Active Card main dashboard Active Limit and one loan process
        Given user on main dashboard
        When user should see value limit active
        Then user should see activity loan wording
        And user should see total loan process
        And user should see card balance

    @C109165
    Scenario: User validate Active Card main dashboard Active Limit and one loan process countdown
        Given user on main dashboard
        When user should see value limit active
        Then user should see activity loan wording
        And user should see total loan process
        And user should see card balance

    @C109166
    Scenario: User validate Active Card main dashboard Account Active and In Process Loan
        Given user on main dashboard
        When user should see total loan process
        Then user should see button apply new limit loan
        And user should see card balance

    @C109167
    Scenario: User validate Active Card main dashboard Account Active and In Process Loan with count down
        Given user on main dashboard
        When user should see total loan process
        Then user should see button apply new limit loan
        And user should see card balance