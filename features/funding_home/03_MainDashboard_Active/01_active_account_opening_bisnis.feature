Feature: User Should See Main Dashboard Active Card On Account Opening Bisnis
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

    Scenario: User validate Active Card main dashboard Acc Opening Bisnis
        Given user on main dashboard
        When user should see text button "Ajukan Pinjaman" on field "btnLoan"
        Then user should see company name on card saldo