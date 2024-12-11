Feature: Brankas - Move Other Files and Folder
    As a customer
    I want to move files and folders in other document

    Background: Login until access menu document brankas
        Given I am a registered customer with following details:
            | userID      | autocaea |
            | password    | 1234Test |
            | userIDstg   | stag76ee |
            | passwordStg | Test1234 |
        And don't have any other document
        And complete onboarding document safe and survey    
        When I filling in form login with the following details:
            | userID      | autocaea |
            | password    | 1234Test |
            | userIDstg   | stag76ee |
            | passwordStg | Test1234 |
        And I click login
        And I click later in pop up biometric
        And I will see card account 'active'                
        And I click tab brankas
        And I click direct to input password document
        And I input password document
        And I click see my document
        And I will direct to page document brankas

    Scenario: Cancel Move folder
        Given I am on root other folder
        And I recently have folder in other doc
        When I refresh the page with swipe down screen
        And I click icon three dot folder
        And I click move
        And I will direct to page move folder/files to root other document
        And I cancel move
        Then I will direct to page document brankas

    Scenario: Cancel Move file
        Given I am on root other folder
        When I click button menu action brankas
        And I upload other document with type 'jpg'
        And I will see other document has been uploaded
        And I click save document
        And I will see snackbar success upload success
        And I click icon three dot file
        And I click move
        And I will direct to page move folder/files to root other document
        And I cancel move
        Then I will direct to page document brankas

    Scenario: Cancel Move folder/file after create new folder
        Given I am on root other folder
        And I recently have folder in other doc
        When I refresh the page with swipe down screen
        And I click icon three dot folder
        And I click move
        And I click create new folder in move folder/files
        And I fill field new folder with 'ABCDE'
        And I save new folder
        And I see snackbar success create new folder
        And I will see folder contents still empty inside the new folder
        And I cancel move
        Then I will direct to page document brankas with folder that has been created in section other document

    Scenario: Move folder from root to root
        Given I am on root other folder
        And I recently have folder in other doc
        When I refresh the page with swipe down screen
        And I click icon three dot folder
        And I click move
        Then I can't move folder/file to root because button move is disabled

    Scenario: Move folder from root to existing folder
        Given I am on root other folder
        When I click button menu action brankas
        And I click create new folder
        And I fill field new folder with 'Rahasia Perusahaan'
        And I save new folder
        And I see snackbar success create new folder
        And I will direct to page document brankas with folder that has been created in section other document
        And I click button menu action brankas
        And I click create new folder
        And I fill field new folder with 'Folder Penting'
        And I save new folder
        And I see snackbar success create new folder
        And I will direct to page document brankas with folder that has been created in section other document
        And I click icon three dot folder
        And I click move
        And I will direct to page move folder/files to root other document
        And I open folder with name 'Rahasia Perusahaan'
        And I will direct to empty detail folder 'Rahasia Perusahaan'
        And I click move here
        Then I will see snackbar success move folder
        And I will see folder is move to inside the folder

    Scenario: Move folder from root to new folder
        Given I am on root other folder
        And I recently have folder in other doc
        When I refresh the page with swipe down screen
        And I click icon three dot folder
        And I click move
        And I click create new folder in move folder/files
        And I fill field new folder with 'ABCDE'
        And I save new folder
        And I see snackbar success create new folder
        And I will see folder contents still empty inside the new folder
        And I click move here
        Then I will see snackbar success move folder
        And I will see folder is move to inside the folder

    Scenario: Move folder from root to sub folder
        Given I am on root other folder
        When I click button menu action brankas
        And I click create new folder
        And I fill field new folder with 'Rahasia Perusahaan'
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
        And I back from detail folder to root folder
        And I will direct to page document brankas
        And I click button menu action brankas
        And I click create new folder
        And I fill field new folder with 'ABCDE'
        And I save new folder
        And I see snackbar success create new folder
        And I will direct to page document brankas with folder that has been created in section other document
        And I click icon three dot folder
        And I click move
        And I will direct to page move folder/files to root other document
        And I open folder with name 'Rahasia Perusahaan'
        And I will direct to detail folder 'Rahasia Perusahaan' with child 'Segera Dihapus Sekarang'
        And I open folder with name 'Segera Dihapus Sekarang'
        And I will direct to empty detail folder 'Segera Dihapus Sekarang'
        And I click move here
        Then I will see snackbar success move folder
        And I will see folder is move to inside the folder

    Scenario: Move folder from inside folder to root
        Given I am on root other folder
        When I click button menu action brankas
        And I click create new folder
        And I fill field new folder with 'Rahasia Perusahaan'
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
        And I click move
        And I will direct to page move folder/files to root other document
        And I click move here
        Then I will see snackbar success move folder
        And I will see folder is move to root other document

    Scenario: Move folder from sub folder to other sub folder
        Given I am on root other folder
        When I click button menu action brankas
        And I click create new folder
        And I fill field new folder with 'Rahasia Perusahaan'
        And I save new folder
        And I see snackbar success create new folder
        And I will direct to page document brankas with folder that has been created in section other document
        And I open other folder
        And I will see folder contents still empty
        And I click button menu action brankas
        And I click create new folder
        And I fill field new folder with 'Rahasia Perusahaan 1'
        And I save new folder
        And I see snackbar success create new folder
        And I see the new folder is created
        And I open other folder
        And I will see folder contents still empty
        And I click button menu action brankas
        And I click create new folder
        And I fill field new folder with 'Rahasia Perusahaan 2'
        And I save new folder
        And I see snackbar success create new folder
        And I see the new folder is created
        And I open other folder
        And I will see folder contents still empty
        And I click button menu action brankas
        And I click create new folder
        And I fill field new folder with 'Rahasia Perusahaan 3'
        And I save new folder
        And I see snackbar success create new folder
        And I see the new folder is created
        And I click icon three dot folder
        And I click move
        And I will direct to page move folder/files to root other document
        And I open folder with name 'Rahasia Perusahaan'
        And I will direct to detail folder 'Rahasia Perusahaan' with child 'Rahasia Perusahaan 2'
        And I click move here
        Then I will see snackbar success move folder
        And I will see folder 'Rahasia Perusahaan 3' and 'Rahasia Perusahaan 2' is inside folder 'Rahasia Perusahaan'

    Scenario: Move file from root to root
        Given I am on root other folder
        When I click button menu action brankas
        And I upload other document with type 'jpg'
        And I will see other document has been uploaded
        And I click save document
        And I will see snackbar success upload success
        And I click icon three dot file
        And I click move
        Then I can't move folder/file to root because button move is disabled

    Scenario: Move file from root to existing folder
        Given I am on root other folder
        When I click button menu action brankas
        And I click create new folder
        And I fill field new folder with 'Rahasia Perusahaan'
        And I save new folder
        And I see snackbar success create new folder
        And I will direct to page document brankas with folder that has been created in section other document
        And I click button menu action brankas
        And I upload other document with type 'jpg'
        And I will see other document has been uploaded
        And I click save document
        And I will see snackbar success upload success
        And I click icon three dot file
        And I open folder with name 'Rahasia Perusahaan'
        And I will direct to empty detail folder 'Rahasia Perusahaan'
        And I click move here
        Then I will see snackbar success move file
        And I will see file is move to inside the folder

    Scenario: Move file from root to new folder
        Given I am on root other folder
        When I click button menu action brankas
        And I upload other document with type 'jpg'
        And I will see other document has been uploaded
        And I click save document
        And I will see snackbar success upload success
        And I click icon three dot file
        And I click move
        And I click create new folder in move folder/files
        And I fill field new folder with 'ABCDE'
        And I save new folder
        And I see snackbar success create new folder
        And I will see folder contents still empty inside the new folder
        And I click move here
        Then I will see snackbar success move file
        And I will see file is move to inside the folder

    Scenario: Move file from root to sub folder
        Given I am on root other folder
        When I click button menu action brankas
        And I click create new folder
        And I fill field new folder with 'Rahasia Perusahaan'
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
        And I back from detail folder to root folder
        And I will direct to page document brankas
        And I click button menu action brankas
        And I upload other document with type 'jpg'
        And I will see other document has been uploaded
        And I click save document
        And I will see snackbar success upload success
        And I click icon three dot file
        And I click move
        And I will direct to page move folder/files to root other document
        And I open folder with name 'Rahasia Perusahaan'
        And I will direct to detail folder 'Rahasia Perusahaan' with child 'Segera Dihapus Sekarang'
        And I open folder with name 'Segera Dihapus Sekarang'
        And I will direct to empty detail folder 'Segera Dihapus Sekarang'
        And I click move here
        Then I will see snackbar success move file
        And I will see file is move to inside the folder

    Scenario: Move file from inside folder to root
        Given I am on root other folder
        When I click button menu action brankas
        And I click create new folder
        And I fill field new folder with 'Rahasia Perusahaan'
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
        And I click icon three dot file
        And I click move
        And I will direct to page move folder/files to root other document
        And I click move here
        Then I will see snackbar success move file
        And I will see file is move to root other document
        And I open other folder
        And I will see folder contents still empty

    Scenario: Move file from sub folder to other sub folder
        Given I am on root other folder
        When I click button menu action brankas
        And I click create new folder
        And I fill field new folder with 'Rahasia Perusahaan'
        And I save new folder
        And I see snackbar success create new folder
        And I will direct to page document brankas with folder that has been created in section other document
        And I open other folder
        And I will see folder contents still empty
        And I click button menu action brankas
        And I click create new folder
        And I fill field new folder with 'Rahasia Perusahaan 1'
        And I save new folder
        And I see snackbar success create new folder
        And I see the new folder is created
        And I open other folder
        And I will see folder contents still empty
        And I click button menu action brankas
        And I click create new folder
        And I fill field new folder with 'Rahasia Perusahaan 2'
        And I save new folder
        And I see snackbar success create new folder
        And I see the new folder is created
        And I open other folder
        And I will see folder contents still empty
        And I click button menu action brankas
        And I upload other document with type 'jpg'
        And I will see other document has been uploaded
        And I click save document
        And I will see snackbar success upload success
        And I click icon three dot file
        And I click move
        And I will direct to page move folder/files to root other document
        And I open folder with name 'Rahasia Perusahaan'
        And I will direct to detail folder 'Rahasia Perusahaan' with child 'Rahasia Perusahaan 2'
        And I click move here
        Then I will see snackbar success move file
        And I will see file with folder 'Rahasia Perusahaan 2' is inside folder 'Rahasia Perusahaan'

    Scenario: Move folder to a specific path with naming folder is same
        Given I am on root other folder
        When I click button menu action brankas
        And I click create new folder
        And I fill field new folder with 'Rahasia Perusahaan'
        And I save new folder
        And I see snackbar success create new folder
        And I will direct to page document brankas with folder that has been created in section other document
        And I open other folder
        And I will see folder contents still empty
        And I click button menu action brankas
        And I click create new folder
        And I fill field new folder with 'Rahasia Perusahaan 1'
        And I save new folder
        And I see snackbar success create new folder
        And I see the new folder is created
        And I back from detail folder to root folder
        And I will direct to page document brankas
        And I click button menu action brankas
        And I click create new folder
        And I fill field new folder with 'Rahasia Perusahaan 1'
        And I save new folder
        And I see snackbar success create new folder
        And I will direct to page document brankas with folder that has been created in section other document
        And I click icon three dot folder
        And I click move
        And I will direct to page move folder/files to root other document 
        And I open other folder
        And I will direct to detail folder 'Rahasia Perusahaan' with child 'Rahasia Perusahaan 1'
        And I click move here
        Then I will see snackbar success move folder
        And I will see folder 'Rahasia Perusahaan 1' and 'Rahasia Perusahaan 1' is inside folder 'Rahasia Perusahaan'

    Scenario: Move file to a specific path with naming file is same
        Given I am on root other folder
        When I click button menu action brankas
        And I click create new folder
        And I fill field new folder with 'Rahasia Perusahaan'
        And I save new folder
        And I see snackbar success create new folder
        And I will direct to page document brankas with folder that has been created in section other document
        And I click button menu action brankas
        And I upload other document with type 'jpg'
        And I will see other document has been uploaded
        And I click save document
        And I will see snackbar success upload success
        And I open other folder
        And I will see folder contents still empty
        And I click button menu action brankas
        And I upload other document with type 'jpg'
        And I will see other document has been uploaded
        And I click save document
        And I will see snackbar success upload success
        And I click icon three dot file
        And I click move
        And I will direct to page move folder/files to root other document
        And I click move here
        Then I will see snackbar success move file
        And I will see both file is move to root other document
        And I open other folder
        And I will see folder contents still empty

    Scenario: Back to root from subfolder in feature move file and folder
        Given I am on root other folder
        When I click button menu action brankas
        And I click create new folder
        And I fill field new folder with 'Rahasia Perusahaan'
        And I save new folder
        And I see snackbar success create new folder
        And I will direct to page document brankas with folder that has been created in section other document
        And I open other folder
        And I will see folder contents still empty
        And I click button menu action brankas
        And I click create new folder
        And I fill field new folder with 'Rahasia Perusahaan 2'
        And I save new folder
        And I see snackbar success create new folder
        And I see the new folder is created
        And I open detail other folder
        And I will see folder contents still empty
        And I click button menu action brankas
        And I click create new folder
        And I fill field new folder with 'Rahasia Perusahaan 3'
        And I save new folder
        And I see snackbar success create new folder
        And I see the new folder is created
        And I click icon three dot file
        And I click move
        And I will direct to page move folder/files to root other document
        And I open folder with name 'Rahasia Perusahaan'
        And I will direct to detail folder 'Rahasia Perusahaan' with child 'Rahasia Perusahaan 2'
        And I open folder with name 'Rahasia Perusahaan 2'
        And I will direct to detail folder 'Rahasia Perusahaan 2' with child 'Rahasia Perusahaan 3'
        And I click back in header page
        And I will direct to detail folder 'Rahasia Perusahaan' with child 'Rahasia Perusahaan 2'
        And I click back in header page
        Then I will direct to page move folder/files to root other document