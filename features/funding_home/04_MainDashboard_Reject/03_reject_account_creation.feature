Feature: User Should See Main Dashboard Rejected Card On Account Creation
    In main dashboard
    As a customer
    I need to see main dashbord status

    Background: User must login to main dashboard
        Given I am a registered customer w
            | userID   | akun0373   |
            | password | Test1234 |
        When I filling in form login with
            | userID   | akun0373   |
            | password | Test1234 |
        And I click login
        And I click later

    Scenario: User validate Rejected Card main dashboard Acc Creation
        Given user on main dashboard
        When user should see text button "Pembuatan Rekening Ditolak" on field "Perbankan Giro"
        Then user should see acc creation name on card saldo