Feature: Account Change Password
    In order to secure my data
    As a customer
    I want to change my password

    @C141167
    Scenario: Change password after 10 minutes blocked login
        Given I wait within 10 minutes after failed to login three times
        When I login with correct data
        And I will directing to main dashboard
        And I go to tab other
        And I click change password
        And I input my old password
        And I input my new password different with old password
        And I input my confirm password
        And I submit my new password
        And I input my OTP code
        Then I will see my password successfully changes
        And I can login with my new password

    @C141168
    Scenario: Check SMS OTP
        Given I submit my new password
        And I am on page OTP code
        When I see snackbar information my otp code has been sent to my phone number
        Then I receive SMS contain with OTP
    
    @C141169
    Scenario: Check email success change password
        Given I am successfully change my password
        When I check my inbox
        Then I will receive email success change password
        And contain with information date and time when I change my password

    @C141170
    Scenario: Drop off in page input OTP
        Given I submit my new password
        And I am on page OTP code
        When I drop off or kill app
        And back again to app
        And I try to login
        And I access again change password
        And I submit my new password
        Then I will see timing OTP back to 59 second

    @C141171
    Scenario: Try change password h+1 after blocked OTP
        Given I try to change my password
        And get blocked send OTP H+1 yesterday
        When I try again to change password today
        And I submit my new password
        Then I will direct to page OTP with attempt resend OTP is 0/5
        And I can input the otp
        And my password is change successfully
