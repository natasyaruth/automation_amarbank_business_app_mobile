Feature: Document Brankas
    In order to open and manage my Document
    As a Customer
    I want to see and secure my document business and loan

    Scenario: Close page onboarding brankas
        Given I am a registered customer with following details:
            | userID      | autocaea |
            | password    | 1234Test |
            | userIDstg   | stag302d |
            | passwordStg | 1234Test |
        And still not complete onboarding document safe
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

    Scenario: Access widget brankas on main dashboard for user initiator recently from registration 1
        Given I am a registered customer with following details:
            | userID      | autocaea |
            | password    | 1234Test |
            | userIDstg   | stag302d |
            | passwordStg | 1234Test |
        And still not complete onboarding document safe
        And I filling in form login with the following details:
            | userID      | autocaea |
            | password    | 1234Test |
            | userIDstg   | stag302d |
            | passwordStg | 1234Test |
        And I click login
        And I click later
        And I click later in pop up biometric
        And I will see card account 'account opening'
        And notification red dot document safe is on
        And I click widget document safe
        And I will see onboarding page document safe continue to choose product
        And I click button choose product
        Then I will see details info of giro account MSME
        And I will see details info of giro account Corporate  

    Scenario: Access widget brankas on main dashboard for user initiator in process giro account opening
        Given I am a registered customer with following details:
            | userID      | autocaea |
            | password    | 1234Test |
            | userIDstg   | stag302d |
            | passwordStg | 1234Test |
        And still not complete onboarding document safe
        And I filling in form login with the following details:
            | userID      | autocaea |
            | password    | 1234Test |
            | userIDstg   | stag302d |
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

    Scenario: Access widget brankas on main dashboard for user initiator in process combine journey
        Given I am a registered customer with following details:
            | userID      | autocaea |
            | password    | 1234Test |
            | userIDstg   | stag302d |
            | passwordStg | 1234Test |
        And still not complete onboarding document safe
        And I filling in form login with the following details:
            | userID      | autocaea |
            | password    | 1234Test |
            | userIDstg   | stag302d |
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

    Scenario: Access widget brankas on main dashboard for user initiator on verification
        Given I am a registered customer with following details:
            | userID      | autocaea |
            | password    | 1234Test |
            | userIDstg   | stag302d |
            | passwordStg | 1234Test |
        And still not complete onboarding document safe
        And I filling in form login with the following details:
            | userID      | autocaea |
            | password    | 1234Test |
            | userIDstg   | stag302d |
            | passwordStg | 1234Test |
        And I click login
        And I click later in pop up biometric
        And I will see card account 'on verification'
        And notification red dot document safe is on
        And I click widget document safe
        Then I will see onboarding page document safe continue to account opening process
        And I continue to process account opening
        And I will direct to page detail progress account opening

    Scenario: Access widget brankas on main dashboard for user individual on verification
        Given I am a registered customer with following details:
            | userID      | autocaea |
            | password    | 1234Test |
            | userIDstg   | stag302d |
            | passwordStg | 1234Test |
        And still not complete onboarding document safe
        And I filling in form login with the following details:
            | userID      | autocaea |
            | password    | 1234Test |
            | userIDstg   | stag302d |
            | passwordStg | 1234Test |
        And I click login
        And I click later in pop up biometric
        And I will see card account 'on verification'
        And notification red dot document safe is on
        And I click widget document safe
        Then I will see onboarding page document safe data still need verification

    Scenario: Access widget brankas on main dashboard for user invitee on verification
        Given I am a registered customer with following details:
            | userID      | autocaea |
            | password    | 1234Test |
            | userIDstg   | stag302d |
            | passwordStg | 1234Test |
        And still not complete onboarding document safe
        And I filling in form login with the following details:
            | userID      | autocaea |
            | password    | 1234Test |
            | userIDstg   | stag302d |
            | passwordStg | 1234Test |
        And I click login
        And I click later in pop up biometric
        And I will see card account 'on verification'
        And notification red dot document safe is on
        And I click widget document safe
        Then I will see onboarding page document safe data still need verification

    Scenario: Access widget brankas on main dashboard for user initiator active
        Given I am a registered customer with following details:
            | userID      | autocaea |
            | password    | 1234Test |
            | userIDstg   | stag302d |
            | passwordStg | 1234Test |
        And still not complete onboarding document safe
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
        And I will see pop up biometric is inactive
        And I click direct to input password document
        And I will see bottom sheet input password document
        And I input password document
        And I click see my document
        Then I will direct to page document business
        And I will see button document giro and document loan

    Scenario: Access widget brankas on main dashboard for user invitee active
        Given I am a registered customer with following details:
            | userID      | autocaea |
            | password    | 1234Test |
            | userIDstg   | stag302d |
            | passwordStg | 1234Test |
        And still not complete onboarding document safe
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
        Then I will direct to page document business
        And I will see button document giro and document loan

    Scenario: Access widget brankas on main dashboard for user individual active
        Given I am a registered customer with following details:
            | userID      | autocaea |
            | password    | 1234Test |
            | userIDstg   | stag302d |
            | passwordStg | 1234Test |
        And still not complete onboarding document safe
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
        Then I will see button document loan
        And I will not see button document giro

    Scenario: Access widget brankas on main dashboard for user combine journey active
        Given I am a registered customer with following details:
            | userID      | autocaea |
            | password    | 1234Test |
            | userIDstg   | stag302d |
            | passwordStg | 1234Test |
        And still not complete onboarding document safe
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
        Then I will see button document loan
        And I will not see button document giro

    Scenario: Fill survey with option done enough
        Given I am a registered customer with following details:
            | userID      | autocaea |
            | password    | 1234Test |
            | userIDstg   | stag302d |
            | passwordStg | 1234Test |
        And still not complete onboarding document safe
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
        And I will direct to page document business
        And I click tab Home
        And I will see pop up fill survey
        And I choose done enough
        And I will see button sent feedback enabled
        And I sent the feedback
        Then I will see snackbar success send feedback
        And I will see card account 'active'
        And notification red dot document safe is off

    Scenario: Fill survey with option not enough - choose one option
        Given I am a registered customer with following details:
            | userID      | autocaea |
            | password    | 1234Test |
            | userIDstg   | stag302d |
            | passwordStg | 1234Test |
        And still not complete onboarding document safe
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
        And I will direct to page document business
        And I click tab Home
        And I choose not enough
        And I will see section to choose reason
        And I checklist reason 'Upload Dokumen'
        And I sent the feedback
        Then I will see snackbar success send feedback
        And I will see card account 'active'
        And notification red dot document safe is off

    Scenario: Fill survey with option not enough - choose more than one option
        Given I am a registered customer with following details:
            | userID      | autocaea |
            | password    | 1234Test |
            | userIDstg   | stag302d |
            | passwordStg | 1234Test |
        And still not complete onboarding document safe
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
        And I will direct to page document business
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

    Scenario: Fill survey with option not enough - choose all option
        Given I am a registered customer with following details:
            | userID      | autocaea |
            | password    | 1234Test |
            | userIDstg   | stag302d |
            | passwordStg | 1234Test |
        And still not complete onboarding document safe
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
        And I will direct to page document business
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

    Scenario: Fill survey with option not enough - choose option other
        Given I am a registered customer with following details:
            | userID      | autocaea |
            | password    | 1234Test |
            | userIDstg   | stag302d |
            | passwordStg | 1234Test |
        And still not complete onboarding document safe
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
        And I will direct to page document business
        And I click tab Home
        And I choose not enough
        And I will see section to choose reason
        And I checklist reason 'Lainnya'
        And I will see button sent feedback disabled
        And I will see field reason
        And I fill feedback with 'Filter Dokumen'
        And I see counting word
        And I sent the feedback
        Then I will see snackbar success send feedback
        And I will see card account 'active'
        And notification red dot document safe is off 

    Scenario: Fill field option other and then delete
        Given I am a registered customer with following details:
            | userID      | autocaea |
            | password    | 1234Test |
            | userIDstg   | stag302d |
            | passwordStg | 1234Test |
        And still not complete onboarding document safe
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
        And I will direct to page document business
        And I click tab Home
        And I choose not enough
        And I will see section to choose reason
        And I checklist reason 'Lainnya'
        And I will see button sent feedback disabled
        And I will see field reason
        And I fill feedback with 'Filter Dokumen'
        And I see counting word
        And I will see button sent feedback enabled
        And I clear field feedback
        Then I see counting word back to default
        And I will see button sent feedback disabled

    Scenario: Choose option not enough and then choose option done enough
        Given I am a registered customer with following details:
            | userID      | autocaea |
            | password    | 1234Test |
            | userIDstg   | stag302d |
            | passwordStg | 1234Test |
        And still not complete onboarding document safe
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
        And I will direct to page document business
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
        And I see counting word
        And I choose done enough
        And I choose not enough
        And I will see section to choose reason
        And I checklist reason 'Lainnya' 
        And I will see button sent feedback disabled
        And I will see field reason
        Then I will not see the feedback anymore

    Scenario: Fill field option other contain with number and special char
        Given I am a registered customer with following details:
            | userID      | autocaea |
            | password    | 1234Test |
            | userIDstg   | stag302d |
            | passwordStg | 1234Test |
        And still not complete onboarding document safe
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
        And I will direct to page document business
        And I click tab Home
        And I choose not enough
        And I will see section to choose reason
        And I checklist reason 'Lainnya'
        And I will see button sent feedback disabled
        And I will see field reason
        And I fill feedback with 'Dokumen 123XYZ @!#%'
        And I see counting word
        And I sent the feedback
        Then I will see snackbar success send feedback
        And I will see card account 'active'
        And notification red dot document safe is off 

    Scenario: Check feeedback and then uncheck
        Given I am a registered customer with following details:
            | userID      | autocaea |
            | password    | 1234Test |
            | userIDstg   | stag302d |
            | passwordStg | 1234Test |
        And still not complete onboarding document safe
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
        And I will direct to page document business
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

    Scenario: Fill survey journey to tab Profile
        Given I am a registered customer with following details:
            | userID      | autocaea |
            | password    | 1234Test |
            | userIDstg   | stag302d |
            | passwordStg | 1234Test |
        And still not complete onboarding document safe
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
        And I will direct to page document business
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
        And notification red dot document safe is off

    Scenario: Fill survey journey to tab Other
        Given I am a registered customer with following details:
            | userID      | autocaea |
            | password    | 1234Test |
            | userIDstg   | stag302d |
            | passwordStg | 1234Test |
        And still not complete onboarding document safe
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
        And I will direct to page document business
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
        And notification red dot document safe is off