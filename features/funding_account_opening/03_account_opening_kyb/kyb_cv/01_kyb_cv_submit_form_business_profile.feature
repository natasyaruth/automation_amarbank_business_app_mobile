@kybSubmitFormBusinessProfileCV
Feature: Account Opening KYB CV - Submit Business Profile
    In order to opening my Giro account with legality business type CV in SMB
    As a customer
    I want to submit my business profile as part of the KYB Process

    Background: User choose legality business type CV
        Given I am a registered customer with following details:
            | userID   | ruth289c           |
            | password | Test1234           |
            | email    | fakemail@email.com |
        And I filling in form login with the following details:
            | userID   | ruth289c |
            | password | Test1234 |
        And I click login
        And I will directing to Hook 1 Onboarding Account Opening
        And I swipe to card Giro Account
        And I choose Giro Account
        And I choose legality business type 'cv'
        And I submit my legality type
        And I upload my eKTP photo
        And I fill all information identity details as followings:
            | eKtpNumber    | 3175080601830002          |
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


    Scenario Outline: Verifying form Business Profile fields has been filled and then empty the fields
        Given I am a customer who has completed my KYC process
        When I fill field '<Field>' with 'Testing' in form Business Profile
        And I clear the field '<Field>' in form Business Profile
        Then I should see message error '<Field Name> wajib diisi' in the below of field '<Field>' in form Business Profile
        Examples:
            | testRailTag | Field         | Field Name          |
            |             | businessName  | Nama bisnis         |
            |             | businessField | Jenis bisnis        |
            |             | npwp          | NPWP bisnis         |
            |             | nib           | NIB Berbasis Resiko |

    Scenario Outline: Verifying one fields hasn't been filled by user in form Business Profile
        Given I am a customer who has completed my KYC process
        When I fill form Business Profile except field '<Field>'
        And I submit my business profile
        And I swipe to field '<Field>' in form Business Profile
        Then I should see message error '<Field Name> wajib diisi' in the below of field '<Field>' in form Business Profile
        Examples:
            | testRailTag | Field             | Field Name                   |
            |             | businessName      | Nama bisnis                  |
            |             | industry          | Tipe industri                |
            |             | businessField     | Jenis bisnis                 |
            |             | monthlyIncome     | Penghasilan bisnis per bulan |
            |             | npwp              | NPWP bisnis                  |
            |             | nib               | NIB Berbasis Resiko          |
            |             | businessDateStart | Tanggal bisnis berdiri       |

    Scenario Outline: Verifying business name with invalid value in form Business Profile
        Given I am a customer who has completed my KYC process
        When I fill field 'businessName' with '<Value>' in form Business Profile
        Then I should see message error '<Message>' in the below of field 'businessName' in form Business Profile
        Examples:                                                                 ❸
            | testRailTag | Value                                                                                                                                                   | Message                                       |
            |             |                                                                                                                                                         | Nama bisnis wajib diisi                       |
            |             | Pa                                                                                                                                                      | Nama bisnis minimal 3 & maksimal 150 karakter |
            |             | Offlineeeeeeeeeee licenses are for using KSE without the internett Once generatedd the license cannot be revoked or transferred to a different machinee | Nama bisnis minimal 3 & maksimal 150 karakter |

    Scenario: Verifying field business name contain with special char and number
        Given I am a customer who has completed my KYC process
        When I fill field 'businessName' with 'John Doe S.Kom, M\'Kom- 11233' in form Business Profile
        Then I shouldn't see message error in the below of field 'businessName' in form Business Profile

    Scenario Outline: Verifying business field with invalid value in form Business Profile
        Given I am a customer who has completed my KYC process
        When I fill field 'businessField' with '<Value>' in form Business Profile
        Then I should see message error '<Message>' in the below of field 'businessField' in form Business Profile
        Examples:                                                                 ❸
            | testRailTag | Value                                                                                                                                                   | Message                                        |
            |             |                                                                                                                                                         | Jenis bisnis wajib diisi                       |
            |             | Pa                                                                                                                                                      | Jenis bisnis minimal 3 & maksimal 150 karakter |
            |             | Offlineeeeeeeeeee licenses are for using KSE without the internett Once generatedd the license cannot be revoked or transferred to a different machinee | Jenis bisnis minimal 3 & maksimal 150 karakter |

    Scenario Outline: Verifying NIB field with invalid value in form Business Profile
        Given I am a customer who has completed my KYC process
        When I fill field 'nib' with '<Value>' in form Business Profile
        Then I should see message error '<Message>' in the below of field 'nib' in form Business Profile
        Examples:                                                                 ❸
            | testRailTag | Value           | Message                                 |
            |             |                 | NIB Berbasis Resiko wajib diisi         |
            |             | 9129106701A!4   | NIB Berbasis Resiko tidak sesuai format |
            |             | 912910670123412 | NIB harus 13 digit                      |
            |             | 912910          | NIB harus 13 digit                      |

    Scenario Outline: Verifying NPWP field with invalid value in form Business Profile
        Given I am a customer who has completed my KYC process
        When I fill field 'npwp' with '<Value>' in form Business Profile
        Then I should see message error '<Message>' in the below of field 'npwp' in form Business Profile
        Examples:                                                                 ❸
            | testRailTag | Value  | Message                 |
            |             |        | NPWP bisnis wajib diisi |
            |             | 912910 | NPWP harus 15 digit     |

    @C96553
    Scenario: Submit form Business Profile successfully business type CV
        Given I am a customer who has completed my KYC process
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
        Then I will notify my business profile has successfully submitted
        And I will directing to page director list