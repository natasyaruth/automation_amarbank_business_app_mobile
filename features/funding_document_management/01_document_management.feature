@document_management
Feature: Document Management
    As a customer
    I want to view business document that I previously uploaded

    @C137178
    Scenario: Close pop up inactive biometric
        Given I am a registered customer with following details:
            | userID      | autocaea |
            | password    | 1234Test |
            | userIDstg   | stag302d |
            | passwordStg | 1234Test |
        And complete onboarding document safe and survey
        And I filling in form login with the following details:
            | userID      | autocaea |
            | password    | 1234Test |
            | userIDstg   | stag302d |
            | passwordStg | 1234Test |
        And I click login
        And I click later in pop up biometric
        And I will see card account 'active'
        When I click tab brankas
        And I will see pop up biometric is inactive
        And I close activated my biometric via document
        Then I will see card account 'active'

    @C137179
    Scenario: Click button activated biometric
        Given I am a registered customer with following details:
            | userID      | autocaea |
            | password    | 1234Test |
            | userIDstg   | stag302d |
            | passwordStg | 1234Test |
        And complete onboarding document safe and survey
        And I filling in form login with the following details:
            | userID      | autocaea |
            | password    | 1234Test |
            | userIDstg   | stag302d |
            | passwordStg | 1234Test |
        And I click login
        And I click later in pop up biometric
        And I will see card account 'active'
        When I click tab brankas
        And I will see pop up biometric is inactive
        And I click activated my biometric via document
        Then I will direct to Tab Other
        And I will see toogle biometric is off

    @C137180
    Scenario: Input password then delete
        Given I am a registered customer with following details:
            | userID      | autocaea |
            | password    | 1234Test |
            | userIDstg   | stag302d |
            | passwordStg | 1234Test |
        And complete onboarding document safe and survey
        And I filling in form login with the following details:
            | userID      | autocaea |
            | password    | 1234Test |
            | userIDstg   | stag302d |
            | passwordStg | 1234Test |
        And I click login
        And I click later in pop up biometric
        And I will see card account 'active'
        When I click tab brankas
        And I will see pop up biometric is inactive
        And I click direct to input password document
        And I will see bottom sheet input password document
        And I input password document
        And I will see button see document is enabled
        And I clear my password
        Then I will see button see document is disabled    

    @C137181
    Scenario: Mask Password
        Given I am a registered customer with following details:
            | userID      | autocaea |
            | password    | 1234Test |
            | userIDstg   | stag302d |
            | passwordStg | 1234Test |
        And complete onboarding document safe and survey
        And I filling in form login with the following details:
            | userID      | autocaea |
            | password    | 1234Test |
            | userIDstg   | stag302d |
            | passwordStg | 1234Test |
        And I click login
        And I click later in pop up biometric
        And I will see card account 'active'
        When I click tab brankas
        And I will see pop up biometric is inactive
        And I click direct to input password document
        And I will see bottom sheet input password document
        And I input password document
        And I unmask my password document
        And I will see my password
        And I mask my password document
        Then I will not see my password

    @C137182
    Scenario: Unmask Password
        Given I am a registered customer with following details:
            | userID      | autocaea |
            | password    | 1234Test |
            | userIDstg   | stag302d |
            | passwordStg | 1234Test |
        And complete onboarding document safe and survey
        And I filling in form login with the following details:
            | userID      | autocaea |
            | password    | 1234Test |
            | userIDstg   | stag302d |
            | passwordStg | 1234Test |
        And I click login
        And I click later in pop up biometric
        And I will see card account 'active'
        When I click tab brankas
        And I will see pop up biometric is inactive
        And I click direct to input password document
        And I will see bottom sheet input password document
        And I input password document
        And I unmask my password document
        And I will see my password

    @C137183
    Scenario: Close bottom sheet password
        Given I am a registered customer with following details:
            | userID      | autocaea |
            | password    | 1234Test |
            | userIDstg   | stag302d |
            | passwordStg | 1234Test |
        And complete onboarding document safe and survey
        And I filling in form login with the following details:
            | userID      | autocaea |
            | password    | 1234Test |
            | userIDstg   | stag302d |
            | passwordStg | 1234Test |
        And I click login
        And I click later in pop up biometric
        And I will see card account 'active'
        When I click tab brankas
        And I will see pop up biometric is inactive
        And I click direct to input password document
        And I will see bottom sheet input password document
        And I close bottom sheet password
        Then I will see card account 'active'

    @C137184
    Scenario: Input wrong password once
        Given I am a registered customer with following details:
            | userID      | autocaea |
            | password    | 1234Test |
            | userIDstg   | stag302d |
            | passwordStg | 1234Test |
        And complete onboarding document safe and survey
        And I filling in form login with the following details:
            | userID      | autocaea |
            | password    | 1234Test |
            | userIDstg   | stag302d |
            | passwordStg | 1234Test |
        And I click login
        And I click later in pop up biometric
        And I will see card account 'active'
        When I click tab brankas
        And I will see pop up biometric is inactive
        And I click direct to input password document
        And I will see bottom sheet input password document
        And I input wrong password document
        And I click see my document
        Then I will see message error password incorrect
        And I reset attempt failed password

    @C137185
    Scenario: Input wrong password twice
        Given I am a registered customer with following details:
            | userID      | autocaea |
            | password    | 1234Test |
            | userIDstg   | stag302d |
            | passwordStg | 1234Test |
        And complete onboarding document safe and survey
        And I filling in form login with the following details:
            | userID      | autocaea |
            | password    | 1234Test |
            | userIDstg   | stag302d |
            | passwordStg | 1234Test |
        And I click login
        And I click later in pop up biometric
        And I will see card account 'active'
        When I click tab brankas
        And I will see pop up biometric is inactive
        And I click direct to input password document
        And I will see bottom sheet input password document
        And I input wrong password document
        And I click see my document
        And I will see message error password incorrect
        And I clear my password
        And I input wrong password document
        And I click see my document
        Then I will see message error password incorrect
        And I reset attempt failed password

    @C137186
    Scenario: Input wrong password three times
        Given I am a registered customer with following details:
            | userID      | autocaea |
            | password    | 1234Test |
            | userIDstg   | stag302d |
            | passwordStg | 1234Test |
        And complete onboarding document safe and survey
        And I filling in form login with the following details:
            | userID      | autocaea |
            | password    | 1234Test |
            | userIDstg   | stag302d |
            | passwordStg | 1234Test |
        And I click login
        And I click later in pop up biometric
        And I will see card account 'active'
        When I click tab brankas
        And I will see pop up biometric is inactive
        And I click direct to input password document
        And I will see bottom sheet input password document
        And I input wrong password document
        And I click see my document
        And I will see message error password incorrect
        And I clear my password
        And I input wrong password document
        And I click see my document
        And I will see message error password incorrect
        And I clear my password
        And I input wrong password document
        And I click see my document
        Then I will directing to page login
        And I reset attempt failed password

    @C137187
    Scenario: Validate pop up activated biometric only appear once click use password
        Given I am a registered customer with following details:
            | userID      | autocaea |
            | password    | 1234Test |
            | userIDstg   | stag302d |
            | passwordStg | 1234Test |
        And complete onboarding document safe and survey
        And I filling in form login with the following details:
            | userID      | autocaea |
            | password    | 1234Test |
            | userIDstg   | stag302d |
            | passwordStg | 1234Test |
        And I click login
        And I click later in pop up biometric
        And I will see card account 'active'
        When I click tab brankas
        And I will see pop up biometric is inactive
        And I click direct to input password document
        And I will see bottom sheet input password document
        And I close bottom sheet password
        And I will see card account 'active'
        And I choose other
        And I click logout
        And complete onboarding document safe and survey
        And I filling in form login with the following details:
            | userID      | autocaea |
            | password    | 1234Test |
            | userIDstg   | stag302d |
            | passwordStg | 1234Test |
        And I click login
        And I will see card account 'active'
        And I click tab brankas
        Then I will see bottom sheet input password document

    @C137188
    Scenario: Validate pop up activated biometric only appear once click activated biometric
        Given I am a registered customer with following details:
            | userID      | autocaea |
            | password    | 1234Test |
            | userIDstg   | stag302d |
            | passwordStg | 1234Test |
        And complete onboarding document safe and survey
        And I filling in form login with the following details:
            | userID      | autocaea |
            | password    | 1234Test |
            | userIDstg   | stag302d |
            | passwordStg | 1234Test |
        And I click login
        And I click later in pop up biometric
        And I will see card account 'active'
        When I click tab brankas
        And I will see pop up biometric is inactive
        And I click activated my biometric via document
        And I will direct to Tab Other
        And I click logout
        And complete onboarding document safe and survey
        And I filling in form login with the following details:
            | userID      | autocaea |
            | password    | 1234Test |
            | userIDstg   | stag302d |
            | passwordStg | 1234Test |
        And I click login
        And I will see card account 'active'
        And I click tab brankas
        Then I will see bottom sheet input password document    

    @C131645
    Scenario: Verify tab profile user individual active
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
        And I click tab profile
        And I will see my profile individual data
        When I click tab brankas
        And I click direct to input password document
        And I input password document
        And I click see my document
        Then I will see menu other document
        And I will not see menu document loan and giro

    @C131646
    Scenario: Verify tab profile user individual active and has loan
        Given I am a registered customer with following details:
            | userID      | niza2098 |
            | password    | Test1234 |
            | userIDstg   | stag11b6 |
            | passwordStg | 1234Test |
        And complete onboarding document safe and survey
        And I filling in form login with the following details:
            | userID      | niza2098 |
            | password    | Test1234 |
            | userIDstg   | stag11b6 |
            | passwordStg | 1234Test |
        And I click login
        And I click later in pop up biometric
        And I will see card account 'active'
        And I click tab profile
        And I will see my profile individual data
        When I click tab brankas
        And I click direct to input password document
        And I input password document
        And I click see my document
        Then I will see menu other document and loan
        And I will not see menu document giro

    @C131649
    Scenario: Verify tab profile user PT Perusahaan active
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
        When I click tab brankas
        And I click direct to input password document
        And I input password document
        And I click see my document
        And I will direct to page document brankas
        Then I will see menu document giro, loan and other
        And I click document giro
        And I will see document business for type company

    @C131653
    Scenario: Verify tab profile user CV active
        Given I am a registered customer with following details:
            | userID      | autoeb6a |
            | password    | 1234Test |
            | userIDstg   | ruth1600 |
            | passwordStg | 1234Test |
        And complete onboarding document safe and survey
        And I filling in form login with the following details:
            | userID      | autoeb6a |
            | password    | 1234Test |
            | userIDstg   | ruth1600 |
            | passwordStg | 1234Test |
        And I click login
        And I click later in pop up biometric
        And I will see card account 'active'
        When I click tab brankas
        And I click direct to input password document
        And I input password document
        And I click see my document
        And I will direct to page document brankas
        Then I will see menu document giro, loan and other
        And I click document giro
        And I will see document business for type company

    @C131656
    Scenario: Verify tab profile user PT Perorangan active
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
        When I click tab brankas
        And I click direct to input password document
        And I input password document
        And I click see my document
        And I will direct to page document brankas
        Then I will see menu document giro, loan and other
        And I click document giro
        And I will see document business for type individual company

    @C131659
    Scenario: Verify tab profile user UD active
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
        When I click tab brankas
        And I click direct to input password document
        And I input password document
        And I click see my document
        And I will direct to page document brankas
        Then I will see menu document giro, loan and other
        And I click document giro
        And I will see document business for type individual company

    @C157169
    Scenario: Open Tab Brankas for user initiator recently from registration 1
        Given I am a registered customer with following details:
            | userID      | deveb76d |
            | password    | 1234Test |
            | userIDstg   | stag7f83 |
            | passwordStg | 1234Test |
        And still not complete onboarding document safe and survey
        And I filling in form login with the following details:
            | userID      | deveb76d |
            | password    | 1234Test |
            | userIDstg   | stag7f83 |
            | passwordStg | 1234Test |
        And I click login
        And I click later
        And I click later in pop up biometric
        And I will see card account 'account opening'
        And notification red dot document safe is on
        And I click tab brankas
        And I will see onboarding page document safe continue to choose product
        And I click button choose product
        Then I will directing to Hook 1 Onboarding Account Opening

    @C157170
    Scenario: Open Tab Brankas for user initiator in process giro account opening
        Given I am a registered customer with following details:
            | userID      | deved388 |
            | password    | 1234Test |
            | userIDstg   | stag3f63 |
            | passwordStg | 1234Test |
        And still not complete onboarding document safe and survey
        And I filling in form login with the following details:
            | userID      | deved388 |
            | password    | 1234Test |
            | userIDstg   | stag3f63 |
            | passwordStg | 1234Test |
        And I click login
        And I click later in pop up biometric
        And I will see card account 'on process'
        And notification red dot document safe is on
        And I continue to complete my data
        And I see page 'Data Personal'
        And I click close in header page
        And I will see pop up confirm close page process account opening
        And I cancel process account opening
        And I will see card account 'on process'
        And notification red dot document safe is on
        And I click tab brankas
        And I will see onboarding page document safe continue to account opening process
        And I continue to process account opening
        Then I see page 'Data Personal'

    @C157171
    Scenario: Open Tab Brankas for user initiator in process combine journey
        Given I am a registered customer with following details:
            | userID      | deveb182 |
            | password    | 1234Test |
            | userIDstg   | stagcf3f |
            | passwordStg | 1234Test |
        And still not complete onboarding document safe and survey
        And I filling in form login with the following details:
            | userID      | deveb182 |
            | password    | 1234Test |
            | userIDstg   | stagcf3f |
            | passwordStg | 1234Test |
        And I click login
        And I click later in pop up biometric
        And I will see card account 'on process combine journey'
        And I continue to complete my data
        And I see page 'Data Personal'
        And I click close in header page
        And I will see pop up confirm close page process account opening
        And I cancel process account opening
        And I will see card account 'on process combine journey'
        And notification red dot document safe is on
        And I click tab brankas
        And I will see onboarding page document safe continue to loan process
        And I continue to process loan
        Then I see page 'Data Personal'

    @C157172
    Scenario: Open Tab Brankas for user initiator on verification
        Given I am a registered customer with following details:
            | userID      | auto0e1c |
            | password    | 1234Test |
            | userIDstg   | ruth7cb8 |
            | passwordStg | 1234Test |
        And still not complete onboarding document safe and survey
        And I filling in form login with the following details:
            | userID      | auto0e1c |
            | password    | 1234Test |
            | userIDstg   | ruth7cb8 |
            | passwordStg | 1234Test |
        And I click login
        And I click later in pop up biometric
        And I will see card account 'on verification'
        And notification red dot document safe is on
        And I click tab brankas
        Then I will see onboarding page document safe continue to account opening process
        And I continue to process account opening
        And I will direct to page detail progress account opening

    @C157173
    Scenario: Open Tab Brankas for user individual on verification
        Given I am a registered customer with following details:
            | userID      | deveaead |
            | password    | 1234Test |
            | userIDstg   | stagb081 |
            | passwordStg | 1234Test |
        And still not complete onboarding document safe and survey
        And I filling in form login with the following details:
            | userID      | deveaead |
            | password    | 1234Test |
            | userIDstg   | stagb081 |
            | passwordStg | 1234Test |
        And I click login
        And I click later in pop up biometric
        And I will see card account 'on verification'
        And notification red dot document safe is on
        And I click tab brankas
        Then I will see onboarding page document safe data still need verification

    @C157174
    Scenario: Open Tab Brankas for user invitee on verification
        Given I am a registered customer with following details:
            | userID      | rudi71d5 |
            | password    | 1234Test |
            | userIDstg   | rudie4f1 |
            | passwordStg | 1234Test | 
        And still not complete onboarding document safe and survey
        And I filling in form login with the following details:
            | userID      | rudi71d5 |
            | password    | 1234Test |
            | userIDstg   | rudie4f1 |
            | passwordStg | 1234Test | 
        And I click login
        And I click later in pop up biometric
        And I will see card account 'on verification'
        And notification red dot document safe is on
        And I click tab brankas
        Then I will see onboarding page document safe data still need verification

    @C157175
    Scenario: Open Tab Brankas for user initiator active
        Given I am a registered customer with following details:
            | userID      | mike2cf3 |
            | password    | 1234Test |
            | userIDstg   | stag98c5 |
            | passwordStg | 1234Test |
        And still not complete onboarding document safe and survey
        And I filling in form login with the following details:
            | userID      | mike2cf3 |
            | password    | 1234Test |
            | userIDstg   | stag98c5 |
            | passwordStg | 1234Test |
        And I click login
        And I click later in pop up biometric
        And I will see card account 'active'
        And notification red dot document safe is on
        And I click tab brankas
        And I will see onboarding page to complete document safe
        And I click use document safe
        And I will see pop up biometric is inactive
        And I click direct to input password document
        And I will see bottom sheet input password document
        And I input password document
        And I click see my document
        Then I will see menu document giro, loan and other

    @C157176
    Scenario: Open Tab Brankas for user invitee active
        Given I am a registered customer with following details:
            | userID      | nataf76e |
            | password    | 1234Test |
            | userIDstg   | nata6bde |
            | passwordStg | 1234Test | 
        And still not complete onboarding document safe and survey
        And I filling in form login with the following details:
            | userID      | nataf76e |
            | password    | 1234Test |
            | userIDstg   | nata6bde |
            | passwordStg | 1234Test | 
        And I click login
        And I click later in pop up biometric
        And I will see card account 'active'
        And notification red dot document safe is on
        And I click tab brankas
        And I will see onboarding page to complete document safe
        And I click use document safe
        And I click direct to input password document
        And I input password document
        And I click see my document
        Then I will see menu document giro, loan and other

    @C157177
    Scenario: Open Tab Brankas for user individual active
        Given I am a registered customer with following details:
            | userID      | autocaea |
            | password    | 1234Test |
            | userIDstg   | stag302d |
            | passwordStg | 1234Test |
        And still not complete onboarding document safe and survey
        And I filling in form login with the following details:
            | userID      | autocaea |
            | password    | 1234Test |
            | userIDstg   | stag302d |
            | passwordStg | 1234Test |
        And I click login
        And I click later in pop up biometric
        And I will see card account 'active'
        And notification red dot document safe is on
        And I click tab brankas
        And I will see onboarding page to complete document safe
        And I click use document safe
        And I click direct to input password document
        And I input password document
        And I click see my document
        Then I will see menu other document
        And I will direct to page document brankas

    @C157178
    Scenario: Open Tab Brankas for user combine journey active
        Given I am a registered customer with following details:
            | userID      | niza2098 |
            | password    | Test1234 |
            | userIDstg   | stag11b6 |
            | passwordStg | 1234Test |
        And still not complete onboarding document safe and survey
        And I filling in form login with the following details:
            | userID      | niza2098 |
            | password    | Test1234 |
            | userIDstg   | stag11b6 |
            | passwordStg | 1234Test |
        And I click login
        And I click later in pop up biometric
        And I will see card account 'active'
        And notification red dot document safe is on
        And I click tab brankas
        And I will see onboarding page to complete document safe
        And I click use document safe
        And I click direct to input password document
        And I input password document
        And I click see my document
        Then I will see menu other document and loan
        And I will not see menu document giro

    @C157517
    Scenario: Validate menu other document is empty
        Given I am a registered customer with following details:
            | userID      | deveceea |
            | password    | 1234Test |
            | userIDstg   | staga8a9 |
            | passwordStg | 1234Test |
        And complete onboarding document safe and survey
        And I filling in form login with the following details:
            | userID      | deveceea |
            | password    | 1234Test |
            | userIDstg   | staga8a9 |
            | passwordStg | 1234Test |
        And I click login
        And I click later in pop up biometric
        And I will see card account 'active'
        When I click tab brankas
        And I click direct to input password document
        And I input password document
        And I click see my document
        And I will see menu document giro, loan and other
        And I will see button upload other document
        And I click menu other document
        Then I will see empty detail menu other document

    @C157518 @FunctTestFundingSprint4
    Scenario: Cancel upload other document
        Given I am a registered customer with following details:
            | userID      | deveceea |
            | password    | 1234Test |
            | userIDstg   | stag990b |
            | passwordStg | 1234Test |
        And complete onboarding document safe and survey
        And I filling in form login with the following details:
            | userID      | deveceea |
            | password    | 1234Test |
            | userIDstg   | stag990b |
            | passwordStg | 1234Test |
        And I click login
        And I click later in pop up biometric
        And I will see card account 'active'
        When I click tab brankas
        And I click direct to input password document
        And I input password document
        And I click see my document
        And I click button upload other document
        And I will see bottom sheet upload other document
        And I close bottom sheet upload
        And I will see pop up confirm cancel upload other document
        And I click confirm cancel upload other document
        Then I will see menu document giro, loan and other
        And I will see button upload other document

    @C157519
    Scenario: Back to menu brankas document from detail other document
        Given I am a registered customer with following details:
            | userID      | deveceea |
            | password    | 1234Test |
            | userIDstg   | stag990b |
            | passwordStg | 1234Test |
        And complete onboarding document safe and survey
        And I filling in form login with the following details:
            | userID      | deveceea |
            | password    | 1234Test |
            | userIDstg   | stag990b |
            | passwordStg | 1234Test |
        And I click login
        And I click later in pop up biometric
        And I will see card account 'active'
        When I click tab brankas
        And I click direct to input password document
        And I input password document
        And I click see my document
        And I will see menu document giro, loan and other
        And I will see button upload other document
        And I click menu other document
        And I will see empty detail menu other document
        And I back to page document business
        Then I will see menu document giro, loan and other
        And I will see button upload other document

    @C157520
    Scenario: Back again to upload other document
        Given I am a registered customer with following details:
            | userID      | deveceea |
            | password    | 1234Test |
            | userIDstg   | stag990b |
            | passwordStg | 1234Test |
        And complete onboarding document safe and survey
        And I filling in form login with the following details:
            | userID      | deveceea |
            | password    | 1234Test |
            | userIDstg   | stag990b |
            | passwordStg | 1234Test |
        And I click login
        And I click later in pop up biometric
        And I will see card account 'active'
        When I click tab brankas
        And I click direct to input password document
        And I input password document
        And I click see my document
        And I click button upload other document
        And I will see bottom sheet upload other document
        And I close bottom sheet upload
        And I will see pop up confirm cancel upload other document
        And I click back to upload other document
        Then I will see bottom sheet upload other document

    @C157521
    Scenario: Upload other document with type JPG
        Given I am a registered customer with following details:
            | userID      | devef721 |
            | password    | 1234Test |
            | userIDstg   | staga8a9 |
            | passwordStg | 1234Test |
        And complete onboarding document safe and survey
        And don't have any other document
        And I filling in form login with the following details:
            | userID      | devef721 |
            | password    | 1234Test |
            | userIDstg   | staga8a9 |
            | passwordStg | 1234Test |
        And I click login
        And I click later in pop up biometric
        And I will see card account 'active'
        When I click tab brankas
        And I click direct to input password document
        And I input password document
        And I click see my document
        And I click button upload other document
        And I will see bottom sheet upload other document
        And I upload other document with type 'jpg'
        And I will see other document has been uploaded
        And I click save document
        Then I will see snackbar success upload success
        And I will direct to page other document with document that has been uploaded is in there

    @C157522
    Scenario: Upload other document with type JPEG
        Given I am a registered customer with following details:
            | userID      | devef721 |
            | password    | 1234Test |
            | userIDstg   | staga8a9 |
            | passwordStg | 1234Test |
        And complete onboarding document safe and survey
        And don't have any other document
        And I filling in form login with the following details:
            | userID      | devef721 |
            | password    | 1234Test |
            | userIDstg   | staga8a9 |
            | passwordStg | 1234Test |
        And I click login
        And I click later in pop up biometric
        And I will see card account 'active'
        When I click tab brankas
        And I click direct to input password document
        And I input password document
        And I click see my document
        And I click button upload other document
        And I will see bottom sheet upload other document
        And I upload other document with type 'jpeg'
        And I will see other document has been uploaded
        And I click save document
        Then I will see snackbar success upload success
        And I will direct to page other document with document that has been uploaded is in there

    @C157523
    Scenario: Upload other document with type PNG
        Given I am a registered customer with following details:
            | userID      | devef721 |
            | password    | 1234Test |
            | userIDstg   | staga8a9 |
            | passwordStg | 1234Test |
        And complete onboarding document safe and survey
        And don't have any other document
        And I filling in form login with the following details:
            | userID      | devef721 |
            | password    | 1234Test |
            | userIDstg   | staga8a9 |
            | passwordStg | 1234Test |
        And I click login
        And I click later in pop up biometric
        And I will see card account 'active'
        When I click tab brankas
        And I click direct to input password document
        And I input password document
        And I click see my document
        And I click button upload other document
        And I will see bottom sheet upload other document
        And I upload other document with type 'png'
        And I will see other document has been uploaded
        And I click save document
        Then I will see snackbar success upload success
        And I will direct to page other document with document that has been uploaded is in there

    @C157524 @FunctTestFundingSprint4
    Scenario: Upload other document with type PDF
        Given I am a registered customer with following details:
            | userID      | devef721 |
            | password    | 1234Test |
            | userIDstg   | staga8a9 |
            | passwordStg | 1234Test |
        And complete onboarding document safe and survey
        And don't have any other document
        And I filling in form login with the following details:
            | userID      | devef721 |
            | password    | 1234Test |
            | userIDstg   | staga8a9 |
            | passwordStg | 1234Test |
        And I click login
        And I click later in pop up biometric
        And I will see card account 'active'
        When I click tab brankas
        And I click direct to input password document
        And I input password document
        And I click see my document
        And I click button upload other document
        And I will see bottom sheet upload other document
        And I upload other document with type 'pdf'
        And I will see other document has been uploaded
        And I click save document
        Then I will see snackbar success upload success
        And I will direct to page other document with document that has been uploaded is in there

    @C157525
    Scenario: Cancel delete other document in section upload
        Given I am a registered customer with following details:
            | userID      | devef721 |
            | password    | 1234Test |
            | userIDstg   | staga8a9 |
            | passwordStg | 1234Test |
        And complete onboarding document safe and survey
        And don't have any other document
        And I filling in form login with the following details:
            | userID      | devef721 |
            | password    | 1234Test |
            | userIDstg   | staga8a9 |
            | passwordStg | 1234Test |
        And I click login
        And I click later in pop up biometric
        And I will see card account 'active'
        When I click tab brankas
        And I click direct to input password document
        And I input password document
        And I click see my document
        And I click button upload other document
        And I will see bottom sheet upload other document
        And I upload other document with type 'pdf'
        And I will see other document has been uploaded
        And I click delete other document in section upload
        And I will see pop up delete other document
        And I cancel delete other document
        Then I will see other document has been uploaded

    @C157526 @FunctTestFundingSprint4
    Scenario: Delete other document in section upload
        Given I am a registered customer with following details:
            | userID      | devef721 |
            | password    | 1234Test |
            | userIDstg   | staga8a9 |
            | passwordStg | 1234Test |
        And complete onboarding document safe and survey
        And don't have any other document
        And I filling in form login with the following details:
            | userID      | devef721 |
            | password    | 1234Test |
            | userIDstg   | staga8a9 |
            | passwordStg | 1234Test |
        And I click login
        And I click later in pop up biometric
        And I will see card account 'active'
        When I click tab brankas
        And I click direct to input password document
        And I input password document
        And I click see my document
        And I click button upload other document
        And I will see bottom sheet upload other document
        And I upload other document with type 'pdf'
        And I will see other document has been uploaded
        And I click delete other document in section upload
        And I will see pop up delete other document
        And I confirm delete other document
        Then I will see other document is deleted
        And I close bottom sheet upload
        And I click confirm cancel upload other document
        And I click menu other document
        And I will see empty detail menu other document

    @C157527
    Scenario: Cancel delete other document in section detail menu Other Document
        Given I am a registered customer with following details:
            | userID      | devef721 |
            | password    | 1234Test |
            | userIDstg   | staga8a9 |
            | passwordStg | 1234Test |
        And complete onboarding document safe and survey
        And don't have any other document
        And I filling in form login with the following details:
            | userID      | devef721 |
            | password    | 1234Test |
            | userIDstg   | staga8a9 |
            | passwordStg | 1234Test |
        And I click login
        And I click later in pop up biometric
        And I will see card account 'active'
        When I click tab brankas
        And I click direct to input password document
        And I input password document
        And I click see my document
        And I click menu other document
        And I will see empty detail menu other document
        And I click button upload other document
        And I will see bottom sheet upload other document
        And I upload other document with type 'pdf'
        And I will see other document has been uploaded
        And I click save document
        And I will direct to page other document with document that has been uploaded is in there
        And I delete other document number '1'
        And I will see pop up delete other document
        And I cancel delete other document
        Then I will direct to page other document with document that has been uploaded is in there

    @C157528 @FunctTestFundingSprint4
    Scenario: Delete other document in section detail menu Other Document
        Given I am a registered customer with following details:
            | userID      | devef721 |
            | password    | 1234Test |
            | userIDstg   | staga8a9 |
            | passwordStg | 1234Test |
        And complete onboarding document safe and survey
        And don't have any other document
        And I filling in form login with the following details:
            | userID      | devef721 |
            | password    | 1234Test |
            | userIDstg   | staga8a9 |
            | passwordStg | 1234Test |
        And I click login
        And I click later in pop up biometric
        And I will see card account 'active'
        When I click tab brankas
        And I click direct to input password document
        And I input password document
        And I click see my document
        And I click menu other document
        And I will see empty detail menu other document
        And I click button upload other document
        And I will see bottom sheet upload other document
        And I upload other document with type 'pdf'
        And I will see other document has been uploaded
        And I click save document
        And I will direct to page other document with document that has been uploaded is in there
        And I delete other document number '1'
        And I will see pop up delete other document
        And I confirm delete other document
        Then I will see empty detail menu other document

    @C157529 @FunctTestFundingSprint4
    Scenario: Upload other document entry point detail menu Other Document
        Given I am a registered customer with following details:
            | userID      | devef721 |
            | password    | 1234Test |
            | userIDstg   | staga8a9 |
            | passwordStg | 1234Test |
        And complete onboarding document safe and survey
        And don't have any other document
        And I filling in form login with the following details:
            | userID      | devef721 |
            | password    | 1234Test |
            | userIDstg   | staga8a9 |
            | passwordStg | 1234Test |
        And I click login
        And I click later in pop up biometric
        And I will see card account 'active'
        When I click tab brankas
        And I click direct to input password document
        And I input password document
        And I click see my document
        And I click menu other document
        And I will see empty detail menu other document
        And I click button upload other document
        And I will see bottom sheet upload other document
        And I upload other document with type 'pdf'
        And I will see other document has been uploaded
        And I click save document
        Then I will see snackbar success upload success
        And I will direct to page other document with document that has been uploaded is in there

    @C157530
    Scenario: Upload more than one other document entry point page document brankas
        Given I am a registered customer with following details:
            | userID      | devef721 |
            | password    | 1234Test |
            | userIDstg   | staga8a9 |
            | passwordStg | 1234Test |
        And complete onboarding document safe and survey
        And don't have any other document
        And I filling in form login with the following details:
            | userID      | devef721 |
            | password    | 1234Test |
            | userIDstg   | staga8a9 |
            | passwordStg | 1234Test |
        And I click login
        And I click later in pop up biometric
        And I will see card account 'active'
        When I click tab brankas
        And I click direct to input password document
        And I input password document
        And I click see my document
        And I click button upload other document
        And I will see bottom sheet upload other document
        And I upload other document with type 'pdf'
        And I will see other document has been uploaded
        And I click save document
        And I will see snackbar success upload success
        And I will direct to page other document with document that has been uploaded is in there
        And I back to page document business
        And I click button upload other document
        And I upload other document with type 'jpg'
        Then I will see other document has been uploaded
        And I click save document
        And I will see snackbar success upload success
        And I see list document is ordering by the latest to oldest

    @C157531
    Scenario: Upload more than one other document entry point detail menu Other Document
        Given I am a registered customer with following details:
            | userID      | devef721 |
            | password    | 1234Test |
            | userIDstg   | staga8a9 |
            | passwordStg | 1234Test |
        And complete onboarding document safe and survey
        And don't have any other document
        And I filling in form login with the following details:
            | userID      | devef721 |
            | password    | 1234Test |
            | userIDstg   | staga8a9 |
            | passwordStg | 1234Test |
        And I click login
        And I click later in pop up biometric
        And I will see card account 'active'
        When I click tab brankas
        And I click direct to input password document
        And I input password document
        And I click see my document
        And I click menu other document
        And I will see empty detail menu other document
        And I click button upload other document
        And I will see bottom sheet upload other document
        And I upload other document with type 'pdf'
        And I will see other document has been uploaded
        And I click save document
        And I will see snackbar success upload success
        And I will direct to page other document with document that has been uploaded is in there
        And I click button upload other document
        And I will see bottom sheet upload other document
        And I upload other document with type 'png'
        And I will see other document has been uploaded
        And I click save document
        Then I will see snackbar success upload success
        And I see list document is ordering by the latest to oldest

    @C157532
    Scenario: Delete all other document
        Given I am a registered customer with following details:
            | userID      | deveb931 |
            | password    | 1234Test |
            | userIDstg   | staga8a9 |
            | passwordStg | 1234Test |
        And complete onboarding document safe and survey
        And has more than one other document
        And I filling in form login with the following details:
            | userID      | deveb931 |
            | password    | 1234Test |
            | userIDstg   | staga8a9 |
            | passwordStg | 1234Test |
        And I click login
        And I click later in pop up biometric
        And I will see card account 'active'
        When I click tab brankas
        And I click direct to input password document
        And I input password document
        And I click see my document
        And I click menu other document
        And I will see other document more than one
        And I delete all other document
        Then I will see empty detail menu other document