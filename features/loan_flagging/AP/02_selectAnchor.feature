Feature: Select the Anchor
    As a customer lead
    I want to select the anchor


    Background:
        Given I am a registered customer with following details:
            | userID   | trys5524  |
            | password | Eca12345 |
        When I filling in form login with the following details:
            | userID   | trys5524 |
            | password | Eca12345|
        And I click login
        And I click button Ajukan Pinjaman
        And I Input Nominal Pinjaman '6500000000'
        And I Input Tenor '90'
        And I click on button Selanjutnya
        And I select loan type "AP"
        And I click on Select the schema
        And I am on loan Schema "AP"
        And I click button Select the schema

    Scenario: user search anchor is not found
        Given I on the anchor page
        When I fill search anchor "testingaja"
        Then I validate anchor is not found

    Scenario: User can select anchor lead on the list
        Given I on the anchor page
        And I fill search anchor "PT Tirta Investama"
        When I select result of search
        And I am on anchor cooperating page
        And I tick on tick box
        And I select the date cooperating       
        Then I click button Kirim Pengajuan Pinjaman


    Scenario: User validate error field on form another anchor
        Given I am  on the anchor page
        When I click icon other anchor
        And I on anchor cooperating page
        Then I click button next
        And I should see error "Nama buyer wajib diisi" in the below of field "anchorNameField"
        And I should see error "Tipe industri wajib diisi" in the below of field "industryTypeField"
        And I should see error "Tanggal bekerjasama wajib diisi" in the below of field "dateField"
        And I should see error "Nama perwakilan wajib diisi" in the below of field "PICNameField"
        And I scroll to view eror pic number
        And I should see error "Nomor Hp / Telepon wajib diisi" in the below of field "PICNumberField"