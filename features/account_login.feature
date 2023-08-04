Feature: Account login
  In order to go to SMB dashboard after registration
  As a customer lead
  I want to login with registered account
  @C75493
  Scenario: Login with registered account
    Given I am registered customer with following details: userID is JOHN12j3 and password is Pass1234 
    When I am filling in my account information with the following details:
      | userID        | JOHN12j3           |
      | password      | Pass1234           |
    And login with registered account
    Then I successed go to dashbord
  
  @C76892
  Scenario: Login with unregistered account
    Given I am unregistered customer try to regist with unregistered account
    When I am filling in my account information with the following details:
      | userID        | LOLO1212           |
      | password      | Pass1234           |
    And login with unregistered account
    Then I should see pop up with text 'Data yang dimasukkan salah' displayed

  Scenario Outline: Verifying User ID with invalid value
    Given I am a customer lead want to login my account 
    When I am filling field 'userID' with '<Value>'
    Then I should see message error '<Message>' in the below of field 'userID'
    Examples : 
    | testRailTag  | Value        | Message                         |
    | @C75489      | JOHN1=+,!    | User ID tidak sesuai format     |
    | @C75490      | JOHN12       | User ID minimal 8 digits        |
    | @C75491      |              | User ID wajib diisi             |
  
  @C75492     
  Scenario: Input Password with no value
    Given I am registered customer with following details: userID is JOHN12j3 and password is Pass1234
    When I am filling in my account information with the following details:
      | userID        | JOHN12j3           |
      | password      |                    |
    Then I should see message error 'Password wajib diisi' in the below of field 'password'
  
  @C75497
  Scenario: Login with User ID and Password is empty
    Given I am registered customer with following details: userID is JOHN12j3 and password is Pass1234
    When I am filling in my account information with the following details: 
      | userID        |               |
      | password      |               |
    Then I should see pop up with text 'Data yang dimasukkan salah' displayed
  
   @TC007
   Scenario: Login with wrong Password for many times
    Given I am registered customer with following details: userID is JOHN12j3 and password is Pass1234
    When I am filling in my account information with wrong password with details:'passpass'
    Then I should see pop up '<Message>' with button '<Button>'
    Examples:
      | testRailTag  |  | Message  | Button |
      | @C75509 | Value Jika 3 kali salah akun anda akan terblokir  |  buttonTryAgain      |
      | @C75510 | Value Jika 3 kali salah akun anda akan terblokir  |  buttonTryAgain      |
      | @C75511 | Akun Anda Terblokir  |        |
      | @C75512 | Sudah 4 kali salah. Jika salah 1 kali lagi maka akun anda akan terblokir permanen  | buttonTryAgain      |
      | @C75513 | Silakan reaktivasi akun untuk mengaktivasi kembali akun Anda  |  buttonReactivation        |

  Scenario: User click Eye icon for 1 times
    Given I am registered customer with following details: userID is JOHN12j3 and password is Pass1234 
    When I click icon 'iconEyePassword' on field 'textFieldPassword' 
    Then I should see the password on field 'textFieldPassword'

  Scenario: User click Eye icon for 2 times
    Given I am registered customer with following details: userID is JOHN12j3 and password is Pass1234 
    When I click icon 'iconEyePassword' on field 'textFieldPassword' 
    Then I should not see the password on field 'textFieldPassword'