Feature: User Should See Main Dashboard Active Card On Account Opening Individu
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

    @C109162
    Scenario: User validate Active Card main dashboard Acc Opening Individu
        Given user on main dashboard
        When user should see text button "Ajukan Pinjaman" on field "btnLoan"
        Then user should see individu name on card saldo