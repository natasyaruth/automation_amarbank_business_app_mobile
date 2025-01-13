@kybSubmitFormBusinessAddressCV
Feature: Account Opening KYB CV - Submit Business Address
    In order to opening my Giro account with legality business type CV in SMB
    As a customer
    I want to submit my business address as part of the KYB Process

    Background: User choose legality business type CV
        Given I am a registered customer with following details:
            | userID      | nata5ff1 |
            | password    | 1234Test |
            | userIDstg   | stag036a |
            | passwordStg | 1234Test |
        And I reset my state journey     
        And I filling in form login with the following details:
            | userID      | nata5ff1 |
            | password    | 1234Test |
            | userIDstg   | stag036a |
            | passwordStg | 1234Test |
        And I click login
        And I click later in pop up biometric
        And I will directing to Hook 1 Onboarding Account Opening
        And I swipe to card Giro Account
        And I choose Giro Account
        And I choose Giro Account Corporate
        And I submit my giro type
        And I choose legality business type 'cv'
        And I submit my legality type
        And I fill NPWP Business
        And I click continue to data personal
        And I click confirm NPWP Business
        And I see page 'Upload eKTP'
        And I update my last journey step to 'Data Employment'
        And I see page 'Data Business Profile'
        When I fill my business profile as followings:
            | businessName       | PT. BOTOL MINUM PERKASA RAYA DAN JAYA |
            | industry           | Jasa                                  |
            | businessField      | Restoran                              |
            | monthlyIncome      | 30 - 50 juta                          |
            | averageTransaction | 2000000                               |
            | nib                | 9129106701234                         |
            | businessDateStart  | 10/10/2010                            |
        And I submit my business profile
        And I submit business director list

    Scenario Outline: Verifying form Business Address fields has been filled and then empty the fields
        Given I am a customer who has submitted business owner list
        When I fill field '<Field>' with '123' in form Business Address
        And I clear the field '<Field>' in form Business Address
        Then I should see message error '<Field Name> wajib diisi' in the below of field '<Field>' in form Business Address
        Examples:
            | testRailTag | Field   | Field Name |
            | @C171419    | address | Alamat     |
            | @C171420    | rt      | RT         |
            | @C171421    | rw      | RW         |

    Scenario Outline: Verifying one fields hasn't been filled by user in form Business Address
        Given I am a customer who has submitted business owner list
        When I fill form Business Address except field '<Field>'
        And I submit my business address
        And I swipe to field '<Field>' in form Business Address
        Then I should see message error '<Field Name> wajib diisi' in the below of field '<Field>' in form Business Address
        Examples:
            | testRailTag | Field    | Field Name     |
            | @C171422    | address  | Alamat         |
            | @C171423    | rt       | RT             |
            | @C171424    | rw       | RW             |
            | @C171425    | province | Provinsi       |
            | @C171426    | city     | Kota/Kabupaten |
            | @C171427    | district | Kecamatan      |
            | @C171428    | village  | Kelurahan      |

    Scenario Outline: Verifying length address in form Business Address
        Given I am a customer who has submitted business owner list
        When I fill field 'address' with '<Value>' in form Business Address
        Then I should see message error '<Message>' in the below of field 'address' in form Business Address
        Examples:                                                                 ❸
            | testRailTag | Value                                                                                                                                                   | Message                                 |
            | @C171429    | Offline123457890 licenses are for using KSE without the internet. Once generated, the license cannot be revoked or transferred to a different machine.. | Alamat minimal 3 & maksimal 50 karakter |
            | @C171430    | Pa                                                                                                                                                      | Alamat minimal 3 & maksimal 50 karakter |

    @C171431
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
            | @C171432    | ab    | RT tidak sesuai format |
            | @C171433    | !@    | RT tidak sesuai format |
            | @C171434    | 3124  | RT maksimal 3          |
            | @C171435    |       | RT wajib diisi         |

    @C171436
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
            | @C171437    | ab    | RW tidak sesuai format |
            | @C171438    | !@    | RW tidak sesuai format |
            | @C171439    | 3124  | RW maksimal 3          |
            | @C171440    |       | RW wajib diisi         |

    @C171441
    Scenario: Verifying field rw contain with -
        Given I am a customer who has submitted business owner list
        When I fill field 'rt' with '-' in form Business Address
        Then I shouldn't see message error in the below of field 'rw' in form Business Address

    @C171442
    Scenario: Submit form Business Address successfully business type CV
        Given I am a customer who has uploaded my eKTP photo and selfie
        And has submitted business owner list
        When I fill my business address as followings:
            | address  | Jl. Gambir Belok Kiri No. 10 |
            | rt       | 000                          |
            | rw       | 011                          |
            | province | DKI JAKARTA                  |
            | city     | JAKARTA SELATAN              |
            | district | PANCORAN                     |
            | village  | PANCORAN                     |
        And I agree to carry out the Rights and Obligations
        And I will directing to page Rights and Obligations
        And I click button agree with Rights and Obligations
        And I will see checkbox Rights and Obligations is checked
        And I submit my business address
        Then I will directing to page upload require documents for business
        And I can close the page so that I can back to main dashboard