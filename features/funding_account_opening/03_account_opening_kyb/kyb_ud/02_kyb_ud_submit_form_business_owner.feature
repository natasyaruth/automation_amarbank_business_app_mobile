@kybSubmitFormBusinessOwnersUD
Feature: Account Opening KYB UD - Submit Business Owners
    In order to opening my Giro account with legality business type UD in SMB
    As a customer
    I want to submit list business owner as part of the KYB Process

    Background: User choose legality business type UD
        Given I am a registered customer with following details:
            | userID      | ruthec01 |
            | password    | 1234Test |
            | userIDstg   | ruth1684 |
            | passwordStg | 1234Test |
        And I filling in form login with the following details:
            | userID      | ruthec01 |
            | password    | 1234Test |
            | userIDstg   | ruth1684 |
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
        And I update my last journey step to 'Data Employment'
        And I see page 'Data Business Profile'
        When I fill my business profile as followings:
            | businessName      | PT. ABCD        |
            | industry          | Jasa            |
            | businessField     | Restoran        |
            | monthlyIncome     | 30 - 50 juta    |
            | nib               | 9129106701234   |
            | businessDateStart | 10/10/2010      |
        And I submit my business profile

    @C131945
    Scenario: Submit form Business owner successfully business type UD
        Given I am a customer who has submitted my business profile
        And I am the only one business owner
        When I submit business owner list
        Then I will notify business owner list has successfully submitted
        And I will directing to page business address