Feature: Account login
  In order to go to SMB dashboard after registration
  As a customer lead
  I want to login with registered account

  Scenario: Login with registered account
    Given I am registered customer with following details: userID is JOHN12j3 and password is Pass1234 
    When I am filling in my account information with the following details:
      | userID        | JOHN12j3           |
      | password      | Pass1234           |
    And login with registered account
    Then I successed go to dashbord

  Scenario: Login with unregistered account
    Given I am registered customer with following details: userID is JOHN12j3 and password is Pass1234
    When I am filling in my account information with the following details:
      | userID        | LOLO1212           |
      | password      | Pass1234           |
    And login with unregistered account
    Then I should see pop up with text 'Data yang dimasukkan salah' displayed

  Scenario: Input User ID with wrong format contain special char (,=*+)
    Given I am a customer lead want to login my account 
    When I am filling field 'userID' with 'JOHN1=+,!'
    Then I should see message error 'User ID tidak sesuai format' in the below of field 'userID'

  Scenario: Input User ID with less than 8 digits
    Given I am a customer lead want to login my account 
    When I am filling field 'userID' with 'JOHN12'
    Then I should see message error 'User ID minimal 8 digits' in the below of field 'userID'

  Scenario: Input User ID with no value
    Given I am a customer lead want to login my account 
    When I am filling field 'userID' with ''
    Then I should see message error 'User ID wajib diisi' in the below of field 'userID'

  Scenario: Input Password with no value
    Given I am registering customer with following details: userID is JOHN12j3 and password is Pass1234
    When I am filling in my account information with the following details:
      | userID        | JOHN12j3           |
      | password      |                    |
    Then I should see message error 'Password wajib diisi' in the below of field 'password'

  Scenario: Login with registered account and invalid password 
    Given I am registered customer with following details: userID is JOHN12j3 and password is Pass1234
    When I am filling in my account information with the following details:
      | userID        | JOHN12j3           |
      | password      | Nono1234           |
    And login with registered account and invalid password
    Then I should see pop up with text 'Data yang dimasukkan salah' displayed

  Scenario: Login with User ID and Password is empty
    Given I am registered customer with following details: userID is JOHN12j3 and password is Pass1234
    When I am filling in my account information with the following details: 
      | userID        |               |
      | password      |               |
    Then I should see pop up with text 'Data yang dimasukkan salah' displayed

  Scenario: Login with Unregistered User ID and password is empty
    Given I am registered customer with following details: userID is JOHN12j3 and password is Pass1234
    When I am filling in my account information with the following details:
      | userID        | LOLO1212           |
      | password      |                    |
    Then I should see message error 'Password wajib diisi' in the below of field 'password'

  Scenario: Login with User ID is empty and valid password
    Given I am registered customer with following details: userID is JOHN12j3 and password is Pass1234
    When I am filling in my account information with the following details:
      | userID        |                    |
      | password      | Pass1234           |
    Then I should see message error 'User ID wajib diisi' in the below of field 'userID'

  Scenario: Login with User ID is wrong format and invalid password
    Given I am registered customer with following details: userID is JOHN12j3 and password is Pass1234
    When I am filling in my account information with the following details:
      | userID        | BUBUBUBU           |
      | password      | Wrong123           |
    Then I should see message error 'User ID tidak sesuai format' in the below of field 'userID'

  Scenario: Login with invalid Password for 1 times
    Given I am registered customer with following details: userID is JOHN12j3 and password is Pass1234
    When I am filling in my account information with the following details:
      | userID        | JOHN12j3           |
      | password      | Wrong123           |
    Then I should see pop up 'Jika 3 kali salah akun anda akan terblokir' with button 'buttonTryAgain'

  Scenario: Login with invalid Password for 2 times
    Given I am registered customer with following details: userID is JOHN12j3 and password is Pass1234
    When I am filling in my account information with the following details:
      | userID        | JOHN12j3           |
      | password      | Wrong123           |
    Then I should see pop up 'Jika 3 kali salah akun anda akan terblokir' with button 'buttonTryAgain'
    
  Scenario: Login with invalid Password for 3 times
    Given I am registered customer with following details: userID is JOHN12j3 and password is Pass1234
    When I am filling in my account information with the following details:
      | userID        | JOHN12j3           |
      | password      | Wrong123           |
    Then I should see pop up 'Akun Anda Terblokir' and 'Silakan coba masuk kembali setelah 30 menit.' 

  Scenario: Login with invalid Password for 4 times
    Given I am registered customer with following details: userID is JOHN12j3 and password is Pass1234
    When I am filling in my account information with the following details:
      | userID        | JOHN12j3           |
      | password      | Wrong123           |
    Then I should see pop up 'Sudah 4 kali salah. Jika salah 1 kali lagi maka akun anda akan terblokir permanen' with button 'buttonTryAgain'

  Scenario: Login with invalid Password for 5 times
    Given I am registered customer with following details: userID is JOHN12j3 and password is Pass1234
    When I am filling in my account information with the following details:
      | userID        | JOHN12j3           |
      | password      | Wrong123           |
    Then I should see pop up 'Silakan reaktivasi akun untuk mengaktivasi kembali akun Anda' with button 'buttonReactivation'

  Scenario: User click Eye icon for 1 times
    Given I am registered customer with following details: userID is JOHN12j3 and password is Pass1234 
    When I click icon 'iconEyePassword' on field 'textFieldPassword' 
    Then I should see the password on field 'textFieldPassword'

  Scenario: User click Eye icon for 2 times
    Given I am registered customer with following details: userID is JOHN12j3 and password is Pass1234 
    When I click icon 'iconEyePassword' on field 'textFieldPassword' 
    Then I should not see the password on field 'textFieldPassword'