Feature: Account Forgot Password
  In order to going to SMB dashboard while forgot user password
  As a customer
  I want to reset password 

Scenario: Input UserID with wrong format
  Given I am a customer want to reset password  
  When I am filling field 'userID' with '<Value>'
  Then I should see message error '<Message>' in the below of field 'userID'
  Examples: 
    | testRailTag  | Value        | Message                         |
    | @C75516      | JOHN1=+,!    | User ID tidak sesuai format     |
    | @C81356      | JOHN12       | User ID minimal 8 digits        |
    | @C81357      |              | User ID wajib diisi             |
 
Scenario: Input UserID that has been unregistered
  Given I am a customer want to reset password 
  When I am filling field 'userID' with 'JOHN1232'
  And reset password with unregistered userid
  Then I should see message error 'User ID belum diregistrasi' in the below of field 'userID'

Scenario: Input UserID that has been registered
  Given I am a customer want to reset password 
  When I am filling field 'userID' with 'JOHN1232'
  And reset password with registered userid
  Then I should see new page with text 'Segera Cek E-mail' and button 'checkEmail'

Scenario: User click resend email 
  Given I am a customer still not receive email after request forgot password 
  When I click link 'resendEmail' on page Cek Email 
  Then I should see page with text 'Segera Cek E-mail' and button 'checkEmail'