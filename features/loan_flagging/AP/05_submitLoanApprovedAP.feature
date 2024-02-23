Feature: Submit Loan Type AP Status is Approved
    As a customer lead
    I want to submit loan and Approved by VP of bussiness

    Background:
        Given I am a registered customer with foll
            | userID   | trys5524 |
            | password | Eca12345 |
        When I filling in form login with the foll
            | userID   | trys5524  |
            | password | Eca12345 |
        And I click login
        

    Scenario: User AR success fill data buyer and submit the loan
        Given I on Main dashboard
        When I click button Ajukan Pinjaman
        And I Input Nominal Pinjaman '6500000000'
        And I Input Tenor '90'
        And I click on button Selanjutnya
        And I on loan type page
        And I select loan type "AR"
        And I click on Select the schema
        And I search anchor "PT Xyz"      
        And I select the date of cooperating
       And I tick on tick box        
        And I click button Kirim Pengajuan Pinjaman
        And I click Oke      
        And I click button upload documents

        # section upload document
        Given I am on upload document page
        When I upload document "ktpnpwp"
        And I upload document "invoiceSupplier"
        And I upload document "mutasiRek"
        And I upload document "lapKeu"       
        And I click button refresh
        And I click back button to loan processing
        # section trigered status loan
        And I trigered api change status loan is approved

    Scenario: User AP validate Limit Loan Activation Approved
        Given I have been access history loan limit to see status "Dalam Proses"
        When I access menu bar limit with status "Dalam Proses"
        Then I select first list card loan approved
        And I validate status is approved
        And I validate content limit approved page