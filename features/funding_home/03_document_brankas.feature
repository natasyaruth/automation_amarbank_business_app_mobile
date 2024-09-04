Feature: Document Brankas
    In order to open and manage my Document
    As a Customer
    I want to see and secure my document business and loan

    @C156924
    Scenario: Close page onboarding brankas
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
        And I see widget document safe
        And notification red dot document safe is on
        And I click widget document safe
        And I close page onboarding document safe
        Then I will see card account 'active'
        And I see widget document safe
        And notification red dot document safe is on

    @C156925
    Scenario: Access widget brankas on main dashboard for user initiator recently from registration 1
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
        And I click widget document safe
        And I will see onboarding page document safe continue to choose product
        And I click button choose product
        Then I will directing to Hook 1 Onboarding Account Opening

    @C156926
    Scenario: Access widget brankas on main dashboard for user initiator in process giro account opening
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
        And I click widget document safe
        And I will see onboarding page document safe continue to account opening process
        And I continue to process account opening
        Then I see page 'Data Personal'

    @C156927
    Scenario: Access widget brankas on main dashboard for user initiator in process combine journey
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
        And I click widget document safe
        And I will see onboarding page document safe continue to loan process
        And I continue to process loan
        Then I see page 'Data Personal'

    @C156928
    Scenario: Access widget brankas on main dashboard for user initiator on verification
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
        And I click widget document safe
        Then I will see onboarding page document safe continue to account opening process
        And I continue to process account opening
        And I will direct to page detail progress account opening

    @C156929
    Scenario: Access widget brankas on main dashboard for user individual on verification
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
        And I click widget document safe
        Then I will see onboarding page document safe data still need verification

    @C156930
    Scenario: Access widget brankas on main dashboard for user invitee on verification
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
        And I click widget document safe
        Then I will see onboarding page document safe data still need verification

    @C156931
    Scenario: Access widget brankas on main dashboard for user initiator active
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
        And I click widget document safe
        And I will see onboarding page to complete document safe
        And I click use document safe
        And I will see pop up biometric is inactive
        And I click direct to input password document
        And I will see bottom sheet input password document
        And I input password document
        And I click see my document
        Then I will direct to page document brankas

    @C156932
    Scenario: Access widget brankas on main dashboard for user invitee active
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
        And I click widget document safe
        And I will see onboarding page to complete document safe
        And I click use document safe
        And I click direct to input password document
        And I input password document
        And I click see my document
        Then I will direct to page document brankas
        And I will see menu document giro, loan and other

    @C156933
    Scenario: Access widget brankas on main dashboard for user individual active
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
        And I click widget document safe
        And I will see onboarding page to complete document safe
        And I click use document safe
        And I click direct to input password document
        And I input password document
        And I click see my document
        Then I will see menu other document
        And I will not see menu document loan and giro

    @C156934
    Scenario: Access widget brankas on main dashboard for user combine journey active
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
        And I click widget document safe
        And I will see onboarding page to complete document safe
        And I click use document safe
        And I click direct to input password document
        And I input password document
        And I click see my document
        Then I will see menu other document and loan
        And I will not see menu document giro

    @C156935
    Scenario: Fill survey with option done enough
        Given I am a registered customer with following details:
            | userID      | rota3159 |
            | password    | 1234Test |
            | userIDstg   | staga810 |
            | passwordStg | 1234Test |
        And still not complete onboarding document safe and survey
        And I filling in form login with the following details:
            | userID      | rota3159 |
            | password    | 1234Test |
            | userIDstg   | staga810 |
            | passwordStg | 1234Test |
        And I click login
        And I click later in pop up biometric
        And I will see card account 'active'
        And notification red dot document safe is on
        And I click widget document safe
        And I will see onboarding page to complete document safe
        And I click use document safe
        And I click direct to input password document
        And I input password document
        And I click see my document
        And I will direct to page document brankas
        And I click tab Home
        And I will see pop up fill survey
        And I choose done enough
        And I will see button sent feedback enabled
        And I sent the feedback
        Then I will see snackbar success send feedback
        And I will see card account 'active'
        And notification red dot document safe is off

    @C156936
    Scenario: Fill survey with option not enough - choose one option
        Given I am a registered customer with following details:
            | userID      | mich875d |
            | password    | 1234Test |
            | userIDstg   | staga810 |
            | passwordStg | 1234Test |
        And still not complete onboarding document safe and survey
        And I filling in form login with the following details:
            | userID      | mich875d |
            | password    | 1234Test |
            | userIDstg   | staga810 |
            | passwordStg | 1234Test |
        And I click login
        And I click later in pop up biometric
        And I will see card account 'active'
        And notification red dot document safe is on
        And I click widget document safe
        And I will see onboarding page to complete document safe
        And I click use document safe
        And I click direct to input password document
        And I input password document
        And I click see my document
        And I will direct to page document brankas
        And I click tab Home
        And I choose not enough
        And I will see section to choose reason
        And I checklist reason 'Upload Dokumen'
        And I sent the feedback
        Then I will see snackbar success send feedback
        And I will see card account 'active'
        And notification red dot document safe is off

    @C156937
    Scenario: Fill survey with option not enough - choose more than one option
        Given I am a registered customer with following details:
            | userID      | deveb4ef |
            | password    | 1234Test |
            | userIDstg   | cona1af3 |
            | passwordStg | 1234Test |
        And still not complete onboarding document safe and survey
        And I filling in form login with the following details:
            | userID      | deveb4ef |
            | password    | 1234Test |
            | userIDstg   | cona1af3 |
            | passwordStg | 1234Test |
        And I click login
        And I click later in pop up biometric
        And I will see card account 'active'
        And notification red dot document safe is on
        And I click widget document safe
        And I will see onboarding page to complete document safe
        And I click use document safe
        And I click direct to input password document
        And I input password document
        And I click see my document
        And I will direct to page document brankas
        And I click tab Home
        And I choose not enough
        And I will see section to choose reason
        And I checklist reason 'Upload Dokumen'
        And I checklist reason 'Kategori Dokumen'
        And I checklist reason 'Cari Dokumen'
        And I sent the feedback
        Then I will see snackbar success send feedback
        And I will see card account 'active'
        And notification red dot document safe is off

    @C156938
    Scenario: Fill survey with option not enough - choose all option
        Given I am a registered customer with following details:
            | userID      | ptpe5040 |
            | password    | 1234Test |
            | userIDstg   | staga810 |
            | passwordStg | 1234Test |
        And still not complete onboarding document safe and survey
        And I filling in form login with the following details:
            | userID      | ptpe5040 |
            | password    | 1234Test |
            | userIDstg   | staga810 |
            | passwordStg | 1234Test |
        And I click login
        And I click later in pop up biometric
        And I will see card account 'active'
        And notification red dot document safe is on
        And I click widget document safe
        And I will see onboarding page to complete document safe
        And I click use document safe
        And I click direct to input password document
        And I input password document
        And I click see my document
        And I will direct to page document brankas
        And I click tab Home
        And I choose not enough
        And I will see section to choose reason
        And I checklist reason 'Upload Dokumen'
        And I checklist reason 'Kategori Dokumen'
        And I will see button sent feedback enabled
        And I checklist reason 'Lainnya'
        And I will see button sent feedback disabled
        And I will see field reason
        And I fill feedback with 'Filter Dokumen'
        And I sent the feedback
        Then I will see snackbar success send feedback
        And I will see card account 'active'
        And notification red dot document safe is off

    @C156939
    Scenario: Fill survey with option not enough - choose option other
        Given I am a registered customer with following details:
            | userID      | ruth91fd |
            | password    | 1234Test |
            | userIDstg   | staga810 |
            | passwordStg | 1234Test |
        And still not complete onboarding document safe and survey
        And I filling in form login with the following details:
            | userID      | ruth91fd |
            | password    | 1234Test |
            | userIDstg   | staga810 |
            | passwordStg | 1234Test |
        And I click login
        And I click later in pop up biometric
        And I will see card account 'active'
        And notification red dot document safe is on
        And I click widget document safe
        And I will see onboarding page to complete document safe
        And I click use document safe
        And I click direct to input password document
        And I input password document
        And I click see my document
        And I will direct to page document brankas
        And I click tab Home
        And I choose not enough
        And I will see section to choose reason
        And I checklist reason 'Lainnya'
        And I will see button sent feedback disabled
        And I will see field reason
        And I fill feedback with 'Filter Dokumen'
        And I sent the feedback
        Then I will see snackbar success send feedback
        And I will see card account 'active'
        And notification red dot document safe is off 

    @C156940
    Scenario: Fill field option other and then delete
        Given I am a registered customer with following details:
            | userID      | deveceea |
            | password    | 1234Test |
            | userIDstg   | staga810 |
            | passwordStg | 1234Test |
        And still not complete onboarding document safe and survey
        And I filling in form login with the following details:
            | userID      | deveceea |
            | password    | 1234Test |
            | userIDstg   | staga810 |
            | passwordStg | 1234Test |
        And I click login
        And I click later in pop up biometric
        And I will see card account 'active'
        And notification red dot document safe is on
        And I click widget document safe
        And I will see onboarding page to complete document safe
        And I click use document safe
        And I click direct to input password document
        And I input password document
        And I click see my document
        And I will direct to page document brankas
        And I click tab Home
        And I choose not enough
        And I will see section to choose reason
        And I checklist reason 'Lainnya'
        And I will see button sent feedback disabled
        And I will see field reason
        And I fill feedback with 'Filter Dokumen'
        And I will see button sent feedback enabled
        And I clear field feedback
        Then I see counting word back to default
        And I will see button sent feedback disabled

    @C156941
    Scenario: Choose option not enough and then choose option done enough
        Given I am a registered customer with following details:
            | userID      | deveceea |
            | password    | 1234Test |
            | userIDstg   | staga810 |
            | passwordStg | 1234Test |
        And still not complete onboarding document safe and survey
        And I filling in form login with the following details:
            | userID      | deveceea |
            | password    | 1234Test |
            | userIDstg   | staga810 |
            | passwordStg | 1234Test |
        And I click login
        And I click later in pop up biometric
        And I will see card account 'active'
        And notification red dot document safe is on
        And I click widget document safe
        And I will see onboarding page to complete document safe
        And I click use document safe
        And I click direct to input password document
        And I input password document
        And I click see my document
        And I will direct to page document brankas
        And I click tab Home
        And I choose not enough
        And I will see section to choose reason
        And I checklist reason 'Upload Dokumen'
        And I checklist reason 'Kategori Dokumen'
        And I checklist reason 'Cari Dokumen'
        And I checklist reason 'Lainnya'
        And I will see button sent feedback disabled
        And I will see field reason
        And I fill feedback with 'Filter Dokumen'
        And I choose done enough
        And I choose not enough
        And I will see section to choose reason
        And I checklist reason 'Lainnya' 
        And I will see button sent feedback disabled
        And I will see field reason
        Then I will not see the feedback anymore

    @C156942
    Scenario: Fill field option other contain with number and special char
        Given I am a registered customer with following details:
            | userID      | deved35f |
            | password    | 1234Test |
            | userIDstg   | staga810 |
            | passwordStg | 1234Test |
        And still not complete onboarding document safe and survey
        And I filling in form login with the following details:
            | userID      | deved35f |
            | password    | 1234Test |
            | userIDstg   | staga810 |
            | passwordStg | 1234Test |
        And I click login
        And I click later in pop up biometric
        And I will see card account 'active'
        And notification red dot document safe is on
        And I click widget document safe
        And I will see onboarding page to complete document safe
        And I click use document safe
        And I click direct to input password document
        And I input password document
        And I click see my document
        And I will direct to page document brankas
        And I click tab Home
        And I choose not enough
        And I will see section to choose reason
        And I checklist reason 'Lainnya'
        And I will see button sent feedback disabled
        And I will see field reason
        And I fill feedback with 'Dokumen 123XYZ @!#%'
        And I sent the feedback
        Then I will see snackbar success send feedback
        And I will see card account 'active'
        And notification red dot document safe is off 

    @C156943
    Scenario: Check feeedback and then uncheck
        Given I am a registered customer with following details:
            | userID      | deved35f |
            | password    | 1234Test |
            | userIDstg   | staga810 |
            | passwordStg | 1234Test |
        And still not complete onboarding document safe and survey
        And I filling in form login with the following details:
            | userID      | deved35f |
            | password    | 1234Test |
            | userIDstg   | staga810 |
            | passwordStg | 1234Test |
        And I click login
        And I click later in pop up biometric
        And I will see card account 'active'
        And notification red dot document safe is on
        And I click widget document safe
        And I will see onboarding page to complete document safe
        And I click use document safe
        And I click direct to input password document
        And I input password document
        And I click see my document
        And I will direct to page document brankas
        And I click tab Home
        And I choose not enough
        And I will see section to choose reason
        And I checklist reason 'Upload Dokumen'
        And I checklist reason 'Kategori Dokumen'
        And I checklist reason 'Cari Dokumen'
        And I will see button sent feedback enabled
        And I uncheck reason 'Upload Dokumen'
        And I will see button sent feedback enabled
        And I uncheck reason 'Kategori Dokumen'
        And I will see button sent feedback enabled
        And I uncheck reason 'Cari Dokumen'
        Then I will see button sent feedback disabled

    @C156944
    Scenario: Fill survey journey to tab Profile
        Given I am a registered customer with following details:
            | userID      | devef721 |
            | password    | 1234Test |
            | userIDstg   | staga810 |
            | passwordStg | 1234Test |
        And still not complete onboarding document safe and survey
        And I filling in form login with the following details:
            | userID      | devef721 |
            | password    | 1234Test |
            | userIDstg   | staga810 |
            | passwordStg | 1234Test |
        And I click login
        And I click later in pop up biometric
        And I will see card account 'active'
        And notification red dot document safe is on
        And I click widget document safe
        And I will see onboarding page to complete document safe
        And I click use document safe
        And I click direct to input password document
        And I input password document
        And I click see my document
        And I will direct to page document brankas
        And I click tab profile
        And I choose not enough
        And I will see section to choose reason
        And I checklist reason 'Upload Dokumen'
        And I checklist reason 'Kategori Dokumen'
        And I checklist reason 'Cari Dokumen'
        And I sent the feedback
        Then I will see snackbar success send feedback
        And I see my profile company data
        And I click tab Home
        And I will see card account 'active'
        And I don't see widget onboarding document safe
        And notification red dot document safe is off
        When I click tab brankas
        And I input password document
        And I click see my document
        And I will direct to page document brankas
        And I click tab Home
        Then I will see card account 'active'

    @C156945
    Scenario: Fill survey journey to tab Other
        Given I am a registered customer with following details:
            | userID      | deveb316 |
            | password    | 1234Test |
            | userIDstg   | staga810 |
            | passwordStg | 1234Test |
        And still not complete onboarding document safe and survey
        And I filling in form login with the following details:
            | userID      | deveb316 |
            | password    | 1234Test |
            | userIDstg   | staga810 |
            | passwordStg | 1234Test |
        And I click login
        And I click later in pop up biometric
        And I will see card account 'active'
        And notification red dot document safe is on
        And I click widget document safe
        And I will see onboarding page to complete document safe
        And I click use document safe
        And I click direct to input password document
        And I input password document
        And I click see my document
        And I will direct to page document brankas
        And I choose other
        And I choose not enough
        And I will see section to choose reason
        And I checklist reason 'Upload Dokumen'
        And I checklist reason 'Kategori Dokumen'
        And I checklist reason 'Cari Dokumen'
        And I sent the feedback
        Then I will see snackbar success send feedback
        And I will direct to Tab Other
        And I click tab Home
        And I will see card account 'active'
        And I don't see widget onboarding document safe
        And notification red dot document safe is off
        When I click tab brankas
        And I input password document
        And I click see my document
        And I will direct to page document brankas
        And I click tab Home
        Then I will see card account 'active'