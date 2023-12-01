@kycSubmitFormDomicileAddressIndividual
Feature: Account Opening KYC Individual - Submit Domicile Address
    In order to opening my Giro account with legality business type Individual in SMB
    As a customer
    I want to submit my domiciles address as part of the KYC Process

    Background: User choose legality business type Individual
        Given I am a registered customer with following details:
            | userID   | ruth0c1c |
            | password | 1234Test |
        And I filling in form login with the following details:
            | userID   | ruth0c1c |
            | password | 1234Test |
        And I click login
        And I will directing to Hook 1 Onboarding Account Opening
        And I swipe to card Giro Account
        And I choose Giro Account
        And I choose legality business type 'individual'
        And I submit my legality type
        And I skip step upload eKTP photo
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
        And I skip flow upload selfie photo
        And I fill my personal data details as followings:
            | lastEducation  | SMA             |
            | motherName     | NADYA LAMUSU    |
            | purposeAccount | Pinjaman        |
            | npwp           | 121785542123321 |
        And I submit my personal data details

    Scenario Outline: Verifying form New Domicile address fields has been filled and then empty the fields
        Given I am a customer who has submitted my personal data details
        When I choose my new domicile address
        And I fill field '<Field>' with 'Testing' in form New Domicile Address
        And I clear the field '<Field>' in form New Domicile Address
        Then I should see message error '<Field Name> wajib diisi' in the below of field '<Field>' in form New Domicile Address
        Examples:
            | testRailTag | Field   | Field Name     |
            |             | address | Alamat lengkap |
            |             | rt      | RT             |
            |             | rw      | RW             |

    Scenario Outline: Verifying one fields hasn't been filled by user in form New Domicile address
        Given I am a customer who has submitted my personal data details
        When I choose my new domicile address
        And I fill form New Domicile Address except field '<Field>'
        And I submit my domicile address
        Then I should see message error '<Field Name> wajib diisi' in the below of field '<Field>' in form New Domicile Address
        Examples:
            | testRailTag | Field    | Field Name     |
            |             | address  | Alamat lengkap |
            |             | rt       | RT             |
            |             | rw       | RW             |
            |             | province | Provinsi       |
            |             | city     | Kota/Kabupaten |
            |             | district | Kecamatan      |
            |             | village  | Kelurahan/Desa |

    Scenario Outline: Verifying length address in form New Domicile address
        Given I am a customer who has submitted my personal data details
        When I choose my new domicile address
        And I fill field 'address' with '<Value>' in form New Domicile Address
        Then I should see message error '<Message>' in the below of field 'address' in form New Domicile Address
        Examples:                                                                 ❸
            | testRailTag | Value                                                                                                                                                   | Message                                  |
            |             | Offline123457890 licenses are for using KSE without the internet. Once generated, the license cannot be revoked or transferred to a different machine.. | Alamat minimal 3 & maksimal 150 karakter |
            |             | Pa                                                                                                                                                      | Alamat minimal 3 & maksimal 150 karakter |

    Scenario: Verifying field address contain with special char and number
        Given I am a customer who has submitted my personal data details
        When I choose my new domicile address
        And I fill field 'address' with 'John Doe S.Kom, M\'Kom- 11233' in form New Domicile Address
        Then I shouldn't see message error in the below of field 'address' in form New Domicile Address

    Scenario: Verifying length RT in form New Domicile address
        Given I am a customer who has submitted my personal data details
        When I choose my new domicile address
        And I fill field 'rt' with '3124' in form New Domicile Address
        Then I should see message error 'RT maksimal 3' in the below of field 'rt' in form New Domicile Address

    Scenario: Verifying field rt contain with -
        Given I am a customer who has submitted my personal data details
        When I choose my new domicile address
        And I fill field 'rt' with '-' in form New Domicile Address
        Then I shouldn't see message error in the below of field 'rt' in form New Domicile Address

    Scenario: Verifying length RW in form New Domicile address
        Given I am a customer who has submitted my personal data details
        When I choose my new domicile address
        And I fill field 'rw' with '3124' in form New Domicile Address
        Then I should see message error 'RW maksimal 3' in the below of field 'rw' in form New Domicile Address

    Scenario: Verifying field rw contain with -
        Given I am a customer who has submitted my personal data details
        When I choose my new domicile address
        And I fill field 'rt' with '-' in form New Domicile Address
        Then I shouldn't see message error in the below of field 'rw' in form New Domicile Address

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