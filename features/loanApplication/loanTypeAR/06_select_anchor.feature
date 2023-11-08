
Feature: Select the Anchor AR
    As a customer lead
    I want to select the anchor

    Background:
        Given I am a registered customer with following details:
            | userID   | niza59ce  |
            | password | Feb042017 |
        When I filling in form login with the following details:
            | userID   | niza59ce  |
            | password | Feb042017 |
        And I click login
        Then I successed go to dashbord
        And I click button loan dashboard
        And user click button ajukan pinjaman
        And user on loan type page
        And user select loan type "AR"
        And user click button lihat skema pinjaman
        And user on loan schema "AR"
        And user click button select the schema

   
    Scenario: user search anchor is not found AR
        Given user on the anchor page
        When user fill search anchor "testingaja"
        Then user validate anchor is not found

    
    Scenario: User can select anchor on the list AR
        Given user on the anchor page
        And user fill search anchor "Kumarat"
        When user select result of search
        And user on anchor cooperating page
        Then user select the date cooperating
        And user back to list anchor page

    
    Scenario: User validate error field on form another anchor AR
        Given user on the anchor page
        When user click icon other anchor
        And user on anchor cooperating page
        Then user click button next
        And user should see error "Nama supplier wajib diisi" in the below of field "anchorNameField"
        And user should see error "Tipe industri wajib diisi" in the below of field "industryTypeField"
        And user should see error "Tanggal bekerjasama wajib diisi" in the below of field "dateField"
        And user should see error "Nama perwakilan wajib diisi" in the below of field "PICNameField"
        And user should see error "Nomor Hp / Telepon wajib diisi" in the below of field "PICNumberField"
        
    
    Scenario: User success fill data other anchor AR
        Given user on the anchor page
        When user click icon other anchor
        Given user on anchor cooperating page
        And user fill a field "anchorName" with "UD Dagangan"
        When user select industry type
        And user select the date cooperating
        And user fill a field "PICNameField" with "Budi"
        And user fill a field "PICNumberField" with "08123456789"
        Then user click button next