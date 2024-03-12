Feature: Account Forgot Password
  In order to going to SMB dashboard while forgot user password
  As a customer
  I want to reset password

  @forgotPassword @C96654
  Scenario: Reset password with user ID is empty
    Given I am a customer want to reset password
    When I leave field User ID empty
    And I input email for reset password with value 'ruth.hutauruk@amarbank.co.id'
    And I click button Reset Password
    Then I should be notified 'User ID wajib diisi' in the below of field 'userID'

  @forgotPassword @C96655
  Scenario: Reset password with user ID hasn't been registered
    Given I am a customer want to reset password
    When I am filling field User ID with 'JOHN1232'
    And I input email for reset password with value 'ruth.hutauruk@amarbank.co.id'
    And I click button Reset Password
    Then I should be notified 'User ID tidak terdaftar' in the below of field 'userID'

  Scenario Outline: Verifying email for reset password with invalid value
    Given I am a customer want to reset password
    When I input email for reset password with value '<Value>'
    Then I should be notified '<Message>' in the below of field 'email'
    Examples:                                                                 ❸
      | testRailTag | Value                  | Message                    |
      |             | ruth.natasyagmail.com  | E-mail tidak sesuai format |
      |             | ruth natasya@gmail.com | E-mail tidak sesuai format |
      |             |                        | E-mail wajib diisi         |

  Scenario: Fill form reset password with user id and email is not match
    Given I am a customer want to reset password
    When I am filling field User ID with 'autocaea'
    And I input email for reset password with value 'ruth.hutauruk@amarbank.co.id'
    And I click button Reset Password
    Then I will see pop up information reset password with text 'Jika 3 kali salah, Anda akan langsung diarahkan ke halaman Masuk Akun'
    And I click try again to reset password

  Scenario: Fill form reset password with user id and email is not match 3 times
    Given I am a customer want to reset password
    When I am filling field User ID with 'autocaea'
    And I input email for reset password with value 'ruth.hutauruk@amarbank.co.id'
    And I click button Reset Password
    And I will see pop up information reset password with text 'Jika 3 kali salah, Anda akan langsung diarahkan ke halaman Masuk Akun'
    And I click try again to reset password
    And I click button Reset Password
    And I will see pop up information reset password with text 'Jika 3 kali salah, Anda akan langsung diarahkan ke halaman Masuk Akun'
    And I click try again to reset password
    And I click button Reset Password
    Then I will see pop up information reset password with text 'Anda akan langsung diarahkan ke halaman Masuk Akun'
    And I click button direct to login
    And I will directing to page login

  Scenario: Fill form reset password with user id and email is match after fill form with user id and email is not match 3 times
    Given I am a customer want to reset password
    When I am filling field User ID with 'autocaea'
    And I input email for reset password with value 'ruth.hutauruk@amarbank.co.id'
    And I click button Reset Password
    And I will see pop up information reset password with text 'Jika 3 kali salah, Anda akan langsung diarahkan ke halaman Masuk Akun'
    And I click try again to reset password
    And I click button Reset Password
    And I will see pop up information reset password with text 'Jika 3 kali salah, Anda akan langsung diarahkan ke halaman Masuk Akun'
    And I click try again to reset password
    And I click button Reset Password
    And I will see pop up information reset password with text 'Anda akan langsung diarahkan ke halaman Masuk Akun'
    And I click button direct to login
    And I click link forgot password
    When I am filling field User ID with 'autocaea'
    And I input email for reset password with value 'auto.integrate.upload.doc@trash-mail.com'
    And I click button Reset Password
    Then I will see information about the reset password can be done in the next 10 minutes

  @forgotPassword @C96656
  Scenario: Reset password with user ID has been registered
    Given I am a customer want to reset password
    When I am filling field User ID with 'ruth79f5'
    And I input email for reset password with value 'natasyaruth03@gmail.com'
    And I click button Reset Password
    Then I should be notified that email Reset Password successfully sent

  @forgotPassword @C96657
  Scenario: Resend email reset password
    Given I am a customer with User ID 'ruth5010' and email 'rut.testing@email.com' has already requested a password reset
    And who has not received the reset password email
    When I resend email reset password
    Then I should be notified that email reset password has been successfully sent

  @C96658
  Scenario: Reset password with user ID from invitation business
    Given I am a customer has User ID 'autoeb6a' and company name 'Automation Jangan Dipake'
    When I am filling field User ID with 'autoeb6a'
    And I input email for reset password with value 'auto.integrate.upload.doc@trash-mail.com'
    And I click button Reset Password
    And I click button confirmation reset password
    Then I should be notified that email Reset Password successfully sent

  @C96659
  Scenario: Back to page reset password from pop up confirmation
    Given I am a customer has User ID 'autoeb6a' and company name 'Automation Jangan Dipake'
    When I am filling field User ID with 'autoeb6a'
    And I input email for reset password with value 'auto.integrate.upload.doc@trash-mail.com'
    And I click button Reset Password
    And I click button back from pop up reset password
    Then I should back to page reset password with field User ID still filled

  @forgotPassword @C96660
  Scenario: Back to page login from page reset password
    Given I am a customer want to reset password
    When I click button back in the header page
    Then I will directing to page login
