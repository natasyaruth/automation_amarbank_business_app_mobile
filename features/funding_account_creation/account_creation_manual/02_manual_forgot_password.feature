Feature: Manual Account Forgot Password
    In order to going to SMB dashboard while forgot user password
    As a customer
    I want to reset password

    @C133816
    Scenario: Process reset password from email (journey from forgot password in page login)
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

    @C133817
    Scenario: Process reset password from email (journey from change password in tab other)
        Given I am a customer want to reset password
        And I am on dashboard
        When I click tab other
        And I click menu change password
        And I fill user id and email
        And I click reset password
        And I will receive email reset password
        And I click reset password link in email
        And I input new password
        And I input confirm new password
        And I click reset password
        And I will direct to page reset password successful changes
        And I can click button direct to login

    @C133818
    Scenario: Check content email reset password
        Given I am a customer that was have sent email to reset password
        When I check email
        Then I will see content email same as figma design

    @C133819
    Scenario: Check content email reset password successful
        Given I am a customer that was successfully change my password
        When I check email
        Then I will see content email same as figma design

    @C133820
    Scenario: Login after success reset password
        Given I am a customer that was successfully change my password
        When I go to page login
        And I fill user id with password that recently change
        Then I will direct to dashboard