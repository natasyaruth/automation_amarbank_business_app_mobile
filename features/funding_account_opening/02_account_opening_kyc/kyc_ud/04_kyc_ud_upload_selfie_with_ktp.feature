Feature: Account Opening KYC UD - Upload Selfie with KTP
    In order to opening my Giro account with legality business type UD in SMB
    As a customer
    I want to upload my selfie photo with KTP as part of the KYC Process

    Background: User choose legality business type UD
        Given I am a registered customer with following details:
            | userID      | natabe66 |
            | password    | Test1234 |
            | userIDstg   | ruth73e1 |
            | passwordStg | 1234Test |
        And I filling in form login with the following details:
            | userID      | natabe66 |
            | password    | Test1234 |
            | userIDstg   | ruth73e1 |
            | passwordStg | 1234Test |
        And I click login
        And I click later in pop up biometric
        And I will directing to Hook 1 Onboarding Account Opening
        And I swipe to card Giro Account
        And I choose Giro Account
        And I choose Giro Account MSME
        And I submit my giro type
        And I choose legality business type 'ud'
        And I submit my legality type
        And I fill NPWP Business
        And I click continue to data personal
        And I click confirm NPWP Business
        And I see page 'Upload eKTP'
        And I update my last journey step to 'Upload Selfie'

    @C171086
    Scenario: Upload selfie with KTP successfully business type UD   
        Given I am a customer who has uploaded my selfie photo
        When I click take photo selfie with KTP
        And I will directing to page take selfie with KTP
        And I click take photo
        And I will direct to page preview selfie picture with KTP
        And I submit my selfie with KTP
        Then I will notify my selfie with KTP is successfully submitted
        And I will directing to page submit Data Personal
        And I reset my state journey