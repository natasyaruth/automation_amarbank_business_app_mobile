# @regressionTest
Feature: AUTOMATED Account Change Password
    In order to secure my data
    As a customer
    I want to change my password

    Background: User Login and Go to Main Dashboard
        Given I am a registered customer with following details:
            | userID      | ruth17a5 |
            | password    | Test1234 |
            | userIDstg   | gakp7d0e |
            | passwordStg | Test1234 |
        When I filling in form login with the following details:
            | userID      | ruth17a5 |
            | password    | Test1234 |
            | userIDstg   | gakp7d0e |
            | passwordStg | Test1234 |
        And I click login
        And I click later in pop up biometric
        Then I will see card account 'active'

    Scenario: AUTOMATED Close Page in form input old password
        Given I choose other
        When I go to page other
        And I click menu change password
        And I will direct to page input old password
        And I close page input old password
        And I will see pop up cancel change password
        And I click button cancel change password
        Then I will direct to Tab Other

    Scenario: AUTOMATED Close page in form input new password
        Given I choose other
        When I go to page other
        And I click menu change password
        Then I will direct to page input old password
        And I input my old password
        And I click next to input new password
        And I will direct to page form input new password
        And I close page input new password
        And I will see pop up cancel change password
        And I click button cancel change password
        Then I will direct to Tab Other

    Scenario: AUTOMATED Cancel close page in form input old password
        Given I choose other
        When I go to page other
        And I click menu change password
        And I will direct to page input old password
        And I close page input old password
        And I will see pop up cancel change password
        And I click button back to change password
        Then I will direct to page input old password

    Scenario: AUTOMATED Cancel close page in form input new password
        Given I choose other
        When I go to page other
        And I click menu change password
        Then I will direct to page input old password
        And I input my old password
        And I click next to input new password
        And I will direct to page form input new password
        And I close page input new password
        And I will see pop up cancel change password
        And I click button back to change password
        Then I will direct to page form input new password

    Scenario: AUTOMATED Mask Old Password
        Given I choose other
        When I go to page other
        And I click menu change password
        Then I will direct to page input old password
        And I input my old password
        And I unmask my old password
        And I mask my old password
        Then I will not see my password

    Scenario: AUTOMATED Unmask Old Password
        Given I choose other
        When I go to page other
        And I click menu change password
        Then I will direct to page input old password
        And I input my old password
        And I unmask my old password
        Then I will see my password
 
    Scenario: AUTOMATED Input old password and then delete
        Given I choose other
        When I go to page other
        And I click menu change password
        Then I will direct to page input old password
        And I input my old password
        And I clear my old password
        Then I will notify by message error 'Password wajib diisi' in field 'oldPassword'

    Scenario: AUTOMATED Input old password with only whitespace
        Given I choose other
        When I go to page other
        And I click menu change password
        Then I will direct to page input old password
        And I input my old password with whitespace
        Then I will notify by message error 'Password wajib diisi' in field 'oldPassword'    

    Scenario: AUTOMATED Input old password with space in the front
        Given I choose other
        When I go to page other
        And I click menu change password
        Then I will direct to page input old password
        And I input my old password with space in front
        And I unmask my old password
        Then I will see my password

    Scenario: AUTOMATED Input old password with whitespace in the middle
        Given I choose other
        When I go to page other
        And I click menu change password
        Then I will direct to page input old password
        And I input my old password with space in the middle
        And I unmask my old password
        Then I will not see my password
        And I will not see message error 'Password wajib diisi' in field 'oldPassword'

    Scenario: AUTOMATED Input old password with whitespace in the back
        Given I choose other
        When I go to page other
        And I click menu change password
        Then I will direct to page input old password
        And I input my old password with space in the back
        And I unmask my old password
        Then I will not see my password
        And I will not see message error 'Password wajib diisi' in field 'oldPassword'       

    Scenario: AUTOMATED Submit password with field still empty
        Given I choose other
        When I go to page other
        And I click menu change password
        Then I will direct to page input old password
        And I click next to input new password
        Then I will notify by message error 'Password wajib diisi' in field 'oldPassword'

    Scenario: AUTOMATED Input wrong old password once
        Given I choose other
        When I go to page other
        And I click menu change password
        Then I will direct to page input old password
        And I input incorrect old password
        And I click next to input new password
        Then I will see pop up data is incorrect
        And I can click try again to input password
        And I reset attempt failed login

    Scenario: AUTOMATED Input wrong old password twice
        Given I choose other
        When I go to page other
        And I click menu change password
        Then I will direct to page input old password
        And I input incorrect old password
        And I click next to input new password
        And I will see pop up data is incorrect
        And I try again to input password
        And I click next to input new password
        Then I will see pop up data is incorrect
        And I can click try again to input password
        And I reset attempt failed login

    Scenario: AUTOMATED Input wrong old password three times
        Given I choose other
        When I go to page other
        And I click menu change password
        Then I will direct to page input old password
        And I input incorrect old password
        And I click next to input new password
        And I will see pop up data is incorrect
        And I try again to input password
        And I click next to input new password
        And I will see pop up data is incorrect
        And I try again to input password
        And I click next to input new password
        Then I will notify I will direct lo login page
        And I click button direct to login
        And I will directing to page login
        And I reset attempt failed login

    
    Scenario: AUTOMATED Input wrong old password first and then correct password
        Given I choose other
        When I go to page other
        And I click menu change password
        Then I will direct to page input old password
        And I input incorrect old password
        And I click next to input new password
        And I will see pop up data is incorrect
        And I can click try again to input password
        And I clear my old password
        And I input my old password
        And I click next to input new password
        Then I will direct to page form input new password
        And I reset attempt failed login