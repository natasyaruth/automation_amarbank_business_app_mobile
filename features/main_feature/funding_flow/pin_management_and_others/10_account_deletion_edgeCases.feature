# @regressionTest
Feature: AUTOMATED Account Deletion Edge Cases
    In order to deactivated my account
    As a customer
    I want to delete my account

    Background: User Login For Delete Account Page
        Given I am a registered customer with following details:
            | userID      | autocaea |
            | password    | 1234Test |
            | userIDstg   | stag76ee |
            | passwordStg | Test1234 |
        And I filling in form login with the following details:
            | userID      | autocaea |
            | password    | 1234Test |
            | userIDstg   | stag76ee |
            | passwordStg | Test1234 |
        And I click login
        # And I click later in pop up biometric
        Then I will see card account 'active'
    
    Scenario: AUTOMATED Close in page how to delete account and important information
        Given I choose other
        When I go to page other
        And I click menu delete account
        And I see page information account deletion
        And I click close in header page
        Then I will back to menu other

    
    Scenario: AUTOMATED Close in page verification account delete
        Given I choose other
        When I go to page other
        And I click menu delete account
        And I continue to verification delete account
        And I see my user id and field password
        And I click close in header page
        Then I will back to menu other

    
    # Scenario: AUTOMATED Close in page input reason account delete
    #     Given I choose other
    #     When I go to page other
    #     And I click menu delete account
    #     And I continue to verification delete account
    #     And I fill my password account deletion
    #     And I verify my data account deletion
    #     And I see field reason and my email
    #     And I click close in header page
    #     Then I will back to menu other

    
    # Scenario: AUTOMATED Verify account deletion with incorrect password
    #     Given I choose other
    #     When I go to page other
    #     And I click menu delete account
    #     And I continue to verification delete account
    #     And I fill incorrect password account deletion
    #     And I verify my data account deletion
    #     Then I should see pop up with text 'Data Yang Dimasukkan Salah' displayed
    #     And I can click button try again

    # Scenario Outline: AUTOMATED Input reason delete account with invalid value
    #     Given I choose other
    #     When I go to page other
    #     And I click menu delete account
    #     And I continue to verification delete account
    #     And I fill my password account deletion
    #     And I verify my data account deletion
    #     And I fill my reason account deletion with '<Value>'
    #     Then I will see message error '<Message>' in the below of field reason
    #     Examples:                                                                 ❸
    #         | testRailTag | Value                                                | Message                                            |
    #         | @C101650    |                                                      | Alasan hapus akun wajib diisi                      |
    #         | @C101651    | Ruth Natasya Natasya Natasya Natasya Natasya Natasya | Alasan hapus akun minimal 3 & maksimal 60 karakter |
    #         | @C101652    | R                                                    | Alasan hapus akun minimal 3 & maksimal 60 karakter |

    
    # Scenario: AUTOMATED Input reason delete account with alphanumeric and special char
    #     Given I choose other
    #     When I go to page other
    #     And I click menu delete account
    #     And I continue to verification delete account
    #     And I fill my password account deletion
    #     And I verify my data account deletion
    #     And I fill my reason account deletion with 'Sudah tidak menjadi bagian dari perusahaan @b123.'
    #     Then I will not see message error in the below of field reason