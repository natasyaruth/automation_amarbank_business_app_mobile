@validationAutoRejectKYB
Feature: Account Opening - Validation Auto Reject
    In order to avoid user that has indicated as:
        - DHN NPWP Business
    Account user should be rejected for 7 days

    Background: Do register phase one
        Given I am a customer that recently registered to amarbank business with data as below
            | fullName        | Revvy                   |
            | email           | revvy@gmail.com         |
            | phoneNumber     | 899967754041            |
            | password        | 1234Test                |
            | confirmPassword | 1234Test                |
        And I login using my user id that I recently receive through email
        And I click later in pop up biometric
        And I will directing to Hook 1 Onboarding Account Opening
        And I click later
        And I choose Giro Account from dashboard
        And I choose Giro Account Corporate

    @C131782
    Scenario: Submit form Business Profile with NPWP business indicated as DHN
        And I choose legality business type 'cv'
        And I submit my legality type
        And I mock feature submit form Business Profile into enabled
        And I update my last journey step to 'Data Employment'
        When I continue to process KYB
        And I fill my business profile as followings:
            | businessName      | PT. ABCD        |
            | industry          | Jasa            |
            | businessField     | Restoran        |
            | monthlyIncome     | 30 - 50 juta    |
            | averageTransaction| 2000000         |
            | npwp              | 906283213036000 |
            | nib               | 9129106701234   |
            | businessDateStart | 10/10/2010      |
        And I submit my business profile
        Then I will direct to page notifying me that I can't continue to next process KYB because my data indicated as DHN
        And I close page rejected account
        And I will direct to dashboard with info my data indicated as DHN 