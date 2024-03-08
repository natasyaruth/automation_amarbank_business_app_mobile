Feature: Apply Either Loan and select the loan type
    As a customer lead
    I want to login Aplly loan and select the loan type


    Background:
        Given I am a registered customer with following details:
            | userID   | bots2912  |
            | password | TestSmb123 |
        When I filling in form login with the following details:
            | userID   | bots2912  |
            | password | TestSmb123 |
        And I click login
        And I click later
        Then I will direct to dashboard
        And I click menu tab testing
        And I click button loan dashboard


Scenario: User validate and select loan type PO
        Given I am on onboarding loan
        When I click button ajukan pinjaman
        And I Input Nominal Pinjaman '8000000000'
        And I Input Tenor '90'
        And I select business location jabodetabek   
        And I click button Selanjutnya              
        And I select loan type "PO"
        And I click button Lihat Skema Pinjaman
        And I click button select the schema
        And user fill a field "bowherName" with "UD Combo Box Fire"
        And user select industry type
        And user select the date cooperating
        And I will see checkbox Rights & Policy, T&C about loan and Privy
        And I click button Kirim Pengajuan Pinjaman
        And I should see text bottom sheet "Selamat, Pengajuan Berhasil Dikirim" in field "titleBottomSheet"
        And I should see text bottom sheet "Pengajuanmu akan segera diproses oleh tim Amar Bank" in field "subTitleBottomSheet"
        And I close the bottom sheet
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

    Scenario: User AP validate Limit Loan Activation Approved
        Given I have been access history loan limit to see status "Dalam Proses"
        When I access menu bar limit with status "Dalam Proses"
        Then I select first list card loan approved
        And user validate status is approved
        And user validate content limit approved page
        