@kycSubmitFormDataEmploymentIndividual
Feature: Account Opening KYC Individual - Submit Data Employment
    In order to opening my Giro account with legality business type Individual in SMB
    As a customer
    I want to submit my data employment as part of the KYC Process

    Background: User choose legality business type Individual
        Given I am a registered customer with following details:
            | userID   | ruthf200 |
            | password | 1234Test |
        And I filling in form login with the following details:
            | userID   | ruthf200 |
            | password | 1234Test |
        And I click login
        And I will directing to Hook 1 Onboarding Account Opening
        And I swipe to card Giro Account
        And I choose Giro Account
        And I choose legality business type 'individual'
        And I submit my legality type
        And I skip step upload eKTP photo
        And I fill all information identity details as followings:
            | eKtpNumber    | 3172011507780009          |
            | fullName      | RUTH NATASYA              |
            | placeOfBirth  | MEDAN                     |
            | dateOfBirth   | 11/11/1995                |
            | gender        | Perempuan                 |
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
        And I choose my domicile address same with my identity information
        And I submit my domicile address

    Scenario Outline: Verifying one fields hasn't been filled by user in form Data Employment
        Given I am a customer who has submitted my domicile address
        When I fill form Data Employment except field '<Field>'
        And I submit my employment data individual
        And I swipe to field '<Field>' in form Data Employment
        Then I should see message error '<Field Name> wajib diisi' in the below of field '<Field>' in form Data Employment
        Examples:
            | testRailTag | Field         | Field Name          |
            |             | workType      | Jenis pekerjaan     |
            |             | sourceIncome  | Sumber Pendapatan   |
            |             | monthlyIncome | Pendapatan bulanan  |
            |             | industry      | Industri perusahaan |
            |             | companyName   | Nama perusahaan     |

    Scenario Outline: Verifying company name with invalid value in form Data Employment
        Given I am a customer who has submitted my domicile address
        When I fill my company name with '<Value>'
        Then I should see message error '<Message>' in the below of field 'companyName' in form Data Employment
        Examples:                                                                 ❸
            | testRailTag | Value                                                                                                                                                   | Message                                           |
            |             | TA                                                                                                                                                      | Nama perusahaan minimal 3 & maksimal 150 karakter |
            |             | Offline123457890 licenses are for using KSE without the internet. Once generated, the license cannot be revoked or transferred to a different machine.. | Nama perusahaan minimal 3 & maksimal 150 karakter |

    Scenario: Verifying company name has been filled and then empty the fields
        Given I am a customer who has submitted my domicile address
        When I fill my company name with 'AMARBANK'
        And I clear field company name
        Then I should see message error 'Nama perusahaan wajib diisi' in the below of field 'companyName' in form Data Employment

    Scenario: Verifying company name contain with special char and number
        Given I am a customer who has submitted my domicile address
        When I fill my company name with 'John Doe S.Kom, M\'Kom- 11233'
        Then I shouldn't see message error in the below of field company name in form Data Employment

    @C96529
    Scenario: Submit form Data Employment successfully business type Individual
        Given I am a customer who has uploaded my eKTP photo and selfie
        And I want to submit my employment data
        When I fill my employment details as followings:
            | workType      | Pegawai Negeri Sipil |
            | sourceIncome  | Gaji Bulanan         |
            | monthlyIncome | 5 - 10 juta          |
            | industry      | Pemerintahan         |
            | companyName   | KEMENDAGRI           |
        And I agree with the terms and condition
        And I allow company to store my data
        And I submit my employment data individual
        Then I will notify that my personal data details needs to be verified first