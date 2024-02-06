Feature: Account Opening KYB PT Perorangan - Upload Document Business
    In order to opening my Giro account with legality business type PT Perorangan in SMB
    As a customer
    I want to upload document business as part of the KYB Process

    Background: User choose legality business type PT Perorangan
        Given I am a registered customer with following details:
            | userID   | ptpe2eef                        |
            | password | 1234Test                        |
            | email    | pt_perorangan203@trash-mail.com |
        And I filling in form login with the following details:
            | userID   | ptpe2eef |
            | password | 1234Test |
        And I click login
        And I will directing to Hook 1 Onboarding Account Opening
        And I swipe to card Giro Account
        And I choose Giro Account
        And I choose Giro Account MSME
        And I choose legality business type 'individualBusiness'
        And I submit my legality type
        And I upload my eKTP photo
        And I fill all information identity details as followings:
            | eKtpNumber    | 3174094106880003               |
            | fullName      | PT PERORANGAN TERBARU KYC TIGA |
            | placeOfBirth  | MEDAN                          |
            | dateOfBirth   | 11/11/1995                     |
            | gender        | Perempuan                      |
            | address       | Jl. Durian Runtuh No. 13       |
            | rt            | 01                             |
            | rw            | 05                             |
            | province      | DKI JAKARTA                    |
            | city          | KOTA ADM. JAKARTA SELATAN      |
            | district      | KEBAYORAN BARU                 |
            | village       | SENAYAN                        |
            | religion      | Katolik                        |
            | maritalStatus | Belum Kawin                    |
        And I submit my information identity details
        And I upload my selfie photo
        And I fill my personal data details as followings:
            | lastEducation | SMA             |
            | motherName    | NADYA LAMUSU    |
            | npwp          | 121785542123321 |
        And I submit my personal data details
        And I choose my domicile address same with my identity information
        And I submit my domicile address
        And I fill my employment details as followings:
            | workType     | Pegawai Swasta       |
            | sourceIncome | Pemasukan dari Usaha |
        And I submit my employment data
        When I continue to process KYB
        And I fill my business profile as followings:
            | businessName      | PT PERORANGAN TERBARU KYC TIGA |
            | industry          | Jasa                           |
            | businessField     | Restoran                       |
            | monthlyIncome     | 30 - 50 juta                   |
            | npwp              | 906283213036000                |
            | nib               | 9129106701234                  |
            | businessDateStart | 10/10/2010                     |
        And I submit my business profile
        And I submit business owner list
        And I fill my business address as followings:
            | address  | Jl. Gambir Belok Kiri No. 10 |
            | rt       | 000                          |
            | rw       | 011                          |
            | province | ACEH                         |
            | city     | KAB. ACEH TIMUR              |
            | district | DARUL AMAN                   |
            | village  |                              |
        And I allow company to store my data
        And I submit my business address

    Scenario: Upload All document business type PT Perorangan
        Given I am a customer who has uploaded my eKTP photo and selfie
        And has submitted business address
        When I click button upload document
        And I see files that need to be uploaded for type individual company
        And I upload all document business for type individual company
        And I continue to main dashboard
        Then I will see card continue to complete upload document business
        And I can continue to page 'Upload Document Business'