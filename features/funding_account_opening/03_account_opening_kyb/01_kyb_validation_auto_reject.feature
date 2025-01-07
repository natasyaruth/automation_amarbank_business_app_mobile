@validationAutoRejectKYB
Feature: Account Opening - Validation Auto Reject
    In order to avoid user that has indicated as:
        - DHN NPWP Business
        - User Invitee DHN
    Account user should be rejected for 7 days

    Background: Do register phase one
        Given I am a customer that recently registered to amarbank business with data as below
            | fullName        | Testing                 |
            | email           | test_DHN_1@gmail.com    |
            | phoneNumber     | 899967754041            |
            | password        | 1234Test                |
        And my mocking DHN currently is off    
        And I login using my user id that I recently receive through email
        And I click later in pop up biometric
        And I will directing to Hook 1 Onboarding Account Opening
        And I click later

    @C171488
    Scenario: Submit form Business Profile with NPWP business indicated as DHN
        Given I choose Giro Account from dashboard
        And I choose Giro Account Corporate
        And I submit my giro type
        And I choose legality business type 'cv'
        And I submit my legality type
        And I fill NPWP Business
        And I click continue to data personal
        And I click confirm NPWP Business
        And I see page 'Upload eKTP'
        And I mock feature submit form Business Profile into enabled
        And I update my last journey step to 'Data Employment'
        When I see page 'Data Business Profile'
        And I fill my business profile as followings:
            | businessName      | PT. ABCD        |
            | industry           | Jasa            |
            | businessField      | Operator tur    |
            | monthlyIncome     | 30 - 50 juta    |
            | averageTransaction| 2000000         |
            | nib               | 9129106701234   |
            | businessDateStart | 10/10/2010      |
        And I submit my business profile
        Then I will direct to page notifying me that I can't continue to next process KYB because my data is indicated as DHN
        And I close page rejected account
        And I will direct to dashboard with info my data indicated as DHN

    @C171489
    Scenario: Register user invitee with indicated as DHN
        Given I register initiator with partner as below
            | fullName        | RUDI                   |
            | email           | testing_32@gmail.com   |
            | phoneNumber     | 899960054041           |
            | password        | 1234Test               |
        And I choose other
        And I click logout
        And I register invitee with business code
        And I login using user id partner
        And I click later in pop up biometric
        And I will direct to page continue to register KYC Invitee
        And I continue to register my KYC data
        And I click take photo eKTP
        And I take photo eKTP
        And I submit my eKTP photo
        And I fill all information identity details as followings:
            | eKtpNumber    | 3170031810770033          |
            | eKtpNumberStg | 3170026604740009          |
        And I mock feature submit form KTP into enabled
        And I swipe to button save data eKTP
        And I submit my information identity details
        Then I will direct to page notifying me that I can't continue to next process KYC because my data is indicated as DHN
        And I close page rejected account
        And I will direct to dashboard with info my data indicated as DHN
        And I choose other
        And I click logout
        And I login using account initiator
        And I click later in pop up biometric
        Then I will direct to dashboard with info other director data indicated as DHN

    @C171490
    Scenario: Give 5 rating account rejected DHN from KYB
        Given I choose Giro Account from dashboard
        And I choose Giro Account Corporate
        And I submit my giro type
        And I choose legality business type 'cv'
        And I submit my legality type
        And I fill NPWP Business
        And I click continue to data personal
        And I click confirm NPWP Business
        And I see page 'Upload eKTP'
        And I mock feature submit form Business Profile into enabled
        And I update my last journey step to 'Data Employment'
        When I see page 'Data Business Profile'
        And I fill my business profile as followings:
            | businessName      | PT. ABCD        |
            | industry          | Jasa            |
            | businessField     | Operator tur    |
            | monthlyIncome     | 30 - 50 juta    |
            | averageTransaction| 2000000         |
            | nib               | 9129106701234   |
            | businessDateStart | 10/10/2010      |
        And I submit my business profile
        And I will direct to page notifying me that I can't continue to next process KYB because my data is indicated as DHN
        And I close page rejected account
        And I will direct to dashboard with info my data indicated as DHN
        And I will see rating survey is in main dashboard
        And I give '5' ratings
        And I sent feedback survey
        Then I will see snackbar my survey is sent
        And I will not see rating survey is in main dashboard
        And I will not see information to give feedback to playstore
        And I will direct to dashboard with info my data indicated as DHN

    @C171491
    Scenario: Give 4 rating account rejected DHN from KYB
        Given I choose Giro Account from dashboard
        And I choose Giro Account Corporate
        And I submit my giro type
        And I choose legality business type 'cv'
        And I submit my legality type
        And I fill NPWP Business
        And I click continue to data personal
        And I click confirm NPWP Business
        And I see page 'Upload eKTP'
        And I mock feature submit form Business Profile into enabled
        And I update my last journey step to 'Data Employment'
        When I see page 'Data Business Profile'
        And I fill my business profile as followings:
            | businessName      | PT. ABCD        |
            | industry          | Jasa            |
            | businessField     | Operator tur    |
            | monthlyIncome     | 30 - 50 juta    |
            | averageTransaction| 2000000         |
            | nib               | 9129106701234   |
            | businessDateStart | 10/10/2010      |
        And I submit my business profile
        And I will direct to page notifying me that I can't continue to next process KYB because my data is indicated as DHN
        And I close page rejected account
        And I will direct to dashboard with info my data indicated as DHN
        And I will see rating survey is in main dashboard
        And I give '4' ratings
        And I sent feedback survey
        Then I will see snackbar my survey is sent
        And I will not see rating survey is in main dashboard
        And I will not see information to give feedback to playstore
        And I will direct to dashboard with info my data indicated as DHN

    @C171492
    Scenario: Give 3 rating account rejected DHN from KYB
        Given I choose Giro Account from dashboard
        And I choose Giro Account Corporate
        And I submit my giro type
        And I choose legality business type 'cv'
        And I submit my legality type
        And I fill NPWP Business
        And I click continue to data personal
        And I click confirm NPWP Business
        And I see page 'Upload eKTP'
        And I mock feature submit form Business Profile into enabled
        And I update my last journey step to 'Data Employment'
        When I see page 'Data Business Profile'
        And I fill my business profile as followings:
            | businessName      | PT. ABCD        |
            | industry          | Jasa            |
            | businessField     | Operator tur    |
            | monthlyIncome     | 30 - 50 juta    |
            | averageTransaction| 2000000         |
            | nib               | 9129106701234   |
            | businessDateStart | 10/10/2010      |
        And I submit my business profile
        And I will direct to page notifying me that I can't continue to next process KYB because my data is indicated as DHN
        And I close page rejected account
        And I will direct to dashboard with info my data indicated as DHN
        And I will see rating survey is in main dashboard
        And I give '3' ratings
        And I will see field text feedback survey
        And I fill feedback survey 'Not really good'
        And I sent feedback survey
        Then I will see snackbar my survey is sent
        And I will not see rating survey is in main dashboard
        And I will not see information to give feedback to playstore
        And I will direct to dashboard with info my data indicated as DHN

    @C171493
    Scenario: Give 2 rating account rejected DHN from KYB
        Given I choose Giro Account from dashboard
        And I choose Giro Account Corporate
        And I submit my giro type
        And I choose legality business type 'cv'
        And I submit my legality type
        And I fill NPWP Business
        And I click continue to data personal
        And I click confirm NPWP Business
        And I see page 'Upload eKTP'
        And I mock feature submit form Business Profile into enabled
        And I update my last journey step to 'Data Employment'
        When I see page 'Data Business Profile'
        And I fill my business profile as followings:
            | businessName      | PT. ABCD        |
            | industry           | Jasa            |
            | businessField      | Operator tur    |
            | monthlyIncome     | 30 - 50 juta    |
            | averageTransaction| 2000000         |
            | nib               | 9129106701234   |
            | businessDateStart | 10/10/2010      |
        And I submit my business profile
        And I will direct to page notifying me that I can't continue to next process KYB because my data is indicated as DHN
        And I close page rejected account
        And I will direct to dashboard with info my data indicated as DHN
        And I will see rating survey is in main dashboard
        And I give '2' ratings
        And I will see field text feedback survey
        And I fill feedback survey 'Not really good'
        And I sent feedback survey
        Then I will see snackbar my survey is sent
        And I will not see rating survey is in main dashboard
        And I will not see information to give feedback to playstore
        And I will direct to dashboard with info my data indicated as DHN

    @C171494
    Scenario: Give 1 rating account rejected DHN from KYB
        Given I choose Giro Account from dashboard
        And I choose Giro Account Corporate
        And I submit my giro type
        And I choose legality business type 'cv'
        And I submit my legality type
        And I fill NPWP Business
        And I click continue to data personal
        And I click confirm NPWP Business
        And I see page 'Upload eKTP'
        And I mock feature submit form Business Profile into enabled
        And I update my last journey step to 'Data Employment'
        When I see page 'Data Business Profile'
        And I fill my business profile as followings:
            | businessName      | PT. ABCD        |
            | industry           | Jasa            |
            | businessField      | Operator tur    |
            | monthlyIncome     | 30 - 50 juta    |
            | averageTransaction| 2000000         |
            | nib               | 9129106701234   |
            | businessDateStart | 10/10/2010      |
        And I submit my business profile
        And I will direct to page notifying me that I can't continue to next process KYB because my data is indicated as DHN
        And I close page rejected account
        And I will direct to dashboard with info my data indicated as DHN
        And I will see rating survey is in main dashboard
        And I give '1' ratings
        And I will see field text feedback survey
        And I fill feedback survey 'Not really good'
        And I sent feedback survey
        Then I will see snackbar my survey is sent
        And I will not see rating survey is in main dashboard
        And I will not see information to give feedback to playstore
        And I will direct to dashboard with info my data indicated as DHN

    @C171495
    Scenario: Give 5 rating account rejected DHN invitee
        Given I register initiator with partner as below
            | fullName        | RUDI                          |
            | email           | test_DHN_partner_1@gmail.com  |
            | phoneNumber     | 899960054041                  |
            | password        | 1234Test                      |
        And I choose other
        And I click logout
        And I register invitee with business code
        And I login using user id partner
        And I click later in pop up biometric
        And I will direct to page continue to register KYC Invitee
        And I continue to register my KYC data
        And I click take photo eKTP
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
        And I choose other
        And I click logout
        And I login using account initiator
        And I click later in pop up biometric
        And I will direct to dashboard with info other director data indicated as DHN
        And I will see rating survey is in main dashboard
        And I give '5' ratings
        And I sent feedback survey
        Then I will see snackbar my survey is sent
        And I will not see rating survey is in main dashboard
        And I will not see information to give feedback to playstore
        And I will direct to dashboard with info other director data indicated as DHN

    @C171496
    Scenario: Give 4 rating account rejected DHN invitee
        Given I register initiator with partner as below
            | fullName        | RUDI                   |
            | email           | rudit.bagas@gmail.com  |
            | phoneNumber     | 899960054041           |
            | password        | 1234Test               |
        And I choose other
        And I click logout
        And I register invitee with business code
        And I login using user id partner
        And I click later in pop up biometric
        And I will direct to page continue to register KYC Invitee
        And I continue to register my KYC data
        And I click take photo eKTP
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
        And I choose other
        And I click logout
        And I login using account initiator
        And I click later in pop up biometric
        And I will direct to dashboard with info other director data indicated as DHN
        And I will see rating survey is in main dashboard
        And I give '4' ratings
        And I sent feedback survey
        Then I will see snackbar my survey is sent
        And I will not see rating survey is in main dashboard
        And I will not see information to give feedback to playstore
        And I will direct to dashboard with info other director data indicated as DHN

    @C171497
    Scenario: Give 3 rating account rejected DHN invitee
        Given I register initiator with partner as below
            | fullName        | RUDI                   |
            | email           | rudit.bagas@gmail.com  |
            | phoneNumber     | 899960054041           |
            | password        | 1234Test               |
        And I choose other
        And I click logout
        And I register invitee with business code
        And I login using user id partner
        And I click later in pop up biometric
        And I will direct to page continue to register KYC Invitee
        And I continue to register my KYC data
        And I click take photo eKTP
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
        And I choose other
        And I click logout
        And I login using account initiator
        And I click later in pop up biometric
        And I will direct to dashboard with info other director data indicated as DHN
        And I will see rating survey is in main dashboard
        And I give '3' ratings
        And I will see field text feedback survey
        And I fill feedback survey 'Not really good'
        And I sent feedback survey
        Then I will see snackbar my survey is sent
        And I will not see rating survey is in main dashboard
        And I will not see information to give feedback to playstore
        And I will direct to dashboard with info other director data indicated as DHN

    @C171498
    Scenario: Give 2 rating account rejected DHN invitee
        Given I register initiator with partner as below
            | fullName        | RUDI                   |
            | email           | rudit.bagas@gmail.com  |
            | phoneNumber     | 899960054041           |
            | password        | 1234Test               |
        And I choose other
        And I click logout
        And I register invitee with business code
        And I login using user id partner
        And I click later in pop up biometric
        And I will direct to page continue to register KYC Invitee
        And I continue to register my KYC data
        And I click take photo eKTP
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
        And I choose other
        And I click logout
        And I login using account initiator
        And I click later in pop up biometric
        And I will direct to dashboard with info other director data indicated as DHN
        And I will see rating survey is in main dashboard
        And I give '2' ratings
        And I will see field text feedback survey
        And I fill feedback survey 'Not really good'
        And I sent feedback survey
        Then I will see snackbar my survey is sent
        And I will not see rating survey is in main dashboard
        And I will not see information to give feedback to playstore
        And I will direct to dashboard with info other director data indicated as DHN

    @C171499
    Scenario: Give 1 rating account rejected DHN invitee
        Given I register initiator with partner as below
            | fullName        | RUDI                   |
            | email           | rudit.bagas@gmail.com  |
            | phoneNumber     | 899960054041           |
            | password        | 1234Test               |
        And I choose other
        And I click logout
        And I register invitee with business code
        And I login using user id partner
        And I click later in pop up biometric
        And I will direct to page continue to register KYC Invitee
        And I continue to register my KYC data
        And I click take photo eKTP
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
        And I choose other
        And I click logout
        And I login using account initiator
        And I click later in pop up biometric
        And I will direct to dashboard with info other director data indicated as DHN
        And I will see rating survey is in main dashboard
        And I give '1' ratings
        And I will see field text feedback survey
        And I fill feedback survey 'Not really good'
        And I sent feedback survey
        Then I will see snackbar my survey is sent
        And I will not see rating survey is in main dashboard
        And I will not see information to give feedback to playstore
        And I will direct to dashboard with info other director data indicated as DHN   

    @C171500
    Scenario: Give rating both in iniator and invitee side DHN case
        Given I register initiator with partner as below
            | fullName        | RUDI                   |
            | email           | rudit.bagas@gmail.com  |
            | phoneNumber     | 899960054041           |
            | password        | 1234Test               |
        And I choose other
        And I click logout
        And I register invitee with business code
        And I login using user id partner
        And I click later in pop up biometric
        And I will direct to page continue to register KYC Invitee
        And I continue to register my KYC data
        And I click take photo eKTP
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
        And I give '5' ratings
        And I sent feedback survey
        And I will see snackbar my survey is sent
        And I choose other
        And I click logout
        And I login using account initiator
        And I click later in pop up biometric
        And I will direct to dashboard with info other director data indicated as DHN
        And I will see rating survey is in main dashboard
        And I give '5' ratings
        And I sent feedback survey
        Then I will see snackbar my survey is sent
        And I will not see rating survey is in main dashboard
        And I will not see information to give feedback to playstore
        And I will direct to dashboard with info other director data indicated as DHN           