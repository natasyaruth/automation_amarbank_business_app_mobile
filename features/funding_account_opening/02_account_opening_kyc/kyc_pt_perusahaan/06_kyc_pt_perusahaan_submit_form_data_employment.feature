@kycSubmitFormDataEmploymentPTPerusahaan
Feature: Account Opening KYC PT Perusahaan - Submit Data Employment
    In order to opening my Giro account with legality business type PT Perusahaan in SMB
    As a customer
    I want to submit my data employment as part of the KYC Process

    Background: User choose legality business type PT Perusahaan
        Given I am a registered customer with following details:
            | userID      | nataf8ec |
            | password    | Test1234 |
            | userIDstg   | stag76ee |
            | passwordStg | Test1234 |
        And I filling in form login with the following details:
            | userID      | nataf8ec |
            | password    | Test1234 |
            | userIDstg   | stag76ee |
            | passwordStg | Test1234 |
        And I click login
        And I will directing to Hook 1 Onboarding Account Opening
        And I swipe to card Giro Account
        And I choose Giro Account
        And I choose Giro Account Corporate
        And I choose legality business type 'company'
        And I submit my legality type
        And I update my last journey step to 'Data Domicile Address'

    @C96543
    Scenario: Submit form Data Employment successfully business type PT Perusahaan
        Given I am a customer who has submitted my domicile address
        When I fill my employment details as followings:
            | workType     | Pegawai Swasta       |
            | sourceIncome | Pemasukan dari Usaha |
        And I submit my employment data
        Then I will notify that I already fill my personal details data