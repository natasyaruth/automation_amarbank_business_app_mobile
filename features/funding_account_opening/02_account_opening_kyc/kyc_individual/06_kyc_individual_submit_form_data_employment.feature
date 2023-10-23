@kycSubmitFormDataEmploymentIndividual
Feature: Account Opening KYC Individual - Submit Data Employment
    In order to opening my Giro account with legality business type Individual in SMB
    As a customer
    I want to submit my data employment as part of the KYC Process

    Background: User choose legality business type Individual
        Given I am a registered customer with following details:
            | userID   | ruthd643 |
            | password | 1234Test |
        And I filling in form login with the following details:
            | userID   | ruthd643 |
            | password | 1234Test |
        And I click login
        Then I will direct to dashboard
        When I swipe to card Giro Account
        And I choose Giro Account
        And I choose legality business type 'individual'
        And I submit my legality type
        And I upload my eKTP photo
        And I fill all information identity details as followings:
            | eKtpNumber    | 3171020805780003          |
            | fullName      | INDIVIDUAL                |
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
        And I choose my new domicile address
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

    Scenario: Submit form Data Employment successfully business type Individual
        Given I am a customer who has submitted my domicile address
        When I fill my employment details as followings:
            | workType      | Pegawai Negeri Sipil |
            | sourceIncome  | Gaji Bulanan         |
            | monthlyIncome | 5 - 10 juta          |
            | industry      | Pemerintahan         |
            | companyName   | AMARBANK             |
        And I agree with the terms and condition
        And I allow company to store my data
        And I submit my employment data
        Then I will notify that my personal data details needs to be verified first