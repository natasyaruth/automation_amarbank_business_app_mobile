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
        And user see button Lihat Detail Pinjaman
        And user see button Gunakan Limit
        And user should see text card "Aktivitas Pinjaman" on field "textCardActivityLoan"         
        And user should see card balance

    @C109164
    Scenario: User validate Active Card main dashboard Active Limit and one loan process
        Given user on main dashboard
        When user should see value limit active
        And user see button Lihat Detail Pinjaman
        And user see button Gunakan Limit
        And user should see text card "Aktivitas Pinjaman" on field "textCardActivityLoan"         
        And user should see card balance


    @C109165
    Scenario: User validate Active Card main dashboard Active Limit and one loan process countdown
        Given user on main dashboard
        When user should see value limit active
        And user see button Lihat Detail Pinjaman
        And user see button Gunakan Limit
        And user should see text card "Aktivitas Pinjaman" on field "textCardActivityLoan"         
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

    Scenario: User verify and validate button Lihat Detail Pinjaman in state All Active
        Given user on main dashboard
        When user should see value limit active
        And user see button Lihat Detail Pinjaman
        And user click button Lihat Detail Pinjaman           
        Then user go to Loan Dashboard page
        

    Scenario: user verify and validate button Aktivitas Pinjaman in state All Active
        Given user on main dashboard
        When user should see value limit active     
        And user see button Lihat Detail Pinjaman      
        And user click button Aktivitas Pinjaman      
        And user on Aktvitas Pinjaman page with status "Dalam Proses"

    
    Scenario: User validate Aktivitas Pinjaman in state All Active and in Process Loan
        Given user on main dashboard
        When user should see value limit active     
        And user see button Lihat Detail Pinjaman      
        And user click button Aktivitas Pinjaman
        And user on Aktvitas Pinjaman page with status "Dalam Proses"
        
     
    Scenario: user verify and validate button Aktivitas Pinjaman in state All Active and  In Process Loan with Countdown
        Given user on main dashboard
        When user should see value limit active     
        And user see button Lihat Detail Pinjaman      
        And user click button Aktivitas Pinjaman  
        And user on Aktvitas Pinjaman page with status "Dalam Proses"

    

 