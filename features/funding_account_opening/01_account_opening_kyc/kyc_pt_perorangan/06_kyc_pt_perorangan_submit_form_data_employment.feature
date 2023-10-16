@kycSubmitFormDataEmploymentPTPerorangan
Feature: Account Opening KYC PT Perorangan - Submit Data Employment
    In order to opening my Giro account with legality business type PT Perorangan in SMB
    As a customer
    I want to submit my data employment as part of the KYC Process

    Background: User choose legality business type PT Perorangan
        Given I am a registered customer with following details:
            | userID   | ruth0ba7 |
            | password | 1234Test |
        And I filling in form login with the following details:
            | userID   | ruth0ba7 |
            | password | 1234Test |
        And I click login
        Then I will direct to dashboard
        When I swipe to card Giro Account
        And I choose Giro Account
        And I choose legality business type 'individualBusiness'
        And I submit my legality type
        And I upload my eKTP photo
        And I fill all information identity details as followings:
            | eKtpNumber    | 3173012606890020          |
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

    Scenario: Submit form Data Employment successfully business type PT Perorangan
        Given I am a customer who has submitted my domicile address
        When I fill my employment details as followings:
            | workType     | Pegawai Swasta       |
            | sourceIncome | Pemasukan dari Usaha |
        And I submit my employment data
        Then I will notify that I already fill my personal details data