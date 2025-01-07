@menu_profile
Feature: Menu Profile
    In order to display customer data profile
    As a customer
    I want to see my detail profile individual and business in tab profile

    @C161240
    Scenario: Validate menu profile with user Individual status active
        Given I am a registered customer with following details:
            | userID      | ruth9ba1 |
            | password    | 1234Test |
            | userIDstg   | stag302d |
            | passwordStg | 1234Test |
        And complete onboarding document safe and survey
        And I filling in form login with the following details:
            | userID      | ruth9ba1 |
            | password    | 1234Test |
            | userIDstg   | stag302d |
            | passwordStg | 1234Test |
        And I click login
        And I click later in pop up biometric
        And I will see card account 'active'
        When I click tab profile
        Then I will see my profile individual data

    @C161241
    Scenario: Validate menu profile with user Individual status on verification
        Given I am a registered customer with following details:
            | userID      | indibec3 |
            | password    | 1234Test |
            | userIDstg   | revv22d2 |
            | passwordStg | 1234Test |
        And I filling in form login with the following details:
            | userID      | indibec3 |
            | password    | 1234Test |
            | userIDstg   | revv22d2 |
            | passwordStg | 1234Test |
        And I click login
        And I click later in pop up biometric
        And I will see card account 'on verification'
        When I click tab profile
        Then I will see my profile individual data

    @C161242
    Scenario: Validate menu profile with user Individual status on process
        Given I am a registered customer with following details:
            | userID      | deved6a1 |
            | password    | 1234Test |
            | userIDstg   | revv22e7 |
            | passwordStg | 1234Test |
        And I filling in form login with the following details:
            | userID      | deved6a1 |
            | password    | 1234Test |
            | userIDstg   | revv22e7 |
            | passwordStg | 1234Test |
        And I click login
        And I click later in pop up biometric
        And I will see card account 'on process'
        When I click tab profile
        Then I will see my profile data is blank

    @C161243
    Scenario: Validate menu profile with user PT Perusahaan status active
        Given I am a registered customer with following details:
            | userID      | autofb2c |
            | password    | 1234Test |
            | userIDstg   | stagcfb7 |
            | passwordStg | 1234Test |
        And complete onboarding document safe and survey
        And I filling in form login with the following details:
            | userID      | autofb2c |
            | password    | 1234Test |
            | userIDstg   | stagcfb7 |
            | passwordStg | 1234Test |
        And I click login
        And I click later in pop up biometric
        And I will see card account 'active'
        When I click tab profile
        Then I see my profile company data
        And I click detail business profile
        And I will direct to detail business profile

    @C161244
    Scenario: Validate menu profile with user PT Perusahaan status on verification
        Given I am a registered customer with following details:
            | userID      | ptpe7f28 | 
            | password    | 1234Test |
            | userIDstg   | revv54d3 |
            | passwordStg | 1234Test |
        And I filling in form login with the following details:
            | userID      | ptpe7f28 |
            | password    | 1234Test |
            | userIDstg   | revv54d3 |
            | passwordStg | 1234Test |
        And I click login
        And I click later in pop up biometric
        And I will see card account 'on verification'
        When I click tab profile
        Then I see my profile company data
        And I click detail business profile
        And I will direct to detail business profile

    @C161245
    Scenario: Validate menu profile with user PT Perusahaan status on process
        Given I am a registered customer with following details:
            | userID      | deve82e5 |
            | password    | 1234Test |
            | userIDstg   | revv5ce0 |
            | passwordStg | 1234Test |
        And I filling in form login with the following details:
            | userID      | deve82e5 |
            | password    | 1234Test |
            | userIDstg   | revv5ce0 |
            | passwordStg | 1234Test |
        And I click login
        And I click later in pop up biometric
        And I will see card account 'on process'
        When I click tab profile
        Then I will see my profile data is blank

    @C161246
    Scenario: Validate menu profile with user CV status active
        Given I am a registered customer with following details:
            | userID      | autoeb6a |
            | password    | 1234Test |
            | userIDstg   | ruth1600 |
            | passwordStg | Test1234 |
        And complete onboarding document safe and survey
        And I filling in form login with the following details:
            | userID      | autoeb6a |
            | password    | 1234Test |
            | userIDstg   | ruth1600 |
            | passwordStg | Test1234 |
        And I click login
        And I click later in pop up biometric
        And I will see card account 'active'
        When I click tab profile
        Then I see my profile company data
        And I click detail business profile
        And I will direct to detail business profile

    @C161247
    Scenario: Validate menu profile with user CV status on verification
        Given I am a registered customer with following details:
            | userID      | auto0e1c |
            | password    | 1234Test |
            | userIDstg   | revv42a4 |
            | passwordStg | 1234Test |
        And I filling in form login with the following details:
            | userID      | auto0e1c |
            | password    | 1234Test |
            | userIDstg   | revv42a4 |
            | passwordStg | 1234Test |
        And I click login
        And I click later in pop up biometric
        And I will see card account 'on verification'
        When I click tab profile
        Then I see my profile company data
        And I click detail business profile
        And I will direct to detail business profile

    @C161248
    Scenario: Validate menu profile with user CV status on process
        Given I am a registered customer with following details:
            | userID      | autoc10a |
            | password    | 1234Test |
            | userIDstg   | mich4d05 |
            | passwordStg | 1234Test |
        And I filling in form login with the following details:
            | userID      | autoc10a |
            | password    | 1234Test |
            | userIDstg   | mich4d05 |
            | passwordStg | 1234Test |
        And I click login
        And I click later in pop up biometric
        And I will see card account 'on process'
        When I click tab profile
        Then I will see my profile data is blank

    @C161249
    Scenario: Validate menu profile with user PT Perorangan status active
        Given I am a registered customer with following details:
            | userID      | autoa645 |
            | password    | 1234Test |
            | userIDstg   | stag6cf7 |
            | passwordStg | 1234Test |
        And complete onboarding document safe and survey
        And I filling in form login with the following details:
            | userID      | autoa645 |
            | password    | 1234Test |
            | userIDstg   | stag6cf7 |
            | passwordStg | 1234Test |
        And I click login
        And I click later in pop up biometric
        And I will see card account 'active'
        When I click tab profile
        Then I see my profile individual company data
        And I click detail business profile
        And I will direct to detail business profile

    @C161250
    Scenario: Validate menu profile with user PT Perorangan status on verification
        Given I am a registered customer with following details:
            | userID      | auto94a2 |
            | password    | 1234Test |
            | userIDstg   | stagf9be |
            | passwordStg | 1234Test |
        And I filling in form login with the following details:
            | userID      | auto94a2 |
            | password    | 1234Test |
            | userIDstg   | stagf9be |
            | passwordStg | 1234Test |
        And I click login
        And I click later in pop up biometric
        And I will see card account 'on verification'
        When I click tab profile
        Then I see my profile individual company data
        And I click detail business profile
        And I will direct to detail business profile

    @C161251
    Scenario: Validate menu profile with user PT Perorangan status on process
        Given I am a registered customer with following details:
            | userID      | auto7d0b |
            | password    | 1234Test |
            | userIDstg   | stagc6ce |
            | passwordStg | 1234Test |
        And I filling in form login with the following details:
            | userID      | auto7d0b |
            | password    | 1234Test |
            | userIDstg   | stagc6ce |
            | passwordStg | 1234Test |
        And I click login
        And I click later in pop up biometric
        And I will see card account 'on process'
        When I click tab profile
        Then I will see my profile data is blank

    @C161252
    Scenario: Validate menu profile with user UD status active
        Given I am a registered customer with following details:
            | userID      | autod015 |
            | password    | 1234Test |
            | userIDstg   | ruthfdcb |
            | passwordStg | 1234Test |
        And complete onboarding document safe and survey
        And I filling in form login with the following details:
            | userID      | autod015 |
            | password    | 1234Test |
            | userIDstg   | ruthfdcb |
            | passwordStg | 1234Test |
        And I click login
        And I click later in pop up biometric
        And I will see card account 'active'
        When I click tab profile
        Then I see my profile individual company data
        And I click detail business profile
        And I will direct to detail business profile

    @C161253
    Scenario: Validate menu profile with user UD status on verification
        Given I am a registered customer with following details:
            | userID      | auto94a2 |
            | password    | 1234Test |
            | userIDstg   | stag4c45 |
            | passwordStg | 1234Test |
        And I filling in form login with the following details:
            | userID      | auto94a2 |
            | password    | 1234Test |
            | userIDstg   | stag4c45 |
            | passwordStg | 1234Test |
        And I click login
        And I click later in pop up biometric
        And I will see card account 'on verification'
        When I click tab profile
        Then I see my profile individual company data
        And I click detail business profile
        And I will direct to detail business profile

    @C161254
    Scenario: Validate menu profile with user UD status on process
        Given I am a registered customer with following details:
            | userID      | auto19fc |
            | password    | 1234Test |
            | userIDstg   | stag5a14 |
            | passwordStg | 1234Test |
        And I filling in form login with the following details:
            | userID      | auto19fc |
            | password    | 1234Test |
            | userIDstg   | stag5a14 |
            | passwordStg | 1234Test |
        And I click login
        And I click later in pop up biometric
        And I will see card account 'on process'
        When I click tab profile
        Then I will see my profile data is blank

    @C161255
    Scenario: Back to page profile from menu business profile
        Given I am a registered customer with following details:
            | userID      | autod015 |
            | password    | 1234Test |
            | userIDstg   | ruthfdcb |
            | passwordStg | 1234Test |
        And complete onboarding document safe and survey
        And I filling in form login with the following details:
            | userID      | autod015 |
            | password    | 1234Test |
            | userIDstg   | ruthfdcb |
            | passwordStg | 1234Test |
        And I click login
        And I click later in pop up biometric
        And I will see card account 'active'
        When I click tab profile
        And I click detail business profile
        And I will direct to page Business profile
        And I click back in header page
        Then I will direct to page Profile

    @C161256
    Scenario: Close bottomsheet password to unhide email and other data
        Given I am a registered customer with following details:
            | userID      | autofb2c |
            | password    | 1234Test |
            | userIDstg   | stagcfb7 |
            | passwordStg | 1234Test |
        And complete onboarding document safe and survey
        And I filling in form login with the following details:
            | userID      | autofb2c |
            | password    | 1234Test |
            | userIDstg   | stagcfb7 |
            | passwordStg | 1234Test |
        And I click login
        And I click later in pop up biometric
        And I will see card account 'active'
        When I click tab profile
        And I see my profile company data
        And I click unhide the information
        And I will see bottom sheet input password profile
        And I close bottom sheet input password profile
        Then I see my profile company data

    @C161257
    Scenario: Mask Password
        Given I am a registered customer with following details:
            | userID      | autofb2c |
            | password    | 1234Test |
            | userIDstg   | stagcfb7 |
            | passwordStg | 1234Test |
        And complete onboarding document safe and survey
        And I filling in form login with the following details:
            | userID      | autofb2c |
            | password    | 1234Test |
            | userIDstg   | stagcfb7 |
            | passwordStg | 1234Test |
        And I click login
        And I click later in pop up biometric
        And I will see card account 'active'
        When I click tab profile
        And I click unhide the information
        And I input my password
        And I don't want to see my password
        Then I will not see my password

    @C161258
    Scenario: Unmask Password
        Given I am a registered customer with following details:
            | userID      | autofb2c |
            | password    | 1234Test |
            | userIDstg   | stagcfb7 |
            | passwordStg | 1234Test |
        And complete onboarding document safe and survey
        And I filling in form login with the following details:
            | userID      | autofb2c |
            | password    | 1234Test |
            | userIDstg   | stagcfb7 |
            | passwordStg | 1234Test |
        And I click login
        And I click later in pop up biometric
        And I will see card account 'active'
        When I click tab profile
        And I click unhide the information
        And I input my password
        And I want to see my password
        Then I will see my password

    @C161259
    Scenario: Input password and then delete password
        Given I am a registered customer with following details:
            | userID      | autofb2c |
            | password    | 1234Test |
            | userIDstg   | stagcfb7 |
            | passwordStg | 1234Test |
        And complete onboarding document safe and survey
        And I filling in form login with the following details:
            | userID      | autofb2c |
            | password    | 1234Test |
            | userIDstg   | stagcfb7 |
            | passwordStg | 1234Test |
        And I click login
        And I click later in pop up biometric
        And I will see card account 'active'
        When I click tab profile
        And I click unhide the information
        And I input my password
        And I will see button to see my data is enabled
        And I clear my password
        Then I will see button to see my data is disabled

    @C161260
    Scenario: Input incorrect password once
        Given I am a registered customer with following details:
            | userID      | autofb2c |
            | password    | 1234Test |
            | userIDstg   | stagcfb7 |
            | passwordStg | 1234Test |
        And complete onboarding document safe and survey
        And never entered wrong password 
        And I filling in form login with the following details:
            | userID      | autofb2c |
            | password    | 1234Test |
            | userIDstg   | stagcfb7 |
            | passwordStg | 1234Test |
        And I click login
        And I click later in pop up biometric
        And I will see card account 'active'
        When I click tab profile
        And I click unhide the information
        And I input wrong password
        And I click to see my profile data
        Then I will see message error password incorrect

    @C161261
    Scenario: Input incorrect password twice
        Given I am a registered customer with following details:
            | userID      | autofb2c |
            | password    | 1234Test |
            | userIDstg   | stagcfb7 |
            | passwordStg | 1234Test |
        And complete onboarding document safe and survey
        And never entered wrong password 
        And I filling in form login with the following details:
            | userID      | autofb2c |
            | password    | 1234Test |
            | userIDstg   | stagcfb7 |
            | passwordStg | 1234Test |
        And I click login
        And I click later in pop up biometric
        And I will see card account 'active'
        When I click tab profile
        And I click unhide the information
        And I input wrong password
        And I click to see my profile data
        And I will see message error password incorrect
        And I clear my password
        And I input wrong password
        And I click to see my profile data
        Then I will see message error password incorrect

    @C161262
    Scenario: Input incorrect password three times
        Given I am a registered customer with following details:
            | userID      | autofb2c |
            | password    | 1234Test |
            | userIDstg   | stagcfb7 |
            | passwordStg | 1234Test |
        And complete onboarding document safe and survey
        And never entered wrong password 
        And I filling in form login with the following details:
            | userID      | autofb2c |
            | password    | 1234Test |
            | userIDstg   | stagcfb7 |
            | passwordStg | 1234Test |
        And I click login
        And I click later in pop up biometric
        And I will see card account 'active'
        When I click tab profile
        And I click unhide the information
        And I input wrong password
        And I click to see my profile data
        And I will see message error password incorrect
        And I clear my password
        And I input wrong password
        And I click to see my profile data
        And I will see message error password incorrect
        And I clear my password
        And I input wrong password
        And I click to see my profile data
        Then I will directing to page login 

    @C161263
    Scenario: Unhide information email, phonenumber and domicile address in account individual
        Given I am a registered customer with following details:
            | userID      | ruthc2d9 |
            | password    | 1234Test |
            | userIDstg   | stag302d |
            | passwordStg | 1234Test |
        And complete onboarding document safe and survey
        And I filling in form login with the following details:
            | userID      | ruthc2d9 |
            | password    | 1234Test |
            | userIDstg   | stag302d |
            | passwordStg | 1234Test |
        And I click login
        And I click later in pop up biometric
        And I will see card account 'active'
        When I click tab profile
        And I will see my profile individual data
        And I click unhide the information
        And I input my password
        And I click to see my profile data
        Then I will see email, phonenumber and domicile address is unmasked

    @C161264
    Scenario: Unhide information email, phonenumber and domicile address in account business
        Given I am a registered customer with following details:
            | userID      | deved6a1 |
            | password    | 1234Test |
            | userIDstg   | ruth2d88 |
            | passwordStg | 1234Test |
        And complete onboarding document safe and survey
        And I filling in form login with the following details:
            | userID      | deved6a1 |
            | password    | 1234Test |
            | userIDstg   | ruth2d88 |
            | passwordStg | 1234Test |
        And I click login
        And I click later in pop up biometric
        And I will see card account 'active'
        When I click tab profile
        And I see my profile company data
        And I click unhide the information
        And I input my password
        And I click to see my profile data
        Then I will see email, phonenumber and domicile address is unmasked

    @C161265
    Scenario: Unhide the information and then back to main dashboard
        Given I am a registered customer with following details:
            | userID      | autofb2c |
            | password    | 1234Test |
            | userIDstg   | stagcfb7 |
            | passwordStg | 1234Test |
        And complete onboarding document safe and survey
        And I filling in form login with the following details:
            | userID      | autofb2c |
            | password    | 1234Test |
            | userIDstg   | stagcfb7 |
            | passwordStg | 1234Test |
        And I click login
        And I click later in pop up biometric
        And I will see card account 'active'
        When I click tab profile
        And I see my profile company data
        And I click unhide the information
        And I input my password
        And I click to see my profile data
        And I will see email, phonenumber and domicile address is unmasked
        And I click tab Home
        And I will see card account 'active'
        And I click tab profile
        Then I will see email, phonenumber and domicile address is unmasked

    @C161266
    Scenario: Hide information email, phonenumber and domicile address in account individual
        Given I am a registered customer with following details:
            | userID      | ruthc2d9 |
            | password    | 1234Test |
            | userIDstg   | stag302d |
            | passwordStg | 1234Test |
        And complete onboarding document safe and survey
        And I filling in form login with the following details:
            | userID      | ruthc2d9 |
            | password    | 1234Test |
            | userIDstg   | stag302d |
            | passwordStg | 1234Test |
        And I click login
        And I click later in pop up biometric
        And I will see card account 'active'
        When I click tab profile
        And I will see my profile individual data
        And I click unhide the information
        And I input my password
        And I click to see my profile data
        And I will see email, phonenumber and domicile address is unmasked
        And I click hide the information
        Then I will see email, phonenumber and domicile address is masked

    @C161267
    Scenario: Hide information email, phonenumber and domicile address in account business
        Given I am a registered customer with following details:
            | userID      | autofb2c |
            | password    | 1234Test |
            | userIDstg   | stagcfb7 |
            | passwordStg | 1234Test |
        And complete onboarding document safe and survey
        And I filling in form login with the following details:
            | userID      | autofb2c |
            | password    | 1234Test |
            | userIDstg   | stagcfb7 |
            | passwordStg | 1234Test |
        And I click login
        And I click later in pop up biometric
        And I will see card account 'active'
        When I click tab profile
        And I see my profile company data
        And I click unhide the information
        And I input my password
        And I click to see my profile data
        And I will see email, phonenumber and domicile address is unmasked
        And I click hide the information
        Then I will see email, phonenumber and domicile address is masked

    @C161268
    Scenario: Hide the information and then back to main dashboard
        Given I am a registered customer with following details:
            | userID      | autofb2c |
            | password    | 1234Test |
            | userIDstg   | stagcfb7 |
            | passwordStg | 1234Test |
        And complete onboarding document safe and survey
        And I filling in form login with the following details:
            | userID      | autofb2c |
            | password    | 1234Test |
            | userIDstg   | stagcfb7 |
            | passwordStg | 1234Test |
        And I click login
        And I click later in pop up biometric
        And I will see card account 'active'
        When I click tab profile
        And I see my profile company data
        And I click unhide the information
        And I input my password
        And I click to see my profile data
        And I will see email, phonenumber and domicile address is unmasked
        And I click hide the information
        And I will see email, phonenumber and domicile address is masked
        And I click tab Home
        And I will see card account 'active'
        And I click tab profile
        Then I will see email, phonenumber and domicile address is masked