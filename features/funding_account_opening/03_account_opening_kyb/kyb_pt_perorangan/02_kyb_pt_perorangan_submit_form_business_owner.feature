@kybSubmitFormBusinessOwnersIndividualBusiness
Feature: Account Opening KYB PT Perorangan - Submit Business Owners
    In order to opening my Giro account with legality business type PT Perorangan in SMB
    As a customer
    I want to submit list business owner as part of the KYB Process

    Background: User choose legality business type PT Perorangan
        Given I am a registered customer with following details:
            | userID      | ruthec01 |
            | password    | 1234Test |
            | userIDstg   | stag76ee |
            | passwordStg | Test1234 |
        And I filling in form login with the following details:
            | userID      | ruthec01 |
            | password    | 1234Test |
            | userIDstg   | stag76ee |
            | passwordStg | Test1234 |
        And I click login
        And I will directing to Hook 1 Onboarding Account Opening
        And I swipe to card Giro Account
        And I choose Giro Account
        And I choose Giro Account MSME
        And I choose legality business type 'individualBusiness'
        And I submit my legality type
        And I update my last journey step to 'Data Employment'
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

    @C96562
    Scenario: Submit form Business owner successfully business type PT Perorangan
        Given I am a customer who has submitted my business profile
        And I am the only one business owner
        When I submit business owner list
        Then I will notify business owner list has successfully submitted
        And I will directing to page business address