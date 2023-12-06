Feature: User Should See Main Dashboard Rejected Card On Loan Application
    In main dashboard
    As a customer
    I need to see main dashbord status

    Background: User must login to main dashboard
        Given I am a registered customer w
            | userID   | pent5a1e   |
            | password | Test1234 |
        When I filling in form login with
            | userID   | pent5a1e   |
            | password | Test1234 |
        And I click login
        And I click later

    Scenario: User validate Rejected Card main dashboard Loan Application
        Given user on main dashboard
        When user should see text button "Pembuatan Rekening Ditolak" on field "Perbankan Giro"
        Then user should see loan application name on card saldo