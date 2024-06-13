@validationDHN
Feature: Account Opening - Validation DHN KTP and NPWP Business
    In order to avoid user that has indicated as DHN in KTP or NPWP business
    Account user should be rejected for 7 days

    Background: Mock feature submit form KTP and Business Profile to check DHN
        Given I mock feature submit form KTP into enabled
        And I mock feature submit form Business Profile into enabled

    @C131781
    Scenario: Submit form KTP with NIK indicated as DHN
        Given I am a customer that recently registered to amarbank business with data as below
            | fullName        | Revvy                   |
            | email           | revvy_dev@gmail.com     |
            | phoneNumber     | 899967754041            |
            | password        | 1234Test                |
            | confirmPassword | 1234Test                |
        And I login using my user id that I recently receive through email
        And I will directing to Hook 1 Onboarding Account Opening
        And I click later
        And I choose Giro Account from dashboard
        And I choose Giro Account MSME
        And I choose legality business type 'individual'
        And I submit my legality type
        And I am a customer want to fill my information identity details
        When I fill all information identity details as followings:
            | eKtpNumber    | 9983035601860007          |
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
        Then I will direct to page notifying me that I can't continue to next process KYC because my data indicated as DHN
        And I close page rejected account
        And I will direct to dashboard with info my data indicated as DHN

    @C131782
    Scenario: Submit form Business Profile with NPWP business indicated as DHN
        Given I am a customer that recently registered to amarbank business with data as below
            | fullName        | Revvy                   |
            | email           | revvy_dev@gmail.com     |
            | phoneNumber     | 899967754041            |
            | password        | 1234Test                |
            | confirmPassword | 1234Test                |
        And I login using my user id that I recently receive through email
        And I will directing to Hook 1 Onboarding Account Opening
        And I click later
        And I choose Giro Account from dashboard
        And I choose Giro Account Corporate
        And I choose legality business type 'cv'
        And I submit my legality type
        And I update my last journey step to 'Data Employment'
        When I continue to process KYB
        And I fill my business profile as followings:
            | businessName      | PT. ABCD        |
            | industry          | Jasa            |
            | businessField     | Restoran        |
            | monthlyIncome     | 30 - 50 juta    |
            | npwp              | 906283213036000 |
            | nib               | 9129106701234   |
            | businessDateStart | 10/10/2010      |
        And I submit my business profile
        Then I will direct to page notifying me that I can't continue to next process KYB because my data indicated as DHN
        And I close page rejected account
        And I will direct to dashboard with info my data indicated as DHN 