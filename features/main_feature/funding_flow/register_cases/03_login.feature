@hooklogin_regress
Feature: Account login
  In order to go to SMB dashboard after registration
  As a customer lead
  I want to login with registered account

  @C159649
  Scenario: Login with registered account
    Given I am a registered customer with following details:
      | userID      | autocaea |
      | password    | 1234Test |
      | userIDstg   | stag76ee |
      | passwordStg | Test1234 |
    When I filling in form login with the following details:
      | userID      | autocaea |
      | password    | 1234Test |
      | userIDstg   | stag76ee |
      | passwordStg | Test1234 |
    And I click login
    And I click later in pop up biometric
    Then I will direct to dashboard

  @C159650
  Scenario: Login with unregistered account
    Given I am an unregistered customer trying to login
    When I filling in form login with the following details:
      | userID      | autocaea |
      | password    | 1234Test |
      | userIDstg   | LOLO1212 |
      | passwordStg | Test1234 |
    And I click login
    Then I should see pop up with text 'Data Yang Dimasukkan Salah' displayed

  @C159652
  Scenario: Input UserID without value
    Given I am a registered customer with following details:
      | userIDstg   | JOHN12j3 |
      | passwordStg | Pass1234 |
    When I filling in form login with the following details:
      | userIDstg   |          |
      | passwordStg | Pass1234 |
    And I click login
    Then I should be notified 'User ID wajib diisi' in the below of field 'userID'

  @C159653
  Scenario: Input Password without value
    Given I am a registered customer with following details:
      | userIDstg   | JOHN12j3 |
      | passwordStg | Pass1234 |
    When I filling in form login with the following details:
      | userIDstg   | JOHN12j3 |
      | passwordStg |          |
    And I click login
    Then I should be notified 'Password wajib diisi' in the below of field 'password'

  @C159654
  Scenario: Login with User ID and Password is empty
    Given I am a registered customer with following details:
      | userIDstg   | JOHN12j3 |
      | passwordStg | Pass1234 |
    When I filling in form login with the following details:
      | userIDstg   |  |
      | passwordStg |  |
    And I click login
    Then I should be notified 'User ID wajib diisi' in the below of field 'userID'
    And I should be notified 'Password wajib diisi' in the below of field 'password'

   @C159655
   Scenario: Login with wrong password once
    Given I am a registered customer with following details:
      | userIDstg   | yahyb7cb |
      | passwordStg | Akuntes2 |
    When I filling in form login with the following details:
      | userIDstg   | yahyb7cb |
      | passwordStg | Salahtes |
    And I click login
    Then I should see log in pop up 'Jika 3 kali salah, Anda harus menunggu untuk mencoba kembali Masuk Akun' with button 'tryAgain'
    And I reset attempt failed login

  @C159656
   Scenario: Login with wrong password twice
    Given I am a registered customer with following details:
      | userIDstg   | yahyb7cb |
      | passwordStg | Akuntes2 |
    When I filling in form login with the following details:
       | userIDstg   | yahyb7cb |
       | passwordStg | Salahtes |
    And I click login
    And I should see log in pop up 'Jika 3 kali salah, Anda harus menunggu untuk mencoba kembali Masuk Akun' with button 'tryAgain'
    And I click try again to login
    And I click login
    Then I should see log in pop up 'Jika 3 kali salah, Anda harus menunggu untuk mencoba kembali Masuk Akun' with button 'tryAgain'
    And I reset attempt failed login 

  @C159658
  Scenario: Login with wrong password three times
    Given I am a registered customer with following details:
      | userIDstg   | yahyb7cb |
      | passwordStg | Akuntes2 |
    When I filling in form login with the following details:
     | userIDstg   | yahyb7cb |
     | passwordStg | Salahtes |
    And I click login
    And I should see log in pop up 'Jika 3 kali salah, Anda harus menunggu untuk mencoba kembali Masuk Akun' with button 'tryAgain'
    And I click try again to login
    And I click login
    Then I should see log in pop up 'Jika 3 kali salah, Anda harus menunggu untuk mencoba kembali Masuk Akun' with button 'tryAgain'
    And I click try again to login
    And I click login
    Then I should see pop up with information three times input incorrect data and can be tried in the next 10 minutes
    And I reset attempt failed login 

  @C159659	
  Scenario: User want to see their password
    Given I am a registered customer with following details:
      | userIDstg   | yahyb7cb |
      | passwordStg | Akuntes2 |
    When I filling in form login with the following details:
      | userIDstg   | yahyb7cb |
      | passwordStg | Akuntes2 |
    And I click icon eye password
    Then I should see my password

  @C159660
  Scenario: User don't want to see their password
    Given I am a registered customer with following details:
      | userIDstg   | yahyb7cb |
      | passwordStg | Akuntes2 |
    When I filling in form login with the following details:
      | userIDstg   | yahyb7cb |
      | passwordStg | Akuntes2 |
    And I click icon eye password twice
    Then I should not see my password

   @C159661
   Scenario: Access call center on page login
    Given I am customer that already on page login
    When I click call center
    Then I should see bottom sheet call center with email

  @C159662
  Scenario: Access link Lupa Password
    Given I am customer that already on page login
    When I click forgot password
    Then I should see new page with text 'Masukkan User ID dan E-mail Anda untuk mendapatkan email mereset password.' displayed
    And I should see field 'userID' on page Forgot Password
    And I should see field 'email' on page Forgot Password

  @C159664
  Scenario: Access link Daftar
    Given I am customer that already on page login
    When I click registration
    Then I should see new page with text 'Buat Akun' displayed
    And I should see field 'fullName' on page Registration

  @C159665
  Scenario: User want to remember their User ID
    Given I am a registered customer with following details:
      | userIDstg   | yahyb7cb |
      | passwordStg | Akuntes2 |
    When I filling in form login with the following details:
      | userIDstg   | yahyb7cb |
      | passwordStg | Akuntes2 |
    And I click checkbox remember me
    And I click login
    And I click later in pop up biometric
    And I choose other
    And I click logout
    Then I should see checkbox remember me is checked
    And I should see field user ID is filled with the last user ID

  @C159666
  Scenario: Back to page Onboarding from page Login
    Given I am customer that already on page login
    When I click button back in the header page
    Then I will direct to page onboarding