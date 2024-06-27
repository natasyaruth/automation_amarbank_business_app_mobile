Feature: User Should See Main Dashboard Rejected Card On Loan Application
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

    @C109169
    Scenario: User validate Rejected Card main dashboard Loan Application
        Given user on main dashboard
        When user should see text card "Kredit Bisnis untuk berbagai kebutuhan usaha" on field "textViewBodyDesc"
        When user should see text card "Aktivitas Pinjaman" on field "textCardActivityLoan"
        When user should see text button "Ajukan Limit Baru" on field "btnLoanNew"
        Then user should see loan application name on card saldo