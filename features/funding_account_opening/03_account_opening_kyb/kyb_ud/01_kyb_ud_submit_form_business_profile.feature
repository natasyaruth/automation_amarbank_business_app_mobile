@kybSubmitFormBusinessProfileUD
Feature: Account Opening KYB UD - Submit Business Profile
    In order to opening my Giro account with legality business type UD in SMB
    As a customer
    I want to submit my business profile as part of the KYB Process

    Background: User choose legality business type UD
        Given I am a registered customer with following details:
            | userID      | ruth9fe2 |
            | password    | Test1234 |
            | userIDstg   | ruth1684 |
            | passwordStg | 1234Test |
        And I filling in form login with the following details:
            | userID      | ruth9fe2 |
            | password    | Test1234 |
            | userIDstg   | ruth1684 |
            | passwordStg | 1234Test |
        And I click login
        And I will directing to Hook 1 Onboarding Account Opening
        And I swipe to card Giro Account
        And I choose Giro Account
        And I choose Giro Account MSME
        And I choose legality business type 'ud'
        And I submit my legality type
        And I update my last journey step to 'Data Employment'

    @C96572
    Scenario: Submit form Business Profile successfully business type UD
        Given I am a customer who has completed my KYC process
        When I continue to process KYB
        And I fill my business profile as followings:
            | businessName      | PT. ABCD        |
            | industry          | Jasa            |
            | businessField     | Restoran        |
            | monthlyIncome     | 30 - 50 juta    |
            | npwp              | 906283213036000 |
            | nib               | 9129106701234   |
            | businessDateStart | 10/10/2010      |
        And I submit my business profile
        Then I will notify my business profile has successfully submitted
        And I will directing to page business owner