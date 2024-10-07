@kycSubmitFormDataPersonalPTPerorangan
Feature: Account Opening KYC PT Perorangan - Submit Data Personal
    In order to opening my Giro account with legality business type PT Perorangan in SMB
    As a customer
    I want to submit my data personal as part of the KYC Process

    Background: User choose legality business type PT Perorangan
        Given I am a registered customer with following details:
            | userID      | ruth07f9 |
            | password    | 1234Test |
            | userIDstg   | ruthdadb |
            | passwordStg | 1234Test |
        And I filling in form login with the following details:
            | userID      | ruth07f9 |
            | password    | 1234Test |
            | userIDstg   | ruthdadb |
            | passwordStg | 1234Test |
        And I click login
        And I click later in pop up biometric
        And I will directing to Hook 1 Onboarding Account Opening
        And I swipe to card Giro Account
        And I choose Giro Account
        And I choose Giro Account MSME
        And I submit my giro type
        And I choose legality business type 'individualBusiness'
        And I submit my legality type
        And I fill NPWP Business
        And I click continue to data personal
        And I click confirm NPWP Business
        And I see page 'Upload eKTP'
        And I update my last journey step to 'Upload Selfie with KTP'

    @C131837
    Scenario: Submit form Data Personal successfully business type PT Perorangan
        Given I am a customer want to fill my personal details
        When I submit my personal data details business and upload my npwp as followings:
            | lastEducation        | SMA          |
            | motherName           | NADYA LAMUSU |
            | referenceName        | IBU SAYA     |
            | referencePhoneNumber | 812343455677 |
        Then I will notify my personal details has successfully submitted
        And I will direct to page domicile address
        And I reset my state journey