Feature: Account Opening Manual - Submit Data Personal
    In order to opening my Giro account in SMB
    As a customer
    I want to submit my data personal as part of the KYC Process

    Scenario: Take picture NPWP
        Given I am a customer want to take picture my NPWP in personal details
        When I click button upload NPWP
        And I choose take picture NPWP
        And I capture my NPWP photo
        Then I will direct to page personal details
        And I see information NPWP was successfully uploaded

    Scenario: Take picture NPWP with blank picture
        Given I am a customer want to take picture my NPWP in personal details
        When I click button upload NPWP
        And I choose take picture NPWP
        And I capture my NPWP photo
        Then I will direct to page personal details
        And I see information NPWP was successfully uploaded

    Scenario: Upload NPWP from gallery
        Given I am a customer want to upload my NPWP in personal details
        When I click button upload NPWP
        And I choose upload from gallery
        And I choose the image
        Then I will direct to page personal details
        And I see information NPWP was successfully uploaded

    Scenario: Upload NPWP with size more than 10 MB
        Given I am a customer want to upload my NPWP in personal details
        When I click button upload NPWP
        And I choose upload from gallery
        And I choose the image with size more than 10MB
        Then I will direct to page personal details
        And I see message error file size should be not more than 10MB

    Scenario: Retake picture NPWP
        Given I am a customer want to retake picture NPWP in personal details
        When I click icon pencil in section upload NPWP
        And I choose take picture NPWP
        And I capture my NPWP photo
        Then I will direct to page personal details
        And I see information NPWP was successfully uploaded

    Scenario: Upload again via gallery
        Given I am a customer want to reupload my NPWP in personal details
        When I click icon pencil in section upload NPWP
        And I choose upload from gallery
        And I choose the image
        Then I will direct to page personal details
        And I see information NPWP was successfully uploaded