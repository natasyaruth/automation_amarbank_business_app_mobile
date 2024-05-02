@kycSubmitFormDataEmploymentCV
Feature: Account Opening KYC CV - Submit Data Employment
    In order to opening my Giro account with legality business type CV in SMB
    As a customer
    I want to submit my data employment as part of the KYC Process

    Background: User choose legality business type CV
        Given I am a registered customer with following details:
            | userID      | ruth07f9 |
            | password    | 1234Test |
            | userIDstg   | ruthf5d5 |
            | passwordStg | 1234Test |
        And I filling in form login with the following details:
            | userID      | ruth07f9 |
            | password    | 1234Test |
            | userIDstg   | ruthf5d5 |
            | passwordStg | 1234Test |
        And I click login
        And I will directing to Hook 1 Onboarding Account Opening
        And I swipe to card Giro Account
        And I choose Giro Account
        And I choose Giro Account Corporate
        And I choose legality business type 'cv'
        And I submit my legality type
        And I update my last journey step to 'Data Domicile Address'

    @C96522
    Scenario: Submit form Data Employment successfully business type CV
        Given I am a customer who has submitted my domicile address
        When I fill my employment details as followings:
            | workType     | Pegawai Swasta       |
            | sourceIncome | Pemasukan dari Usaha |
        And I submit my employment data
        Then I will notify that I already fill my personal details data