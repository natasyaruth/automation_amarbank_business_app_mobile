Feature: Account login
  In order to go to SMB dashboard after registration
  As a customer lead
  I want to login with registered account
  
  @C75493
  Scenario: Login with registered account
    Given I am registered customer with following details: 
      | userID        | ruthad74          |
      | password      | Test1234          | 
    When I am filling in my account information with the following details:
      | userID        | ruthad74          |
      | password      | Test1234          |
    And login with registered account
    Then I successed go to dashbord
  
  @C76892
  Scenario: Login with unregistered account
    Given I am unregistered customer try to regist with unregistered account
    When I am filling in my account information with the following details:
      | userID        |  LOLO1212           |
      | password      |  Pass1234           |
    And login with unregistered account
    Then I should see pop up with text 'Data Yang Dimasukkan Salah' displayed
    
  @C75491     
  Scenario: Input UserID with no value
    Given I am registered customer with following details: 
      | userID        | JOHN12j3       |
      | password      | Pass1234       | 
    When I am filling in my account information with the following details:
      | userID        |                |
      | password      | Pass1234       |
    And I login with userID empty
    Then I should see message error 'User ID wajib diisi' in the below of field 'userID'
  

  @C75492     
  Scenario: Input Password with no value
    Given I am registered customer with following details: 
      | userID        | JOHN12j3       |
      | password      | Pass1234       | 
    When I am filling in my account information with the following details:
      | userID        | JOHN12j3       |
      | password      |                |
    And I login with password empty
    Then I should see message error 'Password wajib diisi' in the below of field 'password'
  
  @C75497
  Scenario: Login with User ID and Password is empty
    Given I am registered customer with following details:
      | userID        | JOHN12j3       |
      | password      | Pass1234       | 
    When I am filling in my account information with the following details: 
      | userID        |                |
      | password      |                |
    And I login with password and userID empty
    Then I should see message error 'User ID wajib diisi' in the below of field 'userID'
    And I should see message error 'Password wajib diisi' in the below of field 'password'
  
   @Login_Wrong_Password_Until_5_Times
   Scenario Outline: Login with wrong Password for many times
    Given I am registered customer with following details:
      | userID        | JOHN12j3       |
      | password      | Pass1234       | 
    When I am filling in my account information with the following details: 
      | userID        | JOHN12j3       |
      | password      | Pass1234       |
    And I login with wrong password
    Then I should see pop up '<Message>' with button '<Button>'
    Examples:
      | testRailTag  | Message                                                                            | Button              |
      | @C75509      | Jika 3 kali salah akun Anda akan terblokir.                                        | tryAgain            |
      | @C75510      | Jika 3 kali salah akun Anda akan terblokir.                                        | tryAgain            |
      | @C75511      | Akun Anda Terblokir                                                                |                     |
      | @C75512      | Sudah 4 kali salah. Jika salah 1 kali lagi maka akun anda akan terblokir permanen  | buttonTryAgain      |
      | @C75513      | Silakan reaktivasi akun untuk mengaktivasi kembali akun Anda                       | buttonReactivation  |

  @C75503
  Scenario: User click Eye icon for 1 times
    Given I am registered customer with following details: 
      | userID        | JOHN12j3          |
      | password      | Pass1234          | 
    When I am filling in my account information with the following details:
      | userID        | JOHN12j3          |
      | password      | Pass1234          |  
    And I click icon iconEyePassword 
    Then I should see the password on field 'textFieldPassword'
  
  @C75504
  Scenario: User click Eye icon for 2 times
    Given I am registered customer with following details: 
      | userID        | JOHN12j3          |
      | password      | Pass1234          | 
    When I am filling in my account information with the following details:
      | userID        | JOHN12j3          |
      | password      | Pass1234          |  
    And I click icon iconEyePassword for 2 times
    Then I should not see the password on field 'textFieldPassword'

  Scenario: User click CallCenter icon 
    Given I am customer that already on page login 
    When I click icon CallCenter
    Then I should see pop up with text 'Hubungi Tim Kami' displayed 
  
  Scenario: User click link Lupa Password
    Given I am customer that already on page login
    When I click link button lupa password
    Then I should see pop up with text 'Masukan User ID Anda untuk mendapatkan email mereset password' displayed
    