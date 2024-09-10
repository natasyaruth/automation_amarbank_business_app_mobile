Feature: Checking Monitoring Process
    As a customer lead
    I want to validation for processing apply loan

    Background:
        Given I am a registered customer with following details:
            | userID   | bots2912   |
            | password | TestSmb123 |
        When I filling in form login with the following details:
            | userID   | bots2912   |
            | password | TestSmb123 |
        And I click login
        And I click button Ajukan Pinjaman
        And I Input Nominal Pinjaman '6500000000'
        And I Input Tenor '90'
        And I click on button Selanjutnya
        And I select loan type "AP"
        And I click on Select the schema
        And I am on loan Schema "AP"
        And I click button Select the schema
        And I search anchor "PT Tirta Investama"
        And I select the date of cooperating
        And I tick on tick box
        And I click button Kirim Pengajuan Pinjaman
        Then I am on success Apply Loan Page

    Scenario: Validate bottom sheet showing and loan processing page
        Given I already submit for apply loan
        And I should see text bottom sheet "Selamat, Pengajuan Berhasil Dikirim" in field "titleBottomSheet"
        When I should see text bottom sheet "Pengajuanmu akan segera diproses oleh tim Amar Bank" in field "subTitleBottomSheet"
        And I should see text bottom sheet "Proses verifikasi pinjaman juga mencakup pembuatan rekening giro secara otomatis." in field "descriptionBottomSheet"
        And I close the bottom sheet
        And I close the bottom sheet
        Then I am on monitoring loan process page
        And I validate section checking document "Pengecekan Dokumen" on field "titleDocumentField"


