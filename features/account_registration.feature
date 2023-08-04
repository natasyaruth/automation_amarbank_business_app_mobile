Feature: Account registration
  In order to open an SMB account
  As a customer lead
  I want to register for an account

  @C75459 @C75462
  Scenario: Create a new account
    Given I am a customer lead wanting to open a new account
    When I choose menu registration
    And filling in my account information with the following details:
      | fullName        | John Doe           |
      | email           | john.doe@email.com |
      | mobileNumber    | 0400000000         |
      | password        | password           |
      | confirmPassword | password           |
    And registering the account
    And verifying my phone number by entering the code sent to me
    And verifying my email by login by user id
    Then my account should be created

  @C75427
  Scenario: Verifying field fullname contain with special char (.-,')
    Given I am a customer want to access menu registration
    When I am filling field 'fullName' with 'John Doe S.Kom, M\'Kom-'
    Then I shouldn't see message error in the below of field fullname

  @C75432 @C75438 @C75444 @C75454 @C75456
  Scenario Outline: Verifying fields has been filled and then empty the fields
    Given I am a customer want to access menu registration
    When I am filling field '<Field>' with 'Testing'
    And I am clearing the field '<Field>'
    Then I should see message error '<Field Name> wajib diisi' in the below of field '<Field>'
    Examples:
      | Field           | Field Name          |
      | fullName        | Nama lengkap        |
      | email           | E-mail              |
      | mobileNumber    | Nomor handphone     |
      | password        | Password            |
      | confirmPassword | Konfirmasi password |

  @C75433 @C75435 @C75446 @C75455 @C75457
  Scenario: Create account without filling the form
    Given I am a customer want to access menu registration
    When I submit form without fill the fields
    Then I should see message error should be filled in all fields with following details:
      | fullName        | Nama lengkap        |
      | email           | E-mail              |
      | mobileNumber    | Nomor handphone     |
      | password        | Password            |
      | confirmPassword | Konfirmasi password |

  @C75428 @C75429 @C75430 @C75431
  Scenario Outline: Verifying full name with invalid value
    Given I am a customer want to access menu registration
    When I am filling field 'fullName' with '<Value>'
    Then I should see message error '<Message>' in the below of field 'fullName'
    Examples:                                                                 ❸
      | Value                                                                                                        | Message                                                                        |
      | Ruth N@tasya!                                                                                                | Nama lengkap tidak boleh mengandung angka dan spesial karakter kecuali (.,\'-) |
      | Ruth Natasya 1                                                                                               | Nama lengkap tidak boleh mengandung angka dan spesial karakter kecuali (.,\'-) |
      | Ruth Natasya Natasya Natasya Natasya Natasya Natasya Natasya Natasya Natasya Natasya Natasya Natasya Natasya | Nama lengkap minimal 3 & maksimal 100 karakter                                 |
      | Ru                                                                                                           | Nama lengkap minimal 3 & maksimal 100 karakter                                 |
      |                                                                                                              | Nama lengkap wajib diisi                                                       |

  @C75436 @C75439
  Scenario Outline: Verifying email with invalid value
    Given I am a customer want to access menu registration
    When I am filling field 'email' with '<Value>'
    Then I should see message error '<Message>' in the below of field 'email'
    Examples:                                                                 ❸
      | Value                  | Message                    |
      | ruth.natasyagmail.com  | E-mail tidak sesuai format |
      | ruth natasya@gmail.com | E-mail tidak sesuai format |
      |                        | E-mail wajib diisi         |

  @C75440 @C75441 @C75442	@C75443	@C75445
  Scenario Outline: Verifying phone number with invalid value
    Given I am a customer want to access menu registration
    When I am filling field 'mobileNumber' with '<Value>'
    Then I should see message error '<Message>' in the below of field 'mobileNumber'
    Examples:                                                                 ❸
      | Value         | Message                                                       |
      | r8956112367   | Nomor handphone tidak sesuai format                           |
      | 8895611236738 | Panjang nomor handphone minimal 8 digit dan maksimal 14 digit |
      | 8956788       | Panjang nomor handphone minimal 8 digit dan maksimal 14 digit |
      | 9678995676    | Nomor handphone tidak sesuai format                           |
      | 8678 995676   | Nomor handphone tidak sesuai format                           |
      |               | Nomor handphone wajib diisi                                   |

  @C75447
  Scenario: Verifying autotrim 0 after label +62 in field phonenumber
    Given I am a customer want to access menu registration
    When I am filling field 'mobileNumber' with '0895611221700'
    Then I will see '895611221700' in field 'mobileNumber'

  @C75449 @C75450 @C75451 @C75448
  Scenario Outline: Verifying password with invalid value
    Given I am a customer want to access menu registration
    When I am filling field 'password' with '<Value>'
    Then I should see message error '<Message>' in the below of field 'password'
    Examples:                                                                 ❸
      | Value           | Message                                                       |
      | TESTINGPASSWORD | Password harus kombinasi huruf kapital, huruf kecil dan angka |
      | testingpassword | Password harus kombinasi huruf kapital, huruf kecil dan angka |
      | TestingPassword | Password harus kombinasi huruf kapital, huruf kecil dan angka |
      | 1234567890      | Password harus kombinasi huruf kapital, huruf kecil dan angka |
      | Test1           | Password minimal 8 karakter                                   |
      |                 | Password wajib diisi                                          |

  @C75452
  Scenario: Verifying field password contain with alphabeth, number and special character
    Given I am a customer want to access menu registration
    When I am filling field 'password' with 'Test1234!@'
    Then I shouldn't see message error in the below of field password

  @C75458
  Scenario Outline: Verifying confirm password with invalid value
    Given I am a customer want to access menu registration
    When I am filling field 'confirmPassword' with '<Value>'
    Then I should see message error '<Message>' in the below of field 'confirmPassword'
    Examples:                                                                 ❸
      | Value           | Message                                        |
      | TESTINGPASSWORD | Konfirmasi password harus sama dengan password |
      |                 | Konfirmasi password wajib diisi                |

  @C75434
  Scenario: Verifying autotrim in field Full name
    Given I am a customer want to access menu registration
    When I am filling field 'fullName' with ' Ruth Natasya '
    Then I will see 'Ruth Natasya ' in field 'fullName'

  Scenario: Verifying phone number with invalid code
    Given I am a customer lead wanting to open a new account
    And had been registering the account with the following details:
      | fullName        | John Doe           |
      | email           | john.doe@email.com |
      | mobileNumber    | 0400000000         |
      | password        | password           |
      | confirmPassword | password           |
    And The verification code sent to me is '123456'
    When I am verifying my phone number with the code '213456'
    Then I should be notified that the code is invalid