Feature: User should see Unified Loan and Current Account Dashboard in Loan Active 
  As a user
  I want to access a single unified dashboard
  So that I can easily manage my current account and loan details.


    Background: User must login to home dashboard
        Given I am a registered customer with following details
            | userID      | botse324   |
            | password    | TestSmb123 |
            | userIDstg   | stag76ee   |
            | passwordStg | Test1234   |
        When I filling in form login with following details
            | userID      | botse324   |
            | password    | TestSmb123 |
            | userIDstg   | stag76ee   |
            | passwordStg | Test1234   |
        And I click login
        And I click later

    @C109149
    Scenario: User validate drop off main dashboard have 1 active limit by default and default tabs pinjaman 
        Given I am a customer want to login
        When user on main dashboard
        And user should see two tabs labeled Loan and Giro Account
        Then user should see text card "Limit Tersedia" on field "textcardlimit"  
        And user should see text button "Gunakan Limit" on field "btnuselimit"
        And user should see text button "Aktivitas Pinjaman" on field "textCardActivityLoan"
        And user should see text button "Tambah Limit Baru" on field "btnaddnewlimit"

    
    Scenario: User validate drop off main dashboard have more than 1 active limit
        Given I am a customer want to login
        When user on main dashboard
        And user should see two tabs labeled Loan and Giro Account
        Then user should see text card "Total Limit Pinjaman" on field "textcardtotallimit"  
        And user should see text button "Gunakan Limit" on field "btnuselimit"
        And user should see text button "Aktivitas Pinjaman" on field "textCardActivityLoan"
        And user should see text button "Tambah Limit Baru" on field "btnaddnewlimit"
        And user can see two limit active

    Scenario: User validate drop off main dashboard have more than 1 active limit and active bill
        Given I am a customer want to login
        When user on main dashboard
        And user should see two tabs labeled Loan and Giro Account
        Then user should see text card "Total Limit Pinjaman" on field "textcardtotallimit"  
        And user should see text button "Gunakan Limit" on field "btnuselimit"
        And user should see text button "Aktivitas Pinjaman" on field "textCardActivityLoan"
        And user should see text button "Tambah Limit Baru" on field "btnaddnewlimit"
        And user can see two limit active
        And user see text "2 Tagihan Aktif"

    Scenario: User validate drop off main dashboard have more than 1 active limit and active bill (due date)
        Given I am a customer want to login
        When user on main dashboard
        And user should see two tabs labeled Loan and Giro Account
        Then user should see text card "Total Limit Pinjaman" on field "textcardtotallimit"  
        And user should see text button "Gunakan Limit" on field "btnuselimit"
        And user should see text button "Aktivitas Pinjaman" on field "textCardActivityLoan"
        And user should see text button "Tambah Limit Baru" on field "btnaddnewlimit"
        And user can see two limit active
        And user see text "2 Tagihan Aktif"
        And user see text "Tagihan terdekat akan di autodebet 3 Hari Lagi" on field "textcardautodebet"


    Scenario: User validate drop off main dashboard have more than 1 active limit and active bill (autodebet success)
        Given I am a customer want to login
        When user on main dashboard
        And user should see two tabs labeled Loan and Giro Account
        Then user should see text card "Total Limit Pinjaman" on field "textcardtotallimit"  
        And user should see text button "Gunakan Limit" on field "btnuselimit"
        And user should see text button "Aktivitas Pinjaman" on field "textCardActivityLoan"
        And user should see text button "Tambah Limit Baru" on field "btnaddnewlimit"
        And user can see two limit active
        And user see text "2 Tagihan Aktif"
        And user see text "1 Tagihan berhasil dibayar" on field "textcardrepaysuccess"

    
    Scenario: User validate drop off main dashboard have more than 1 active limit and active bill (autodebet failed)
        Given I am a customer want to login
        When user on main dashboard
        And user should see two tabs labeled Loan and Giro Account
        Then user should see text card "Total Limit Pinjaman" on field "textcardtotallimit"  
        And user should see text button "Gunakan Limit" on field "btnuselimit"
        And user should see text button "Aktivitas Pinjaman" on field "textCardActivityLoan"
        And user should see text button "Tambah Limit Baru" on field "btnaddnewlimit"
        And user can see two limit active
        And user see text "2 Tagihan Aktif"
        And user see text "Autodebet gagal, Pastikan saldo mencukupi." on field "textcardrepayfailed"


    Scenario: User validate main dashboard drop off in apply limit, disburse, etc
        Given I am a customer want to login
        When user on main dashboard
        And user should see two tabs labeled Loan and Giro Account
        Then user should see text card "Total Limit Pinjaman" on field "textcardtotallimit"  
        And user should see text button "Gunakan Limit" on field "btnuselimit"
        And user should see text button "Aktivitas Pinjaman" on field "textCardActivityLoan"
        And user can see tooltip on Aktivitas Pinjaman
        And user should see text button "Tambah Limit Baru" on field "btnaddnewlimit"
        And user can see two limit active
        And user see text "2 Tagihan Aktif"


    Scenario: User delete tooltip on Aktivitas Pinjaman
        Given I am a customer want to login
        When user on main dashboard
        And user should see two tabs labeled Loan and Giro Account
        Then user should see text card "Total Limit Pinjaman" on field "textcardtotallimit"  
        And user should see text button "Gunakan Limit" on field "btnuselimit"
        And user should see text button "Aktivitas Pinjaman" on field "textCardActivityLoan"
        And user click X button to close tooltip
        Then user should see text card "1" on field "textCardValueProcess"


    Scenario: Scenario validate main dashboard drop off offering, expired
        Given I am a customer want to login
        When user on main dashboard
        And user should see two tabs labeled Loan and Giro Account
        And user should see text card "Selesaikan proses penawaran limit baru!" on field "textcarddropoff"
        Then user should see text card "Total Limit Pinjaman" on field "textcardtotallimit"         
        And user should see text button "Aktivitas Pinjaman" on field "textCardActivityLoan"
        And user should see text card "1" on field "textCardValueProcess"
        And user should see text button "Tambah Limit Baru" on field "btnaddnewlimit"
        And user should see text button "Gunakan Limit" on field "btnuselimit"
        And user see text "2 Tagihan Aktif"
        