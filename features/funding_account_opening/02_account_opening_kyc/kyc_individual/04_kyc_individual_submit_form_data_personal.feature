@kycSubmitFormDataPersonalIndividual
Feature: Account Opening KYC Individual - Submit Data Personal
    In order to opening my Giro account with legality business type Individual in SMB
    As a customer
    I want to submit my data personal as part of the KYC Process

    Background: User choose legality business type UD
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
        And I update my last journey step to 'Upload Selfie'

    Scenario Outline: Verifying one fields hasn't been filled by user in form Data Personal
        Given I am a customer want to fill my personal details
        When I fill form Data Personal except field '<Field>'
        And I submit my personal data details
        Then I should see message error '<Field Name> wajib diisi' in the below of field '<Field>' in form Data Personal
        Examples:
            | testRailTag | Field          | Field Name                |
            |             | lastEducation  | Pendidikan terakhir       |
            |             | motherName     | Nama ibu kandung          |
            |             | purposeAccount | Tujuan Pembuatan rekening |

    Scenario: Verifying field mother name has been filled and then empty the fields
        Given I am a customer want to fill my personal details
        When I fill field 'motherName' with 'Nur' in form Data Personal
        And I clear the field 'motherName' in form Data Personal
        Then I should see message error 'Nama ibu kandung wajib diisi' in the below of field 'motherName' in form Data Personal

    Scenario Outline: Verifying mother name with invalid value in form Data Personal
        Given I am a customer want to fill my personal details
        When I fill field 'motherName' with '<Value>' in form Data Personal
        Then I should see message error '<Message>' in the below of field 'motherName' in form Data Personal
        Examples:                                                                 ❸
            | testRailTag | Value                                               | Message                                                                          |
            |             | Nur 3@                                              | Nama ibu kandung tidak boleh mengandung angka & spesial karakter kecuali (.,\'-) |
            |             | Nu                                                  | Nama ibu kandung minimal 3 & maksimal 50 karakter                                |
            |             | Nur Nur Nur Nur Nur Nur Nur Nur Nur Nur Nur Nur Nur | Nama ibu kandung minimal 3 & maksimal 50 karakter                                |

    Scenario: Verifying field mother name contain with special char (.-,')
        Given I am a customer want to fill my personal details
        When I fill field 'motherName' with 'John Doe S.Kom, M\'Kom-' in form Data Personal
        Then I shouldn't see message error in the below of field 'motherName' in form Data Personal

    Scenario: Submit form Data Personal without upload NPWP
        Given I am a customer want to fill my personal details
        When I fill my personal data details as followings:
            | lastEducation  | SMA             |
            | motherName     | NADYA LAMUSU    |
            | purposeAccount | Pinjaman        |
        And I submit my personal data details    
        Then I should see message error 'NPWP Individu wajib diupload' in the below of field 'motherName' in form Data Personal

    @C96526
    Scenario: Submit form Data Personal successfully business type individual
        Given I am a customer want to fill my personal details
        When I submit my personal data details individual and upload my npwp as followings:
            | lastEducation  | SMA           |
            | motherName     | NADYA LAMUSU  |
            | purposeAccount | Rekening Gaji |
        Then I will notify my personal details has successfully submitted
        And I will direct to page domicile address