@kybSubmitFormBusinessAddressUD
Feature: Account Opening KYB UD - Submit Business Address
    In order to opening my Giro account with legality business type UD in SMB
    As a customer
    I want to submit my business address as part of the KYB Process

    Background: User choose legality business type UD
        Given I am a registered customer with following details:
            | userID      | udteea44 |
            | password    | 1234Test |
            | userIDstg   | ruth1684 |
            | passwordStg | 1234Test |
        And I filling in form login with the following details:
            | userID      | udteea44 |
            | password    | 1234Test |
            | userIDstg   | ruth1684 |
            | passwordStg | 1234Test |
        And I click login
        And I click later in pop up biometric
        And I will directing to Hook 1 Onboarding Account Opening
        And I swipe to card Giro Account
        And I choose Giro Account
        And I choose Giro Account MSME
        And I choose legality business type 'ud'
        And I submit my legality type
        And I update my last journey step to 'Data Employment'
        When I continue to process KYB
        And I fill my business profile as followings:
            | businessName      | UD TERBARU KYC TIGA |
            | industry          | Jasa                |
            | businessField     | Restoran            |
            | monthlyIncome     | 30 - 50 juta        |
            | npwp              | 988283213036000     |
            | nib               | 912910111111234     |
            | businessDateStart | 10/10/2010          |
        And I submit my business profile
        And I submit business owner list

    @C131946
    Scenario: Submit form Business Address successfully business type UD
        Given I am a customer who has submitted business owner list
        When I fill my business address as followings:
            | address  | Jl. Gambir Belok kanan No. 23 |
            | rt       | 010                           |
            | rw       | 027                           |
            | province | DKI JAKARTA                   |
            | city     | JAKARTA SELATAN               |
            | district | PANCORAN                      |
            | village  | PANCORAN                      |
        And I allow company to store my data
        And I submit my business address
        Then I will directing to page upload require documents for business individual
        And I can close the page so that I can back to main dashboard