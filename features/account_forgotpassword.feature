Feature: Account Forgot Password
  In order to going to SMB dashboard while forgot user password
  As a customer
  I want to reset password 

@C81357
Scenario: Input UserID with empty value
  Given I am a customer want to reset password 
  When I am filling field 'userID' with ' '
  And click button Reset Password
  Then I should see message error 'User ID belum diregistrasi' in the below of field 'userID'

@C75517
Scenario: Input UserID that has been unregistered
  Given I am a customer want to reset password 
  When I am filling field 'userID' with 'JOHN1232'
  And click button Reset Password
  Then I should see message error 'User ID belum diregistrasi' in the below of field 'userID'

@C75518
Scenario: Input UserID that has been registered
  Given I am a customer want to reset password 
  When I am filling field 'userID' with 'JOHN1232'
  And reset password with registered userid
  Then I should see new page with text 'Segera Cek E-mail' and button 'checkEmail'

@C75520
Scenario: User click resend email 
  Given I am a customer still not receive email after request forgot password 
  When I click link 'resendEmail' on page Cek Email 
  Then I should see page with text 'Segera Cek E-mail' and button 'checkEmail'

@C75521
Scenario: User click cek email 
  Given I am a customer still not receive email after request forgot password 
  When I click link 'resendEmail' on page Cek Email 
  Then I should see page with text 'Segera Cek E-mail' and button 'checkEmail'

@C75528
Scenario: User click Eye icon for 1 times
  Given I am registered customer with following details: 
    | userID        | JOHN12j3          |
    | password      | Pass1234          | 
  When I am filling in my account information with the following details:
    | userID        | JOHN12j3          |
    | password      | Pass1234          |  
  And I click icon iconEyePassword 
  Then I should see the password on field 'textFieldPassword'
  
@C75530  
Scenario: User click Eye icon for 2 times
  Given I am registered customer with following details: 
      | userID        | JOHN12j3          |
      | password      | Pass1234          | 
  When I am filling in my account information with the following details:
      | userID        | JOHN12j3          |
      | password      | Pass1234          |  
  And I click icon iconEyePassword for 2 times
  Then I should not see the password on field 'textFieldPassword'

