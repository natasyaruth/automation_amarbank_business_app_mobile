Feature: Account registration
  In order to open an SMB account
  As a customer lead
  I want to register for an account

  @C75459
  Scenario: Create a new account
    Given I am a customer lead wanting to open a new account
    When I choose menu registration
    And I filling in my account information with the following details:
      | fullName        | John Doe           |
      | email           | john.doe@email.com |
      | mobileNumber    | 85155021230        |
      | password        | 1234Test           |
      | confirmPassword | 1234Test           |
    And I registering the account
    And I verifying my phone number by entering the code sent to me
    And I verifying my email by login by user id
    Then my account should be created

  @registration_1 @C75427
  Scenario: Verifying field fullname contain with special char (.-,')
    Given I am a customer want to access menu registration
    When I am filling field 'fullName' with 'John Doe S.Kom, M\'Kom-'
    Then I shouldn't see message error in the below of field 'fullName'

  @registration_1 @scenario_clearfilled_and_then_empty_field
  Scenario Outline: Verifying fields has been filled and then empty the fields
    Given I am a customer want to access menu registration
    When I am filling field '<Field>' with 'Testing'
    And I am clearing the field '<Field>'
    Then I should see message error '<Field Name> wajib diisi' in the below of field '<Field>'
    Examples:
      | testRailTag | Field           | Field Name          |
      | @C75432     | fullName        | Nama lengkap        |
      | @C75438     | email           | E-mail              |
      | @C75444     | mobileNumber    | Nomor handphone     |
      | @C75454     | password        | Password            |
      | @C75456     | confirmPassword | Konfirmasi password |

  @registration_1 @scenario_negative_one_field_is_not_filled_by_user
  Scenario Outline: Verifying one fields hasn't been filled by user
    Given I am a customer want to access menu registration
    When I fill form registration except field '<Field>'
    And I submit form registration
    Then I should see message error '<Field Name> wajib diisi' in the below of field '<Field>'
    Examples:
      | testRailTag | Field           | Field Name          |
      | @C75433     | fullName        | Nama lengkap        |
      | @C75435     | email           | E-mail              |
      | @C75446     | mobileNumber    | Nomor handphone     |
      | @C75455     | password        | Password            |
      | @C75457     | confirmPassword | Konfirmasi password |

  @registration_1 @scenario_negative_field_fullName_with_invalid_value
  Scenario Outline: Verifying full name with invalid value
    Given I am a customer want to access menu registration
    When I am filling field 'fullName' with '<Value>'
    Then I should see message error '<Message>' in the below of field 'fullName'
    Examples:                                                                 ❸
      | testRailTag | Value                                                | Message                                                                        |
      | @C75428     | Ruth N@tasya!                                        | Nama lengkap tidak boleh mengandung angka dan spesial karakter kecuali (.,\'-) |
      | @C75429     | Ruth Natasya 1                                       | Nama lengkap tidak boleh mengandung angka dan spesial karakter kecuali (.,\'-) |
      | @C75430     | Ruth Natasya Natasya Natasya Natasya Natasya Natasya | Nama lengkap minimal 3 & maksimal 50 karakter                                  |
      | @C75431     | Ru                                                   | Nama lengkap minimal 3 & maksimal 50 karakter                                  |
      | @C80637     |                                                      | Nama lengkap wajib diisi                                                       |

  @registration_1 @scenario_negative_field_email_with_invalid_value
  Scenario Outline: Verifying email with invalid value
    Given I am a customer want to access menu registration
    When I am filling field 'email' with '<Value>'
    Then I should see message error '<Message>' in the below of field 'email'
    Examples:                                                                 ❸
      | testRailTag | Value                  | Message                    |
      | @C75436     | ruth.natasyagmail.com  | E-mail tidak sesuai format |
      | @C75439     | ruth natasya@gmail.com | E-mail tidak sesuai format |
      | @C80639     |                        | E-mail wajib diisi         |

  @registration_1 @scenario_negative_field_phoneNumber_with_invalid_value
  Scenario Outline: Verifying phone number with invalid value
    Given I am a customer want to access menu registration
    When I am filling field 'mobileNumber' with '<Value>'
    Then I should see message error '<Message>' in the below of field 'mobileNumber'
    Examples:                                                                 ❸
      | testRailTag | Value         | Message                                                       |
      | @C75440     | 89561r12367   | Nomor handphone wajib diisi                                   |
      | @C75441     | 8895611236738 | Panjang nomor handphone minimal 8 digit dan maksimal 15 digit |
      | @C75442     | 8956          | Panjang nomor handphone minimal 8 digit dan maksimal 15 digit |
      | @C75443     | 9678995676    | Nomor handphone tidak sesuai format                           |
      | @C75445     | 8678 995676   | Nomor handphone wajib diisi                                   |
      | @C80640     |               | Nomor handphone wajib diisi                                   |

  @registration_1 @C75447
  Scenario: Verifying autotrim 0 after label +62 in field phonenumber
    Given I am a customer want to access menu registration
    When I am filling field 'mobileNumber' with '0895611221700'
    Then I will see '895611221700' in field 'mobileNumber'

  @registration_1 @scenario_negative_field_password_with_invalid_value
  Scenario Outline: Verifying password with invalid value
    Given I am a customer want to access menu registration
    When I am filling field 'password' with '<Value>'
    Then I should see message error '<Message>' in the below of field 'password'
    Examples:                                                                 ❸
      | testRailTag | Value           | Message                                                       |
      | @C75449     | TESTINGPASSWORD | Password harus kombinasi huruf kapital, huruf kecil dan angka |
      | @C75450     | testingpassword | Password harus kombinasi huruf kapital, huruf kecil dan angka |
      | @C75451     | TestingPassword | Password harus kombinasi huruf kapital, huruf kecil dan angka |
      | @C75453     | 1234567890      | Password harus kombinasi huruf kapital, huruf kecil dan angka |
      | @C75448     | Test1           | Password minimal 8 karakter                                   |
      | @C80641     |                 | Password wajib diisi                                          |

  @registration_1 @C75452
  Scenario: Verifying field password contain with alphabeth, number and special character
    Given I am a customer want to access menu registration
    When I am filling field 'password' with 'Test1234!@'
    Then I shouldn't see message error in the below of field 'password'

  @registration_1 @scenario_negative_field_confirm_password_with_invalid_value
  Scenario Outline: Verifying confirm password with invalid value
    Given I am a customer want to access menu registration
    When I am filling field 'confirmPassword' with '<Value>'
    Then I should see message error '<Message>' in the below of field 'confirmPassword'
    Examples:                                                                 ❸
      | testRailTag | Value           | Message                                        |
      | @C75458     | TESTINGPASSWORD | Konfirmasi password harus sama dengan password |
      | @C80643     |                 | Konfirmasi password wajib diisi                |

  @registration_1 @C75434
  Scenario: Verifying autotrim in field Full name
    Given I am a customer want to access menu registration
    When I am filling field 'fullName' with ' Ruth Natasya '
    Then I will see 'Ruth Natasya ' in field 'fullName'

  @registration_1 @scenario_icon_eye
  Scenario Outline: Unmask and mask the password and confirm password
    Given I am a customer want to access menu registration
    When I am filling field '<Field>' with 'Test1234'
    And I click icon eye in '<Field>' field
    Then I will see my password 'Test1234' in the field
    When I click icon eye in '<Field>' field
    Then I will not see my password 'Test1234' in the field
    Examples:
      | testRailTag | Field           |
      | @C75460     | password        |
      | @C75461     | confirmPassword |

  @registration_1 @C75462
  Scenario: Access link login in page registration
    Given I am a customer want to access menu registration
    When I click link registration
    Then I will directing to page login

  @C75463
  Scenario: Access link terms and condition in page registration
    Given I am a customer want to access menu registration
    When I click link terms and condition
    Then I will directing to web view terms and condition

  @C75464
  Scenario: Access link privacy and policy in page registration
    Given I am a customer want to access menu registration
    When I click link privacy and policy
    Then I will directing to web view privacy and policy

  @C75465
  Scenario: Access call center on page registration
    Given I am a customer want to access menu registration
    When I click call center
    Then I will see helping center via whatsapp and email

  @registration_1 @C75486
  Scenario: Back to page form registration from pop up confirmation
    Given I am a customer want to access menu registration
    When I filling in my account information with the following details:
      | fullName        | Natasya Ruth           |
      | email           | ruth.natasya@email.com |
      | mobileNumber    | 8975656998             |
      | password        | 1234Test               |
      | confirmPassword | 1234Test               |
    And I click button back to page registration
    Then I will direct to page registration with each fields still has values as following:
      | fullName        | Natasya Ruth           |
      | email           | ruth.natasya@email.com |
      | mobileNumber    | 8975656998             |
      | password        | 1234Test               |
      | confirmPassword | 1234Test               |

  @registration_1 @C75853
  Scenario: Back to page Onboarding from page Registration
    Given I am a customer want to access menu registration
    When I click button back in the page registration
    Then I will direct to page onboarding

  @C81400
  Scenario: Create account business with business code from invitation email
    Given I am a customer lead wanting to register account business from invitation
    When I choose menu registration
    And I filling in my account business information with the following details:
      | fullName        | Natasya Ruth           |
      | email           | ruth.natasya@email.com |
      | mobileNumber    | 8975656998             |
      | password        | 1234Test               |
      | confirmPassword | 1234Test               |
    And I registering the account
    And I verifying my phone number by entering the code sent to me
    And I verifying my email by login by user id
    Then my account should be created

  @registration_1 @C81401
  Scenario: Verifying field business code has been filled and then empty the field
    Given I am a customer want to access menu registration
    When I am filling field 'businessCode' with 'XYZ123'
    And I am clearing the field 'businessCode'
    Then I shouldn't see message error in the below of field 'businessCode'

  @C76006
  Scenario: Verifying phone number with wrong OTP code
    Given I am a customer had been registering the account with the following details:
      | fullName        | Ruth Natasya       |
      | email           | fakemail@email.com |
      | mobileNumber    | 81234567890        |
      | password        | Test1234           |
      | confirmPassword | Test1234           |
    When I verifying my phone number by entering the wrong code
    Then I should be notified in the below of field OTP that 'Kode OTP yang dimasukkan salah'

  @C76007
  Scenario: Verifying phone number with expired OTP code
    Given I am a customer had been registering the account with the following details:
      | fullName        | Ruth Natasya       |
      | email           | fakemail@email.com |
      | mobileNumber    | 81234567890        |
      | password        | Test1234           |
      | confirmPassword | Test1234           |
    When I let the otp code expire
    And I verifying my phone number by entering the code sent to me
    Then I should be notified in the below of field OTP that 'Kode OTP yang dimasukkan sudah kadaluarsa'

  @C76008
  Scenario: Verifying phone number with wrong OTP code more than five times
    Given I am a customer had been registering the account with the following details:
      | fullName        | Ruth Natasya       |
      | email           | fakemail@email.com |
      | mobileNumber    | 81234567890        |
      | password        | Test1234           |
      | confirmPassword | Test1234           |
    When I verifying my phone number by entering the wrong code more than five times
    Then I can't filled the OTP field
    And I should be notified that I can reverify the phone number tomorrow
