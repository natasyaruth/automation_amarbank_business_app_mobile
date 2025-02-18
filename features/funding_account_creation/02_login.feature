@login
Feature: Account login
  In order to go to SMB dashboard after registration
  As a customer lead
  I want to login with registered account

  Scenario: Login with registered account
    Given I am a registered customer with following details:
      | userID      | <user id dev> |
      | password    | <password dev>|
      | userIDstg   | <user id stg> |
      | passwordStg | <password dev>|
    When I filling in form login with the following details:
      | userID      | <user id dev> |
      | password    | <password dev>|
      | userIDstg   | <user id stg> |
      | passwordStg | <password dev>|
    And I click login
    And I click later in pop up biometric
    Then I will direct to dashboard

  Scenario: Login with unregistered account
    Given I am an unregistered customer trying to login
    When I filling in form login with the following details:
      | userID      | <user id dev> |
      | password    | <password dev>|
      | userIDstg   | <user id stg> |
      | passwordStg | <password dev>|
    And I click login
    Then I should see pop up with text 'Data Yang Dimasukkan Salah' displayed

  Scenario: Input UserID without value
    Given I am a registered customer with following details:
      | userID      | <user id dev> |
      | password    | <password dev>|
      | userIDstg   | <user id stg> |
      | passwordStg | <password dev>|
    When I filling in form login with the following details:
      | userID      |               |
      | password    | <password dev>|
      | userIDstg   |               |
      | passwordStg | <password dev>|
    And I click login
    Then I should be notified 'User ID wajib diisi' in the below of field 'userID'

  Scenario: Input Password without value
    Given I am a registered customer with following details:
      | userID      | <user id dev> |
      | password    | <password dev>|
      | userIDstg   | <user id stg> |
      | passwordStg | <password dev>|
    When I filling in form login with the following details:
      | userID      | <user id dev> |
      | password    |               |
      | userIDstg   | <user id stg> |
      | passwordStg |               |
    And I click login
    Then I should be notified 'Password wajib diisi' in the below of field 'password'

  Scenario: Login with User ID and Password is empty
    Given I am a registered customer with following details:
      | userID      | <user id dev> |
      | password    | <password dev>|
      | userIDstg   | <user id stg> |
      | passwordStg | <password dev>|
    When I filling in form login with the following details:
      | userID      |  |
      | password    |  |
      | userIDstg   |  |
      | passwordStg |  |
    And I click login
    Then I should be notified 'User ID wajib diisi' in the below of field 'userID'
    And I should be notified 'Password wajib diisi' in the below of field 'password'

  Scenario: User want to see their password
    Given I am a registered customer with following details:
      | userID      | <user id dev> |
      | password    | <password dev>|
      | userIDstg   | <user id stg> |
      | passwordStg | <password dev>|
    When I filling in form login with the following details:
      | userID      | <user id dev> |
      | password    | <password dev>|
      | userIDstg   | <user id stg> |
      | passwordStg | <password dev>|
    And I click icon eye password
    Then I should see my password

  Scenario: User don't want to see their password
    Given I am a registered customer with following details:
      | userID      | <user id dev> |
      | password    | <password dev>|
      | userIDstg   | <user id stg> |
      | passwordStg | <password dev>|
    When I filling in form login with the following details:
      | userID      | <user id dev> |
      | password    | <password dev>|
      | userIDstg   | <user id stg> |
      | passwordStg | <password dev>|
    And I click icon eye password twice
    Then I should not see my password

  Scenario: Access call center on page login
    Given I am customer that already on page login
    When I click call center
    Then I should see bottom sheet call center with email

  Scenario: Access link Lupa Password
    Given I am customer that already on page login
    When I click forgot password
    Then I should see new page with text 'Masukkan User ID dan E-mail Anda untuk mendapatkan email mereset password.' displayed
    And I should see field 'userID' on page Forgot Password
    And I should see field 'email' on page Forgot Password

  Scenario: Access link Daftar
    Given I am customer that already on page login
    When I click registration
    Then I should see new page with text 'Buat Akun' displayed
    And I should see field 'fullName' on page Registration

  Scenario: User want to remember their User ID
    Given I am a registered customer with following details:
      | userID      | <user id dev> |
      | password    | <password dev>|
      | userIDstg   | <user id stg> |
      | passwordStg | <password dev>|
    When I filling in form login with the following details:
      | userID      | <user id dev> |
      | password    | <password dev>|
      | userIDstg   | <user id stg> |
      | passwordStg | <password dev>|
    And I click checkbox remember me
    And I click login
    And I click later in pop up biometric
    And I will see card account 'active'
    And I choose other
    And I click logout
    Then I should see checkbox remember me is checked
    And I should see field user ID is filled with the last user ID

  Scenario: Back to page Onboarding from page Login
    Given I am customer that already on page login
    When I click button back in the header page
    Then I will direct to page onboarding

  Scenario: Login with wrong password once
    Given I am a registered customer with following details:
      | userID      | <user id dev> |
      | password    | <password dev>|
      | userIDstg   | <user id stg> |
      | passwordStg | <password dev>|
    And I reset attempt failed login  
    When I filling in form login with the following details:
      | userID      | <user id dev> |
      | password    | <password dev>|
      | userIDstg   | <user id stg> |
      | passwordStg | <password dev>|
    And I click login
    Then I should see log in pop up 'Jika 3 kali salah, Anda harus menunggu untuk mencoba kembali Masuk Akun' with button 'tryAgain'

  @C165944
  Scenario: Login with wrong password twice
    Given I am a registered customer with following details:
      | userID      | <user id dev> |
      | password    | <password dev>|
      | userIDstg   | <user id stg> |
      | passwordStg | <password dev>|
    When I filling in form login with the following details:
      | userID      | <user id dev> |
      | password    | <password dev>|
      | userIDstg   | <user id stg> |
      | passwordStg | <password dev>|
    And I reset attempt failed login  
    And I click login
    And I should see log in pop up 'Jika 3 kali salah, Anda harus menunggu untuk mencoba kembali Masuk Akun' with button 'tryAgain'
    And I click try again to login
    And I click login
    Then I should see log in pop up 'Jika 3 kali salah, Anda harus menunggu untuk mencoba kembali Masuk Akun' with button 'tryAgain'

  @C165945
  Scenario: Login with wrong password three times
    Given I am a registered customer with following details:
      | userID      | <user id dev> |
      | password    | <password dev>|
      | userIDstg   | <user id stg> |
      | passwordStg | <password dev>|
    And I reset attempt failed login  
    When I filling in form login with the following details:
      | userID      | <user id dev> |
      | password    | <password dev>|
      | userIDstg   | <user id stg> |
      | passwordStg | <password dev>|
    And I click login
    And I should see log in pop up 'Jika 3 kali salah, Anda harus menunggu untuk mencoba kembali Masuk Akun' with button 'tryAgain'
    And I click try again to login
    And I click login
    Then I should see log in pop up 'Jika 3 kali salah, Anda harus menunggu untuk mencoba kembali Masuk Akun' with button 'tryAgain'
    And I click try again to login
    And I click login
    Then I should see pop up with information three times input incorrect data and can be tried in the next 10 minutes