@kybSubmitFormBusinessAddressCV
Feature: Account Opening KYB CV - Submit Business Address
    In order to opening my Giro account with legality business type CV in SMB
    As a customer
    I want to submit my business address as part of the KYB Process

    Background: User choose legality business type CV
        Given I am a registered customer with following details:
            | userID   | ruth0c1c              |
            | password | 1234Test              |
            | email    | rut.testing@email.com |
        And I filling in form login with the following details:
            | userID   | ruth0c1c |
            | password | 1234Test |
        And I click login
        And I will directing to Hook 1 Onboarding Account Opening
        And I swipe to card Giro Account
        And I choose Giro Account
        And I choose legality business type 'cv'
        And I submit my legality type
        And I skip step upload eKTP photo
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
        And I skip flow upload selfie photo
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
            | businessName      | COBA COBA       |
            | industry          | Jasa            |
            | businessField     | Restoran        |
            | monthlyIncome     | 30 - 50 juta    |
            | npwp              | 906283213036000 |
            | nib               | 9129106701234   |
            | businessDateStart | 10/10/2010      |
        And I submit my business profile
        And I click add business director
        And I fill business director data as followings:
            | fullName | COKI PARDEDE                |
            | email    | coki.pardede@trash-mail.com |
            | nik      | 3175064412930004            |
        And I save data director
        And I validate my first director
        And I click add business director
        And I fill business director data as followings:
            | fullName | TRYSE REZZA                |
            | email    | tryse.rezza@trash-mail.com |
            | nik      | 3171036412910007           |
        And I save data director
        And I validate my second director
        And I submit business director list
        And I confirm my director lists

    Scenario Outline: Verifying form Business Address fields has been filled and then empty the fields
        Given I am a customer who has submitted business owner list
        When I fill field '<Field>' with '123' in form Business Address
        And I clear the field '<Field>' in form Business Address
        Then I should see message error '<Field Name> wajib diisi' in the below of field '<Field>' in form Business Address
        Examples:
            | testRailTag | Field   | Field Name |
            |             | address | Alamat     |
            |             | rt      | RT         |
            |             | rw      | RW         |

    Scenario Outline: Verifying one fields hasn't been filled by user in form Business Address
        Given I am a customer who has submitted business owner list
        When I fill form Business Address except field '<Field>'
        And I submit my business address
        And I swipe to field '<Field>' in form Business Address
        Then I should see message error '<Field Name> wajib diisi' in the below of field '<Field>' in form Business Address
        Examples:
            | testRailTag | Field    | Field Name     |
            |             | address  | Alamat         |
            |             | rt       | RT             |
            |             | rw       | RW             |
            |             | province | Provinsi       |
            |             | city     | Kota/Kabupaten |
            |             | district | Kecamatan      |
            |             | village  | Kelurahan      |

    Scenario Outline: Verifying length address in form Business Address
        Given I am a customer who has submitted business owner list
        When I fill field 'address' with '<Value>' in form Business Address
        Then I should see message error '<Message>' in the below of field 'address' in form Business Address
        Examples:                                                                 ❸
            | testRailTag | Value                                                                                                                                                   | Message                                  |
            |             | Offline123457890 licenses are for using KSE without the internet. Once generated, the license cannot be revoked or transferred to a different machine.. | Alamat minimal 3 & maksimal 150 karakter |
            |             | Pa                                                                                                                                                      | Alamat minimal 3 & maksimal 150 karakter |

    Scenario: Verifying field address contain with special char and number
        Given I am a customer who has submitted business owner list
        When I fill field 'address' with 'John Doe S.Kom, M\'Kom- 11233' in form Business Address
        Then I shouldn't see message error in the below of field 'address' in form Business Address

    Scenario Outline: Verifying rt with invalid value in form Business Address
        Given I am a customer who has submitted business owner list
        When I fill field 'rt' with '<Value>' in form Business Address
        Then I should see message error '<Message>' in the below of field 'rt' in form Business Address
        Examples:                                                                 ❸
            | testRailTag | Value | Message                |
            |             | ab    | RT tidak sesuai format |
            |             | !@    | RT tidak sesuai format |
            |             | 3124  | RT maksimal 3          |
            |             |       | RT wajib diisi         |

    Scenario: Verifying field rt contain with -
        Given I am a customer who has submitted business owner list
        When I fill field 'rt' with '-' in form Business Address
        Then I shouldn't see message error in the below of field 'rt' in form Business Address

    Scenario Outline: Verifying rw with invalid value in form Business Address
        Given I am a customer who has submitted business owner list
        When I fill field 'rw' with '<Value>' in form Business Address
        Then I should see message error '<Message>' in the below of field 'rw' in form Business Address
        Examples:                                                                 ❸
            | testRailTag | Value | Message                |
            |             | ab    | RW tidak sesuai format |
            |             | !@    | RW tidak sesuai format |
            |             | 3124  | RW maksimal 3          |
            |             |       | RW wajib diisi         |

    Scenario: Verifying field rw contain with -
        Given I am a customer who has submitted business owner list
        When I fill field 'rt' with '-' in form Business Address
        Then I shouldn't see message error in the below of field 'rw' in form Business Address

    @C96560
    Scenario: Submit form Business Address successfully business type CV
        Given I am a customer who has uploaded my eKTP photo and selfie
        And has submitted business owner list
        When I fill my business address as followings:
            | address  | Jl. Gambir Belok Kiri No. 10 |
            | rt       | 000                          |
            | rw       | 011                          |
            | province | ACEH                         |
            | city     | KAB. ACEH TIMUR              |
            | district | DARUL AMAN                   |
            | village  |                              |
        And I agree with the terms and condition
        And I allow company to store my data
        And I submit my business address
        Then I will directing to page upload require documents for business
        And I can close the page so that I can back to main dashboard