@kycSubmitFormDomicileAddressIndividual
Feature: Account Opening KYC Individual - Submit Domicile Address
    In order to opening my Giro account with legality business type Individual in SMB
    As a customer
    I want to submit my domiciles address as part of the KYC Process

    Background: User choose legality business type Individual
        Given I am a registered customer with following details:
            | userID   | ruth07f9 |
            | password | 1234Test |
        And I filling in form login with the following details:
            | userID   | ruth07f9 |
            | password | 1234Test |
        And I click login
        And I will directing to Hook 1 Onboarding Account Opening
        And I swipe to card Giro Account
        And I choose Giro Account
        And I choose legality business type 'individual'
        And I submit my legality type
        And I upload my eKTP photo
        And I fill all information identity details as followings:
            | eKtpNumber    | 3174090101780017          |
            | fullName      | NADYA LAROSA              |
            | placeOfBirth  | MEDAN                     |
            | dateOfBirth   | 11/11/1995                |
            | gender        | Laki-laki                 |
            | address       | Jl. Durian Runtuh No. 13  |
            | rt            | 01                        |
            | rw            | 05                        |
            | province      | DKI JAKARTA               |
            | city          | KOTA ADM. JAKARTA SELATAN |
            | district      | KEBAYORAN BARU            |
            | village       | SENAYAN                   |
            | religion      | Katolik                   |
            | maritalStatus | Belum Kawin               |
        And I submit my information identity details
        And I upload my selfie photo
        And I fill my personal data details as followings:
            | lastEducation  | SMA             |
            | motherName     | NADYA LAMUSU    |
            | purposeAccount | Pinjaman        |
            | npwp           | 121785542123321 |
        And I submit my personal data details

    @C96527
    Scenario: Submit form Domicile address same with KTP successfully business type Individual
        Given I am a customer who has submitted my personal data details
        When I choose my domicile address same with my identity information
        And I submit my domicile address
        Then I will notify my domicile address has successfully submitted
        And I will direct to page Data Employment Individual

    @C96528
    Scenario: Submit form Domicile address with new address successfully business type Individual
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
        And I will direct to page Data Employment Individual