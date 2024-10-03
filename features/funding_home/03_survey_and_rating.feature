Feature: Home - Survey and Rating
    In order give feedback after register SMB Business App
    As a Customer
    I want to give rating and feedback

    @C160302
    Scenario: Give 5 rating account rejected
        Given I am a customer that recently registered to amarbank business with data as below
            | fullName        | Revvy                   |
            | email           | testing_11@gmail.com    |
            | phoneNumber     | 813968854041            |
            | password        | 1234Test                |
            | confirmPassword | 1234Test                |
        And I login using my user id that I recently receive through email
        And I click later in pop up biometric
        And I will directing to Hook 1 Onboarding Account Opening
        And I click later
        And I choose Giro Account from dashboard
        And I choose Giro Account MSME
        And I submit my giro type
        And I choose legality business type 'individual'
        And I submit my legality type
        And I see page 'Upload eKTP'
        And I click take photo eKTP
        And I will directing to page take photo eKTP
        And I take photo eKTP
        And I submit my eKTP photo
        And I fill all information identity details as followings:
            | eKtpNumber    | 3171131810770033          |
            | eKtpNumberStg | 3494397967994519          |
        And I swipe to button save data eKTP
        And I submit my information identity details
        And I will direct to page notifying me that I can't continue to next process KYC because my data already registered
        And I close page rejected account
        And I will direct to dashboard with widget account is rejected
        And I will see rating survey is in main dashboard
        And I give '5' ratings
        And I sent feedback survey
        Then I will see snackbar my survey is sent
        And I will not see rating survey is in main dashboard
        And I will direct to dashboard with widget account is rejected

    @C160303
    Scenario: Give 4 rating account rejected
        Given I am a customer that recently registered to amarbank business with data as below
            | fullName        | Revvy                   |
            | email           | testing_11@gmail.com    |
            | phoneNumber     | 813968854041            |
            | password        | 1234Test                |
            | confirmPassword | 1234Test                |
        And I login using my user id that I recently receive through email
        And I click later in pop up biometric
        And I will directing to Hook 1 Onboarding Account Opening
        And I click later
        And I choose Giro Account from dashboard
        And I choose Giro Account MSME
        And I submit my giro type
        And I choose legality business type 'individual'
        And I submit my legality type
        And I see page 'Upload eKTP'
        And I click take photo eKTP
        And I will directing to page take photo eKTP
        And I take photo eKTP
        And I submit my eKTP photo
        And I fill all information identity details as followings:
            | eKtpNumber    | 3171131810770033          |
            | eKtpNumberStg | 3494397967994519          |
        And I swipe to button save data eKTP
        And I submit my information identity details
        And I will direct to page notifying me that I can't continue to next process KYC because my data already registered
        And I close page rejected account
        And I will direct to dashboard with widget account is rejected
        And I will see rating survey is in main dashboard
        And I give '4' ratings
        And I sent feedback survey
        Then I will see snackbar my survey is sent
        And I will not see rating survey is in main dashboard
        And I will direct to dashboard with widget account is rejected

    @C160304
    Scenario: Give 3 rating account rejected
        Given I am a customer that recently registered to amarbank business with data as below
            | fullName        | Revvy                   |
            | email           | testing_11@gmail.com    |
            | phoneNumber     | 813968854041            |
            | password        | 1234Test                |
            | confirmPassword | 1234Test                |
        And I login using my user id that I recently receive through email
        And I click later in pop up biometric
        And I will directing to Hook 1 Onboarding Account Opening
        And I click later
        And I choose Giro Account from dashboard
        And I choose Giro Account MSME
        And I submit my giro type
        And I choose legality business type 'individual'
        And I submit my legality type
        And I see page 'Upload eKTP'
        And I click take photo eKTP
        And I will directing to page take photo eKTP
        And I take photo eKTP
        And I submit my eKTP photo
        And I fill all information identity details as followings:
            | eKtpNumber    | 3171131810770033          |
            | eKtpNumberStg | 3494397967994519          |
        And I swipe to button save data eKTP
        And I submit my information identity details
        And I will direct to page notifying me that I can't continue to next process KYC because my data already registered
        And I close page rejected account
        And I will direct to dashboard with widget account is rejected
        And I will see rating survey is in main dashboard
        And I give '3' ratings
        And I will see field text feedback survey
        And I fill feedback survey 'Not really good'
        And I sent feedback survey
        Then I will see snackbar my survey is sent
        And I will not see rating survey is in main dashboard
        And I will direct to dashboard with widget account is rejected
        
    @C160305   
    Scenario: Give 2 rating account rejected
        Given I am a customer that recently registered to amarbank business with data as below
            | fullName        | Revvy                   |
            | email           | testing_11@gmail.com    |
            | phoneNumber     | 813968854041            |
            | password        | 1234Test                |
            | confirmPassword | 1234Test                |
        And I login using my user id that I recently receive through email
        And I click later in pop up biometric
        And I will directing to Hook 1 Onboarding Account Opening
        And I click later
        And I choose Giro Account from dashboard
        And I choose Giro Account MSME
        And I submit my giro type
        And I choose legality business type 'individual'
        And I submit my legality type
        And I see page 'Upload eKTP'
        And I click take photo eKTP
        And I will directing to page take photo eKTP
        And I take photo eKTP
        And I submit my eKTP photo
        And I fill all information identity details as followings:
            | eKtpNumber    | 3171131810770033          |
            | eKtpNumberStg | 3494397967994519          |
        And I swipe to button save data eKTP
        And I submit my information identity details
        And I will direct to page notifying me that I can't continue to next process KYC because my data already registered
        And I close page rejected account
        And I will direct to dashboard with widget account is rejected
        And I will see rating survey is in main dashboard
        And I give '2' ratings
        And I will see field text feedback survey
        And I fill feedback survey 'Not really good'
        And I sent feedback survey
        Then I will see snackbar my survey is sent
        And I will not see rating survey is in main dashboard
        And I will direct to dashboard with widget account is rejected

    @C160306
    Scenario: Give 1 rating account rejected
        Given I am a customer that recently registered to amarbank business with data as below
            | fullName        | Revvy                   |
            | email           | testing_11@gmail.com    |
            | phoneNumber     | 813968854041            |
            | password        | 1234Test                |
            | confirmPassword | 1234Test                |
        And I login using my user id that I recently receive through email
        And I click later in pop up biometric
        And I will directing to Hook 1 Onboarding Account Opening
        And I click later
        And I choose Giro Account from dashboard
        And I choose Giro Account MSME
        And I submit my giro type
        And I choose legality business type 'individual'
        And I submit my legality type
        And I see page 'Upload eKTP'
        And I click take photo eKTP
        And I will directing to page take photo eKTP
        And I take photo eKTP
        And I submit my eKTP photo
        And I fill all information identity details as followings:
            | eKtpNumber    | 3171131810770033          |
            | eKtpNumberStg | 3494397967994519          |
        And I swipe to button save data eKTP
        And I submit my information identity details
        And I will direct to page notifying me that I can't continue to next process KYC because my data already registered
        And I close page rejected account
        And I will direct to dashboard with widget account is rejected
        And I will see rating survey is in main dashboard
        And I give '1' ratings
        And I will see field text feedback survey
        And I fill feedback survey 'Not really good'
        And I sent feedback survey
        Then I will see snackbar my survey is sent
        And I will not see rating survey is in main dashboard
        And I will direct to dashboard with widget account is rejected

    @C160309
    Scenario: Give rating less than 4 and then more than 4 account rejected
        Given I am a customer that recently registered to amarbank business with data as below
            | fullName        | Revvy                   |
            | email           | testing_11@gmail.com    |
            | phoneNumber     | 813968854041            |
            | password        | 1234Test                |
            | confirmPassword | 1234Test                |
        And I login using my user id that I recently receive through email
        And I click later in pop up biometric
        And I will directing to Hook 1 Onboarding Account Opening
        And I click later
        And I choose Giro Account from dashboard
        And I choose Giro Account MSME
        And I submit my giro type
        And I choose legality business type 'individual'
        And I submit my legality type
        And I see page 'Upload eKTP'
        And I click take photo eKTP
        And I will directing to page take photo eKTP
        And I take photo eKTP
        And I submit my eKTP photo
        And I fill all information identity details as followings:
            | eKtpNumber    | 3171131810770033          |
            | eKtpNumberStg | 3494397967994519          |
        And I swipe to button save data eKTP
        And I submit my information identity details
        And I will direct to page notifying me that I can't continue to next process KYC because my data already registered
        And I close page rejected account
        And I will direct to dashboard with widget account is rejected
        And I will see rating survey is in main dashboard
        And I give '1' ratings
        And I will see field text feedback survey
        And I fill feedback survey 'Not really good'
        And I give '5' ratings
        And I will not see field text feedback survey
        And I sent feedback survey
        Then I will see snackbar my survey is sent
        And I will not see rating survey is in main dashboard
        And I will direct to dashboard with widget account is rejected

    @C160310
    Scenario: Give rating more than 4 and then less than 4 account rejected
        Given I am a customer that recently registered to amarbank business with data as below
            | fullName        | Revvy                   |
            | email           | testing_11@gmail.com    |
            | phoneNumber     | 813968854041            |
            | password        | 1234Test                |
            | confirmPassword | 1234Test                |
        And I login using my user id that I recently receive through email
        And I click later in pop up biometric
        And I will directing to Hook 1 Onboarding Account Opening
        And I click later
        And I choose Giro Account from dashboard
        And I choose Giro Account MSME
        And I submit my giro type
        And I choose legality business type 'individual'
        And I submit my legality type
        And I see page 'Upload eKTP'
        And I click take photo eKTP
        And I will directing to page take photo eKTP
        And I take photo eKTP
        And I submit my eKTP photo
        And I fill all information identity details as followings:
            | eKtpNumber    | 3171131810770033          |
            | eKtpNumberStg | 3494397967994519          |
        And I swipe to button save data eKTP
        And I submit my information identity details
        And I will direct to page notifying me that I can't continue to next process KYC because my data already registered
        And I close page rejected account
        And I will direct to dashboard with widget account is rejected
        And I will see rating survey is in main dashboard
        And I give '5' ratings
        And I will not see field text feedback survey
        And I give '1' ratings
        And I will see field text feedback survey
        And I fill feedback survey 'Not really good'
        And I sent feedback survey
        Then I will see snackbar my survey is sent
        And I will not see rating survey is in main dashboard
        And I will direct to dashboard with widget account is rejected

    @C160311
    Scenario: Give rating less than 4 with feedback is blank
        Given I am a customer that recently registered to amarbank business with data as below
            | fullName        | Revvy                   |
            | email           | testing_11@gmail.com    |
            | phoneNumber     | 813968854041            |
            | password        | 1234Test                |
            | confirmPassword | 1234Test                |
        And I login using my user id that I recently receive through email
        And I click later in pop up biometric
        And I will directing to Hook 1 Onboarding Account Opening
        And I click later
        And I choose Giro Account from dashboard
        And I choose Giro Account MSME
        And I submit my giro type
        And I choose legality business type 'individual'
        And I submit my legality type
        And I see page 'Upload eKTP'
        And I click take photo eKTP
        And I will directing to page take photo eKTP
        And I take photo eKTP
        And I submit my eKTP photo
        And I fill all information identity details as followings:
            | eKtpNumber    | 3171131810770033          |
            | eKtpNumberStg | 3494397967994519          |
        And I swipe to button save data eKTP
        And I submit my information identity details
        And I will direct to page notifying me that I can't continue to next process KYC because my data already registered
        And I close page rejected account
        And I will direct to dashboard with widget account is rejected
        And I will see rating survey is in main dashboard
        And I give '3' ratings
        And I will see field text feedback survey
        And I fill feedback survey ''
        And I sent feedback survey
        Then I will see snackbar my survey is sent
        And I will direct to dashboard with widget account is rejected

    @C160312
    Scenario: Fill feedback with length character more than 259 char
        Given I am a customer that recently registered to amarbank business with data as below
            | fullName        | Revvy                   |
            | email           | testing_11@gmail.com    |
            | phoneNumber     | 813968854041            |
            | password        | 1234Test                |
            | confirmPassword | 1234Test                |
        And I login using my user id that I recently receive through email
        And I click later in pop up biometric
        And I will directing to Hook 1 Onboarding Account Opening
        And I click later
        And I choose Giro Account from dashboard
        And I choose Giro Account MSME
        And I submit my giro type
        And I choose legality business type 'individual'
        And I submit my legality type
        And I see page 'Upload eKTP'
        And I click take photo eKTP
        And I will directing to page take photo eKTP
        And I take photo eKTP
        And I submit my eKTP photo
        And I fill all information identity details as followings:
            | eKtpNumber    | 3171131810770033          |
            | eKtpNumberStg | 3494397967994519          |
        And I swipe to button save data eKTP
        And I submit my information identity details
        And I will direct to page notifying me that I can't continue to next process KYC because my data already registered
        And I close page rejected account
        And I will direct to dashboard with widget account is rejected
        And I will see rating survey is in main dashboard
        And I give '3' ratings
        And I will see field text feedback survey
        And I fill feedback survey 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, semt'
        And I will see field is filled with character only 259 char
        And I sent feedback survey
        Then I will see snackbar my survey is sent
        And I will direct to dashboard with widget account is rejected

    @C160313
    Scenario: Fill feedback with alphanumeric and special character
        Given I am a customer that recently registered to amarbank business with data as below
            | fullName        | Revvy                   |
            | email           | testing_11@gmail.com    |
            | phoneNumber     | 813968854041            |
            | password        | 1234Test                |
            | confirmPassword | 1234Test                |
        And I login using my user id that I recently receive through email
        And I click later in pop up biometric
        And I will directing to Hook 1 Onboarding Account Opening
        And I click later
        And I choose Giro Account from dashboard
        And I choose Giro Account MSME
        And I submit my giro type
        And I choose legality business type 'individual'
        And I submit my legality type
        And I see page 'Upload eKTP'
        And I click take photo eKTP
        And I will directing to page take photo eKTP
        And I take photo eKTP
        And I submit my eKTP photo
        And I fill all information identity details as followings:
            | eKtpNumber    | 3171131810770033          |
            | eKtpNumberStg | 3494397967994519          |
        And I swipe to button save data eKTP
        And I submit my information identity details
        And I will direct to page notifying me that I can't continue to next process KYC because my data already registered
        And I close page rejected account
        And I will direct to dashboard with widget account is rejected
        And I will see rating survey is in main dashboard
        And I give '3' ratings
        And I will see field text feedback survey
        And I fill feedback survey 'Lorem (123) ip$um #dor @met, consectetuer & 100% adipiscing el!t.'
        And I will see field feedback is filled
        And I sent feedback survey
        Then I will see snackbar my survey is sent
        And I will direct to dashboard with widget account is rejected