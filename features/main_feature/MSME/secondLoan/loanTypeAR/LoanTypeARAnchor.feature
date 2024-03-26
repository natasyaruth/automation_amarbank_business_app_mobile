Feature: Apply Either Loan and select the loan type
    As a customer lead
    I want to login Aplly loan and select the loan type


    Background:
        Given I am a registered customer with following details:
            # | userID   | bots2912  |
            # | password | TestSmb123 |
            | userID   | niza1356   |
            | password | Test1234 |
        When I filling in form login with the following details:
            # | userID   | bots2912  |
            # | password | TestSmb123 |
            | userID   | niza1356   |
            | password | Test1234 |
        And I click login
        And I click later
        Then I will direct to dashboard
        And I click menu tab testing
        And I click button loan dashboard

    @emes4
    Scenario: user choose type loan AR Anchor
        Given I am on onboarding loan
        And I click button ajukan pinjaman       
        And I Input Nominal Pinjaman '2400000000'
        And I Input Tenor '30'
        And I select business location jabodetabek    
        And I click on button Selanjutnya              
        And I select loan type "AP"
        And I click on Lihat Skema Pinjaman        
        And I click button select the schema
        And I fill search anchor "CV. Karunia"
        And I select result of search        
        And I select the date cooperating  
        And I will see checkbox Rights & Policy, T&C about loan and Privy
        And I click button Kirim Pengajuan Pinjaman
        And I should see text bottom sheet "Selamat, Pengajuan Berhasil Dikirim" in field "titleBottomSheet"
        And I should see text bottom sheet "Pengajuanmu akan segera diproses oleh tim Amar Bank" in field "subTitleBottomSheet"
        And user close the bottom sheet
        And I am on user on monitoring loan process page
        And I click button Upload Dokumen     
        And I upload document "npwpOfComp"
        And I upload document "proofOfPurchase"
        And I upload document "paymentMutation"
        And I upload document "financialReports"
        And I click button refresh
        And user click back button to loan processing
        # section trigered status loan
        And user trigered api change status loan is approved

    @emes5
    Scenario: User AP validate Limit Loan Activation Approved
        Given I have been access history loan limit to see status "Dalam Proses"
        When I access menu bar limit with status "Dalam Proses"
        Then I select first list card loan approved
        And user validate status is approved
        And user validate content limit approved page

    Scenario: Validate Card Limit For Type Loan AP
        Given I have been on Loan Dashboard to see the loan type of Loan AP
        When I validate the card of "Loan AP"
        Then I should see the wording dan card design of "Loan AP"
        And user click button back
        And user should see text view "Selamat, Limit Pinjaman Telah Aktif" on bottom sheet "titleLimitPinjaman"
        And user should see text bottom sheet "Limit Tersedia" in field "titleLimitTersedia"
        And user should see text bottom sheet "Buyer" in field "titleSupplier"
        And user should see text bottom sheet "No. Pinjaman" in field "titleNoPinjaman"
        And user click button copy
        And user should see text bottom sheet "Informasi Tambahan" in field "titleInformasiTambahan"
        And user click button lihat pinjaman
        