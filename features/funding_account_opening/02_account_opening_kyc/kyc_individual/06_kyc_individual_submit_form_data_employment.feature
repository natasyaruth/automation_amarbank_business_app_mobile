@kycSubmitFormDataEmploymentIndividual
Feature: Account Opening KYC Individual - Submit Data Employment
    In order to opening my Giro account with legality business type Individual in SMB
    As a customer
    I want to submit my data employment as part of the KYC Process

    Scenario Outline: Verifying one fields hasn't been filled by user in form Data Employment
        Given I am a registered customer with following details:
            | userID      | ruth2322 |
            | password    | Test1234 |
            | userIDstg   | ruth530f |
            | passwordStg | 1234Test |
        And I filling in form login with the following details:
            | userID      | ruth2322 |
            | password    | Test1234 |
            | userIDstg   | ruth530f |
            | passwordStg | 1234Test |
        And I click login
        And I will directing to Hook 1 Onboarding Account Opening
        And I swipe to card Giro Account
        And I choose Giro Account
        And I choose Giro Account Corporate
        And I choose legality business type 'individual'
        And I submit my legality type
        And I update my last journey step to 'Data Domicile Address'
        When I fill form Data Employment except field '<Field>'
        And I submit my employment data individual
        And I swipe to field '<Field>' in form Data Employment
        Then I should see message error '<Field Name> wajib diisi' in the below of field '<Field>' in form Data Employment
        Examples:
            | testRailTag | Field         | Field Name          |
            | @C101251    | workType      | Jenis pekerjaan     |
            | @C101252    | sourceIncome  | Sumber Pendapatan   |
            | @C101253    | monthlyIncome | Pendapatan bulanan  |
            | @C101254    | industry      | Industri perusahaan |
            | @C101255    | companyName   | Nama perusahaan     |

    Scenario Outline: Verifying company name with invalid value in form Data Employment
        Given I am a registered customer with following details:
            | userID      | ruth2322 |
            | password    | Test1234 |
            | userIDstg   | ruth530f |
            | passwordStg | 1234Test |
        And I filling in form login with the following details:
            | userID      | ruth2322 |
            | password    | Test1234 |
            | userIDstg   | ruth530f |
            | passwordStg | 1234Test |
        And I click login
        And I will directing to Hook 1 Onboarding Account Opening
        And I swipe to card Giro Account
        And I choose Giro Account
        And I choose Giro Account Corporate
        And I choose legality business type 'individual'
        And I submit my legality type
        And I update my last journey step to 'Data Domicile Address'
        When I fill my company name with '<Value>'
        Then I should see message error '<Message>' in the below of field 'companyName' in form Data Employment
        Examples:                                                                 ❸
            | testRailTag | Value                                                                                                                                                   | Message                                           |
            | @C101256    | TA                                                                                                                                                      | Nama perusahaan minimal 3 & maksimal 150 karakter |
            | @C101257    | Offline123457890 licenses are for using KSE without the internet. Once generated, the license cannot be revoked or transferred to a different machine.. | Nama perusahaan minimal 3 & maksimal 150 karakter |

    @C101258
    Scenario: Verifying company name has been filled and then empty the fields
        Given I am a registered customer with following details:
            | userID      | ruth2322 |
            | password    | Test1234 |
            | userIDstg   | ruth530f |
            | passwordStg | 1234Test |
        And I filling in form login with the following details:
            | userID      | ruth2322 |
            | password    | Test1234 |
            | userIDstg   | ruth530f |
            | passwordStg | 1234Test |
        And I click login
        And I will directing to Hook 1 Onboarding Account Opening
        And I swipe to card Giro Account
        And I choose Giro Account
        And I choose Giro Account Corporate
        And I choose legality business type 'individual'
        And I submit my legality type
        And I update my last journey step to 'Data Domicile Address'
        When I fill my company name with 'AMARBANK'
        And I clear field company name
        Then I should see message error 'Nama perusahaan wajib diisi' in the below of field 'companyName' in form Data Employment

    @C101259
    Scenario: Verifying company name contain with special char and number
        Given I am a registered customer with following details:
            | userID      | ruth2322 |
            | password    | Test1234 |
            | userIDstg   | ruth530f |
            | passwordStg | 1234Test |
        And I filling in form login with the following details:
            | userID      | ruth2322 |
            | password    | Test1234 |
            | userIDstg   | ruth530f |
            | passwordStg | 1234Test |
        And I click login
        And I will directing to Hook 1 Onboarding Account Opening
        And I swipe to card Giro Account
        And I choose Giro Account
        And I choose Giro Account Corporate
        And I choose legality business type 'individual'
        And I submit my legality type
        And I update my last journey step to 'Data Domicile Address'
        When I fill my company name with 'John Doe S.Kom, M\'Kom- 11233'
        Then I shouldn't see message error in the below of field company name in form Data Employment

    @C96529
    Scenario: Submit form Data Employment successfully business type Individual
        Given I am a registered customer with following details:
            | userID      | ruth2322 |
            | password    | Test1234 |
            | userIDstg   | ruth530f |
            | passwordStg | 1234Test |
        And I filling in form login with the following details:
            | userID      | ruth2322 |
            | password    | Test1234 |
            | userIDstg   | ruth530f |
            | passwordStg | 1234Test |
        And I click login
        And I will directing to Hook 1 Onboarding Account Opening
        And I swipe to card Giro Account
        And I choose Giro Account
        And I choose Giro Account Corporate
        And I choose legality business type 'individual'
        And I submit my legality type
        And I upload my eKTP photo
        And I fill all information identity details as followings:
            | eKtpNumber    | 3004056103550001          |
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
        And I submit my personal data details individual and upload my npwp as followings:
            | lastEducation  | SMA           |
            | motherName     | NADYA LAMUSU  |
            | purposeAccount | Rekening Gaji |
        And I choose my domicile address same with my identity information
        And I submit my domicile address
        When I fill my employment details as followings:
            | workType      | Pegawai Negeri Sipil |
            | sourceIncome  | Gaji Bulanan         |
            | monthlyIncome | 5 - 10 juta          |
            | industry      | Pemerintahan         |
            | companyName   | KEMENDAGRI           |
        And I allow company to store my data
        And I submit my employment data individual
        Then I will notify that my personal data details needs to be verified first