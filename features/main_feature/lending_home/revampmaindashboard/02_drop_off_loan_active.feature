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
        When I have accessed the unified dashboard              
        Then I should see text card revamp "Limit Tersedia" on field "textViewLimittersedia"  
        And I should see text button revamp  "Gunakan Limit" on field "btntextgunakanlimit"
        And I should see text button revamp "Aktivitas Pinjaman" on field "btntextCardActivityLoan"
        And I should see text button revamp "Tambah Limit Baru" on field "btntextaddnewlimit"

    
    Scenario: User validate drop off main dashboard have more than 1 active limit
        Given I am a customer want to login
        When I have accessed the unified dashboard             
        And I should see text card for more than 1 limit "Total Limit Pinjaman" on field "textviewtotallimit" 
        And I should see text button revamp  "Gunakan Limit" on field "btntextgunakanlimit"
        And I should see text button revamp "Aktivitas Pinjaman" on field "btntextCardActivityLoan"
        And I should see text button revamp "Tambah Limit Baru" on field "btntextaddnewlimit"
        And I should see more than one active limit loan

    Scenario: User validate drop off main dashboard have more than 1 active limit and active bill
        Given I am a customer want to login
        When I have accessed the unified dashboard          
        Then I should see text card for more than 1 limit "Total Limit Pinjaman" on field "textviewtotallimit"  
        And I should see text button revamp "Gunakan Limit" on field "btntextgunakanlimit"
        And I should see text button revamp "Aktivitas Pinjaman" on field "btntextCardActivityLoan"
        And I should see text button revamp "Tambah Limit Baru" on field "btntextaddnewlimit"
        And I should see more than one active limit loan
        And I have information "2 Tagihan Aktif" on maindashboard

    Scenario: User validate drop off main dashboard have more than 1 active limit and active bill (due date)
        Given I am a customer want to login
        When I have accessed the unified dashboard        
        Then I should see text card for more than 1 limit "Total Limit Pinjaman" on field "textviewtotallimit"  
        And I should see text button revamp "Gunakan Limit" on field "btntextgunakanlimit"
        And I should see text button revamp "Aktivitas Pinjaman" on field "btntextCardActivityLoan"
        And I should see text button revamp "Tambah Limit Baru" on field "btntextaddnewlimit"
        And I should see more than one active limit loan
        And I have information "2 Tagihan Aktif" on maindashboard
        And I validate text for nearest repayment


    Scenario: User validate drop off main dashboard have more than 1 active limit and active bill (autodebet success)
        Given I am a customer want to login
        When I have accessed the unified dashboard        
        And I should see text card "Total Limit Pinjaman" on field "textviewtotallimit"  
        And I should see text button revamp "Gunakan Limit" on field "btnuselimit"
        And I should see text button revamp "Aktivitas Pinjaman" on field "btntextCardActivityLoan"
        And I should see text button revamp "Tambah Limit Baru" on field "btntextaddnewlimit"
        And I should see more than one active limit loan
        And I have information "2 Tagihan Aktif" on maindashboard
        And I validate text for success autodebet

    
    Scenario: User validate drop off main dashboard have more than 1 active limit and active bill (autodebet failed)
        Given I am a customer want to login
        When I have accessed the unified dashboard        
        And I should see text card "Total Limit Pinjaman" on field "textviewtotallimit"  
        And I should see text button revamp "Gunakan Limit" on field "btntextgunakanlimit"
        And I should see text button revamp "Aktivitas Pinjaman" on field "btntextCardActivityLoan"
        And I should see text button revamp "Tambah Limit Baru" on field "btntextaddnewlimit"
        And I should see more than one active limit loan
        And I have information "2 Tagihan Aktif" on maindashboard
        And I validate text for failed autodebet


    Scenario: User validate main dashboard drop off in apply limit, disburse, etc
        Given I am a customer want to login
        When I have accessed the unified dashboard       
        And I should see text card "Total Limit Pinjaman" on field "textviewtotallimit"  
        And I should see text button revamp "Gunakan Limit" on field "btntextgunakanlimit"
        And I should see text button revamp "Aktivitas Pinjaman" on field "btntextCardActivityLoan"
        And I can see tooltip on Aktivitas Pinjaman
        And I should see text button revamp "Tambah Limit Baru" on field "btntextaddnewlimit"
        And I should see more than one active limit loan
        And I have information "2 Tagihan Aktif" on maindashboard


    Scenario: User delete tooltip on Aktivitas Pinjaman
        Given I am a customer want to login
        When I have accessed the unified dashboard        
        Then I should see text card "Total Limit Pinjaman" on field "textviewtotallimit"  
        And I should see text button revamp "Gunakan Limit" on field "btntextgunakanlimit"
        And I should see text button revamp "Aktivitas Pinjaman" on field "btntextCardActivityLoan"
        And I click X button to close tooltip
        Then I should see text card "1" on field "textCardValueProcess"


    Scenario: Scenario validate main dashboard drop off offering, expired
        Given I am a customer want to login
        When I have accessed the unified dashboard        
        And I should see text card "Selesaikan proses penawaran limit baru!" on field "textcarddropoff"
        Then I should see text card "Total Limit Pinjaman" on field "textviewtotallimit"         
        And I should see text button revamp "Aktivitas Pinjaman" on field "btntextCardActivityLoan"
        And I should see text card "1" on field "textCardValueProcess"
        And I should see text button revamp "Tambah Limit Baru" on field "btnaddnewlimit"
        And I should see text button revamp "Gunakan Limit" on field "btntextgunakanlimit"
        And I have information "2 Tagihan Aktif" on maindashboard

        