@kycSubmitFormDataPersonalPTPerusahaan
Feature: Account Opening KYC PT Perusahaan - Submit Data Personal
    In order to opening my Giro account with legality business type PT Perusahaan in SMB
    As a customer
    I want to submit my data personal as part of the KYC Process

    Background: User choose legality business type PT Perusahaan
        Given I am a registered customer with following details:
            | userID   | ruth15ff |
            | password | Test1234 |
        And I filling in form login with the following details:
            | userID   | ruth15ff |
            | password | Test1234 |
        And I click login
        And I will directing to Hook 1 Onboarding Account Opening
        And I swipe to card Giro Account
        And I choose Giro Account
        And I choose legality business type 'company'
        And I submit my legality type
        And I update my last journey step to 'Upload Selfie'

    @C96540
    Scenario: Submit form Data Personal successfully business type PT Perusahaan
        Given I am a customer want to fill my personal details
        When I submit my personal data details business and upload my npwp as followings:
            | lastEducation  | SMA           |
            | motherName     | NADYA LAMUSU  |
        Then I will notify my personal details has successfully submitted
        And I will direct to page domicile address