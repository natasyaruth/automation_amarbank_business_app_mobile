Feature: Login by email
  In order to login by email
  As a customer
  I want to login by click button "Masuk Akun" from email

Scenario: Login account by email
        Given I am a user want login by email
        When I do process register 
        And I input otp code
        And I got email notification 
        And I open the email
        And I click button "Masuk Akun" on email
        Then I directly to app on login page
        And User ID will automatically fill on field user ID
        And I can login by email
        And I direct to dashboard

Scenario: Validate email content
        Given I am a user want login by email
        When I do process register 
        And I input otp code
        Then I got email notification
        And I validate email content according to figma