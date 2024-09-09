Feature: Account login
  In order to go to SMB dashboard after registration
  As a customer lead
  I want to login with registered account

  @login @case65
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

   @login @case66
  Scenario: Login with unregistered account
    Given I am an unregistered customer trying to login
    When I filling in form login with the following details:
      | userID      | autocaea |
      | password    | 1234Test |
      | userIDstg   | LOLO1212 |
      | passwordStg | Test1234 |
    And I click login
    Then I should see pop up with text 'Data Yang Dimasukkan Salah' displayed

   @login @case67
  Scenario: Input UserID without value
    Given I am a registered customer with following details:
      | userIDstg   | JOHN12j3 |
      | passwordStg | Pass1234 |
    When I filling in form login with the following details:
      | userIDstg   |          |
      | passwordStg | Pass1234 |
    And I click login
    Then I should be notified 'User ID wajib diisi' in the below of field 'userID'

   @login @case68
  Scenario: Input Password without value
    Given I am a registered customer with following details:
      | userIDstg   | JOHN12j3 |
      | passwordStg | Pass1234 |
    When I filling in form login with the following details:
      | userIDstg   | JOHN12j3 |
      | passwordStg |          |
    And I click login
    Then I should be notified 'Password wajib diisi' in the below of field 'password'

   @login @case69
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

   @case70
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

   @case71
  Scenario: Login with wrong password twice
    Given I am a customer who has failed to login '1' times with following details:
      | userIDstg   | yahyb7cb |
      | passwordStg | Akuntes2 |
    When I filling in form login with the following details:
      | userIDstg   | yahyb7cb |
      | passwordStg | Salahtes |
    And I click login
    Then I should see pop up 'Jika 3 kali salah akun Anda akan terblokir.' with button 'tryAgain'  

   #@login @C75511
  Scenario: Login with wrong password three times
    Given I am a customer who has failed to login '2' times with following details:
      | userID   | ruth17a5 |
      | password | Test1234 |
    When I filling in form login with the following details:
      | userID   | ruth17a5 |
      | password | Pass1234 |
    And I click login
    Then I should see pop up 'Akun Anda Terblokir' with button 'close'    

   #@login @C75503
  Scenario: User want to see their password
    Given I am customer that already on page login
    When I filling in form login with the following details:
      | userID   | JOHN12j3 |
      | password | Pass1234 |
    And I click icon eye password
    Then I should see my password

   #@login @C75504
  Scenario: User don't want to see their password
    Given I am customer that already on page login
    When I filling in form login with the following details:
      | userID   | JOHN12j3 |
      | password | Pass1234 |
    And I click icon eye password twice
    Then I should not see my password

   #@login @C75505
  Scenario: Access call center on page login
    Given I am customer that already on page login
    When I click call center
    Then I should see pop up with text 'Hubungi Tim Kami' displayed
    And I should see pop up with text 'Kami akan membantu Anda dalam pembuatan rekening' displayed

   #@login @C75506
  Scenario: Access link Lupa Password
    Given I am customer that already on page login
    When I click forgot password
    Then I should see new page with text 'Masukan User ID Anda untuk mendapatkan email mereset password.' displayed
    And I should see field 'userID' on page Forgot Password

   #@login @C75507
  Scenario: Access link Daftar
    Given I am customer that already on page login
    When I click registration
    Then I should see new page with text 'Buat Akun' displayed
    And I should see field 'fullName' on page Registration

   #@login @C75508
  Scenario: User want to remember their User ID
    Given I am a registered customer with following details:
      | userID   | rutha013 |
      | password | 1234Test |
    When I filling in form login with the following details:
      | userID   | rutha013 |
      | password | 1234Test |
    And I click checkbox remember me
    And I click login
    And I click logout
    Then I should see checkbox remember me is checked
    And I should see field user ID is filled with the last user ID

   #@login @C75514
  Scenario: Back to page Onboarding from page Login
    Given I am customer that already on page login
    When I click button back in the header page
    Then I will direct to page onboarding  