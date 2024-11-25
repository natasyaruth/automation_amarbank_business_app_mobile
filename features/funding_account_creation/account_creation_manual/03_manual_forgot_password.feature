Feature: Manual Account Forgot Password
    In order to going to SMB dashboard while forgot user password
    As a customer
    I want to reset password

    @C166007
    Scenario: Reset password from link forgot password in page login - Individual
        Given I am a customer want to reset password
        When I direct to page login
        And I click link forgot password
        And I fill user id and email
        And I click reset password
        And I will receive email reset password
        And I click reset password link in email
        And I input new password
        And I input confirm new password
        And I click reset password
        And I will direct to page reset password successful changes
        And I can click button direct to login

    @C166008
    Scenario: Reset password from link forgot password in page login - Business
        Given I am a customer want to reset password
        When I direct to page login
        And I click link forgot password
        And I fill user id and email
        And I click reset password
        And I will see pop up confirm reset password contain with company name
        And I confirm to reset password
        And I will receive email reset password
        And I click reset password link in email
        And I input new password
        And I input confirm new password
        And I click reset password
        And I will direct to page reset password successful changes
        And I can click button direct to login    

    @C166009
    Scenario: Check content email reset password
        Given I am a customer that was have sent email to reset password
        When I check email
        Then I will see content email same as figma design

    @C166010
    Scenario: Check content email reset password successful
        Given I am a customer that was successfully change my password
        When I check email
        Then I will see content email same as figma design

    @C166011
    Scenario: Login after success reset password
        Given I am a customer that was successfully change my password
        When I go to page login
        And I fill user id with password that recently change
        Then I will direct to dashboard