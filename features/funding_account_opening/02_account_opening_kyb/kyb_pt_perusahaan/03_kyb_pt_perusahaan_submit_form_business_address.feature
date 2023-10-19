@kybSubmitFormBusinessAddressCompany
Feature: Account Opening KYB PT Perusahaan - Submit Business Address
    In order to opening my Giro account with legality business type PT Perusahaan in SMB
    As a customer
    I want to submit my business address as part of the KYB Process

    Background: User choose legality business type PT Perusahaan
        Given I am a registered customer with following details:
            | userID   | ruth1ed7              |
            | password | 1234Test              |
            | email    | ruth01@trash-mail.com |
        And I filling in form login with the following details:
            | userID   | ruth1ed7 |
            | password | 1234Test |
        And I click login
        Then I will direct to dashboard
        When I swipe to card Giro Account
        And I choose Giro Account
        And I choose legality business type 'company'
        And I submit my legality type
        And I upload my eKTP photo
        And I fill all information identity details as followings:
            | eKtpNumber    | 3172024112840005          |
            | fullName      | NADYA SAMANTHA            |
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
            | lastEducation | SMA             |
            | motherName    | NADYA LAMUSU    |
            | npwp          | 121785542123321 |
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
        And I fill my employment details as followings:
            | workType     | Pegawai Swasta       |
            | sourceIncome | Pemasukan dari Usaha |
        And I submit my employment data
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
        And I submit business owner list

    Scenario: Submit form Business Address successfully business type PT Perusahaan
        Given I am a customer who has submitted business owner list
        When I fill my business address as followings:
            | address  | Jl. Gambir Belok kanan No. 23 |
            | rt       | 010                           |
            | rw       | 027                           |
            | province | DKI JAKARTA                   |
            | city     | JAKARTA SELATAN               |
            | district | PANCORAN                      |
            | village  | PANCORAN                      |
        And I agree with the terms and condition
        And I allow company to store my data
        And I submit my business address
        Then I will directing to page upload require documents for business