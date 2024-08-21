@kybSubmitFormBusinessProfileCV
Feature: Account Opening KYB CV - Submit Business Profile
    In order to opening my Giro account with legality business type CV in SMB
    As a customer
    I want to submit my business profile as part of the KYB Process

    Background: User choose legality business type CV
        Given I am a registered customer with following details:
            | userID      | ruth0c1c |
            | password    | 1234Test |
            | userIDstg   | ruth7cb8 |
            | passwordStg | 1234Test |
        And I filling in form login with the following details:
            | userID      | ruth0c1c |
            | password    | 1234Test |
            | userIDstg   | ruth7cb8 |
            | passwordStg | 1234Test |
        And I click login
        And I click later in pop up biometric
        And I will directing to Hook 1 Onboarding Account Opening
        And I swipe to card Giro Account
        And I choose Giro Account
        And I choose Giro Account Corporate
        And I choose legality business type 'cv'
        And I submit my legality type
        And I fill NPWP Business
        And I click continue to data personal
        And I click confirm NPWP Business
        And I see page 'Upload eKTP'
        And I update my last journey step to 'Data Employment'

    Scenario Outline: Verifying form Business Profile fields has been filled and then empty the fields
        Given I am a customer who has completed my KYC process
        When I continue to process KYB
        And I fill field '<Field>' with '121212' in form Business Profile
        And I clear the field '<Field>' in form Business Profile
        Then I should see message error '<Field Name> wajib diisi' in the below of field '<Field>' in form Business Profile
        Examples:
            | testRailTag | Field              | Field Name            |
            | @C131851    | businessName       | Nama bisnis           |
            | @C131852    | businessField      | Jenis bisnis          |
            | @C134126    | averageTransaction | Rata - rata transaksi |
            | @C131854    | nib                | NIB Berbasis Resiko   |

    Scenario Outline: Verifying one fields hasn't been filled by user in form Business Profile
        Given I am a customer who has completed my KYC process
        When I continue to process KYB
        And I fill form Business Profile except field '<Field>'
        And I submit my business profile
        And I swipe to field '<Field>' in form Business Profile
        Then I should see message error '<Field Name> wajib diisi' in the below of field '<Field>' in form Business Profile
        Examples:
            | testRailTag | Field             | Field Name                   |
            | @C131855    | businessName      | Nama bisnis                  |
            | @C131856    | industry          | Tipe industri                |
            | @C131857    | businessField     | Jenis bisnis                 |
            | @C131858    | monthlyIncome     | Penghasilan bisnis per bulan |
            | @C134133    | averageTransaction| Rata - rata transaksi        |
            | @C131860    | nib               | NIB Berbasis Resiko          |
            | @C131861    | businessDateStart | Tanggal bisnis berdiri       |

    Scenario Outline: Verifying business name with invalid value in form Business Profile
        Given I am a customer who has completed my KYC process
        When I continue to process KYB
        And I fill field 'businessName' with '<Value>' in form Business Profile
        Then I should see message error '<Message>' in the below of field 'businessName' in form Business Profile
        Examples:                                                                 ❸
            | testRailTag | Value                                                                                                                                                   | Message                                       |
            | @C131862    | Pa                                                                                                                                                      | Nama bisnis minimal 3 & maksimal 150 karakter |
            | @C131863    | Offlineeeeeeeeeee licenses are for using KSE without the internett Once generatedd the license cannot be revoked or transferred to a different machinee | Nama bisnis minimal 3 & maksimal 150 karakter |

    @C131864
    Scenario: Verifying field business name contain with special char and number
        Given I am a customer who has completed my KYC process
        When I continue to process KYB
        And I fill field 'businessName' with 'John Doe S.Kom, M\'Kom- 11233' in form Business Profile
        Then I shouldn't see message error in the below of field 'businessName' in form Business Profile

    @C134116
    Scenario: Verifying field average transaction contain with special char and alphabeth
        Given I am a customer who has completed my KYC process
        When I continue to process KYB
        And I fill field 'averageTransaction' with '20;0000ty@#$' in form Business Profile
        Then I should see message error 'Rata - rata transaksi wajib diisi' in the below of field 'averageTransaction' in form Business Profile   

    Scenario Outline: Verifying business field with invalid value in form Business Profile
        Given I am a customer who has completed my KYC process
        When I continue to process KYB
        And I fill field 'businessField' with '<Value>' in form Business Profile
        Then I should see message error '<Message>' in the below of field 'businessField' in form Business Profile
        Examples:                                                                 ❸
            | testRailTag | Value                                                                                                                                                   | Message                                        |
            | @C131865    | Pa                                                                                                                                                      | Jenis bisnis minimal 3 & maksimal 150 karakter |
            | @C131866    | Offlineeeeeeeeeee licenses are for using KSE without the internett Once generatedd the license cannot be revoked or transferred to a different machinee | Jenis bisnis minimal 3 & maksimal 150 karakter |

    Scenario Outline: Verifying NIB field with invalid value in form Business Profile
        Given I am a customer who has completed my KYC process
        When I continue to process KYB
        And I fill field 'nib' with '<Value>' in form Business Profile
        Then I should see message error '<Message>' in the below of field 'nib' in form Business Profile
        Examples:                                                                 ❸
            | testRailTag | Value           | Message                                 |
            | @C131867    | 9129106701A!4   | NIB Berbasis Resiko tidak sesuai format |
            | @C131868    | 912910670123412 | NIB harus 13 digit                      |
            | @C131869    | 912910          | NIB harus 13 digit                      |

    @C131872
    Scenario: Submit form Business Profile successfully business type CV
        Given I am a customer who has completed my KYC process
        When I continue to process KYB
        And I see fields that available in Business Profile
        And I fill my business profile as followings:
            | businessName       | PT. ABCD        |
            | industry           | Jasa            |
            | businessField      | Restoran        |
            | monthlyIncome      | 30 - 50 juta    |
            | averageTransaction | 2000000         |
            | nib                | 9129106701234   |
            | businessDateStart  | 10/10/2010      |
        And I submit my business profile
        Then I will notify my business profile has successfully submitted
        And I will directing to page director list