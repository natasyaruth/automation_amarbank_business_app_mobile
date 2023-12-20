Feature: Account Deletion
    In order to deactivated my account
    As a customer
    I want to delete my account

    Scenario: Close in page how to delete account and important information
        Given I am a registered customer with following details:
            | userID   | autocaea |
            | password | 1234Test |
        And I filling in form login with the following details:
            | userID   | autocaea |
            | password | 1234Test |
        And I click login
        And I click later
        And I will see card account 'active'
        When I go to page other
        And I click menu delete account
        And I see page information account deletion
        And I click close in header page
        Then I will back to menu other

    Scenario: Close in page verification account delete
        Given I am a registered customer with following details:
            | userID   | autocaea |
            | password | 1234Test |
        And I filling in form login with the following details:
            | userID   | autocaea |
            | password | 1234Test |
        And I click login
        And I click later
        And I will see card account 'active'
        When I go to page other
        And I click menu delete account
        And I continue to verification delete account
        And I see my user id and field password
        And I click close in header page
        Then I will back to menu other

    Scenario: Close in page input reason account delete
        Given I am a registered customer with following details:
            | userID   | autocaea                                 |
            | password | 1234Test                                 |
            | email    | auto.integrate.upload.doc@trash-mail.com |
        And I filling in form login with the following details:
            | userID   | autocaea |
            | password | 1234Test |
        And I click login
        And I click later
        And I will see card account 'active'
        When I go to page other
        And I click menu delete account
        And I continue to verification delete account
        And I fill my password account deletion
        And I verify my data account deletion
        And I see field reason and my email
        And I click close in header page
        Then I will back to menu other

    Scenario: Verify account deletion with incorrect password
        Given I am a registered customer with following details:
            | userID   | autocaea |
            | password | 1234Test |
        And I filling in form login with the following details:
            | userID   | autocaea |
            | password | 1234Test |
        And I click login
        And I click later
        And I will see card account 'active'
        When I go to page other
        And I click menu delete account
        And I continue to verification delete account
        And I fill incorrect password account deletion
        And I verify my data account deletion
        Then I should see pop up with text 'Data Yang Dimasukkan Salah' displayed
        And I can click button try again

    Scenario: Input password and then delete
        Given I am a registered customer with following details:
            | userID   | autocaea |
            | password | 1234Test |
        And I filling in form login with the following details:
            | userID   | autocaea |
            | password | 1234Test |
        And I click login
        And I click later
        And I will see card account 'active'
        When I go to page other
        And I click menu delete account
        And I continue to verification delete account
        And I fill my password account deletion
        And I delete my password
        Then I see button verify is disable

    Scenario: User unmask and mask password
        Given I am a registered customer with following details:
            | userID   | autocaea |
            | password | 1234Test |
        And I filling in form login with the following details:
            | userID   | autocaea |
            | password | 1234Test |
        And I click login
        And I click later
        And I will see card account 'active'
        When I go to page other
        And I click menu delete account
        And I continue to verification delete account
        And I fill my password account deletion
        And I unmask my password
        Then I will see my password
        When I mask my password
        Then I will not see my password

    Scenario Outline: Input reason delete account with invalid value
        Given I am a registered customer with following details:
            | userID   | autocaea |
            | password | 1234Test |
        And I filling in form login with the following details:
            | userID   | autocaea |
            | password | 1234Test |
        And I click login
        And I click later
        And I will see card account 'active'
        When I go to page other
        And I click menu delete account
        And I continue to verification delete account
        And I fill my password account deletion
        And I verify my data account deletion
        And I fill my reason account deletion with '<Value>'
        Then I will see message error '<Message>' in the below of field reason
        Examples:                                                                 ❸
            | testRailTag | Value                                                | Message                                            |
            |             |                                                      | Alasan hapus akun wajib diisi                      |
            |             | Ruth Natasya Natasya Natasya Natasya Natasya Natasya | Alasan hapus akun minimal 3 & maksimal 60 karakter |
            |             | R                                                    | Alasan hapus akun minimal 3 & maksimal 60 karakter |

    Scenario: Input reason delete account with alphanumeric and special char
        Given I am a registered customer with following details:
            | userID   | autocaea |
            | password | 1234Test |
        And I filling in form login with the following details:
            | userID   | autocaea |
            | password | 1234Test |
        And I click login
        And I click later
        And I will see card account 'active'
        When I go to page other
        And I click menu delete account
        And I continue to verification delete account
        And I fill my password account deletion
        And I verify my data account deletion
        And I fill my reason account deletion with 'Sudah tidak menjadi bagian dari perusahaan @b123.'
        Then I will not see message error in the below of field reason

    Scenario: Input reason delete account and then delete
        Given I am a registered customer with following details:
            | userID   | autocaea |
            | password | 1234Test |
        And I filling in form login with the following details:
            | userID   | autocaea |
            | password | 1234Test |
        And I click login
        And I click later
        And I will see card account 'active'
        When I go to page other
        And I click menu delete account
        And I continue to verification delete account
        And I fill my password account deletion
        And I verify my data account deletion
        And I fill my reason account deletion with 'Sudah tidak menjadi bagian dari perusahaan ini'
        And I delete my reason
        Then I will see message error 'Alasan hapus akun wajib diisi' in the below of field reason
        And I see button request delete account is disable

    Scenario: Submit request account deletion with reason empty
        Given I am a registered customer with following details:
            | userID   | autocaea |
            | password | 1234Test |
        And I filling in form login with the following details:
            | userID   | autocaea |
            | password | 1234Test |
        And I click login
        And I click later
        And I will see card account 'active'
        When I go to page other
        And I click menu delete account
        And I continue to verification delete account
        And I fill my password account deletion
        And I verify my data account deletion
        And I let field reason empty
        Then I see button request delete account is disable

    Scenario: Delete account active Individual
        Given I am a registered customer with following details:
            | userID   | autocaea |
            | password | 1234Test |
        And I filling in form login with the following details:
            | userID   | autocaea |
            | password | 1234Test |
        And I click login
        And I click later
        And I will see card account 'active'
        When I go to page other
        And I click menu delete account
        And I continue to verification delete account
        And I fill my password account deletion
        And I verify my data account deletion
        And I fill my reason account deletion with 'Sudah tidak menjadi bagian dari perusahaan ini'
        And I submit my request account deletion
        Then I will see message waiting to send the request
        And I will direct to page my request account deletion still on process
        And I click close in header page
        And I will back to menu other

    Scenario: Delete account on process Individual
        Given I am a registered customer with following details:
            | userID   | ruth152d |
            | password | 1234Test |
        And I filling in form login with the following details:
            | userID   | ruth152d |
            | password | 1234Test |
        And I click login
        And I click later
        And I will see card account 'on process'
        When I go to page other
        And I click menu delete account
        And I continue to verification delete account
        And I fill my password account deletion
        And I verify my data account deletion
        And I fill my reason account deletion with 'Sudah tidak menjadi bagian dari perusahaan ini'
        And I submit my request account deletion
        Then I will see message waiting to send the request
        And I will direct to page my request account deletion still on process
        And I click close in header page
        And I will back to menu other

    Scenario: Delete account on verification Individual
        Given I am a registered customer with following details:
            | userID   | auto4424 |
            | password | 1234Test |
        And I filling in form login with the following details:
            | userID   | auto4424 |
            | password | 1234Test |
        And I click login
        And I click later
        And I will see card account 'on verification'
        When I go to page other
        And I click menu delete account
        And I continue to verification delete account
        And I fill my password account deletion
        And I verify my data account deletion
        And I fill my reason account deletion with 'Sudah tidak menjadi bagian dari perusahaan ini'
        And I submit my request account deletion
        Then I will see message waiting to send the request
        And I will direct to page my request account deletion still on process
        And I click close in header page
        And I will back to menu other

    Scenario: Access menu delete account after process delete account active Individual
        Given I am a registered customer with following details:
            | userID   | auto4424 |
            | password | 1234Test |
        And I filling in form login with the following details:
            | userID   | auto4424 |
            | password | 1234Test |
        And I click login
        And I click later
        And I will see card account 'on verification'
        When I go to page other
        And I click menu delete account
        Then I will direct to page my request account deletion still on process
        And I click close in header page
        And I will back to menu other

    Scenario: Delete account active Business
        Given I am a registered customer with following details:
            | userID   | auto3a2f |
            | password | 1234Test |
        And I filling in form login with the following details:
            | userID   | auto3a2f |
            | password | 1234Test |
        And I click login
        And I click later
        And I will see card account 'active'
        When I go to page other
        And I click menu delete account
        And I continue to verification delete account
        And I fill my password account deletion
        And I verify my data account deletion
        And I fill my reason account deletion with 'Sudah tidak menjadi bagian dari perusahaan ini'
        And I submit my request account deletion
        Then I will see message waiting to send the request
        And I will direct to page my request account deletion still on process
        And I click close in header page
        And I will back to menu other

    Scenario: Delete account on process Business
        Given I am a registered customer with following details:
            | userID   | auto436d |
            | password | 1234Test |
        And I filling in form login with the following details:
            | userID   | auto436d |
            | password | 1234Test |
        And I click login
        And I click later
        And I will see card account 'complete document'
        When I go to page other
        And I click menu delete account
        And I continue to verification delete account
        And I fill my password account deletion
        And I verify my data account deletion
        And I fill my reason account deletion with 'Sudah tidak menjadi bagian dari perusahaan ini'
        And I submit my request account deletion
        Then I will see message waiting to send the request
        And I will direct to page my request account deletion still on process
        And I click close in header page
        And I will back to menu other

    Scenario: Delete account on verification Business
        Given I am a registered customer with following details:
            | userID   | auto79e2 |
            | password | 1234Test |
        And I filling in form login with the following details:
            | userID   | auto79e2 |
            | password | 1234Test |
        And I click login
        And I click later
        And I will see card account 'on verification'
        When I go to page other
        And I click menu delete account
        And I continue to verification delete account
        And I fill my password account deletion
        And I verify my data account deletion
        And I fill my reason account deletion with 'Sudah tidak menjadi bagian dari perusahaan ini'
        And I submit my request account deletion
        Then I will see message waiting to send the request
        And I will direct to page my request account deletion still on process
        And I click close in header page
        And I will back to menu other

    Scenario: Access menu delete account after process delete account active Business
        Given I am a registered customer with following details:
            | userID   | auto79e2 |
            | password | 1234Test |
        And I filling in form login with the following details:
            | userID   | auto79e2 |
            | password | 1234Test |
        And I click login
        And I click later
        And I will see card account 'on verification'
        When I go to page other
        And I click menu delete account
        Then I will direct to page my request account deletion still on process
        And I click close in header page
        And I will back to menu other