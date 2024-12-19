@kycSubmitFormDataPersonalIndividual
Feature: Account Opening KYC Individual - Submit Data Personal
    In order to opening my Giro account with legality business type Individual in SMB
    As a customer
    I want to submit my data personal as part of the KYC Process

    Background: User choose legality business type UD
        Given I am a registered customer with following details:
            | userID      | ruth0c1c |
            | password    | 1234Test |
            | userIDstg   | ruth530f |
            | passwordStg | 1234Test |
        And I filling in form login with the following details:
            | userID      | ruth0c1c |
            | password    | 1234Test |
            | userIDstg   | ruth530f |
            | passwordStg | 1234Test |
        And I click login
        And I click later in pop up biometric
        And I will directing to Hook 1 Onboarding Account Opening
        And I swipe to card Giro Account
        And I choose Giro Account
        And I choose Giro Account MSME
        And I submit my giro type
        And I choose legality business type 'individual'
        And I submit my legality type
        And I fill NPWP Business
        And I click continue to data personal
        And I click confirm NPWP Business
        And I see page 'Upload eKTP'
        And I update my last journey step to 'Upload Selfie with KTP'

    Scenario Outline: Verifying one fields hasn't been filled by user in form Data Personal
        Given I am a customer want to fill my personal details
        When I fill form Data Personal except field '<Field>'
        And I submit my personal data details
        Then I should see message error '<Field Name> wajib diisi' in the below of field '<Field>' in form Data Personal
        Examples:
            | testRailTag | Field                | Field Name                |
            | @C170913    | lastEducation        | Pendidikan terakhir       |
            | @C170914    | motherName           | Nama ibu kandung          |
            | @C170915    | purposeAccount       | Tujuan Pembuatan rekening |
            | @C170916    | referencePhoneNumber | Nomor handphone kerabat   |
            | @C170917    | referenceName        | Nama kerabat              |

    @C170918
    Scenario: Verifying field mother name has been filled and then empty the fields
        Given I am a customer want to fill my personal details
        When I fill field 'motherName' with 'Nur' in form Data Personal
        And I clear the field 'motherName' in form Data Personal
        Then I should see message error 'Nama ibu kandung wajib diisi' in the below of field 'motherName' in form Data Personal

    Scenario Outline: Verifying mother name with invalid value in form Data Personal
        Given I am a customer want to fill my personal details
        When I fill field 'motherName' with '<Value>' in form Data Personal
        Examples:                                                                 ❸
            | testRailTag | Value                                               | Message                                                                          |
            | @C170919    | Nur 3@                                              | Nama ibu kandung tidak boleh mengandung angka & spesial karakter kecuali (.,\'-) |
            | @C170920    | Nu                                                  | Nama ibu kandung minimal 3 & maksimal 50 karakter                                |
            | @C170921    | Nur Nur Nur Nur Nur Nur Nur Nur Nur Nur Nur Nur Nur | Nama ibu kandung minimal 3 & maksimal 50 karakter                                |

    @C170922
    Scenario: Verifying field mother name contain with special char (.-,')
        Given I am a customer want to fill my personal details
        When I fill field 'motherName' with 'John Doe S.Kom, M\'Kom-' in form Data Personal
        Then I shouldn't see message error in the below of field 'motherName' in form Data Personal

    Scenario Outline: Verifying relatives name with invalid value in form Data Personal
        Given I am a customer want to fill my personal details
        When I fill field 'referenceName' with '<Value>' in form Data Personal
        Then I should see message error '<Message>' in the below of field 'referenceName' in form Data Personal
        Examples:                                                                 ❸
            | testRailTag | Value                                               | Message                                                                      |
            | @C170923    | Nur 3@                                              | Nama kerabat tidak boleh mengandung angka & spesial karakter kecuali (.,\'-) |
            | @C170924    | Nu                                                  | Nama kerabat minimal 3 & maksimal 50 karakter                                |
            | @C170925    | Nur Nur Nur Nur Nur Nur Nur Nur Nur Nur Nur Nur Nur | Nama kerabat minimal 3 & maksimal 50 karakter                                |

    @C170926
    Scenario: Verifying field relatives name has been filled and then empty the fields
        Given I am a customer want to fill my personal details
        When I fill field 'referenceName' with 'Nur' in form Data Personal
        And I clear the field 'referenceName' in form Data Personal
        Then I should see message error 'Nama kerabat wajib diisi' in the below of field 'referenceName' in form Data Personal

    @C170927
    Scenario: Verifying field relatives name contain with special char (.-,')
        Given I am a customer want to fill my personal details
        When I fill field 'referenceName' with 'John Doe S.Kom, M\'Kom-' in form Data Personal
        Then I shouldn't see message error in the below of field 'referenceName' in form Data Personal

    Scenario Outline: Verifying phone number of relatives customer with invalid value
        Given I am a customer want to fill my personal details
        When I fill field 'referencePhoneNumber' with '<Value>' in form Data Personal
        Then I should see message error '<Message>' in the below of field 'referencePhoneNumber' in form Data Personal
        Examples:                                                                 ❸
            | testRailTag | Value         | Message                                                       |
            | @C170928    | 89561r12367   | Nomor handphone tidak sesuai format                           |
            | @C170929    | 8895611236738 | Panjang nomor handphone minimal 8 digit dan maksimal 15 digit |
            | @C170930    | 8956          | Panjang nomor handphone minimal 8 digit dan maksimal 15 digit |
            | @C170931    | 9678995676    | Nomor handphone tidak sesuai format                           |
            | @C170932    | 8678 995676   | Nomor handphone tidak sesuai format                           |
            | @C170933    |               | Nomor handphone kerabat wajib diisi                           |

    @C170934
    Scenario: Verifying autotrim 0 after label +62 in field relatives phonenumber
        Given I am a customer want to fill my personal details
        When I fill field 'referencePhoneNumber' with '089561123456' in form Data Personal
        Then I will see phonenumber '89561123456' in field reference number

    @C170935
    Scenario: Verify bottom sheet upload document NPWP
        Given I am a customer want to fill my personal details
        When I click button upload document NPWP
        Then I will see bottom sheet with option take NPWP using camera or upload from gallery

    @C170936
    Scenario: Close bottom sheet upload document NPWP
        Given I am a customer want to fill my personal details
        When I click button upload document NPWP
        And I click close bottom sheet upload NPWP
        Then I will not see the bottom sheet

    @C170937
    Scenario: Submit form Data Personal without upload NPWP
        Given I am a customer want to fill my personal details
        When I fill my personal data details as followings:
            | lastEducation        | SMA          |
            | motherName           | NADYA LAMUSU |
            | purposeAccount       | Pinjaman     |
            | referenceName        | IBU SAYA     |
            | referencePhoneNumber | 812343455677 |
        And I don't upload my NPWP photo
        And I submit my personal data details
        Then I should see message error 'NPWP Individu wajib diupload' in the below of field 'npwp' in form Data Personal

    @C170938
    Scenario: Submit form Data Personal successfully business type individual
        Given I am a customer want to fill my personal details
        And I see page 'Data Personal'
        When I submit my personal data details individual and upload my npwp as followings:
            | lastEducation        | SMA           |
            | motherName           | NADYA LAMUSU  |
            | referenceName        | IBU SAYA      |
            | referencePhoneNumber | 812343455677  |
            | purposeAccount       | Rekening Gaji |
        Then I will notify my personal details has successfully submitted
        And I will direct to page domicile address
        And I reset my state journey