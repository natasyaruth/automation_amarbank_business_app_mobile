@document_management
Feature: Brankas - Document Management
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
        And never entered wrong password
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

    @C137185
    Scenario: Input wrong password twice
        Given I am a registered customer with following details:
            | userID      | autocaea |
            | password    | 1234Test |
            | userIDstg   | stag302d |
            | passwordStg | 1234Test |
        And complete onboarding document safe and survey
        And never entered wrong password
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

    @C137186
    Scenario: Input wrong password three times
        Given I am a registered customer with following details:
            | userID      | autocaea |
            | password    | 1234Test |
            | userIDstg   | stag302d |
            | passwordStg | 1234Test |
        And complete onboarding document safe and survey
        And never entered wrong password
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

    @C137187
    Scenario: Validate pop up activated biometric only appear once click use password
        Given I am a registered customer with following details:
            | userID      | autocaea |
            | password    | 1234Test |
            | userIDstg   | stag302d |
            | passwordStg | 1234Test |
        And complete onboarding document safe and survey
        And never entered wrong password
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
        And never entered wrong password
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
    Scenario: Verify content document brankas user individual active
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
        Then I will see button upload other document
        And I will see empty detail menu other document
        And I will not see menu document loan and giro

    @C131646
    Scenario: Verify content document brankas user individual active and has loan
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
        Then I will see button upload other document
        And I will see menu other document and loan
        And I will not see menu document giro

    @C131649
    Scenario: Verify content document brankas user PT Perusahaan active
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
        Then I will see menu document giro and other
        And I click document giro
        And I click document legality business
        And I will see document business for type company

    @C131653
    Scenario: Verify content document brankas user CV active
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
        When I click tab brankas
        And I click direct to input password document
        And I input password document
        And I click see my document
        And I will direct to page document brankas
        Then I will see menu document giro and other
        And I click document giro
        And I click document legality business
        And I will see document business for type company

    @C131656
    Scenario: Verify content document brankas user PT Perorangan active
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
        Then I will see menu document giro and other
        And I click document giro
        And I click document legality business
        And I will see document business for type individual company

    @C131659
    Scenario: Verify content document brankas user UD active
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
        Then I will see menu document giro and other
        And I click document giro
        And I click document legality business
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
        And I click option exit survey 'Proses akan dilanjutkan nanti'
        And I submit my exit survey
        And I will see card account 'on process'
        And notification red dot document safe is on
        When I click tab brankas
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
        And I click option exit survey 'Proses akan dilanjutkan nanti'
        And I submit my exit survey
        And I will see card account 'on process combine journey'
        And notification red dot document safe is on
        When I click tab brankas
        And I will see onboarding page document safe continue to loan process
        And I continue to process loan
        Then I see page 'Data Personal'

    @C157172
    Scenario: Open Tab Brankas for user initiator on verification
        Given I am a registered customer with following details:
            | userID      | auto0e1c |
            | password    | 1234Test |
            | userIDstg   | test0792 |
            | passwordStg | 1234Test |
        And still not complete onboarding document safe and survey
        And I filling in form login with the following details:
            | userID      | auto0e1c |
            | password    | 1234Test |
            | userIDstg   | test0792 |
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
            | userID      | rota3159 |
            | password    | 1234Test |
            | userIDstg   | stag98c5 |
            | passwordStg | 1234Test |
        And still not complete onboarding document safe and survey
        And I filling in form login with the following details:
            | userID      | rota3159 |
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
        Then I will see menu document giro and other

    @C157176
    Scenario: Open Tab Brankas for user invitee active
        Given I am a registered customer with following details:
            | userID      | mich875d |
            | password    | 1234Test |
            | userIDstg   | nata6bde |
            | passwordStg | 1234Test | 
        And still not complete onboarding document safe and survey
        And I filling in form login with the following details:
            | userID      | mich875d |
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
        Then I will see menu document giro and other

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
        Then I will see empty detail menu other document
        And I will not see menu document loan and giro

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
        And don't have any other document
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
        And I will see menu document giro and other
        And I will see button upload other document
        Then I will see empty detail menu other document

    @C157518
    Scenario: Close bottom sheet Add new file and new folder
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
        And I click button menu action brankas
        And I will see bottom sheet menu action brankas
        And I close bottom sheet upload
        Then I will direct to page document brankas

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
        And I click button menu action brankas
        And I will see bottom sheet menu action brankas
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
        And I click button menu action brankas
        And I will see bottom sheet menu action brankas
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
        And I click button menu action brankas
        And I will see bottom sheet menu action brankas
        And I upload other document with type 'png'
        And I will see other document has been uploaded
        And I click save document
        Then I will see snackbar success upload success
        And I will direct to page other document with document that has been uploaded is in there

    @C157524
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
        And I click button menu action brankas
        And I will see bottom sheet menu action brankas
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
        And I click button menu action brankas
        And I will see bottom sheet menu action brankas
        And I upload other document with type 'pdf'
        And I will see other document has been uploaded
        And I click save document
        And I will see snackbar success upload success
        And I will direct to page other document with document that has been uploaded is in there
        And I click button menu action brankas
        And I upload other document with type 'jpg'
        Then I will see other document has been uploaded
        And I click save document
        And I will see snackbar success upload success
        And I see list document is ordered alphabetical

    @C164031
    Scenario: Close bottom sheet add new folder other document
        Given I am a registered customer with following details:
            | userID      | deveceea |
            | password    | 1234Test |
            | userIDstg   | stag990b |
            | passwordStg | 1234Test |
        And complete onboarding document safe and survey
        And don't have any other document
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
        And I click button menu action brankas
        And I will see bottom sheet menu action brankas
        And I click create new folder
        And I will see bottom sheet new folder
        And I close bottom sheet upload
        Then I will direct to page document brankas

    @C164032
    Scenario: Add single new folder other document
        Given I am a registered customer with following details:
            | userID      | deveceea |
            | password    | 1234Test |
            | userIDstg   | stag990b |
            | passwordStg | 1234Test |
        And complete onboarding document safe and survey
        And don't have any other document
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
        And I click button menu action brankas
        And I will see bottom sheet menu action brankas
        And I click create new folder
        And I fill field new folder with 'Folder Penting dan Rahasia'
        And I save new folder
        Then I see snackbar success create new folder
        And I will direct to page document brankas with folder that has been created in section other document

    @C164033
    Scenario: Add more than one new folder other document
        Given I am a registered customer with following details:
            | userID      | deveceea |
            | password    | 1234Test |
            | userIDstg   | stag990b |
            | passwordStg | 1234Test |
        And complete onboarding document safe and survey
        And don't have any other document
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
        And I click button menu action brankas
        And I click create new folder
        And I fill field new folder with 'Folder Tidak Penting'
        And I save new folder
        And I see snackbar success create new folder
        And I click button menu action brankas
        And I click create new folder
        And I fill field new folder with 'Folder Penting dan Rahasia'
        And I save new folder
        And I see snackbar success create new folder
        And I see list folder is ordered alphabetical

    @C164034
    Scenario: Add new folder and file
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
        And I click button menu action brankas
        And I upload other document with type 'pdf'
        And I will see other document has been uploaded
        And I click save document
        And I will see snackbar success upload success
        And I will direct to page other document with document that has been uploaded is in there
        And I click button menu action brankas
        And I upload other document with type 'jpg'
        And I will see other document has been uploaded
        And I click save document
        And I will see snackbar success upload success
        And I click button menu action brankas
        And I click create new folder
        And I fill field new folder with 'Folder Penting'
        And I save new folder
        And I see snackbar success create new folder
        And I will direct to page document brankas with folder that has been created in section other document
        And I click button menu action brankas
        And I click create new folder
        And I fill field new folder with 'Folder Rahasia'
        And I save new folder
        And I see snackbar success create new folder
        Then I see list other document is ordering by folder and follow with file with alphabetical order

    @C164035
    Scenario: Let folder naming is blank
        Given I am a registered customer with following details:
            | userID      | deveceea |
            | password    | 1234Test |
            | userIDstg   | stag990b |
            | passwordStg | 1234Test |
        And complete onboarding document safe and survey
        And don't have any other document
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
        And I click button menu action brankas
        And I will see bottom sheet menu action brankas
        And I click create new folder
        And I click icon clear name
        Then I will see button create new folder is disabled

    @C164036
    Scenario: Clear naming folder and then fill again
        Given I am a registered customer with following details:
            | userID      | deveceea |
            | password    | 1234Test |
            | userIDstg   | stag990b |
            | passwordStg | 1234Test |
        And complete onboarding document safe and survey
        And don't have any other document
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
        And I click button menu action brankas
        And I will see bottom sheet menu action brankas
        And I click create new folder
        And I click icon clear name
        And I will see button create new folder is disabled
        And I fill field new folder with 'Folder Penting dan Rahasia'
        Then I will see button create new folder is enabled

    @C164037
    Scenario: Clear naming folder using keyboard
        Given I am a registered customer with following details:
            | userID      | deveceea |
            | password    | 1234Test |
            | userIDstg   | stag990b |
            | passwordStg | 1234Test |
        And complete onboarding document safe and survey
        And don't have any other document
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
        And I click button menu action brankas
        And I will see bottom sheet menu action brankas
        And I click create new folder
        And I clear new folder name using keyboard
        Then I will see button create new folder is disabled

    @C164038
    Scenario: Fill folder name using special char
        Given I am a registered customer with following details:
            | userID      | deveceea |
            | password    | 1234Test |
            | userIDstg   | stag990b |
            | passwordStg | 1234Test |
        And complete onboarding document safe and survey
        And don't have any other document
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
        And I click button menu action brankas
        And I will see bottom sheet menu action brankas
        And I click create new folder
        And I fill field new folder with 'Folder Penting & R4has!@.,'
        And I save new folder
        And I see snackbar success create new folder
        Then I will direct to page document brankas with folder that has been created in section other document

    @C164039
    Scenario: Fill folder name using alphanumeric
        Given I am a registered customer with following details:
            | userID      | deveceea |
            | password    | 1234Test |
            | userIDstg   | stag990b |
            | passwordStg | 1234Test |
        And complete onboarding document safe and survey
        And don't have any other document
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
        And I click button menu action brankas
        And I will see bottom sheet menu action brankas
        And I click create new folder
        And I fill field new folder with 'Folder Penting 1'
        And I save new folder
        And I see snackbar success create new folder
        Then I will direct to page document brankas with folder that has been created in section other document

    @C164040
    Scenario: Fill folder name with length char more than 100 char
        Given I am a registered customer with following details:
            | userID      | deveceea |
            | password    | 1234Test |
            | userIDstg   | stag990b |
            | passwordStg | 1234Test |
        And complete onboarding document safe and survey
        And don't have any other document
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
        And I click button menu action brankas
        And I will see bottom sheet menu action brankas
        And I click create new folder
        And I fill field new folder with char more than 100 character
        Then I see field new folder is filled with only 100 character, the rest is auto trimmed
        And I will see button create new folder is enabled
        And I save new folder
        And I see snackbar success create new folder
        And I will direct to page document brankas with folder that has been created in section other document

    @C164041
    Scenario: Fill folder name with length char less than 2 char
        Given I am a registered customer with following details:
            | userID      | deveceea |
            | password    | 1234Test |
            | userIDstg   | stag990b |
            | passwordStg | 1234Test |
        And complete onboarding document safe and survey
        And don't have any other document
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
        And I click button menu action brankas
        And I will see bottom sheet menu action brankas
        And I click create new folder
        And I fill field new folder with 'A'
        And I save new folder
        And I see snackbar success create new folder
        Then I will direct to page document brankas with folder that has been created in section other document 

    @C164042
    Scenario: Create new folder when the previous folder was not renamed
        Given I am a registered customer with following details:
            | userID      | deveceea |
            | password    | 1234Test |
            | userIDstg   | stag990b |
            | passwordStg | 1234Test |
        And complete onboarding document safe and survey
        And don't have any other document
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
        And I click button menu action brankas
        And I click create new folder
        And I save new folder
        And I see snackbar success create new folder
        And I will direct to page document brankas with new folder using name Folder Baru
        And I click button menu action brankas
        And I will see bottom sheet menu action brankas
        And I click create new folder
        Then I will see field new folder is filled with Folder Baru 1

    @C164043
    Scenario: Create another folder with name same as before
        Given I am a registered customer with following details:
            | userID      | deveceea |
            | password    | 1234Test |
            | userIDstg   | stag990b |
            | passwordStg | 1234Test |
        And complete onboarding document safe and survey
        And don't have any other document
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
        And I click button menu action brankas
        And I click create new folder
        And I fill field new folder with 'A'
        And I save new folder
        And I see snackbar success create new folder
        And I will direct to page document brankas with folder that has been created in section other document
        And I click button menu action brankas
        And I click create new folder
        And I fill new folder name same as before
        And I save new folder
        Then I see message error folder name is exist
        And I will see button create new folder is enabled

    @C164044
    Scenario: Close bottom sheet edit folder
        Given I am a registered customer with following details:
            | userID      | deveceea |
            | password    | 1234Test |
            | userIDstg   | stag990b |
            | passwordStg | 1234Test |
        And complete onboarding document safe and survey
        And don't have any other document
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
        And I click button menu action brankas
        And I will see bottom sheet menu action brankas
        And I click create new folder
        And I fill field new folder with 'Folder Penting'
        And I save new folder
        And I see snackbar success create new folder
        And I click icon three dot folder
        And I will see bottom sheet detail info folder
        And I click edit folder name
        And I will see bottom sheet change folder name
        And I close bottom sheet upload
        Then I will direct to page document brankas with folder that has been created in section other document

    @C164045
    Scenario: Edit naming folder
        Given I am a registered customer with following details:
            | userID      | deveceea |
            | password    | 1234Test |
            | userIDstg   | stag990b |
            | passwordStg | 1234Test |
        And complete onboarding document safe and survey
        And don't have any other document
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
        And I click button menu action brankas
        And I will see bottom sheet menu action brankas
        And I click create new folder
        And I fill field new folder with 'Folder Penting'
        And I save new folder
        And I see snackbar success create new folder
        And I click icon three dot folder
        And I click edit folder name
        And I will see bottom sheet change folder name
        And I edit folder name with 'Folder Tidak Penting'
        And I click change name
        Then I will see snackbar success change folder name
        And I will direct to page document brankas with folder name has been change

    @C164065
    Scenario: Edit naming folder from menu detail in title 
        Given I am a registered customer with following details:
            | userID      | deveceea |
            | password    | 1234Test |
            | userIDstg   | stag990b |
            | passwordStg | 1234Test |
        And complete onboarding document safe and survey
        And don't have any other document
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
        And I click button menu action brankas
        And I will see bottom sheet menu action brankas
        And I click create new folder
        And I fill field new folder with 'Folder Penting'
        And I save new folder
        And I see snackbar success create new folder
        And I open other folder
        And I will see empty detail menu other document
        And I click icon three dot folder detail
        And I click edit folder name
        And I will see bottom sheet change folder name
        And I edit folder name with 'Folder Tidak Penting'
        And I click change name
        Then I will see snackbar success change folder name
        And I will see title folder name is change
        And I will see empty detail menu other document

    @C164046
    Scenario: Edit naming folder using special char
        Given I am a registered customer with following details:
            | userID      | deveceea |
            | password    | 1234Test |
            | userIDstg   | stag990b |
            | passwordStg | 1234Test |
        And complete onboarding document safe and survey
        And don't have any other document
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
        And I click button menu action brankas
        And I click create new folder
        And I fill field new folder with 'Folder Penting'
        And I save new folder
        And I see snackbar success create new folder
        And I click icon three dot folder
        And I click edit folder name
        And I edit folder name with 'Folder T!d@k.,&'
        And I click change name
        Then I will see snackbar success change folder name
        And I will direct to page document brankas with folder name has been change

    @C164047
    Scenario: Edit naming folder using alpha numeric
        Given I am a registered customer with following details:
            | userID      | deveceea |
            | password    | 1234Test |
            | userIDstg   | stag990b |
            | passwordStg | 1234Test |
        And complete onboarding document safe and survey
        And don't have any other document
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
        And I click button menu action brankas
        And I click create new folder
        And I fill field new folder with 'Folder Penting'
        And I save new folder
        And I see snackbar success create new folder
        And I click icon three dot folder
        And I click edit folder name
        And I edit folder name with 'Folder 1234'
        And I click change name
        Then I will see snackbar success change folder name
        And I will direct to page document brankas with folder name has been change

    @C164048
    Scenario: Edit folder name with length char more than 100 char
        Given I am a registered customer with following details:
            | userID      | deveceea |
            | password    | 1234Test |
            | userIDstg   | stag990b |
            | passwordStg | 1234Test |
        And complete onboarding document safe and survey
        And don't have any other document
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
        And I click button menu action brankas
        And I click create new folder
        And I fill field new folder with 'Folder Penting'
        And I save new folder
        And I see snackbar success create new folder
        And I click icon three dot folder
        And I click edit folder name
        And I change folder name with char more than 100 character
        Then I see update folder name is filled with only 100 character, the rest is auto trimmed
        And I see button change name is enabled
        And I click change name
        Then I will see snackbar success change folder name
        And I will direct to page document brankas with folder name has been change

    @C164049
    Scenario: Edit folder name with length char less than 2 char
        Given I am a registered customer with following details:
            | userID      | deveceea |
            | password    | 1234Test |
            | userIDstg   | stag990b |
            | passwordStg | 1234Test |
        And complete onboarding document safe and survey
        And don't have any other document
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
        And I click button menu action brankas
        And I click create new folder
        And I fill field new folder with 'Folder Penting'
        And I save new folder
        And I see snackbar success create new folder
        And I click icon three dot folder
        And I click edit folder name
        And I edit folder name with 'A'
        And I click change name
        Then I will see snackbar success change folder name
        And I will direct to page document brankas with folder name has been change

    @C164050
    Scenario: Let folder naming is blank when editing
        Given I am a registered customer with following details:
            | userID      | deveceea |
            | password    | 1234Test |
            | userIDstg   | stag990b |
            | passwordStg | 1234Test |
        And complete onboarding document safe and survey
        And don't have any other document
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
        And I click button menu action brankas
        And I click create new folder
        And I fill field new folder with 'Folder Penting'
        And I save new folder
        And I see snackbar success create new folder
        And I click icon three dot folder
        And I click edit folder name
        And I click icon clear name
        Then I see button change name is disabled 

    @C164051
    Scenario: Clear naming folder using keyboard when editing
        Given I am a registered customer with following details:
            | userID      | deveceea |
            | password    | 1234Test |
            | userIDstg   | stag990b |
            | passwordStg | 1234Test |
        And complete onboarding document safe and survey
        And don't have any other document
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
        And I click button menu action brankas
        And I click create new folder
        And I fill field new folder with 'Folder Penting'
        And I save new folder
        And I see snackbar success create new folder
        And I click icon three dot folder
        And I click edit folder name
        And I clear change folder name using keyboard
        Then I see button change name is disabled

    @C164052
    Scenario: Edit naming folder same with existing folder
        Given I am a registered customer with following details:
            | userID      | deveceea |
            | password    | 1234Test |
            | userIDstg   | stag990b |
            | passwordStg | 1234Test |
        And complete onboarding document safe and survey
        And don't have any other document
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
        And I click button menu action brankas
        And I click create new folder
        And I fill field new folder with 'Folder Penting'
        And I save new folder
        And I see snackbar success create new folder
        And I click button menu action brankas
        And I click create new folder
        And I save new folder
        And I see snackbar success create new folder
        And I click icon three dot folder
        And I click edit folder name
        And I edit folder name same with other folder
        And I click change name
        Then I will see snackbar success change folder name
        And I will see both folder with same name in root other document

    @C164053
    Scenario: Edit naming file
        Given I am a registered customer with following details:
            | userID      | deveceea |
            | password    | 1234Test |
            | userIDstg   | stag990b |
            | passwordStg | 1234Test |
        And complete onboarding document safe and survey
        And don't have any other document
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
        And I click button menu action brankas
        And I upload other document with type 'jpg'
        And I will see other document has been uploaded
        And I click save document
        And I will see snackbar success upload success
        And I click icon three dot file
        And I will see bottom sheet detail info file
        And I click edit file name
        And I will see bottom sheet change file name
        And I edit file name with 'Dokumen Penting Banget'
        And I click change name
        Then I will see snackbar success change file name
        And I will direct to page document brankas with file name has been change

    @C164054
    Scenario: Edit naming file contain with extension file
        Given I am a registered customer with following details:
            | userID      | deveceea |
            | password    | 1234Test |
            | userIDstg   | stag990b |
            | passwordStg | 1234Test |
        And complete onboarding document safe and survey
        And don't have any other document
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
        And I click button menu action brankas
        And I upload other document with type 'jpg'
        And I will see other document has been uploaded
        And I click save document
        And I will see snackbar success upload success
        And I click icon three dot file
        And I click edit file name
        And I edit file name contain with extension file
        And I click change name
        Then I will see snackbar success change file name
        And I will direct to page document brankas with file name has been change 

    @C164055
    Scenario: Edit naming file using special char
        Given I am a registered customer with following details:
            | userID      | deveceea |
            | password    | 1234Test |
            | userIDstg   | stag990b |
            | passwordStg | 1234Test |
        And complete onboarding document safe and survey
        And don't have any other document
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
        And I click button menu action brankas
        And I upload other document with type 'jpg'
        And I will see other document has been uploaded
        And I click save document
        And I will see snackbar success upload success
        And I click icon three dot file
        And I click edit file name
        And I edit file name with 'Dokumen !@#$%.,'
        And I click change name
        Then I will see snackbar success change file name
        And I will direct to page document brankas with file name has been change

    @C164056
    Scenario: Edit naming file using alpha numeric
        Given I am a registered customer with following details:
            | userID      | deveceea |
            | password    | 1234Test |
            | userIDstg   | stag990b |
            | passwordStg | 1234Test |
        And complete onboarding document safe and survey
        And don't have any other document
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
        And I click button menu action brankas
        And I upload other document with type 'jpg'
        And I will see other document has been uploaded
        And I click save document
        And I will see snackbar success upload success
        And I click icon three dot file
        And I click edit file name
        And I edit file name with 'Dokumen 1'
        And I click change name
        Then I will see snackbar success change file name
        And I will direct to page document brankas with file name has been change

    @C164057
    Scenario: Edit file name with length char more than 100 char
        Given I am a registered customer with following details:
            | userID      | deveceea |
            | password    | 1234Test |
            | userIDstg   | stag990b |
            | passwordStg | 1234Test |
        And complete onboarding document safe and survey
        And don't have any other document
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
        And I click button menu action brankas
        And I upload other document with type 'jpg'
        And I will see other document has been uploaded
        And I click save document
        And I will see snackbar success upload success
        And I click icon three dot file
        And I click edit file name
        And I update file name with char more than 100 character
        Then I see field file name is filled with only 100 character, the rest is auto trimmed
        And I see button change name is enabled
        And I click change name
        Then I will see snackbar success change file name
        And I will direct to page document brankas with file name has been change

    @C164058
    Scenario: Edit file name with length char less than 2 char
        Given I am a registered customer with following details:
            | userID      | deveceea |
            | password    | 1234Test |
            | userIDstg   | stag990b |
            | passwordStg | 1234Test |
        And complete onboarding document safe and survey
        And don't have any other document
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
        And I click button menu action brankas
        And I upload other document with type 'jpg'
        And I will see other document has been uploaded
        And I click save document
        And I will see snackbar success upload success
        And I click icon three dot file
        And I click edit file name
        And I edit file name with 'A'
        And I click change name
        Then I will see snackbar success change file name
        And I will direct to page document brankas with file name has been change

    @C164059
    Scenario: Edit naming file same with other file
        Given I am a registered customer with following details:
            | userID      | deveceea |
            | password    | 1234Test |
            | userIDstg   | stag990b |
            | passwordStg | 1234Test |
        And complete onboarding document safe and survey
        And don't have any other document
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
        And I click button menu action brankas
        And I upload other document with type 'pdf'
        And I will see other document has been uploaded
        And I click save document
        And I will see snackbar success upload success
        And I click button menu action brankas
        And I upload other document with type 'jpg'
        And I will see other document has been uploaded
        And I click save document
        And I will see snackbar success upload success
        And I click icon three dot file
        And I click edit file name
        And I edit file name same with file name as before
        And I click change name
        Then I will see snackbar success change file name
        And I will see both files with same filename in root other document

    @C164060
    Scenario: Let file naming is blank when editing
        Given I am a registered customer with following details:
            | userID      | deveceea |
            | password    | 1234Test |
            | userIDstg   | stag990b |
            | passwordStg | 1234Test |
        And complete onboarding document safe and survey
        And don't have any other document
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
        And I click button menu action brankas
        And I upload other document with type 'jpg'
        And I will see other document has been uploaded
        And I click save document
        And I will see snackbar success upload success
        And I click icon three dot file
        And I click edit file name
        And I click icon clear name
        Then I see button change name is disabled

    @C164061
    Scenario: Clear naming file using keyboard when editing
        Given I am a registered customer with following details:
            | userID      | deveceea |
            | password    | 1234Test |
            | userIDstg   | stag990b |
            | passwordStg | 1234Test |
        And complete onboarding document safe and survey
        And don't have any other document
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
        And I click button menu action brankas
        And I upload other document with type 'jpg'
        And I will see other document has been uploaded
        And I click save document
        And I will see snackbar success upload success
        And I click icon three dot file
        And I click edit file name
        And I clear change file name using keyboard
        Then I see button change name is disabled

    @C164062
    Scenario: Add new folder with more than one branches
        Given I am a registered customer with following details:
            | userID      | deveceea |
            | password    | 1234Test |
            | userIDstg   | stag990b |
            | passwordStg | 1234Test |
        And complete onboarding document safe and survey
        And don't have any other document
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
        And I click button menu action brankas
        And I click create new folder
        And I fill field new folder with 'Folder Penting dan Rahasia'
        And I save new folder
        And I see snackbar success create new folder
        And I will direct to page document brankas with folder that has been created in section other document
        And I open other folder
        And I will see folder contents still empty
        And I click button menu action brankas
        And I click create new folder
        And I fill field new folder with 'Folder Penting dan Rahasia 2'
        And I save new folder
        And I see snackbar success create new folder
        And I see the new folder is created
        And I open detail other folder
        And I will see folder contents still empty
        And I click button menu action brankas
        And I click create new folder
        And I fill field new folder with 'Folder Penting dan Rahasia 3'
        And I save new folder
        And I see snackbar success create new folder
        And I see the new folder is created
        And I open detail other folder
        And I will see folder contents still empty
        And I click button menu action brankas
        And I click create new folder
        And I fill field new folder with 'Folder Penting dan Rahasia 4'
        And I save new folder
        And I see snackbar success create new folder
        And I see the new folder is created
        And I open detail other folder
        And I will see folder contents still empty
        And I click button menu action brankas
        And I click create new folder
        And I fill field new folder with 'Folder Penting dan Rahasia 5'
        And I save new folder
        And I see snackbar success create new folder
        Then I see the new folder is created

    @C164063
    Scenario: Add new file in folder branches
        Given I am a registered customer with following details:
            | userID      | deveceea |
            | password    | 1234Test |
            | userIDstg   | stag990b |
            | passwordStg | 1234Test |
        And complete onboarding document safe and survey
        And don't have any other document
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
        And I click button menu action brankas
        And I click create new folder
        And I fill field new folder with 'Bisnis MSME'
        And I save new folder
        And I see snackbar success create new folder
        And I will direct to page document brankas with folder that has been created in section other document
        And I open other folder
        And I click button menu action brankas
        And I upload other document with type 'jpg'
        And I will see other document has been uploaded
        And I click save document
        Then I will see snackbar success upload success
        And I see the new file is created
      
    @C164064
    Scenario: Edit file in folder branches
        Given I am a registered customer with following details:
            | userID      | deveceea |
            | password    | 1234Test |
            | userIDstg   | stag990b |
            | passwordStg | 1234Test |
        And complete onboarding document safe and survey
        And don't have any other document
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
        And I click button menu action brankas
        And I click create new folder
        And I fill field new folder with 'Perusahaan Aku'
        And I save new folder
        And I see snackbar success create new folder
        And I will direct to page document brankas with folder that has been created in section other document
        And I open other folder
        And I will see folder contents still empty
        And I click button menu action brankas
        And I upload other document with type 'jpg'
        And I will see other document has been uploaded
        And I click save document
        And I will see snackbar success upload success
        And I see the new file is created
        And I click icon three dot file
        And I click edit file name
        And I will see bottom sheet change file name
        And I edit file name with 'Dokumen Aku'
        And I click change name
        Then I will see snackbar success change file name
        And I will see file name has been change

    @C167409
    Scenario: Edit naming folder in detail folder
        Given I am a registered customer with following details:
            | userID      | deveceea |
            | password    | 1234Test |
            | userIDstg   | stag990b |
            | passwordStg | 1234Test |
        And complete onboarding document safe and survey
        And don't have any other document
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
        And I click button menu action brankas
        And I click create new folder
        And I fill field new folder with 'Harus dijaga'
        And I save new folder
        And I see snackbar success create new folder
        And I will direct to page document brankas with folder that has been created in section other document
        And I open other folder
        And I will see folder contents still empty
        And I click button menu action brankas
        And I click create new folder
        And I fill field new folder with 'Folder Penting dan Rahasia 2'
        And I save new folder
        And I see snackbar success create new folder
        And I see the new folder is created
        And I click icon three dot folder
        And I click edit folder name
        And I will see bottom sheet change folder name
        And I edit folder name with 'Folder Tidak Penting sih'
        And I click change name
        Then I will see snackbar success change folder name
        And I will see folder name has been change

    @C165174
    Scenario: Cancel Delete Folder
        Given I am a registered customer with following details:
            | userID      | deveceea |
            | password    | 1234Test |
            | userIDstg   | stag990b |
            | passwordStg | 1234Test |
        And complete onboarding document safe and survey
        And don't have any other document
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
        And I click button menu action brankas
        And I click create new folder
        And I fill field new folder with 'Folder Penting dan Rahasia'
        And I save new folder
        And I see snackbar success create new folder
        And I will direct to page document brankas with folder that has been created in section other document
        And I click icon three dot folder
        And I click delete folder
        And I will see pop up confirm delete folder
        And I cancel delete folder
        Then I will direct to page document brankas
        
    @C165175
    Scenario: Cancel Delete File
        Given I am a registered customer with following details:
            | userID      | deveceea |
            | password    | 1234Test |
            | userIDstg   | stag990b |
            | passwordStg | 1234Test |
        And complete onboarding document safe and survey
        And don't have any other document
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
        And I click button menu action brankas
        And I upload other document with type 'jpg'
        And I will see other document has been uploaded
        And I click save document
        And I will see snackbar success upload success
        And I click icon three dot file
        And I click delete file
        And I will see pop up confirm delete file
        And I cancel delete file
        Then I will direct to page document brankas

    @C167410
    Scenario: Delete single folder
        Given I am a registered customer with following details:
            | userID      | deveceea |
            | password    | 1234Test |
            | userIDstg   | stag990b |
            | passwordStg | 1234Test |
        And complete onboarding document safe and survey
        And don't have any other document
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
        And I click button menu action brankas
        And I click create new folder
        And I fill field new folder with 'Folder Penting dan Rahasia'
        And I save new folder
        And I see snackbar success create new folder
        And I will direct to page document brankas with folder that has been created in section other document
        And I click icon three dot folder
        And I click delete folder
        And I will see pop up confirm delete folder
        And I confirm delete folder
        Then I will see snackbar folder deleted successfully
        And I will not see the deleted folder

    @C165176
    Scenario: Delete folder from menu detail in title
        Given I am a registered customer with following details:
            | userID      | deveceea |
            | password    | 1234Test |
            | userIDstg   | stag990b |
            | passwordStg | 1234Test |
        And complete onboarding document safe and survey
        And don't have any other document
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
        And I click button menu action brankas
        And I click create new folder
        And I fill field new folder with 'Folder Penting dan Rahasia'
        And I save new folder
        And I see snackbar success create new folder
        And I will direct to page document brankas with folder that has been created in section other document
        And I open other folder
        And I will see empty detail menu other document
        And I click icon three dot folder detail
        And I click delete folder
        And I will see pop up confirm delete folder
        And I confirm delete folder
        Then I will see snackbar folder deleted successfully
        And I will direct to page document brankas
        And I will see menu document giro and other
        And I will not see the deleted folder
        And I will see empty detail menu other document

    @C165177
    Scenario: Delete more than one folders
         Given I am a registered customer with following details:
            | userID      | deveceea |
            | password    | 1234Test |
            | userIDstg   | stag990b |
            | passwordStg | 1234Test |
        And complete onboarding document safe and survey
        And don't have any other document
        And I have more than one other folders
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
        And I click icon three dot folder
        And I click delete folder
        And I confirm delete folder
        And I will see snackbar folder deleted successfully
        And I click icon three dot folder
        And I click delete folder
        And I confirm delete folder
        Then I will see snackbar folder deleted successfully
        And I will see empty detail menu other document

    @C165178
    Scenario: Delete folder within folder
        Given I am a registered customer with following details:
            | userID      | deveceea |
            | password    | 1234Test |
            | userIDstg   | stag990b |
            | passwordStg | 1234Test |
        And complete onboarding document safe and survey
        And don't have any other document
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
        And I click button menu action brankas
        And I click create new folder
        And I fill field new folder with 'Segera Dihapus'
        And I save new folder
        And I see snackbar success create new folder
        And I open other folder
        And I will see folder contents still empty
        And I click button menu action brankas
        And I click create new folder
        And I fill field new folder with 'Segera Dihapus 2'
        And I save new folder
        And I see snackbar success create new folder
        And I click icon three dot folder
        And I click delete folder
        And I confirm delete folder
        Then I will see snackbar folder deleted successfully
        And I will not see the deleted folder
        And I will see empty detail menu other document

    @C165179
    Scenario: Delete single file
        Given I am a registered customer with following details:
            | userID      | deveceea |
            | password    | 1234Test |
            | userIDstg   | stag990b |
            | passwordStg | 1234Test |
        And complete onboarding document safe and survey
        And don't have any other document
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
        And I click button menu action brankas
        And I upload other document with type 'jpg'
        And I will see other document has been uploaded
        And I click save document
        And I will see snackbar success upload success
        And I click icon three dot file
        And I click delete file
        And I will see pop up confirm delete file
        And I confirm delete file
        Then I will see snackbar file deleted successfully
        And I will not see the deleted file

    @C165180
    Scenario: Delete more than one files
        Given I am a registered customer with following details:
            | userID      | deveceea |
            | password    | 1234Test |
            | userIDstg   | stag990b |
            | passwordStg | 1234Test |
        And complete onboarding document safe and survey
        And don't have any other document
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
        And I click button menu action brankas
        And I upload other document with type 'jpg'
        And I will see other document has been uploaded
        And I click save document
        And I will see snackbar success upload success
        And I click button menu action brankas
        And I upload other document with type 'png'
        And I will see other document has been uploaded
        And I click save document
        And I will see snackbar success upload success
        And I click icon three dot file
        And I click delete file
        And I confirm delete file
        And I will see snackbar file deleted successfully
        And I click icon three dot file
        And I click delete file
        And I confirm delete file
        Then I will see snackbar file deleted successfully
        And I will see empty detail menu other document

    @C165181
    Scenario: Delete file within folder
        Given I am a registered customer with following details:
            | userID      | deveceea |
            | password    | 1234Test |
            | userIDstg   | stag990b |
            | passwordStg | 1234Test |
        And complete onboarding document safe and survey
        And don't have any other document
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
        And I click button menu action brankas
        And I click create new folder
        And I fill field new folder with 'Rahasia Negara'
        And I save new folder
        And I see snackbar success create new folder
        And I open other folder
        And I will see folder contents still empty
        And I click button menu action brankas
        And I upload other document with type 'jpg'
        And I will see other document has been uploaded
        And I click save document
        And I will see snackbar success upload success
        And I click icon three dot file
        And I click delete file
        And I will see pop up confirm delete file
        And I confirm delete file
        Then I will see snackbar file deleted successfully
        And I will not see the deleted file
        And I will see empty detail menu other document