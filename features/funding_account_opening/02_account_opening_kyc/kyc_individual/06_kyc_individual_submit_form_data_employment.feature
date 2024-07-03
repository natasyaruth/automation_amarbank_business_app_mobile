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
        And I click later in pop up biometric
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
            | testRailTag | Field              | Field Name            |
            | @C131771    | workType           | Jenis pekerjaan       |
            | @C131772    | sourceIncome       | Sumber Pendapatan     |
            | @C131773    | monthlyIncome      | Pendapatan bulanan    |
            | @C134094    | averageTransaction | Rata - rata transaksi |
            | @C131774    | industry           | Industri perusahaan   |
            | @C131775    | companyName        | Nama perusahaan       |

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
        And I click later in pop up biometric
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
            | @C131776    | TA                                                                                                                                                      | Nama perusahaan minimal 3 & maksimal 150 karakter |
            | @C131777    | Offline123457890 licenses are for using KSE without the internet. Once generated, the license cannot be revoked or transferred to a different machine.. | Nama perusahaan minimal 3 & maksimal 150 karakter |

    @C131778
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
        And I click later in pop up biometric
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

    @C134099
    Scenario: Verifying average transaction has been filled and then empty the fields
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
        And I click later in pop up biometric
        And I will directing to Hook 1 Onboarding Account Opening
        And I swipe to card Giro Account
        And I choose Giro Account
        And I choose Giro Account Corporate
        And I choose legality business type 'individual'
        And I submit my legality type
        And I update my last journey step to 'Data Domicile Address'
        When I fill my average transaction with '2000000'
        And I clear field average transaction
        Then I should see message error 'Rata - rata transaksi wajib diisi' in the below of field 'averageTransaction' in form Data Employment

    @C131779
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
        And I click later in pop up biometric
        And I will directing to Hook 1 Onboarding Account Opening
        And I swipe to card Giro Account
        And I choose Giro Account
        And I choose Giro Account Corporate
        And I choose legality business type 'individual'
        And I submit my legality type
        And I update my last journey step to 'Data Domicile Address'
        When I fill my company name with 'John Doe S.Kom, M\'Kom- 11233'
        Then I shouldn't see message error in the below of field company name in form Data Employment

    @C134100
    Scenario: Verifying average transaction contain with special char and alphabeth
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
        And I click later in pop up biometric
        And I will directing to Hook 1 Onboarding Account Opening
        And I swipe to card Giro Account
        And I choose Giro Account
        And I choose Giro Account Corporate
        And I choose legality business type 'individual'
        And I submit my legality type
        And I update my last journey step to 'Data Domicile Address'
        When I fill my average transaction with "200000aB@"
        Then I shouldn't see message error in the below of field average transaction in form Data Employment    

    @C131780
    Scenario: Submit form Data Employment successfully business type Individual
        Given I am a registered customer with following details:
            | userID      | deve26d4 |
            | password    | 1234Test |
            | userIDstg   | ruth530f |
            | passwordStg | 1234Test |
        And I filling in form login with the following details:
            | userID      | deve26d4 |
            | password    | 1234Test |
            | userIDstg   | ruth530f |
            | passwordStg | 1234Test |
        And I click login
        And I click later in pop up biometric
        And I will directing to Hook 1 Onboarding Account Opening
        And I swipe to card Giro Account
        And I choose Giro Account
        And I choose Giro Account Corporate
        And I choose legality business type 'individual'
        And I submit my legality type
        And I update my last journey step to 'Data Domicile Address'
        And I see fields that available in Data Employment
        When I fill my employment details as followings:
            | workType           | Pegawai Negeri Sipil |
            | sourceIncome       | Gaji Bulanan         |
            | monthlyIncome      | 5 - 10 juta          |
            | averageTransaction | 2000000              |
            | industry           | Pemerintahan         |
            | companyName        | KEMENDAGRI           |
        And I agree to carry out the Rights and Obligations
        And I will directing to page Rights and Obligations
        And I click button agree with Rights and Obligations
        And I will see checkbox Rights and Obligations is checked
        And I submit my employment data individual
        Then I will notify that my personal data details needs to be verified first