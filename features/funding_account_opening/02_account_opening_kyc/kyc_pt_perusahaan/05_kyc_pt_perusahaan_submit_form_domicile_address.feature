@kycSubmitFormDomicileAddressPTPerusahaan
Feature: Account Opening KYC PT Perusahaan - Submit Domicile Address
    In order to opening my Giro account with legality business type PT Perusahaan in SMB
    As a customer
    I want to submit my domiciles address as part of the KYC Process

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
        And I choose Giro Account Corporate
        And I choose legality business type 'company'
        And I submit my legality type
        And I update my last journey step to 'Data Personal'

    @C96541
    Scenario: Submit form Domicile address same with KTP successfully business type PT Perusahaan
        Given I am a customer who has submitted my personal data details
        When I choose my domicile address same with my identity information
        And I submit my domicile address
        Then I will notify my domicile address has successfully submitted
        And I will direct to page Data Employment

    @C96542
    Scenario: Submit form Domicile address with new address successfully business type PT Perusahaan
        Given I am a customer who has submitted my personal data details
        When I choose my new domicile address
        And I fill new domicile details as followings:
            | typeResidence | Rumah                     |
            | address       | JL. KS TUBUN NO. 27       |
            | rt            | 01                        |
            | rw            | 01                        |
            | province      | DKI JAKARTA               |
            | city          | KOTA ADM. JAKARTA SELATAN |
            | district      | PANCORAN                  |
            | village       | PANCORAN                  |
        And I submit my domicile address
        Then I will notify my domicile address has successfully submitted
        And I will direct to page Data Employment