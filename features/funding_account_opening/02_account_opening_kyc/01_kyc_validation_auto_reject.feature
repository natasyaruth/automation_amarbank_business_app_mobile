@validationAutoRejectKYC
Feature: Account Opening - Validation Auto Reject
    In order to avoid user that has indicated as:
        - DHN KTP
        - individual user used NIK that already registered
    Account user should be rejected for 7 days

    Background: Do register phase one
        Given I am a customer that recently registered to amarbank business with data as below
            | fullName        | Revvy                   |
            | email           | revvy@gmail.com         |
            | phoneNumber     | 899967754041            |
            | password        | 1234Test                |
            | confirmPassword | 1234Test                |
        And my mocking DHN currently is off    
        And I login using my user id that I recently receive through email
        And I click later in pop up biometric
        And I will directing to Hook 1 Onboarding Account Opening
        And I click later
        And I choose Giro Account from dashboard
        And I choose Giro Account MSME

    @C131781
    Scenario: Submit form KTP with NIK indicated as DHN business type Individual
        Given I choose legality business type 'individual'
        And I submit my legality type
        And I fill NPWP Business
        And I click continue to data personal
        And I click confirm NPWP Business
        And I see page 'Upload eKTP'
        And I mock feature submit form KTP into enabled
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
        Then I will direct to page notifying me that I can't continue to next process KYC because my data is indicated as DHN
        And I close page rejected account
        And I will direct to dashboard with info my data indicated as DHN

    @C135997
    Scenario: Submit form KTP with NIK indicated as DHN business type Business
        Given I choose legality business type 'cv'
        And I submit my legality type
        And I fill NPWP Business
        And I click continue to data personal
        And I click confirm NPWP Business
        And I see page 'Upload eKTP'
        And I mock feature submit form KTP into enabled
        And I am a customer want to fill my information identity details
        When I fill all information identity details as followings:
            | eKtpNumber    | 6683035601830007          |
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
        Then I will direct to page notifying me that I can't continue to next process KYC because my data is indicated as DHN
        And I close page rejected account
        And I will direct to dashboard with info my data indicated as DHN    

    @C135998
    Scenario: Submit form KTP with NIK already registered business type Individual
        Given I choose legality business type 'individual'
        And I submit my legality type
        And I fill NPWP Business
        And I click continue to data personal
        And I click confirm NPWP Business
        And I see page 'Upload eKTP'
        And I am a customer want to fill my information identity details
        When I fill all information identity details as followings:
            | eKtpNumber    | 3171131810770033          |
            | eKtpNumberStg | 3172026604740009          |
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
        Then I will direct to page notifying me that I can't continue to next process KYC because my data already registered
        And I close page rejected account
        And I will direct to dashboard with widget account is rejected
        And I can click widget account rejected
        And I will see information that I can try to register after 7 days

    @C160315
    Scenario: Give 5 rating account rejected DHN from KYC
        Given I choose legality business type 'individual'
        And I submit my legality type
        And I fill NPWP Business
        And I click continue to data personal
        And I click confirm NPWP Business
        And I see page 'Upload eKTP'
        And I click take photo eKTP
        And I will directing to page take photo eKTP
        And I take photo eKTP
        And I submit my eKTP photo
        And I fill all information identity details as followings:
            | eKtpNumber    | 3170031810770033          |
            | eKtpNumberStg | 3170026604740009          |
        And I mock feature submit form KTP into enabled
        And I swipe to button save data eKTP
        And I submit my information identity details
        And I will direct to page notifying me that I can't continue to next process KYC because my data is indicated as DHN
        And I close page rejected account
        And I will direct to dashboard with info my data indicated as DHN
        And I will see rating survey is in main dashboard
        And I give '5' ratings
        And I sent feedback survey
        Then I will see snackbar my survey is sent
        And I will not see rating survey is in main dashboard
        And I will direct to dashboard with info my data indicated as DHN

    @C160316
    Scenario: Give 4 rating account rejected DHN from KYC
        Given I choose legality business type 'individual'
        And I submit my legality type
        And I fill NPWP Business
        And I click continue to data personal
        And I click confirm NPWP Business
        And I see page 'Upload eKTP'
        And I click take photo eKTP
        And I will directing to page take photo eKTP
        And I take photo eKTP
        And I submit my eKTP photo
        And I fill all information identity details as followings:
            | eKtpNumber    | 3170031810770033          |
            | eKtpNumberStg | 3170026604740009          |
        And I mock feature submit form KTP into enabled
        And I swipe to button save data eKTP
        And I submit my information identity details
        And I will direct to page notifying me that I can't continue to next process KYC because my data is indicated as DHN
        And I close page rejected account
        And I will direct to dashboard with info my data indicated as DHN
        And I will see rating survey is in main dashboard
        And I give '4' ratings
        And I sent feedback survey
        Then I will see snackbar my survey is sent
        And I will not see rating survey is in main dashboard
        And I will direct to dashboard with info my data indicated as DHN

    @C160317
    Scenario: Give 3 rating account rejected DHN from KYC
        Given I choose legality business type 'individual'
        And I submit my legality type
        And I fill NPWP Business
        And I click continue to data personal
        And I click confirm NPWP Business
        And I see page 'Upload eKTP'
        And I click take photo eKTP
        And I will directing to page take photo eKTP
        And I take photo eKTP
        And I submit my eKTP photo
        And I fill all information identity details as followings:
            | eKtpNumber    | 3170031810770033          |
            | eKtpNumberStg | 3170026604740009          |
        And I mock feature submit form KTP into enabled
        And I swipe to button save data eKTP
        And I submit my information identity details
        And I will direct to page notifying me that I can't continue to next process KYC because my data is indicated as DHN
        And I close page rejected account
        And I will direct to dashboard with info my data indicated as DHN
        And I will see rating survey is in main dashboard
        And I give '3' ratings
        And I will see field text feedback survey
        And I fill feedback survey 'Not really good'
        And I sent feedback survey
        Then I will see snackbar my survey is sent
        And I will not see rating survey is in main dashboard
        And I will direct to dashboard with info my data indicated as DHN

    @C160318
    Scenario: Give 2 rating account rejected DHN from KYC
        Given I choose legality business type 'individual'
        And I submit my legality type
        And I fill NPWP Business
        And I click continue to data personal
        And I click confirm NPWP Business
        And I see page 'Upload eKTP'
        And I click take photo eKTP
        And I will directing to page take photo eKTP
        And I take photo eKTP
        And I submit my eKTP photo
        And I fill all information identity details as followings:
            | eKtpNumber    | 3170031810770033          |
            | eKtpNumberStg | 3170026604740009          |
        And I mock feature submit form KTP into enabled
        And I swipe to button save data eKTP
        And I submit my information identity details
        And I will direct to page notifying me that I can't continue to next process KYC because my data is indicated as DHN
        And I close page rejected account
        And I will direct to dashboard with info my data indicated as DHN
        And I will see rating survey is in main dashboard
        And I give '2' ratings
        And I will see field text feedback survey
        And I fill feedback survey 'Not really good'
        And I sent feedback survey
        Then I will see snackbar my survey is sent
        And I will not see rating survey is in main dashboard
        And I will direct to dashboard with info my data indicated as DHN

    @C160319
    Scenario: Give 1 rating account rejected DHN from KYC
        Given I choose legality business type 'individual'
        And I submit my legality type
        And I fill NPWP Business
        And I click continue to data personal
        And I click confirm NPWP Business
        And I see page 'Upload eKTP'
        And I click take photo eKTP
        And I will directing to page take photo eKTP
        And I take photo eKTP
        And I submit my eKTP photo
        And I fill all information identity details as followings:
            | eKtpNumber    | 3170031810770033          |
            | eKtpNumberStg | 3170026604740009          |
        And I mock feature submit form KTP into enabled
        And I swipe to button save data eKTP
        And I submit my information identity details
        And I will direct to page notifying me that I can't continue to next process KYC because my data is indicated as DHN
        And I close page rejected account
        And I will direct to dashboard with info my data indicated as DHN
        And I will see rating survey is in main dashboard
        And I give '1' ratings
        And I will see field text feedback survey
        And I fill feedback survey 'Not really good'
        And I sent feedback survey
        Then I will see snackbar my survey is sent
        And I will not see rating survey is in main dashboard
        And I will direct to dashboard with info my data indicated as DHN

    @C160320
    Scenario: Give rating less than 4 and then more than 4 in account rejected  DHN
        Given I choose legality business type 'individual'
        And I submit my legality type
        And I fill NPWP Business
        And I click continue to data personal
        And I click confirm NPWP Business
        And I see page 'Upload eKTP'
        And I click take photo eKTP
        And I will directing to page take photo eKTP
        And I take photo eKTP
        And I submit my eKTP photo
        And I fill all information identity details as followings:
            | eKtpNumber    | 3170031810770033          |
            | eKtpNumberStg | 3170026604740009          |
        And I mock feature submit form KTP into enabled
        And I swipe to button save data eKTP
        And I submit my information identity details
        And I will direct to page notifying me that I can't continue to next process KYC because my data is indicated as DHN
        And I close page rejected account
        And I will direct to dashboard with info my data indicated as DHN
        And I will see rating survey is in main dashboard
        And I give '1' ratings
        And I will see field text feedback survey
        And I fill feedback survey 'Not really good'
        And I give '5' ratings
        Then I will not see field text feedback survey
        And I sent feedback survey
        And I will see snackbar my survey is sent
        And I will not see rating survey is in main dashboard

    @C160321
    Scenario: Give rating more than 4 and then less than 4 in account rejected  DHN
        Given I choose legality business type 'individual'
        And I submit my legality type
        And I fill NPWP Business
        And I click continue to data personal
        And I click confirm NPWP Business
        And I see page 'Upload eKTP'
        And I click take photo eKTP
        And I will directing to page take photo eKTP
        And I take photo eKTP
        And I submit my eKTP photo
        And I fill all information identity details as followings:
            | eKtpNumber    | 3170031810770033          |
            | eKtpNumberStg | 3170026604740009          |
        And I mock feature submit form KTP into enabled
        And I swipe to button save data eKTP
        And I submit my information identity details
        And I will direct to page notifying me that I can't continue to next process KYC because my data is indicated as DHN
        And I close page rejected account
        And I will direct to dashboard with info my data indicated as DHN
        And I will see rating survey is in main dashboard
        And I give '5' ratings
        And I will not see field text feedback survey
        And I give '1' ratings
        Then I will see field text feedback survey
        And I fill feedback survey 'Not really good'
        And I sent feedback survey
        And I will see snackbar my survey is sent
        And I will not see rating survey is in main dashboard