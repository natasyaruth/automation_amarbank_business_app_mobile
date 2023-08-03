Feature: Account registration
  In order to open an SMB account
  As a customer lead
  I want to register for an account

  @TC001
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

  @TC002
  Scenario: Verifying field fullname contain with special char (.-,')
    Given I am a customer want to access menu registration
    When I am filling field 'fullName' with 'John Doe S.Kom, M\'Kom-'
    Then I shouldn't see message error in the below of field fullname

  @TC003
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

  @TC004
  Scenario: Create account without filling the form
    Given I am a customer want to access menu registration
    When I submit form without fill the fields
    Then I should see message error should be filled in all fields with following details:
      | fullName        | Nama lengkap        |
      | email           | E-mail              |
      | mobileNumber    | Nomor handphone     |
      | password        | Password            |
      | confirmPassword | Konfirmasi password |

  Scenario Outline: Input fields with whitespace in the front and back of the value
    Given I am a customer want to access menu registration
    When I am filling field '<Field>' with ' <First Value> '
    Then I should see '<After Trimmed Value>' in field '<Field>' with whitespace in the front is trimmed
    Examples:
      | Field           | First Value            | After Trimmed Value    |
      | fullName        | Ruth Natasya           | "Ruth Natasya "        |
      | email           | ruth.natasya@gmail.com | ruth.natasya@gmail.com |
      | mobileNumber    | 89561122179            | 89561122179            |

  @TC005
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

  @TC006
  Scenario Outline: Verifying email with invalid value
    Given I am a customer want to access menu registration
    When I am filling field 'email' with '<Value>'
    Then I should see message error '<Message>' in the below of field 'email'
    Examples:                                                                 ❸
      | Value                  | Message                     |
      | ruth.natasyagmail.com  | E-mail tidak sesuai format  |
      | ruth natasya@gmail.com | E-mail tidak sesuai format  |
      |                        | Nomor handphone wajib diisi |

  @TC007
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

  @TC008
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

  @TC009
  Scenario Outline: Verifying confirm password with invalid value
    Given I am a customer want to access menu registration
    When I am filling field 'confirmPassword' with '<Value>'
    Then I should see message error '<Message>' in the below of field 'confirmPassword'
    Examples:                                                                 ❸
      | Value           | Message                                        |
      | TESTINGPASSWORD | Konfirmasi password harus sama dengan password |
      |                 | Konfirmasi password wajib diisi                |

  Scenario: Access link login in page registration
    Given I am a customer want to access menu login from page registration
    When I click link registration
    Then I will directing to page login

  Scenario: Access link terms and condition in page registration
    Given I am a customer want go to page terms and condition through link login in the page registration
    When I click link terms and condition
    Then I will directing to web view terms and condition
  
  Scenario: Access link privacy and policy in page registration
    Given I am a customer want go to page registration through link login in the page registration
    When I click link privacy and policy
    Then I will directing to web view privacy and policy
  
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

