@kybSubmitFormBusinessAddressCV
Feature: Account Opening KYB CV - Submit Business Address
    In order to opening my Giro account with legality business type CV in SMB
    As a customer
    I want to submit my business address as part of the KYB Process

    Background: User choose legality business type CV
        Given I am a registered customer with following details:
            | userID   | ruth6eb7            |
            | password | Test1234            |
            | email    | ruth@trash-mail.com |
        And I filling in form login with the following details:
            | userID   | ruth6eb7 |
            | password | Test1234 |
        And I click login
        And I will directing to Hook 1 Onboarding Account Opening
        And I swipe to card Giro Account
        And I choose Giro Account
        And I choose legality business type 'cv'
        And I submit my legality type
        And I upload my eKTP photo
        And I fill all information identity details as followings:
            | eKtpNumber    | 3175062603811003         |
            | fullName      | PT CV SATU               |
            | placeOfBirth  | MEDAN                    |
            | dateOfBirth   | 11/11/1995               |
            | gender        | Laki-laki                |
            | address       | Jl. Durian Runtuh No. 13 |
            | rt            | 01                       |
            | rw            | 05                       |
            | province      | ACEH                     |
            | city          | KAB. ACEH TIMUR          |
            | district      | DARUL AMAN               |
            | village       |                          |
            | religion      | Budha                    |
            | maritalStatus | Belum Kawin              |
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
            | businessName      | PT CV           |
            | industry          | Jasa            |
            | businessField     | Restoran        |
            | monthlyIncome     | 30 - 50 juta    |
            | npwp              | 906283213036000 |
            | nib               | 9129106701234   |
            | businessDateStart | 10/10/2010      |
        And I submit my business profile
        And I submit business director list

    Scenario: Submit form Business Address successfully business type CV
        Given I am a customer who has submitted business owner list
        When I fill my business address as followings:
            | address  | Jl. Gambir Belok Kiri No. 10 |
            | rt       | 000                          |
            | rw       | 011                          |
            | province | SUMATERA UTARA               |
            | city     | KAB. DELI SERDANG            |
            | district | SINEMBAH TANJUNG MUDA HULU   |
            | village  | DURIAN EMPAT MBELANG         |
        And I agree with the terms and condition
        And I allow company to store my data
        And I submit my business address
        Then I will directing to page upload require documents for business
        And I can close the page so that I can back to main dashboard