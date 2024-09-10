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
        And I click tab profile
        And I will see my profile individual data
        When I click tab brankas
        And I click direct to input password document
        And I input password document
        And I click see my document
        Then I will see button document loan
        And I will not see button document giro
        And I click button document loan
        And I will see document loan is empty

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
        Then I will direct to page document business
        And I will not see button document giro
        And I will see button document loan
        And I click button document loan
        And I will see list of my loan
        And I click top list of my loan
        And I will see list of document loan

    @C131647
    Scenario: Verify tab profile user individual on verification
        Given I am a registered customer with following details:
            | userID      | indibec3 |
            | password    | 1234Test |
            | userIDstg   | stagb081 |
            | passwordStg | 1234Test |
        And complete onboarding document safe and survey
        And I filling in form login with the following details:
            | userID      | indibec3 |
            | password    | 1234Test |
            | userIDstg   | stagb081 |
            | passwordStg | 1234Test |
        And I click login
        And I click later in pop up biometric
        And I will see card account 'on verification'
        When I click tab brankas
        And I click direct to input password document
        And I input password document
        And I click see my document
        Then I will see document page is empty

    @C131648
    Scenario: Verify tab profile user individual on process KYC
        Given I am a registered customer with following details:
            | userID      | deved6a1 |
            | password    | 1234Test |
            | userIDstg   | stag8fac |
            | passwordStg | 1234Test |
        And complete onboarding document safe and survey
        And I filling in form login with the following details:
            | userID      | deved6a1 |
            | password    | 1234Test |
            | userIDstg   | stag8fac |
            | passwordStg | 1234Test |
        And I click login
        And I click later in pop up biometric
        And I will see card account 'on process'
        When I click tab brankas
        And I click direct to input password document
        And I input password document
        And I click see my document
        And I will see document page is empty

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
        And I will direct to page document business
        Then I will see button document giro and document loan
        And I click document giro
        And I will see document business for type company

    @C131650
    Scenario: Verify tab profile user PT Perusahaan on verification
        Given I am a registered customer with following details:
            | userID      | ptpe7f28 |
            | password    | 1234Test |
            | userIDstg   | stag9a38 |
            | passwordStg | 1234Test |
        And complete onboarding document safe and survey
        And I filling in form login with the following details:
            | userID      | ptpe7f28 |
            | password    | 1234Test |
            | userIDstg   | stag9a38 |
            | passwordStg | 1234Test |
        And I click login
        And I click later in pop up biometric
        And I will see card account 'on verification'
        When I click tab brankas
        And I click direct to input password document
        And I input password document
        And I click see my document
        Then I will direct to page document business
        And I will see button document giro and document loan
        And I click document giro
        And I will see document business for type company

    @C131651
    Scenario: Verify tab profile user PT Perusahaan complete document
        Given I am a registered customer with following details:
            | userID      | ptpe1d52 |
            | password    | 1234Test |
            | userIDstg   | stag528f |
            | passwordStg | 1234Test |
        And complete onboarding document safe and survey
        And I filling in form login with the following details:
            | userID      | ptpe1d52 |
            | password    | 1234Test |
            | userIDstg   | stag528f |
            | passwordStg | 1234Test |
        And I click login
        And I click later in pop up biometric
        And I will see card account 'complete document'
        When I click tab brankas
        And I click direct to input password document
        And I input password document
        And I click see my document
        Then I will direct to page document business
        And I will see button document giro and document loan
        And I click document giro
        And I will see document business for type company

    @C131652
    Scenario: Verify tab profile user PT Perusahaan on process KYB
        Given I am a registered customer with following details:
            | userID      | deve82e5 |
            | password    | 1234Test |
            | userIDstg   | stag48e9 |
            | passwordStg | 1234Test |
        And complete onboarding document safe and survey
        And I filling in form login with the following details:
            | userID      | deve82e5 |
            | password    | 1234Test |
            | userIDstg   | stag48e9 |
            | passwordStg | 1234Test |
        And I click login
        And I click later in pop up biometric
        And I will see card account 'on process'
        When I click tab brankas
        And I click direct to input password document
        And I input password document
        And I click see my document
        Then I will direct to page document business
        And I will see document page is empty

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
        And I will direct to page document business
        Then I will see button document giro and document loan
        And I click document giro
        And I will see document business for type company

    @C131654
    Scenario: Verify tab profile user CV on verification
        Given I am a registered customer with following details:
            | userID      | auto0e1c |
            | password    | 1234Test |
            | userIDstg   | ruth7cb8 |
            | passwordStg | 1234Test |
        And complete onboarding document safe and survey
        And I filling in form login with the following details:
            | userID      | auto0e1c |
            | password    | 1234Test |
            | userIDstg   | ruth7cb8 |
            | passwordStg | 1234Test |
        And I click login
        And I click later in pop up biometric
        And I will see card account 'on verification'
        When I click tab brankas
        And I click direct to input password document
        And I input password document
        And I click see my document
        Then I will direct to page document business
        And I will see button document giro and document loan
        And I click document giro
        And I will see document business for type company

    @C131655
    Scenario: Verify tab profile user CV complete document
        Given I am a registered customer with following details:
            | userID      | autoc10a |
            | password    | 1234Test |
            | userIDstg   | mich4d05 |
            | passwordStg | 1234Test |
        And complete onboarding document safe and survey
        And I filling in form login with the following details:
            | userID      | autoc10a |
            | password    | 1234Test |
            | userIDstg   | mich4d05 |
            | passwordStg | 1234Test |
        And I click login
        And I click later in pop up biometric
        And I will see card account 'complete document'
        When I click tab brankas
        And I click direct to input password document
        And I input password document
        And I click see my document
        Then I will direct to page document business
        And I will see button document giro and document loan
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
        And I will direct to page document business
        Then I will see button document giro and document loan
        And I click document giro
        And I will see document business for type individual company

    @C131657
    Scenario: Verify tab profile user PT Perorangan on verification
        Given I am a registered customer with following details:
            | userID      | auto94a2 |
            | password    | 1234Test |
            | userIDstg   | stagdfb7 |
            | passwordStg | 1234Test |
        And complete onboarding document safe and survey
        And I filling in form login with the following details:
            | userID      | auto94a2 |
            | password    | 1234Test |
            | userIDstg   | stagdfb7 |
            | passwordStg | 1234Test |
        And I click login
        And I click later in pop up biometric
        And I will see card account 'on verification'
        When I click tab brankas
        And I click direct to input password document
        And I input password document
        And I click see my document
        Then I will direct to page document business
        And I will see button document giro and document loan
        And I click document giro
        And I will see document business for type individual company

    @C131658
    Scenario: Verify tab profile user PT Perorangan complete document
        Given I am a registered customer with following details:
            | userID      | auto7d0b |
            | password    | 1234Test |
            | userIDstg   | stagc6ce |
            | passwordStg | 1234Test |
        And complete onboarding document safe and survey
        And I filling in form login with the following details:
            | userID      | auto7d0b |
            | password    | 1234Test |
            | userIDstg   | stagc6ce |
            | passwordStg | 1234Test |
        And I click login
        And I click later in pop up biometric
        And I will see card account 'complete document'
        When I click tab brankas
        And I click direct to input password document
        And I input password document
        And I click see my document
        Then I will direct to page document business
        And I will see button document giro and document loan
        And I click document giro
        And I will see document business for type individual company

    @C131659
    Scenario: Verify tab profile user UD active
        Given I am a registered customer with following details:
            | userID      | autod015 |
            | password    | 1234Test |
            | userIDstg   | stag4cce |
            | passwordStg | 1234Test |
        And complete onboarding document safe and survey
        And I filling in form login with the following details:
            | userID      | autod015 |
            | password    | 1234Test |
            | userIDstg   | stag4cce |
            | passwordStg | 1234Test |
        And I click login
        And I click later in pop up biometric
        And I will see card account 'active'
        When I click tab brankas
        And I click direct to input password document
        And I input password document
        And I click see my document
        And I will direct to page document business
        Then I will see button document giro and document loan
        And I click document giro
        And I will see document business for type individual company

    @C131660
    Scenario: Verify tab profile user UD on verification
        Given I am a registered customer with following details:
            | userID      | auto590e |
            | password    | 1234Test |
            | userIDstg   | stag4c45 |
            | passwordStg | 1234Test |
        And complete onboarding document safe and survey
        And I filling in form login with the following details:
            | userID      | auto590e |
            | password    | 1234Test |
            | userIDstg   | stag4c45 |
            | passwordStg | 1234Test |
        And I click login
        And I click later in pop up biometric
        And I will see card account 'on verification'
        When I click tab brankas
        And I click direct to input password document
        And I input password document
        And I click see my document
        Then I will direct to page document business
        And I will see button document giro and document loan
        And I click document giro
        And I will see document business for type individual company

    @C131661
    Scenario: Verify tab profile user UD complete document
        Given I am a registered customer with following details:
            | userID      | autob386 |
            | password    | 1234Test |
            | userIDstg   | stag5a14 |
            | passwordStg | 1234Test |
        And complete onboarding document safe and survey
        And I filling in form login with the following details:
            | userID      | autob386 |
            | password    | 1234Test |
            | userIDstg   | stag5a14 |
            | passwordStg | 1234Test |
        And I click login
        And I click later in pop up biometric
        And I will see card account 'complete document'
        When I click tab brankas
        And I click direct to input password document
        And I input password document
        And I click see my document
        Then I will direct to page document business
        And I will see button document giro and document loan
        And I click document giro
        And I will see document business for type individual company

    @C131663
    Scenario: Verify button business document is appear if user upload 1 document
        Given I am a registered customer with following details:
            | userID      | auto19fc |
            | password    | 1234Test |
            | userIDstg   | assa78cf |
            | passwordStg | Test1234 |
        And complete onboarding document safe and survey
        And I filling in form login with the following details:
            | userID      | auto19fc |
            | password    | 1234Test |
            | userIDstg   | assa78cf |
            | passwordStg | Test1234 |
        And I click login
        And I click later in pop up biometric
        And I will see card account 'complete document'
        When I click tab brankas
        And I click direct to input password document
        And I input password document
        And I click see my document
        Then I will direct to page document business
        And I will see button document giro and document loan
        And I click document giro
        And I will see one document giro

    @C131664
    Scenario: Back to page Dokumen Bisnis from page Dokumen Giro
        Given I am a registered customer with following details:
            | userID      | autoc10a |
            | password    | 1234Test |
            | userIDstg   | mich4d05 |
            | passwordStg | 1234Test |
        And complete onboarding document safe and survey
        And I filling in form login with the following details:
            | userID      | autoc10a |
            | password    | 1234Test |
            | userIDstg   | mich4d05 |
            | passwordStg | 1234Test |
        And I click login
        And I click later in pop up biometric
        And I will see card account 'complete document'
        When I click tab brankas
        And I click direct to input password document
        And I input password document
        And I click see my document
        Then I will direct to page document business
        And I will see button document giro and document loan
        And I click document giro
        And I back to page document business
        And I will direct to page document business

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
        And I back to dashboard
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
        And I back to dashboard
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
            | userIDstg   | stag302d |
            | passwordStg | 1234Test |
        And still not complete onboarding document safe and survey
        And I filling in form login with the following details:
            | userID      | mike2cf3 |
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
        And I will see pop up biometric is inactive
        And I click direct to input password document
        And I will see bottom sheet input password document
        And I input password document
        And I click see my document
        Then I will direct to page document business
        And I will see button document giro and document loan

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
        Then I will direct to page document business
        And I will see button document giro and document loan

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
        Then I will see button document loan
        And I will not see button document giro

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
        Then I will see button document loan
        And I will not see button document giro