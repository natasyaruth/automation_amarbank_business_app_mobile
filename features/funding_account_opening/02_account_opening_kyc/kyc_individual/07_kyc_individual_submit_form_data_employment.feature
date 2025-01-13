@kycSubmitFormDataEmploymentIndividual
Feature: Account Opening KYC Individual - Submit Data Employment
    In order to opening my Giro account with legality business type Individual in SMB
    As a customer
    I want to submit my data employment as part of the KYC Process

    Background: User choose legality business type Individual
        Given I am a registered customer with following details:
            | userID      | deve2f2c |
            | password    | 1234Test |
            | userIDstg   | stagd7b3 |
            | passwordStg | 1234Test |
        And I reset my state journey
        And I filling in form login with the following details:
            | userID      | deve2f2c |
            | password    | 1234Test |
            | userIDstg   | stagd7b3 |
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
        And I see page 'Upload eKTP'
        And I update my last journey step to 'Data Domicile Address'

    Scenario Outline: Verifying one fields hasn't been filled by user in form Data Employment
        Given I am a customer who has submitted my domicile address
        When I fill form Data Employment except field '<Field>'
        And I submit my employment data individual
        And I swipe to field '<Field>' in form Data Employment
        Then I should see message error '<Field Name> wajib diisi' in the below of field '<Field>' in form Data Employment
        Examples:
            | testRailTag | Field              | Field Name            |
            | @C171062    | workType           | Jenis pekerjaan       |
            | @C171063    | sourceIncome       | Sumber Pendapatan     |
            | @C171064    | monthlyIncome      | Pendapatan bulanan    |
            | @C171065    | averageTransaction | Rata - rata transaksi |
            | @C171066    | industry           | Industri usaha        |
            | @C171067    | companyName        | Nama usaha            |

    Scenario Outline: Verifying business name with invalid value in form Data Employment
        Given I am a customer who has submitted my domicile address
        When I fill my company name with '<Value>'
        Then I should see message error '<Message>' in the below of field 'companyName' in form Data Employment
        Examples:                                                                 ❸
            | testRailTag | Value                                                                                                                                                   | Message                                           |
            | @C171068    | TA                                                                                                                                                      | Nama usaha minimal 3 & maksimal 150 karakter |
            | @C171069    | Offline123457890 licenses are for using KSE without the internet. Once generated, the license cannot be revoked or transferred to a different machine.. | Nama usaha minimal 3 & maksimal 150 karakter |

    @C171070
    Scenario: Verifying business name has been filled and then empty the fields
        Given I am a customer who has submitted my domicile address
        When I fill my company name with 'AMARBANK'
        And I clear field company name
        Then I should see message error 'Nama usaha wajib diisi' in the below of field 'companyName' in form Data Employment

    @C171071
    Scenario: Verifying average transaction has been filled and then empty the fields
        Given I am a customer who has submitted my domicile address
        When I fill my average transaction with '2000000'
        And I clear field average transaction
        Then I should see message error 'Rata - rata transaksi wajib diisi' in the below of field 'averageTransaction' in form Data Employment

    @C171072
    Scenario: Verifying business name contain with special char and number
        Given I am a customer who has submitted my domicile address
        When I fill my company name with 'John Doe S.Kom, M\'Kom- 11233'
        Then I shouldn't see message error in the below of field company name in form Data Employment

    @C171073
    Scenario: Verifying average transaction contain with special char and alphabeth
        Given I am a customer who has submitted my domicile address
        When I fill my average transaction with "200000aB@"
        Then I shouldn't see message error in the below of field average transaction in form Data Employment    

    @C171074
    Scenario: Submit form Data Employment successfully business type Individual
        Given I am a customer who has submitted my domicile address
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