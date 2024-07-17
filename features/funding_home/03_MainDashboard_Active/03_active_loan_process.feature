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
        When user should see text card "Kredit Bisnis untuk berbagai kebutuhan usaha" on field "textViewBodyDesc"
        Then user should see text card "Aktivitas Pinjaman" on field "textCardActivityLoan"
        And user should see text card "1" on field "textCardValueProcess"
        And user should see text card "Proses" on field "textCardProcess"
        And user should see text button "Ajukan Limit Baru" on field "btnLoanNew"
        And user should see card balance

    @C109167
    Scenario: User validate Active Card main dashboard Account Active and In Process Loan with count down
        Given user on main dashboard
        When user should see text card "Kredit Bisnis untuk berbagai kebutuhan usaha" on field "textViewBodyDesc"
        Then user should see text card "Aktivitas Pinjaman" on field "textCardActivityLoan"
        And user should see text card "1" on field "textCardValueProcess"
        And user should see text card "Proses" on field "textCardProcess"
        And user should see text button "Ajukan Limit Baru" on field "btnLoanNew"
        And user should see card balance

    Scenario: User validate button Gunakan Limit in main Dashboard When User Only Has 1 Active Limit
        Given user on main dashboard
        When see button with text "Gunakan Limit"
        Then user click button "Gunakan Limit"
        And user direct to the detail active limit

    Scenario: User validate button Gunakan Limit in main Dashboard When User Has More Than 1 Active Limit
        Given user on main dashboard
        When see button with text "Gunakan Limit"
        Then user click button "Gunakan Limit"
        And user direct to bottomsheet active limit
        And user see all the active limit
        And user close after click close in bottomsheet active limit

    Scenario: User Validate Bottomsheet Active Limit After Success Show List Active Limit
        Given user on main dashboard
        When user click bottomsheet active limit
        And success show list active limit
        Then user close the bottomsheet

    Scenario: User Access Bottomsheet Active Limit When Internet Connection is Low
        Given user on main dashboard
        When user click bottomsheet active limit
        Then user see loading icon
        Then user close the bottomsheet

    Scenario: User Access Bottomsheet Active Limit When Failed Show List Active Limit
        Given user on main dashboard
        When user click bottomsheet active limit
        Then system show failed bottomsheet of active limit
        Then user close the bottomsheet








