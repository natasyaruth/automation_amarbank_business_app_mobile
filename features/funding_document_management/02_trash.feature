Feature: Brankas - Trash
    As a customer
    I want to see list folder and file other that has been deleted

    @C167413
    Scenario: Back to menu dokumen brankas from page Trash
        Given I am a registered customer with following details:
            | userID      | deveceea |
            | password    | 1234Test |
            | userIDstg   | stag990b |
            | passwordStg | 1234Test |
        And complete onboarding document safe and survey
        And don't have any other document
        And don't have any document in trash
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
        And I click menu trash
        And I will direct to trash page
        And I click back in header page
        Then I will direct to page document brankas

    @C167414
    Scenario: Close bottom sheet delete all permanent
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
        And I click menu trash
        And I click menu detail trash
        And I will see bottom sheet menu delete all permanent
        And I close bottom sheet menu delete all permanent
        Then I will direct to trash page

    @C167415
    Scenario: Close bottom sheet detail file/folder in trash
        Given I am a registered customer with following details:
            | userID      | deveceea |
            | password    | 1234Test |
            | userIDstg   | stag990b |
            | passwordStg | 1234Test |
        And complete onboarding document safe and survey
        And I recently have folder in other doc
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
        And I click button menu action brankas
        And I click menu trash
        And I will see folder that recently deleted in trash
        And I click icon three dot folder in trash
        And I will see bottom sheet menu folder trash
        And I close bottom sheet menu detail content trash
        Then I will direct to trash page
        And I will see folder that recently deleted in trash

    @C167416
    Scenario: Cancel delete all permanent
        Given I am a registered customer with following details:
            | userID      | deveceea |
            | password    | 1234Test |
            | userIDstg   | stag990b |
            | passwordStg | 1234Test |
        And complete onboarding document safe and survey
        And I recently have folder in other doc
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
        And I click button menu action brankas
        And I click menu trash
        And I will see folder that recently deleted in trash
        And I click menu detail trash
        And I will see bottom sheet menu delete all permanent
        And I click delete all permanent
        And I cancel delete all permanent
        Then I will direct to trash page
        And I will see folder that recently deleted in trash

    @C167417
    Scenario: Cancel delete permanent folder/file
        Given I am a registered customer with following details:
            | userID      | deveceea |
            | password    | 1234Test |
            | userIDstg   | stag990b |
            | passwordStg | 1234Test |
        And complete onboarding document safe and survey
        And I recently have folder in other doc
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
        And I click button menu action brankas
        And I click menu trash
        And I will see folder that recently deleted in trash
        And I click icon three dot folder in trash
        And I click delete permanent
        And I will see pop up confirm delete folder permanent
        And I cancel delete permanent
        Then I will direct to trash page
        And I will see folder that recently deleted in trash  

    @C167418
    Scenario: Delete all permanent in trash
        Given I am a registered customer with following details:
            | userID      | deveceea |
            | password    | 1234Test |
            | userIDstg   | stag990b |
            | passwordStg | 1234Test |
        And complete onboarding document safe and survey
        And I recently have folder in other doc
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
        And I click button menu action brankas
        And I click menu trash
        And I will see folder that recently deleted in trash
        And I click menu detail trash
        And I click delete all permanent
        And I will see pop up confirm delete all permanent
        And I confirm delete all permanent
        Then I will see snackbar success delete all permanent
        And I will direct to trash page
        And I will not see all content in trash

    @C167419
    Scenario: Delete permanent file
        Given I am a registered customer with following details:
            | userID      | deveceea |
            | password    | 1234Test |
            | userIDstg   | stag990b |
            | passwordStg | 1234Test |
        And complete onboarding document safe and survey
        And don't have any other document
        And don't have any document in trash
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
        And I will see snackbar file deleted successfully
        And I will not see the deleted file
        And I click button menu action brankas
        And I click menu trash
        And I will see file that recently deleted in trash
        And I click icon three dot file in trash
        And I will see bottom sheet menu file trash
        And I click delete permanent
        And I will see pop up confirm delete file permanent
        And I confirm delete permanent
        Then I will see snackbar success delete permanent document
        And I will direct to trash page
        And The file is not in trash anymore

    @C167420
    Scenario: Delete permanent folder
        Given I am a registered customer with following details:
            | userID      | deveceea |
            | password    | 1234Test |
            | userIDstg   | stag990b |
            | passwordStg | 1234Test |
        And complete onboarding document safe and survey
        And don't have any other document
        And don't have any document in trash
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
        And I will see snackbar folder deleted successfully
        And I will not see the deleted folder
        And I click button menu action brankas
        And I click menu trash
        And I will see folder that recently deleted in trash
        And I click icon three dot folder in trash
        And I click delete permanent
        And I will see pop up confirm delete folder permanent
        And I confirm delete permanent
        Then I will see snackbar success delete permanent folder
        And I will direct to trash page
        And The folder is not in trash anymore

    @C167421
    Scenario: Delete permanent folder within folder
        Given I am a registered customer with following details:
            | userID      | deveceea |
            | password    | 1234Test |
            | userIDstg   | stag990b |
            | passwordStg | 1234Test |
        And complete onboarding document safe and survey
        And don't have any other document
        And don't have any document in trash
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
        And I will see snackbar folder deleted successfully
        And I will not see the deleted folder
        And I click back in header page
        And I will direct to page document brankas
        And I click button menu action brankas
        And I click menu trash
        And I will see folder that recently deleted in trash
        And I click icon three dot folder in trash
        And I click delete permanent
        And I will see pop up confirm delete folder permanent
        And I confirm delete permanent
        Then I will see snackbar success delete permanent folder
        And I will direct to trash page
        And The folder is not in trash anymore 

    @C167422
    Scenario: Delete permanent file within folder
        Given I am a registered customer with following details:
            | userID      | deveceea |
            | password    | 1234Test |
            | userIDstg   | stag990b |
            | passwordStg | 1234Test |
        And complete onboarding document safe and survey
        And don't have any other document
        And don't have any document in trash
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
        And I will see snackbar file deleted successfully
        And I will not see the deleted file
        And I click back in header page
        And I will direct to page document brankas
        And I click button menu action brankas
        And I click menu trash
        And I will see file that recently deleted in trash
        And I click icon three dot file in trash
        And I will see bottom sheet menu file trash
        And I click delete permanent
        And I will see pop up confirm delete file permanent
        And I confirm delete permanent
        Then I will see snackbar success delete permanent document
        And I will direct to trash page
        And The file is not in trash anymore

    @C167423
    Scenario: Delete permanent folder with sub branches in root
        Given I am a registered customer with following details:
            | userID      | deveceea |
            | password    | 1234Test |
            | userIDstg   | stag990b |
            | passwordStg | 1234Test |
        And complete onboarding document safe and survey
        And don't have any other document
        And don't have any document in trash
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
        And I see the new folder is created
        And I back from detail folder to root folder
        And I click icon three dot folder
        And I click delete folder
        And I confirm delete folder
        And I will see snackbar folder deleted successfully
        And I click button menu action brankas
        And I click menu trash
        And I will see folder that recently deleted from root in trash
        And I click icon three dot folder in trash
        And I click delete permanent
        And I confirm delete permanent
        Then I will see snackbar success delete permanent folder
        And I will direct to trash page
        And The folder is not in trash anymore 

    @C167424
    Scenario: Delete permanent folder in sub branches
        Given I am a registered customer with following details:
            | userID      | deveceea |
            | password    | 1234Test |
            | userIDstg   | stag990b |
            | passwordStg | 1234Test |
        And complete onboarding document safe and survey
        And don't have any other document
        And don't have any document in trash
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
        And I see the new folder is created
        And I open detail other folder
        And I will see folder contents still empty
        And I back to folder in branch '3'
        And I click icon three dot folder detail
        And I click delete folder
        And I confirm delete folder
        And I will see snackbar folder deleted successfully
        And I back from detail folder to root folder
        And I click button menu action brankas
        And I click menu trash
        And I will see folder that recently deleted in trash
        And I click icon three dot folder in trash
        And I click delete permanent
        And I confirm delete permanent
        Then I will see snackbar success delete permanent folder
        And I will direct to trash page
        And The folder is not in trash anymore 

    @C167425
    Scenario: Restore folder in trash
        Given I am a registered customer with following details:
            | userID      | deveceea |
            | password    | 1234Test |
            | userIDstg   | stag990b |
            | passwordStg | 1234Test |
        And complete onboarding document safe and survey
        And don't have any other document
        And don't have any document in trash
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
        And I will see snackbar folder deleted successfully
        And I will not see the deleted folder
        And I click button menu action brankas
        And I click menu trash
        And I will see folder that recently deleted in trash
        And I click icon three dot folder in trash
        And I click restore
        Then I will see snackbar success restore folder
        And The folder is not in trash anymore
        And I click back in header page
        And I will direct to page document brankas
        And I refresh the page with swipe down screen
        And I will see folder that has been restored in root brankas document
        And I open other folder
        And I will see empty detail menu other document

    @C167426
    Scenario: Restore file in trash
        Given I am a registered customer with following details:
            | userID      | devef721 |
            | password    | 1234Test |
            | userIDstg   | staga8a9 |
            | passwordStg | 1234Test |
        And complete onboarding document safe and survey
        And don't have any other document
        And don't have any document in trash
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
        And I upload other document with type 'jpg'
        And I will see other document has been uploaded
        And I click save document
        And I will see snackbar success upload success
        And I click icon three dot file
        And I click delete file
        And I will see pop up confirm delete file
        And I confirm delete file
        And I will see snackbar file deleted successfully
        And I will not see the deleted file
        And I click button menu action brankas
        And I click menu trash
        And I will see file that recently deleted in trash
        And I click icon three dot file in trash
        And I click restore
        Then I will see snackbar success restore document
        And I click back in header page
        And I will see file that has been restored in root brankas document

    @C167427
    Scenario: Restore folder in trash with name same as existing folder in brankas
        Given I am a registered customer with following details:
            | userID      | deveceea |
            | password    | 1234Test |
            | userIDstg   | stag990b |
            | passwordStg | 1234Test |
        And complete onboarding document safe and survey
        And don't have any other document
        And don't have any document in trash
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
        And I will see snackbar folder deleted successfully
        And I will not see the deleted folder
        And I click button menu action brankas
        And I click create new folder
        And I fill new folder name same as before
        And I save new folder
        And I see snackbar success create new folder
        And I will direct to page document brankas with folder that has been created in section other document
        And I click button menu action brankas
        And I click menu trash
        And I will see folder that recently deleted in trash
        And I click icon three dot folder in trash
        And I click restore
        Then I will see snackbar success restore folder
        And The folder is not in trash anymore
        And I click back in header page
        And I refresh the page with swipe down screen
        And I will see two folders with same name  

    @C167428
    Scenario: Restore file in trash with name same as existing file in brankas
        Given I am a registered customer with following details:
            | userID      | deveceea |
            | password    | 1234Test |
            | userIDstg   | stag990b |
            | passwordStg | 1234Test |
        And complete onboarding document safe and survey
        And don't have any other document
        And don't have any document in trash
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
        And I will see snackbar file deleted successfully
        And I will not see the deleted file
        And I click button menu action brankas
        And I upload other document with type 'jpg'
        And I will see other document has been uploaded
        And I click save document
        And I will see snackbar success upload success
        And I click button menu action brankas
        And I click menu trash
        And I will see file that recently deleted in trash
        And I click icon three dot file in trash
        And I click restore
        Then I will see snackbar success restore document
        And I click back in header page
        And I refresh the page with swipe down screen
        And I will see two files with same name 
        
    @C167429
    Scenario: Restore folder from child folder
        Given I am a registered customer with following details:
            | userID      | deveceea |
            | password    | 1234Test |
            | userIDstg   | stag990b |
            | passwordStg | 1234Test |
        And complete onboarding document safe and survey
        And don't have any other document
        And don't have any document in trash
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
        And I will direct to page document brankas with folder that has been created in section other document
        And I open other folder
        And I will see folder contents still empty
        And I click button menu action brankas
        And I click create new folder
        And I fill field new folder with 'Segera Dihapus Sekarang'
        And I save new folder
        And I see snackbar success create new folder
        And I see the new folder is created
        And I click icon three dot folder
        And I click delete folder
        And I confirm delete folder
        And I will see snackbar folder deleted successfully
        And I will not see the deleted folder
        And I click back in header page
        And I will direct to page document brankas
        And I click button menu action brankas
        And I click menu trash
        And I will see folder that recently deleted in trash
        And I open folder in trash
        And I click icon three dot folder in trash
        And I click restore
        Then I will see snackbar success restore folder
        And The folder is not in trash anymore
        And I click back in header page
        And I refresh the page with swipe down screen
        And I will see folder that has been restored in root brankas document

    @C167430
    Scenario: Restore file from child folder
        Given I am a registered customer with following details:
            | userID      | deveceea |
            | password    | 1234Test |
            | userIDstg   | stag990b |
            | passwordStg | 1234Test |
        And complete onboarding document safe and survey
        And don't have any other document
        And don't have any document in trash
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
        And I will see snackbar file deleted successfully
        And I will not see the deleted file
        And I click back in header page
        And I will direct to page document brankas
        And I click button menu action brankas
        And I click menu trash
        And I will see file that recently deleted in trash
        And I click icon three dot file in trash
        And I click restore
        Then I will see snackbar success restore document
        And The file is not in trash anymore
        And I click back in header page
        And I will see file that has been restored in root brankas document along with root folder

    @C167431
    Scenario: Restore folder with branches in root
        Given I am a registered customer with following details:
            | userID      | deveceea |
            | password    | 1234Test |
            | userIDstg   | stag990b |
            | passwordStg | 1234Test |
        And complete onboarding document safe and survey
        And don't have any other document
        And don't have any document in trash
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
        And I see the new folder is created
        And I back from detail folder to root folder
        And I will direct to page document brankas
        And I click icon three dot folder
        And I click delete folder
        And I confirm delete folder
        And I will see snackbar folder deleted successfully
        And I click button menu action brankas
        And I click menu trash
        And I will see folder that recently deleted from root in trash
        And I click icon three dot folder in trash
        And I click restore
        Then I will see snackbar success restore folder
        And I click back in header page
        And I will direct to page document brankas
        And I refresh the page with swipe down screen
        And I will see folder that has been restored in root brankas document