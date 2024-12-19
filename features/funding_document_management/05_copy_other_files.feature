Feature: Brankas - Copy Other Files
    As a customer
    I want to duplicate other document in brankas

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

    Scenario: Copy other files
        Given I am on root other folder
        When I click button menu action brankas
        And I upload other document with type 'jpg'
        And I will see other document has been uploaded
        And I click save document
        And I will see snackbar success upload success
        And I will direct to page other document with document that has been uploaded is in there
        And I click icon three dot file
        And I click copy files
        Then I will see snackbar success copy files
        And I will see the copied files with text copy in the front name
        And I see list document is ordered alphabetical 

    Scenario: Copy other files twice
        Given I am on root other folder
        When I click button menu action brankas
        And I upload other document with type 'jpg'
        And I will see other document has been uploaded
        And I click save document
        And I will see snackbar success upload success
        And I will direct to page other document with document that has been uploaded is in there
        And I click icon three dot file
        And I click copy files
        And I will see snackbar success copy files
        And I will see the copied files with text copy in the front name
        And I see list document is ordered alphabetical
        And I click icon three dot file that has been copied before
        And I click copy files
        And I will see snackbar success copy files
        Then I will see the copied files with text copy in the front name
        And I see list document is ordered alphabetical 

    Scenario: Copy the copied files
        Given I am on root other folder
        When I click button menu action brankas
        And I upload other document with type 'jpg'
        And I will see other document has been uploaded
        And I click save document
        And I will see snackbar success upload success
        And I will direct to page other document with document that has been uploaded is in there
        And I click icon three dot file
        And I click copy files
        And I will see snackbar success copy files
        And I will see the copied files with text copy in the front name
        And I see list document is ordered alphabetical
        And I click icon three dot file
        And I click copy files
        And I will see snackbar success copy files
        Then I will see the copied files with text copy in the front name
        And I see list document is ordered alphabetical 

    Scenario: Copy files inside folder
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
        And I click button menu action brankas
        And I upload other document with type 'jpg'
        And I will see other document has been uploaded
        And I click save document
        And I will see snackbar success upload success
        And I click icon three dot file
        And I click copy files
        And I will see snackbar success copy files
        Then I will see the copied files with text copy in the front name

    Scenario: Edit file copied name into existing file name
        Given I am on root other folder
        When I click button menu action brankas
        And I upload other document with type 'jpg'
        And I will see other document has been uploaded
        And I click save document
        And I will see snackbar success upload success
        And I will direct to page other document with document that has been uploaded is in there
        And I click icon three dot file
        And I click copy files
        And I will see snackbar success copy files
        And I will see the copied files with text copy in the front name
        And I click icon three dot file
        And I click edit file name
        And I edit file name same with file name as before
        And I click change name
        Then I will see snackbar success change file name
        And I will see both files with same filename in root other document