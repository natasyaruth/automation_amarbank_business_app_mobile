@kycSubmitFormDomicileAddressIndividual
Feature: Account Opening KYC Individual - Submit Domicile Address
    In order to opening my Giro account with legality business type Individual in SMB
    As a customer
    I want to submit my domiciles address as part of the KYC Process

    Background: User choose legality business type Individual
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
        And I update my last journey step to 'Data Personal'

    Scenario Outline: Verifying form New Domicile address fields has been filled and then empty the fields
        Given I am a customer who has submitted my personal data details
        When I choose my new domicile address
        And I fill field '<Field>' with 'Testing' in form New Domicile Address
        And I clear the field '<Field>' in form New Domicile Address
        Then I should see message error '<Field Name> wajib diisi' in the below of field '<Field>' in form New Domicile Address
        Examples:
            | testRailTag | Field   | Field Name     |
            | @C171043    | address | Alamat lengkap |
            | @C171044    | rt      | RT             |
            | @C171045    | rw      | RW             |

    Scenario Outline: Verifying one fields hasn't been filled by user in form New Domicile address
        Given I am a customer who has submitted my personal data details
        When I choose my new domicile address
        And I fill form New Domicile Address except field '<Field>'
        And I submit my domicile address
        Then I should see message error '<Field Name> wajib diisi' in the below of field '<Field>' in form New Domicile Address
        Examples:
            | testRailTag | Field    | Field Name     |
            | @C171046    | address  | Alamat lengkap |
            | @C171047    | rt       | RT             |
            | @C171048    | rw       | RW             |
            | @C171049    | province | Provinsi       |
            | @C171050    | city     | Kota/Kabupaten |
            | @C171051    | district | Kecamatan      |
            | @C171052    | village  | Kelurahan/Desa |

    Scenario Outline: Verifying length address in form New Domicile address
        Given I am a customer who has submitted my personal data details
        When I choose my new domicile address
        And I fill field 'address' with '<Value>' in form New Domicile Address
        Then I should see message error '<Message>' in the below of field 'address' in form New Domicile Address
        Examples:                                                                 ❸
            | testRailTag | Value                                                                                                                                                   | Message                                  |
            | @C171053    | Offline123457890 licenses are for using KSE without the internet. Once generated, the license cannot be revoked or transferred to a different machine.. | Alamat minimal 3 & maksimal 50 karakter |
            | @C171054    | Pa                                                                                                                                                      | Alamat minimal 3 & maksimal 50 karakter |

    @C171055
    Scenario: Verifying field address contain with special char and number
        Given I am a customer who has submitted my personal data details
        When I choose my new domicile address
        And I fill field 'address' with 'John Doe S.Kom, M\'Kom- 11233' in form New Domicile Address
        Then I shouldn't see message error in the below of field 'address' in form New Domicile Address

    @C171056
    Scenario: Verifying length RT in form New Domicile address
        Given I am a customer who has submitted my personal data details
        When I choose my new domicile address
        And I fill field 'rt' with '3124' in form New Domicile Address
        Then I should see message error 'RT maksimal 3' in the below of field 'rt' in form New Domicile Address

    @C171057
    Scenario: Verifying field rt contain with -
        Given I am a customer who has submitted my personal data details
        When I choose my new domicile address
        And I fill field 'rt' with '-' in form New Domicile Address
        Then I shouldn't see message error in the below of field 'rt' in form New Domicile Address

    @C171058
    Scenario: Verifying length RW in form New Domicile address
        Given I am a customer who has submitted my personal data details
        When I choose my new domicile address
        And I fill field 'rw' with '3124' in form New Domicile Address
        Then I should see message error 'RW maksimal 3' in the below of field 'rw' in form New Domicile Address

    @C171059
    Scenario: Verifying field rw contain with -
        Given I am a customer who has submitted my personal data details
        When I choose my new domicile address
        And I fill field 'rt' with '-' in form New Domicile Address
        Then I shouldn't see message error in the below of field 'rw' in form New Domicile Address

    @C171060
    Scenario: Submit form Domicile address same with KTP successfully business type Individual
        Given I am a customer who has submitted my personal data details
        When I choose my domicile address same with my identity information
        And I submit my domicile address
        Then I will notify my domicile address has successfully submitted
        And I will direct to page Data Employment Individual

    @C171061
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
        And I reset my state journey