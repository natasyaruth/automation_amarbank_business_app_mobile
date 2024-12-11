Feature: Brankas - Move and Copy Files Giro
    As a customer
    I want to move and copy files in dokumen basic in brankas

    Scenario: Close bottom sheet menu info document giro
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
        And I will see menu document giro and other
        And I click document giro
        And I click menu detail info document 'NIB'
        And I will see bottom sheet detail info document giro
        And I close bottom sheet detail info document giro
        Then I will direct to page document giro

    Scenario: Cancel move and copy document giro
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
        And I will see menu document giro and other
        And I click document giro
        And I click menu detail info document 'NIB'
        And I click copy and move files
        And I will direct to page move and copy files to root other document
        And I cancel move and copy files
        Then I will direct to page document giro

    Scenario: Back to document giro through icon back in header move and copy files
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
        And I will see menu document giro and other
        And I click document giro
        And I click menu detail info document 'NIB'
        And I click copy and move files
        And I will direct to page move and copy files to root other document
        And I click back in header page
        Then I will direct to page document giro

    Scenario: Move and copy files in root other document
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
        And I will see menu document giro and other
        And I click document giro
        And I click menu detail info document 'NIB'
        And I click copy and move files
        And I click move and copy here
        Then I will see snackbar success copy and move files
        And I will see file is copied and move to section other document

    Scenario: Close bottom sheet create new folder through move and copy files
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
        And I will see menu document giro and other
        And I click document giro
        And I click menu detail info document 'NIB'
        And I click copy and move files
        And I click create new folder in move and copy
        And I will see bottom sheet new folder
        And I close bottom sheet upload
        Then I will direct to page move and copy files to root other document

    Scenario: Move and copy files through create new folder
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
        And I will see menu document giro and other
        And I click document giro
        And I click menu detail info document 'NIB'
        And I click copy and move files
        And I click create new folder in move and copy
        And I fill field new folder with 'Folder Penting dan Rahasia'
        And I save new folder
        And I see snackbar success create new folder
        And I will see folder contents still empty
        And I click move and copy here
        Then I will see snackbar success copy and move files
        And I will see file is copied and move inside the folder
        And I back from detail folder to root folder
        And I see root folder is exist

    Scenario: Move and copy files to existing folder in root
        Given I am a registered customer with following details:
            | userID      | autofb2c |
            | password    | 1234Test |
            | userIDstg   | stagcfb7 |
            | passwordStg | 1234Test |
        And I recently have folder in other doc
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
        And I will see menu document giro and other
        And I click document giro
        And I click menu detail info document 'NIB'
        And I click copy and move files
        And I open other folder
        And I will see folder contents still empty
        And I click move and copy here
        Then I will see snackbar success copy and move files
        And I will see file is copied and move inside the folder
        And I back from detail folder to root folder
        And I see root folder is exist

    Scenario: Move and copy files to sub folder in existing folder
        Given I am a registered customer with following details:
            | userID      | autofb2c |
            | password    | 1234Test |
            | userIDstg   | stagcfb7 |
            | passwordStg | 1234Test |
        And I recently have '2' folder in other doc
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
        And I will see menu document giro and other
        And I click document giro
        And I click menu detail info document 'NIB'
        And I click copy and move files
        And I open other folder
        And I will see folder contents still empty
        And I open other folder
        And I will see folder contents still empty
        And I click move and copy here
        Then I will see snackbar success copy and move files
        And I will see file is copied and move inside the folder
        And I back from detail folder to root folder
        And I will direct to page document brankas
        And I see root folder is exist

    Scenario: Create new folder with naming folder is same through move and copy files
        Given I am a registered customer with following details:
            | userID      | autofb2c |
            | password    | 1234Test |
            | userIDstg   | stagcfb7 |
            | passwordStg | 1234Test |
        And I recently have folder in other doc
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
        And I will see menu document giro and other
        And I click document giro
        And I click menu detail info document 'NIB'
        And I click copy and move files
        And I click create new folder in move and copy
        And I fill new folder name same as before
        And I save new folder
        Then I see message error folder name is exist

    Scenario: Cancel move and copy files after create new folder
        Given I am a registered customer with following details:
            | userID      | autofb2c |
            | password    | 1234Test |
            | userIDstg   | stagcfb7 |
            | passwordStg | 1234Test |
        And don't have any other document
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
        And I will see menu document giro and other
        And I click document giro
        And I click menu detail info document 'NIB'
        And I click copy and move files
        And I click create new folder in move and copy
        And I fill field new folder with 'Folder Penting'
        And I save new folder
        And I see snackbar success create new folder
        And I will see folder contents still empty
        And I cancel move and copy files
        Then I will direct to page document giro
        And I click back in header page
        And I will direct to page document brankas with folder that has been created in section other document

    Scenario: Move and copy files with naming file is same
        Given I am a registered customer with following details:
            | userID      | autofb2c |
            | password    | 1234Test |
            | userIDstg   | stagcfb7 |
            | passwordStg | 1234Test |
        And don't have any other document
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
        And I will see menu document giro and other
        And I click document giro
        And I click menu detail info document 'NIB'
        And I click copy and move files
        And I click move and copy here
        And I will see snackbar success copy and move files
        And I will see file is copied and move to section other document
        And I click document giro
        And I click menu detail info document 'NIB'
        And I click copy and move files
        And I click move and copy here
        Then I will see snackbar success copy and move files
        And I will see file is copied and move to section other document

    Scenario: Move and copy files Akta Pendirian
        Given I am a registered customer with following details:
            | userID      | autofb2c |
            | password    | 1234Test |
            | userIDstg   | stagcfb7 |
            | passwordStg | 1234Test |
        And don't have any other document
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
        And I will see menu document giro and other
        And I click document giro
        And I click menu detail info document 'Akta Pendirian'
        And I click copy and move files
        And I click move and copy here
        Then I will see snackbar success copy and move files
        And I will see file is copied and move to section other document

    Scenario: Move and copy files Akta Perubahan Terakhir
        Given I am a registered customer with following details:
            | userID      | autofb2c |
            | password    | 1234Test |
            | userIDstg   | stagcfb7 |
            | passwordStg | 1234Test |
        And don't have any other document
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
        And I will see menu document giro and other
        And I click document giro
        And I click menu detail info document 'Akta Perubahan Terakhir'
        And I click copy and move files
        And I click move and copy here
        Then I will see snackbar success copy and move files
        And I will see file is copied and move to section other document

    Scenario: Move and copy files Sertifikat Perubahan Terakhir
        Given I am a registered customer with following details:
            | userID      | autofb2c |
            | password    | 1234Test |
            | userIDstg   | stagcfb7 |
            | passwordStg | 1234Test |
        And don't have any other document
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
        And I will see menu document giro and other
        And I click document giro
        And I click menu detail info document 'Sertifikat Perubahan Terakhir'
        And I click copy and move files
        And I click move and copy here
        Then I will see snackbar success copy and move files
        And I will see file is copied and move to section other document

    Scenario: Move and copy files Sertifikat Pendaftaran
        Given I am a registered customer with following details:
            | userID      | autofb2c |
            | password    | 1234Test |
            | userIDstg   | stagcfb7 |
            | passwordStg | 1234Test |
        And don't have any other document
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
        And I will see menu document giro and other
        And I click document giro
        And I click menu detail info document 'Sertifikat Pendaftaran'
        And I click copy and move files
        And I click move and copy here
        Then I will see snackbar success copy and move files
        And I will see file is copied and move to section other document

    Scenario: Move and copy files NPWP Bisnis
        Given I am a registered customer with following details:
            | userID      | autofb2c |
            | password    | 1234Test |
            | userIDstg   | stagcfb7 |
            | passwordStg | 1234Test |
        And don't have any other document
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
        And I will see menu document giro and other
        And I click document giro
        And I click menu detail info document 'NPWP Bisnis'
        And I click copy and move files
        And I click move and copy here
        Then I will see snackbar success copy and move files
        And I will see file is copied and move to section other document

    Scenario: Move and copy files Surat Pernyataan Pendirian
        Given I am a registered customer with following details:
            | userID      | autofb2c |
            | password    | 1234Test |
            | userIDstg   | stagcfb7 |
            | passwordStg | 1234Test |
        And don't have any other document
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
        And I will see menu document giro and other
        And I click document giro
        And I click menu detail info document 'Surat Pernyataan Pendirian'
        And I click copy and move files
        And I click move and copy here
        Then I will see snackbar success copy and move files
        And I will see file is copied and move to section other document

    Scenario: Move and copy files SK Kemenkumham Pendirian
        Given I am a registered customer with following details:
            | userID      | autofb2c |
            | password    | 1234Test |
            | userIDstg   | stagcfb7 |
            | passwordStg | 1234Test |
        And don't have any other document
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
        And I will see menu document giro and other
        And I click document giro
        And I click menu detail info document 'SK Kemenkumham Pendirian'
        And I click copy and move files
        And I click move and copy here
        Then I will see snackbar success copy and move files
        And I will see file is copied and move to section other document

    Scenario: Move and copy files SK Kemenkumham Perubahan Terakhir
        Given I am a registered customer with following details:
            | userID      | autofb2c |
            | password    | 1234Test |
            | userIDstg   | stagcfb7 |
            | passwordStg | 1234Test |
        And don't have any other document
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
        And I will see menu document giro and other
        And I click document giro
        And I click menu detail info document 'SK Kemenkumham Pendirian'
        And I click copy and move files
        And I click move and copy here
        Then I will see snackbar success copy and move files
        And I will see file is copied and move to section other document

    Scenario: Move and copy files Surat Pernyataan Perubahan Terakhir
        Given I am a registered customer with following details:
            | userID      | autofb2c |
            | password    | 1234Test |
            | userIDstg   | stagcfb7 |
            | passwordStg | 1234Test |
        And don't have any other document
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
        And I will see menu document giro and other
        And I click document giro
        And I click menu detail info document 'Surat Pernyataan Perubahan Terakhir'
        And I click copy and move files
        And I click move and copy here
        Then I will see snackbar success copy and move files
        And I will see file is copied and move to section other document