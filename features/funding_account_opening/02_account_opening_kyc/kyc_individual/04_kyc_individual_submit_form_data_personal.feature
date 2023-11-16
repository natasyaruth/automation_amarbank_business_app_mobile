@kycSubmitFormDataPersonalIndividual
Feature: Account Opening KYC Individual - Submit Data Personal
    In order to opening my Giro account with legality business type Individual in SMB
    As a customer
    I want to submit my data personal as part of the KYC Process

    Background: User choose legality business type UD
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
            | eKtpNumber    | 3173062211771308          |
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

    Scenario Outline: Verifying one fields hasn't been filled by user in form Data Personal
        Given I am a customer who has uploaded my selfie photo
        When I fill form Data Personal except field '<Field>'
        And I submit my personal data details
        Then I should see message error '<Field Name> wajib diisi' in the below of field '<Field>' in form Data Personal
        Examples:
            | testRailTag | Field          | Field Name                |
            |             | lastEducation  | Pendidikan terakhir       |
            |             | motherName     | Nama ibu kandung          |
            |             | purposeAccount | Tujuan pembuatan rekening |

    Scenario: Verifying field mother name has been filled and then empty the fields
        Given I am a customer who has uploaded my selfie photo
        When I fill field 'motherName' with 'Nur' in form Data Personal
        And I clear the field 'motherName' in form Data Personal
        And I submit my personal data details
        Then I should see message error 'Nama ibu kandung wajib diisi' in the below of field 'motherName' in form Data Personal

    Scenario: Verifying field npwp has been filled and then empty the fields
        Given I am a customer who has uploaded my selfie photo
        When I fill field 'npwp' with '121785542123321' in form Data Personal
        And I clear the field 'npwp' in form Data Personal
        And I submit my personal data details
        Then I shouldn't see message error in the below of field 'npwp' in form Data Personal

    Scenario Outline: Verifying mother name with invalid value in form Data Personal
        Given I am a customer who has uploaded my selfie photo
        When I fill field 'motherName' with '<Value>' in form Data Personal
        Then I should see message error '<Message>' in the below of field 'motherName' in form Data Personal
        Examples:                                                                 ❸
            | testRailTag | Value                                   | Message                                                                         |
            |             | Nur 3@                                  | Nama ibu kandung tidak boleh mengandung angka & spesial karakter kecuali (.,'-) |
            |             | Nu                                      | Nama ibu kandung minimal 3 & maksimal 50 karakter                               |
            |             | Nur Nur Nur Nur Nur Nur Nur Nur Nur Nur | Nama ibu kandung minimal 3 & maksimal 50 karakter                               |
            |             |                                         | Nama ibu kandung wajib diisi                                                    |

    Scenario: Verifying field mother name contain with special char (.-,')
        Given I am a customer who has uploaded my selfie photo
        When I fill field 'motherName' with 'John Doe S.Kom, M\'Kom-' in form Data Personal
        Then I shouldn't see message error in the below of field 'motherName' in form Data Personal

    Scenario: Submit form Data Personal successfully business type Individual without input NPWP
        Given I am a customer who has uploaded my selfie photo
        When I fill my personal data details as followings:
            | lastEducation  | SMA          |
            | motherName     | NADYA LAMUSU |
            | purposeAccount | Pinjaman     |
        And I submit my personal data details
        Then I will direct to page domicile address

    @C96526
    Scenario: Submit form Data Personal successfully business type Individual
        Given I am a customer who has uploaded my selfie photo
        When I fill my personal data details as followings:
            | lastEducation  | SMA             |
            | motherName     | NADYA LAMUSU    |
            | purposeAccount | Pinjaman        |
            | npwp           | 121785542123321 |
        And I submit my personal data details
        Then I will direct to page domicile address