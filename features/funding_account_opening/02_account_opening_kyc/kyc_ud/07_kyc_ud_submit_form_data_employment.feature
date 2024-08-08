@kycSubmitFormDataEmploymentUD
Feature: Account Opening KYC UD - Submit Data Employment
    In order to opening my Giro account with legality business type UD in SMB
    As a customer
    I want to submit my data employment as part of the KYC Process

    Background: User choose legality business type UD
        Given I am a registered customer with following details:
            | userID      | ruth2322 |
            | password    | Test1234 |
            | userIDstg   | ruth73e1 |
            | passwordStg | 1234Test |
        And I filling in form login with the following details:
            | userID      | ruth2322 |
            | password    | Test1234 |
            | userIDstg   | ruth73e1 |
            | passwordStg | 1234Test |
        And I click login
        And I will directing to Hook 1 Onboarding Account Opening
        And I swipe to card Giro Account
        And I choose Giro Account
        And I choose Giro Account MSME
        And I choose legality business type 'ud'
        And I submit my legality type
        And I update my last journey step to 'Data Domicile Address'

    @C131847
    Scenario: Submit form Data Employment successfully business type UD
        Given I am a customer who has submitted my domicile address
        And I see fields that available in Data Employment
        When I fill my employment details as followings:
            | workType     | Pegawai Swasta       |
            | sourceIncome | Pemasukan dari Usaha |
        And I submit my employment data
        Then I will notify that I already fill my personal details data
        And I reset my state journey