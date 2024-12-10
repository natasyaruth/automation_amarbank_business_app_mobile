Feature: Account Opening Manual - Submit Data Personal
    In order to opening my Giro account in SMB
    As a customer
    I want to submit my data personal as part of the KYC Process

    @C171185
    Scenario: Take picture NPWP
        Given I am a customer want to take picture my NPWP in personal details
        When I click button upload NPWP
        And I choose take picture NPWP
        And I capture my NPWP photo
        Then I will direct to page personal details
        And I see information NPWP was successfully uploaded

    @C171186
    Scenario: Take picture NPWP with blank picture
        Given I am a customer want to take picture my NPWP in personal details
        When I click button upload NPWP
        And I choose take picture NPWP
        And I capture my NPWP photo
        Then I will direct to page personal details
        And I see information NPWP was successfully uploaded

    @C171187
    Scenario: Upload NPWP from gallery
        Given I am a customer want to upload my NPWP in personal details
        When I click button upload NPWP
        And I choose upload from gallery
        And I choose the image
        Then I will direct to page personal details
        And I see information NPWP was successfully uploaded

    @C171188
    Scenario: Upload NPWP with size more than 10 MB
        Given I am a customer want to upload my NPWP in personal details
        When I click button upload NPWP
        And I choose upload from gallery
        And I choose the image with size more than 10MB
        Then I will direct to page personal details
        And I see message error file size should be not more than 10MB

    @C171189
    Scenario: Retake picture NPWP
        Given I am a customer want to retake picture NPWP in personal details
        When I click icon pencil in section upload NPWP
        And I choose take picture NPWP
        And I capture my NPWP photo
        Then I will direct to page personal details
        And I see information NPWP was successfully uploaded

    @C171190
    Scenario: Upload again via gallery
        Given I am a customer want to reupload my NPWP in personal details
        When I click icon pencil in section upload NPWP
        And I choose upload from gallery
        And I choose the image
        Then I will direct to page personal details
        And I see information NPWP was successfully uploaded

    @C171191
    Scenario: Check bottomsheet on Data Personal
        Given I am a customer want to check bottomsheet on Data Personal
        When I regist account
        And I am on page data verifikasi data e-Ktp
        And I click bottomsheet for Provinsi
        Then User direct to field Cari Nama Provinsi
        And Show all province on list
        And User available to scroll the list
        And User available to type name of province
        When I do the same process for Kabupaten, Kecamatan and Kelurahan
        And I continue to process 
        And I am on page alamat tempat tinggal
        And I click bottomsheet for Provinsi
        Then User direct to field Cari Nama Provinsi
        And Show all province on list
        And User available to scroll the list
        And User available to type name of province