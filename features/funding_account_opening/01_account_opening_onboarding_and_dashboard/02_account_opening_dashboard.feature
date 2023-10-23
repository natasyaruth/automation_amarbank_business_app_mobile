@accountOpeningOnBoarding
Feature: Account Opening Main Dashboard
    In order to opening my Giro account in SMB
    As a customer
    I can see my latest information in main dashboard

    Background: User has registered and login to dashboard
        Given I am a registered customer with following details:
            | userID   | ruth17a5 |
            | password | Test1234 |
        When I filling in form login with the following details:
            | userID   | ruth17a5 |
            | password | Test1234 |
        And I click login
        And I click later
        And I will direct to dashboard
        And I choose Giro Account

    Scenario: User can see cards continue to complete data personal after drop off from flow Upload eKTP
        Given I am a customer want to open Giro Account
        And I choose legality business type 'company'
        And I submit my legality type
        And I see page 'Upload eKTP'
        And I back to dashboard
        Then I will see card continue to data personal
        And I can continue to page 'Upload eKTP'

    Scenario: User can see cards continue to complete data personal after drop off from flow Submit data KTP
        Given I am a customer want to open Giro Account
        And I choose legality business type 'company'
        And I submit my legality type
        And I upload my eKTP photo
        And I see page 'Data KTP'
        And I back to dashboard
        Then I will see card continue to data personal
        And I can continue to page 'Data KTP'

    Scenario: User can see cards continue to complete data personal after drop off from flow Upload Selfie
        Given I am a customer want to open Giro Account
        And I choose legality business type 'company'
        And I submit my legality type
        And I upload my eKTP photo
        And I fill all information identity details as followings:
            | eKtpNumber    | 3173035601860007          |
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
        And I see page 'Upload Selfie'
        And I back to dashboard
        Then I will see card continue to data personal
        And I can continue to page 'Upload Selfie'

    Scenario: User can see cards continue to complete data personal after drop off from flow Submit data Personal
        Given I am a customer want to open Giro Account
        And I choose legality business type 'company'
        And I submit my legality type
        And I upload my eKTP photo
        And I fill all information identity details as followings:
            | eKtpNumber    | 3173035601860007          |
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
        And I see page 'Data Personal'
        And I back to dashboard
        Then I will see card continue to data personal
        And I can continue to page 'Data Personal'
        
    Scenario: User can see cards continue to complete data personal after drop off from flow Submit data Domicile Address
        Given I am a customer want to open Giro Account
        And I choose legality business type 'company'
        And I submit my legality type
        And I upload my eKTP photo
        And I fill all information identity details as followings:
            | eKtpNumber    | 3173035601860007          |
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
        And I see page 'Data Domicile Address'
        And I back to dashboard
        Then I will see card continue to data personal
        And I can continue to page 'Data Domicile Address'

    Scenario: User can see cards continue to complete data personal after drop off from flow Submit data Employment
        Given I am a customer want to open Giro Account
        And I choose legality business type 'company'
        And I submit my legality type
        And I upload my eKTP photo
        And I fill all information identity details as followings:
            | eKtpNumber    | 3173035601860007          |
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
        And I choose my domicile address same with my identity information
        And I submit my domicile address
        And I see page 'Data Employment'
        And I back to dashboard
        Then I will see card continue to data personal
        And I can continue to page 'Data Employment'

    Scenario: User can see cards continue to complete data business after drop off from flow Submit data Business Profile
        Given I am a customer want to open Giro Account
        And I choose legality business type 'company'
        And I submit my legality type
        And I upload my eKTP photo
        And I fill all information identity details as followings:
            | eKtpNumber    | 3173035601860007          |
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
        And I choose my domicile address same with my identity information
        And I submit my domicile address
        And I fill my employment details as followings:
            | workType     | Pegawai Swasta       |
            | sourceIncome | Pemasukan dari Usaha |
        And I submit my employment data
        And I continue to process KYB
        And I see page 'Data Business Profile'
        And I back to dashboard
        Then I will see card continue to data business
        And I can continue to page 'Data Business Profile'

    Scenario: User can see cards continue to complete data business after drop off from flow Submit data Business Owner
        Given I am a customer want to open Giro Account
        And I choose legality business type 'ud'
        And I submit my legality type
        And I upload my eKTP photo
        And I fill all information identity details as followings:
            | eKtpNumber    | 3173035601860007          |
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
        And I choose my domicile address same with my identity information
        And I submit my domicile address
        And I fill my employment details as followings:
            | workType     | Pegawai Swasta       |
            | sourceIncome | Pemasukan dari Usaha |
        And I submit my employment data
        And I continue to process KYB
        And I fill my business profile as followings:
            | businessName      | PT. ABCD        |
            | industry          | Jasa            |
            | businessField     | Restoran        |
            | monthlyIncome     | 30 - 50 juta    |
            | npwp              | 906283213036000 |
            | nib               | 9129106701234   |
            | businessDateStart | 10/10/2010      |
        And I submit my business profile
        And I see page 'Data Business Owner'
        And I back to dashboard
        Then I will see card continue to data business
        And I can continue to page 'Data Business Owner'

    Scenario: User can see cards continue to complete data business after drop off from flow Submit data Director List
        Given I am a customer want to open Giro Account
        And I choose legality business type 'company'
        And I submit my legality type
        And I upload my eKTP photo
        And I fill all information identity details as followings:
            | eKtpNumber    | 3173035601860007          |
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
        And I choose my domicile address same with my identity information
        And I submit my domicile address
        And I fill my employment details as followings:
            | workType     | Pegawai Swasta       |
            | sourceIncome | Pemasukan dari Usaha |
        And I submit my employment data
        And I continue to process KYB
        And I fill my business profile as followings:
            | businessName      | PT. ABCD        |
            | industry          | Jasa            |
            | businessField     | Restoran        |
            | monthlyIncome     | 30 - 50 juta    |
            | npwp              | 906283213036000 |
            | nib               | 9129106701234   |
            | businessDateStart | 10/10/2010      |
        And I submit my business profile
        And I see page 'Data Director List'
        And I back to dashboard
        Then I will see card continue to data business
        And I can continue to page 'Data Director List'

    Scenario: User can see cards continue to complete data business after drop off from flow Submit data Business Address
        Given I am a customer want to open Giro Account
        And I choose legality business type 'company'
        And I submit my legality type
        And I upload my eKTP photo
        And I fill all information identity details as followings:
            | eKtpNumber    | 3173035601860007          |
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
        And I choose my domicile address same with my identity information
        And I submit my domicile address
        And I fill my employment details as followings:
            | workType     | Pegawai Swasta       |
            | sourceIncome | Pemasukan dari Usaha |
        And I submit my employment data
        And I continue to process KYB
        And I fill my business profile as followings:
            | businessName      | PT. ABCD        |
            | industry          | Jasa            |
            | businessField     | Restoran        |
            | monthlyIncome     | 30 - 50 juta    |
            | npwp              | 906283213036000 |
            | nib               | 9129106701234   |
            | businessDateStart | 10/10/2010      |
        And I submit my business profile
        And I submit business director
        And I see page 'Data Business Address'
        And I back to dashboard
        Then I will see card continue to data business
        And I can continue to page 'Data Business Address'

    Scenario: User can see cards continue to complete upload document after complete flow KYC and KYB
        Given I am a customer want to open Giro Account
        And I choose legality business type 'company'
        And I submit my legality type
        And I upload my eKTP photo
        And I fill all information identity details as followings:
            | eKtpNumber    | 3173035601860007          |
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
        And I choose my domicile address same with my identity information
        And I submit my domicile address
        And I fill my employment details as followings:
            | workType     | Pegawai Swasta       |
            | sourceIncome | Pemasukan dari Usaha |
        And I submit my employment data
        And I continue to process KYB
        And I fill my business profile as followings:
            | businessName      | PT. ABCD        |
            | industry          | Jasa            |
            | businessField     | Restoran        |
            | monthlyIncome     | 30 - 50 juta    |
            | npwp              | 906283213036000 |
            | nib               | 9129106701234   |
            | businessDateStart | 10/10/2010      |
        And I submit my business profile
        And I submit business director
        And I fill my business address as followings:
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
        And I see page 'Upload Document Business'
        And I close page upload document
        Then I will see card continue to complete upload document business
        And I can continue to page 'Upload Document Business'

    Scenario: User can see cards continue to complete upload document and register director list
        Given I am a customer want to open Giro Account
        And I choose legality business type 'company'
        And I submit my legality type
        And I upload my eKTP photo
        And I fill all information identity details as followings:
            | eKtpNumber    | 3173035601860007          |
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
        And I choose my domicile address same with my identity information
        And I submit my domicile address
        And I fill my employment details as followings:
            | workType     | Pegawai Swasta       |
            | sourceIncome | Pemasukan dari Usaha |
        And I submit my employment data
        And I continue to process KYB
        And I fill my business profile as followings:
            | businessName      | PT. ABCD        |
            | industry          | Jasa            |
            | businessField     | Restoran        |
            | monthlyIncome     | 30 - 50 juta    |
            | npwp              | 906283213036000 |
            | nib               | 9129106701234   |
            | businessDateStart | 10/10/2010      |
        And I submit my business profile
        And I click add business director
        And I fill business director data as followings:
            | fullName | BIMO PURWOKO        |
            | email    | bimo@trash-mail.com |
            | nik      | 3166021710820021    |
        And I save data director
        And I submit business director
        And I confirm my director lists
        And I fill my business address as followings:
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
        And I see page 'Upload Document Business'
        And I close page upload document
        Then I will see card continue to complete upload document business and registration director list
        And I can continue to page 'Registration Director'