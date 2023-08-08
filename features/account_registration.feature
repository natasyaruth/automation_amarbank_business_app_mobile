Feature: Account registration
  In order to open an SMB account
  As a customer lead
  I want to register for an account

  @C75459
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

  Scenario Outline: Create account without filling the form
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

  Scenario Outline: Verifying full name with invalid value
    Given I am a customer want to access menu registration
    When I am filling field 'fullName' with '<Value>'
    Then I should see message error '<Message>' in the below of field 'fullName'
    Examples:                                                                 ❸
      | testRailTag | Value                                                                                                        | Message                                                                        |
      | @C75428     | Ruth N@tasya!                                                                                                | Nama lengkap tidak boleh mengandung angka dan spesial karakter kecuali (.,\'-) |
      | @C75429     | Ruth Natasya 1                                                                                               | Nama lengkap tidak boleh mengandung angka dan spesial karakter kecuali (.,\'-) |
      | @C75430     | Ruth Natasya Natasya Natasya Natasya Natasya Natasya Natasya Natasya Natasya Natasya Natasya Natasya Natasya | Nama lengkap minimal 3 & maksimal 100 karakter                                 |
      | @C75431     | Ru                                                                                                           | Nama lengkap minimal 3 & maksimal 100 karakter                                 |
      | @C80637     |                                                                                                              | Nama lengkap wajib diisi                                                       |

  Scenario Outline: Verifying email with invalid value
    Given I am a customer want to access menu registration
    When I am filling field 'email' with '<Value>'
    Then I should see message error '<Message>' in the below of field 'email'
    Examples:                                                                 ❸
      | testRailTag | Value                  | Message                    |
      | @C75436     | ruth.natasyagmail.com  | E-mail tidak sesuai format |
      | @C75439     | ruth natasya@gmail.com | E-mail tidak sesuai format |
      | @C80639     |                        | E-mail wajib diisi         |

  Scenario Outline: Verifying phone number with invalid value
    Given I am a customer want to access menu registration
    When I am filling field 'mobileNumber' with '<Value>'
    Then I should see message error '<Message>' in the below of field 'mobileNumber'
    Examples:                                                                 ❸
      | testRailTag | Value         | Message                                                       |
      | @C75440     | r8956112367   | Nomor handphone tidak sesuai format                           |
      | @C75441     | 8895611236738 | Panjang nomor handphone minimal 8 digit dan maksimal 14 digit |
      | @C75442     | 8956788       | Panjang nomor handphone minimal 8 digit dan maksimal 14 digit |
      | @C75443     | 9678995676    | Nomor handphone tidak sesuai format                           |
      | @C75445     | 8678 995676   | Nomor handphone tidak sesuai format                           |
      | @C80640     |               | Nomor handphone wajib diisi                                   |

  @C75447
  Scenario: Verifying autotrim 0 after label +62 in field phonenumber
    Given I am a customer want to access menu registration
    When I am filling field 'mobileNumber' with '0895611221700'
    Then I will see '895611221700' in field 'mobileNumber'


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

  @C75452
  Scenario: Verifying field password contain with alphabeth, number and special character
    Given I am a customer want to access menu registration
    When I am filling field 'password' with 'Test1234!@'
    Then I shouldn't see message error in the below of field password

  Scenario Outline: Verifying confirm password with invalid value
    Given I am a customer want to access menu registration
    When I am filling field 'confirmPassword' with '<Value>'
    Then I should see message error '<Message>' in the below of field 'confirmPassword'
    Examples:                                                                 ❸
      | testRailTag | Value           | Message                                        |
      | @C75458     | TESTINGPASSWORD | Konfirmasi password harus sama dengan password |
      | @C80643     |                 | Konfirmasi password wajib diisi                |

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