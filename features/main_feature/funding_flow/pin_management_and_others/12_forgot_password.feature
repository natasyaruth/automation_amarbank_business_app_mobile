Feature: Account Forgot Password
  In order to going to SMB dashboard while forgot user password
  As a customer
  I want to reset password

   
  Scenario: Reset password with user ID is empty
    Given I am a customer want to reset password
    And I leave field User ID empty
    When I click button Reset Password
    Then I should be notified 'User ID wajib diisi'

   
  Scenario: Reset password with user ID hasn't been registered
    Given I am a customer want to reset password
    When I am filling field User ID with 'JOHN1232'
    And I click button Reset Password
    Then I should be notified 'User ID tidak terdaftar'

   
  Scenario: Reset password with user ID has been registered
    Given I am a customer want to reset password
    When I am filling field User ID with 'nugr0426'
    And I click button Reset Password
    Then I should be notified that email Reset Password successfully sent

   
  Scenario: Resend email reset password
    Given I am a customer with User ID 'nugr0426' has already requested a password reset
    And who has not received the reset password email
    When I resend email reset password
    Then I should be notified that email reset password has been successfully sent

  
  Scenario: Reset password with user ID from invitation business
    Given I am a customer has User ID '' and company name ''
    When I am filling field User ID with ''
    And I click button Reset Password
    And I click button confirmation reset password
    Then I should be notified that email Reset Password successfully sent

  
  Scenario: Back to page reset password from pop up confirmation
    Given I am a customer has User ID '' and company name ''
    When I am filling field User ID with ''
    And I click button Reset Password
    And I click button back from pop up reset password
    Then I should back to page reset password with field User ID still filled

  
  Scenario: Back to page login from page reset password
    Given I am a customer want to reset password
    When I click button back in the header page
    Then I will directing to page login
