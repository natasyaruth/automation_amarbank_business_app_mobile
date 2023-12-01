Feature: User Should See Main Dashboard Active Card On Account Opening Individu
    In main dashboard
    As a customer
    I need to see main dashbord status

    Background: User must login to main dashboard
        Given I am a registered customer w
            | userID   | pent5a1e |
            | password | Test1234 |
        When I filling in form login with
            | userID   | pent5a1e |
            | password | Test1234 |
        And I click login
        And I click later

    Scenario: User validate Active Card main dashboard All Active Limit
        Given user on main dashboard
        When user should see value limit active
        Then user should see activity loan wording
        And user should see card balance

    Scenario: User validate Active Card main dashboard Active Limit and one loan process
        Given user on main dashboard
        When user should see value limit active
        Then user should see activity loan wording
        And user should see total loan process
        And user should see card balance

    Scenario: User validate Active Card main dashboard Active Limit and one loan process countdown
        Given user on main dashboard
        When user should see value limit active
        Then user should see activity loan wording
        And user should see total loan process
        And user should see card balance

    Scenario: User validate Active Card main dashboard Account Active and In Process Loan
        Given user on main dashboard
        When user should see total loan process
        Then user should see button apply new limit loan
        And user should see card balance

    Scenario: User validate Active Card main dashboard Account Active and In Process Loan with count down
        Given user on main dashboard
        When user should see total loan process
        Then user should see button apply new limit loan
        And user should see card balance