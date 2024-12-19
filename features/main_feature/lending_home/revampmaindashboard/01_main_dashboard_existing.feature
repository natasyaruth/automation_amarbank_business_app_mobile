Feature: User Should See New dashboard condition
    In main dashboard
    As a customer
    I need to see main dashbord status when no activity

    Background: Login with registered account
        Given I am a registered customer with following details:
            | userID      | tesd5f07 |
            | password    | Test1234 |
            | userIDstg   | stag76ee |
            | passwordStg | Test1234 |
        When I filling in form login with following details:
            | userID      | tesd5f07 |
            | password    | Test1234 |
            | userIDstg   | stag76ee |
            | passwordStg | Test1234 |
        And I click login
        

    
    @testnurul01
    Scenario: User validate main dashboard when no activity
        Given user on main dashboard
        And user should see text card "Kredit Bisnis untuk berbagai kebutuhan usaha" on field "textViewBodyDesc"
        And user should see text button "Ajukan Limit Kredit" on field "btnLoan"
        And user should see text card "Dapatkan benefit seperti Gratis Biaya Admin, Transaksi Real-Time, dan keuntungan lainnya"
        And user should see text button "Pilih Rekening Giro" on field "btnStartGiro"


    
    


       