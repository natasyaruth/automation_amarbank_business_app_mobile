@login
Feature: Account login
  In order to go to SMB dashboard after registration
  As a customer lead
  I want to login with registered account

  @C131544
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

  @C131545
  Scenario: Login with unregistered account
    Given I am an unregistered customer trying to login
    When I filling in form login with the following details:
      | userID      | LOLO1212 |
      | password    | Pass1234 |
      | userIDstg   | LOLO1212 |
      | passwordStg | Test1234 |
    And I click login
    Then I should see pop up with text 'Data Yang Dimasukkan Salah' displayed

  @C131546
  Scenario: Input UserID without value
    Given I am a registered customer with following details:
      | userID      | autocaea |
      | password    | Test1234 |
      | userIDstg   | stag76ee |
      | passwordStg | Test1234 |
    When I filling in form login with the following details:
      | userID      |          |
      | password    | Pass1234 |
      | userIDstg   |          |
      | passwordStg | Test1234 |
    And I click login
    Then I should be notified 'User ID wajib diisi' in the below of field 'userID'

  @C131547
  Scenario: Input Password without value
    Given I am a registered customer with following details:
      | userID      | autocaea |
      | password    | Pass1234 |
      | userIDstg   | stag76ee |
      | passwordStg | Test1234 |
    When I filling in form login with the following details:
      | userID      | autocaea |
      | password    |          |
      | userIDstg   | stag76ee |
      | passwordStg |          |
    And I click login
    Then I should be notified 'Password wajib diisi' in the below of field 'password'

  @C131548
  Scenario: Login with User ID and Password is empty
    Given I am a registered customer with following details:
      | userID      | JOHN12j3 |
      | password    | Pass1234 |
      | userIDstg   | stag76ee |
      | passwordStg | Test1234 |
    When I filling in form login with the following details:
      | userID      |  |
      | password    |  |
      | userIDstg   |  |
      | passwordStg |  |
    And I click login
    Then I should be notified 'User ID wajib diisi' in the below of field 'userID'
    And I should be notified 'Password wajib diisi' in the below of field 'password'

  @C131549
  Scenario: User want to see their password
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
    And I click icon eye password
    Then I should see my password

  @C131550
  Scenario: User don't want to see their password
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
    And I click icon eye password twice
    Then I should not see my password

  @C131551
  Scenario: Access call center on page login
    Given I am customer that already on page login
    When I click call center
    Then I should see bottom sheet call center with email

  @C131552
  Scenario: Access link Lupa Password
    Given I am customer that already on page login
    When I click forgot password
    Then I should see new page with text 'Masukkan User ID dan E-mail Anda untuk mendapatkan email mereset password.' displayed
    And I should see field 'userID' on page Forgot Password
    And I should see field 'email' on page Forgot Password

  @C131553
  Scenario: Access link Daftar
    Given I am customer that already on page login
    When I click registration
    Then I should see new page with text 'Buat Akun' displayed
    And I should see field 'fullName' on page Registration

  @C131554
  Scenario: User want to remember their User ID
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
    And I click checkbox remember me
    And I click login
    And I click later in pop up biometric
    And I will see card account 'active'
    And I choose other
    And I click logout
    Then I should see checkbox remember me is checked
    And I should see field user ID is filled with the last user ID

  @C131555
  Scenario: Back to page Onboarding from page Login
    Given I am customer that already on page login
    When I click button back in the header page
    Then I will direct to page onboarding

  @C131556
  Scenario: Login with wrong password once
    Given I am a registered customer with following details:
      | userID      | autocaea |
      | password    | 1234Test |
      | userIDstg   | stag76ee |
      | passwordStg | Test1234 |
    And I reset attempt failed login  
    When I filling in form login with the following details:
      | userID      | autocaea |
      | password    | Pass1234 |
      | userIDstg   | stag76ee |
      | passwordStg | Pass1234 |
    And I click login
    Then I should see log in pop up 'Jika 3 kali salah, Anda harus menunggu untuk mencoba kembali Masuk Akun' with button 'tryAgain'

  @C131557
  Scenario: Login with wrong password twice
    Given I am a registered customer with following details:
      | userID      | autocaea |
      | password    | 1234Test |
      | userIDstg   | stag76ee |
      | passwordStg | Test1234 |
    When I filling in form login with the following details:
      | userID      | autocaea |
      | password    | Pass1234 |
      | userIDstg   | stag76ee |
      | passwordStg | Pass1234 |
    And I reset attempt failed login  
    And I click login
    And I should see log in pop up 'Jika 3 kali salah, Anda harus menunggu untuk mencoba kembali Masuk Akun' with button 'tryAgain'
    And I click try again to login
    And I click login
    Then I should see log in pop up 'Jika 3 kali salah, Anda harus menunggu untuk mencoba kembali Masuk Akun' with button 'tryAgain'

  @C131558
  Scenario: Login with wrong password three times
    Given I am a registered customer with following details:
      | userID      | autocaea |
      | password    | 1234Test |
      | userIDstg   | stag76ee |
      | passwordStg | Test1234 |
    And I reset attempt failed login  
    When I filling in form login with the following details:
      | userID      | autocaea |
      | password    | Pass1234 |
      | userIDstg   | stag76ee |
      | passwordStg | Pass1234 |
    And I click login
    And I should see log in pop up 'Jika 3 kali salah, Anda harus menunggu untuk mencoba kembali Masuk Akun' with button 'tryAgain'
    And I click try again to login
    And I click login
    Then I should see log in pop up 'Jika 3 kali salah, Anda harus menunggu untuk mencoba kembali Masuk Akun' with button 'tryAgain'
    And I click try again to login
    And I click login
    Then I should see pop up with information three times input incorrect data and can be tried in the next 10 minutes

  @C131559
  Scenario: Click login via biometric
    Given I am customer that already on page login
    When I click button login via biometric
    Then I should see bottom sheet that biometric still not activated yet
    And I close bottom sheet biometric

  @C162149
  Scenario: Exit process PDP
    Given I am a registered customer with following details:
      | userID      | autocaea |
      | password    | 1234Test |
      | userIDstg   | nata6bde |
      | passwordStg | 1234Test |
    And still not agree with PDP concern
    When I filling in form login with the following details:
      | userID      | autocaea |
      | password    | 1234Test |
      | userIDstg   | nata6bde |
      | passwordStg | 1234Test |
    And I click login
    And I see pop up Terms Updates
    And I click to see terms and conditions
    And I will directing to page PDP
    And I click close in header page
    And I see pop up confirm to exit 
    And I cancel continue to see PDP
    Then I will directing to page login

  @C162150
  Scenario: Back to process PDP  
    Given I am a registered customer with following details:
      | userID      | autocaea |
      | password    | 1234Test |
      | userIDstg   | revv1341 |
      | passwordStg | 1234Test |
    And still not agree with PDP concern
    When I filling in form login with the following details:
      | userID      | autocaea |
      | password    | 1234Test |
      | userIDstg   | revv1341 |
      | passwordStg | 1234Test |
    And I click login
    And I see pop up Terms Updates
    And I click to see terms and conditions
    And I will directing to page PDP
    And I click close in header page
    And I see pop up confirm to exit 
    And I want continue to see PDP
    Then I will back to page PDP

  @C162151
  Scenario: Login using existing user active with PDP still not submitted yet
    Given I am a registered customer with following details:
      | userID      | autocaea |
      | password    | 1234Test |
      | userIDstg   | cokr7f68 |
      | passwordStg | Test1234 |
    And still not agree with PDP concern
    When I filling in form login with the following details:
      | userID      | autocaea |
      | password    | 1234Test |
      | userIDstg   | cokr7f68 |
      | passwordStg | Test1234 |
    And I click login
    And I see pop up Terms Updates
    And I click to see terms and conditions
    And I will directing to page PDP
    And I click button agree to PDP
    And I will see pop up option PDP login
    And I check option already and read the condition PDP
    And I check option I agree Amarbank send me new information and innovation from the bank
    And I submit the PDP login
    And I click later in pop up biometric
    Then I will see card account 'active'

  @C162152
  Scenario: Login using existing user on verification with PDP still not submitted yet
    Given I am a registered customer with following details:
      | userID      | indibec3 |
      | password    | 1234Test |
      | userIDstg   | testdf76 |
      | passwordStg | 1234Test |
    And still not agree with PDP concern
    When I filling in form login with the following details:
      | userID      | indibec3 |
      | password    | 1234Test |
      | userIDstg   | testdf76 |
      | passwordStg | 1234Test |
    And I click login
    And I see pop up Terms Updates
    And I click to see terms and conditions
    And I will directing to page PDP
    And I click button agree to PDP
    And I will see pop up option PDP login
    And I check option already and read the condition PDP
    And I check option I agree Amarbank send me new information and innovation from the bank
    And I submit the PDP login
    And I click later in pop up biometric
    Then I will see card account 'on verification'

  @C162153
  Scenario: Login using existing user on process with PDP still not submitted yet
    Given I am a registered customer with following details:
      | userID      | deved6a1 |
      | password    | 1234Test |
      | userIDstg   | revv1a78 |
      | passwordStg | 1234Test |
    And still not agree with PDP concern
    When I filling in form login with the following details:
      | userID      | deved6a1 |
      | password    | 1234Test |
      | userIDstg   | revv1a78 |
      | passwordStg | 1234Test |
    And I click login
    And I see pop up Terms Updates
    And I click to see terms and conditions
    And I will directing to page PDP
    And I click button agree to PDP
    And I will see pop up option PDP login
    And I check option already and read the condition PDP
    And I check option I agree Amarbank send me new information and innovation from the bank
    And I submit the PDP login
    And I click later in pop up biometric
    Then I will see card account 'on process'