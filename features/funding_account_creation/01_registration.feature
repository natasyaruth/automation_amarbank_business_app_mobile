@registration
Feature: Account registration
  In order to open an SMB account
  As a customer lead
  I want to register for an account

  Scenario: Validate wording carousel onboarding
    Given I am a customer open app amarbank business
    When I see carousel onboarding
    And I validate wording funding business
    And I swipe to next carousel
    And I validate wording financial management
    And I swipe to next carousel
    And I validate wording financial and data privacy

  Scenario: Create a new account
    Given I am a customer lead wanting to open a new account
    When I choose menu registration
    And I filling in my account information with the following details:
      | fullName        | Revvy                    |
      | email           | <your email>             |
      | mobileNumber    | <your phoneNumber>       |
      | password        | <your password>          |
      | confirmPassword | <your password>          |
    And I registering the account
    And I will directing to page terms and condition
    And I click button agree with terms and condition
    And I will directing to page privacy and policy 
    And I click button agree with privacy and policy
    And I will directing to page PDP
    And I click button agree to PDP
    And I will see pop up option PDP registration
    And I check option already and read the condition PDP
    And I check option I agree Amarbank send me new information and innovation from the bank
    And I submit the PDP registration
    And I verifying my phone number by entering the code sent to me
    And I will get my user id with format combination from number and alphabeth lower case without special char 
    And I verifying my email by login by user id
    Then my account should be created

  Scenario: Checking user id with some attempt
    Given I register customer '5' times
    When I receive all the user id's
    Then All user id's using format combination from number and alphabeth lower case without special char

  Scenario: Verifying field fullname contain with special char (.-,')
    Given I am a customer want to access menu registration
    When I am filling field 'fullName' with 'John Doe S.Kom, M\'Kom-'
    Then I shouldn't see message error in the below of field 'fullName'

  @validation_fill_field_and_clear_field
  Scenario Outline: Verifying fields has been filled and then empty the fields
    Given I am a customer want to access menu registration
    When I am filling field '<Field>' with 'Testing'
    And I am clearing the field '<Field>'
    Then I should see message error '<Field Name> wajib diisi' in the below of field '<Field>'
    Examples:
      | testRailTag  | Field           | Field Name          |
      | @            | fullName        | Nama lengkap        |
      | @            | email           | E-mail              |
      | @            | mobileNumber    | Nomor handphone     |
      | @            | password        | Password            |
      | @            | confirmPassword | Konfirmasi password |

  @validation_one_empty_fields
  Scenario Outline: Verifying one fields hasn't been filled by user
    Given I am a customer want to access menu registration
    When I fill form registration except field '<Field>'
    And I submit form registration
    Then I should see message error '<Field Name> wajib diisi' in the below of field '<Field>'
    Examples:
      | testRailTag  | Field           | Field Name          |
      | @            | fullName        | Nama lengkap        |
      | @            | email           | E-mail              |
      | @            | mobileNumber    | Nomor handphone     |
      | @            | password        | Password            |
      | @            | confirmPassword | Konfirmasi password |

  @validation_format_fullname
  Scenario Outline: Verifying full name with invalid value
    Given I am a customer want to access menu registration
    When I am filling field 'fullName' with '<Value>'
    Then I should see message error '<Message>' in the below of field 'fullName'
    Examples:                                                                 ❸
      | testRailTag  | Value                                                | Message                                                                        |
      | @            | Ruth N@tasya!                                        | Nama lengkap tidak boleh mengandung angka dan spesial karakter kecuali (.,\'-) |
      | @            | Ruth Natasya 1                                       | Nama lengkap tidak boleh mengandung angka dan spesial karakter kecuali (.,\'-) |
      | @            | Ruth Natasya Natasya Natasya Natasya Natasya Natasya | Nama lengkap minimal 3 & maksimal 50 karakter                                  |
      | @            | Ru                                                   | Nama lengkap minimal 3 & maksimal 50 karakter                                  |
      | @            |                                                      | Nama lengkap wajib diisi                                                       |

  @validation_format_email
  Scenario Outline: Verifying email with invalid value
    Given I am a customer want to access menu registration
    When I am filling field 'email' with '<Value>'
    Then I should see message error '<Message>' in the below of field 'email'
    Examples:                                                                 ❸
      | testRailTag  | Value                  | Message                    |
      | @            | ruth.natasyagmail.com  | E-mail tidak sesuai format |
      | @            | ruth natasya@gmail.com | E-mail tidak sesuai format |
      | @            |                        | E-mail wajib diisi         |

  @validation_format_phonenumber
  Scenario Outline: Verifying phone number with invalid value
    Given I am a customer want to access menu registration
    When I am filling field 'mobileNumber' with '<Value>'
    Then I should see message error '<Message>' in the below of field 'mobileNumber'
    Examples:                                                                 ❸
      | testRailTag  | Value         | Message                                                       |
      | @            | 89561r12367   | Nomor handphone wajib diisi                                   |
      | @            | 8895611236738 | Panjang nomor handphone minimal 8 digit dan maksimal 15 digit |
      | @            | 8956          | Panjang nomor handphone minimal 8 digit dan maksimal 15 digit |
      | @            | 9678995676    | Nomor handphone tidak sesuai format                           |
      | @            | 8678 995676   | Nomor handphone wajib diisi                                   |
      | @            |               | Nomor handphone wajib diisi                                   |

  Scenario: Verifying autotrim 0 after label +62 in field phonenumber
    Given I am a customer want to access menu registration
    When I am filling field 'mobileNumber' with '0895611221700'
    Then I will see '895611221700' in field 'mobileNumber'

  @validation_format_password
  Scenario Outline: Verifying password with invalid value
    Given I am a customer want to access menu registration
    When I am filling field 'password' with '<Value>'
    Then I should see message error '<Message>' in the below of field 'password'
    Examples:                                                                 ❸
      | testRailTag  | Value           | Message                                                       |
      | @            | TESTINGPASSWORD | Password harus kombinasi huruf kapital, huruf kecil dan angka |
      | @            | testingpassword | Password harus kombinasi huruf kapital, huruf kecil dan angka |
      | @            | TestingPassword | Password harus kombinasi huruf kapital, huruf kecil dan angka |
      | @            | 1234567890      | Password harus kombinasi huruf kapital, huruf kecil dan angka |
      | @            | Test1           | Password minimal 8 karakter                                   |
      | @            |                 | Password wajib diisi                                          |

  Scenario: Verifying field password contain with alphabeth, number and special character
    Given I am a customer want to access menu registration
    When I am filling field 'password' with 'Test1234!@'
    Then I shouldn't see message error in the below of field 'password'

  @validation_format_confirm_password
  Scenario Outline: Verifying confirm password with invalid value
    Given I am a customer want to access menu registration
    When I am filling field 'confirmPassword' with '<Value>'
    Then I should see message error '<Message>' in the below of field 'confirmPassword'
    Examples:                                                                 ❸
      | testRailTag | Value           | Message                                        |
      | @           | TESTINGPASSWORD | Konfirmasi password harus sama dengan password |
      | @           |                 | Konfirmasi password wajib diisi                |

  Scenario: Verifying autotrim in field Full name
    Given I am a customer want to access menu registration
    When I am filling field 'fullName' with ' Ruth Natasya '
    Then I will see 'Ruth Natasya ' in field 'fullName'

  @mask_password
  Scenario Outline: Unmask and mask the password and confirm password
    Given I am a customer want to access menu registration
    When I am filling field '<Field>' with 'Test1234'
    And I click icon eye in '<Field>' field
    Then I will see my password 'Test1234' in the field
    When I click icon eye in '<Field>' field
    Then I will not see my password 'Test1234' in the field
    Examples:
      | testRailTag  | Field           |
      | @            | password        |
      | @            | confirmPassword |

  Scenario: Access link login in page registration
    Given I am a customer want to access menu registration
    When I click link registration
    Then I will directing to page login

  Scenario: Access call center on page registration
    Given I am a customer want to access menu registration
    When I click call center
    Then I will see helping center via email

  Scenario: Back to page form registration from pop up confirmation
    Given I am a customer want to access menu registration
    When I filling in my account information with the following details:
      | fullName        | Revvy                    |
      | email           | <your email>             |
      | mobileNumber    | <your phoneNumber>       |
      | password        | <your password>          |
      | confirmPassword | <your password>          |
    And I click button back to page registration
    Then I will direct to page registration with each fields still has values as following:
      | fullName        | Revvy                    |
      | email           | <your email>             |
      | mobileNumber    | <your phoneNumber>       |
      | password        | <your password>          |
      | confirmPassword | <your password>          |

  Scenario: Back to page Onboarding from page Registration
    Given I am a customer want to access menu registration
    When I click button back in the header page
    Then I will direct to page onboarding

  Scenario: Verifying phone number with wrong OTP code
    Given I am a customer had been registering the account with the following details:
      | fullName        | Revvy                    |
      | email           | <your email>             |
      | mobileNumber    | <your phoneNumber>       |
      | password        | <your password>          |
      | confirmPassword | <your password>          |
    And I registering the account
    And I will directing to page terms and condition
    And I click button agree with terms and condition
    And I will directing to page privacy and policy 
    And I click button agree with privacy and policy
    And I will directing to page PDP
    And I click button agree to PDP
    And I check option already and read the condition PDP
    And I check option I agree Amarbank send me new information and innovation from the bank
    And I submit the PDP registration
    When I verifying my phone number by entering the wrong code
    Then I should be notified in the below of field OTP that 'Kode OTP yang dimasukkan salah'

  Scenario: Verifying phone number with expired OTP code
    Given I am a customer had been registering the account with the following details:
      | fullName        | Revvy                    |
      | email           | <your email>             |
      | mobileNumber    | <your phoneNumber>       |
      | password        | <your password>          |
      | confirmPassword | <your password>          |
    And I registering the account
    And I will directing to page terms and condition
    And I click button agree with terms and condition
    And I will directing to page privacy and policy 
    And I click button agree with privacy and policy
    And I will directing to page PDP
    And I click button agree to PDP
    And I check option already and read the condition PDP
    And I check option I agree Amarbank send me new information and innovation from the bank
    And I submit the PDP registration
    When I let the otp code expire
    And I verifying my phone number by entering the code sent to me
    Then I should be notified in the below of field OTP that 'Kode OTP yang dimasukkan sudah kedaluwarsa'

  Scenario: Verifying phone number with wrong OTP code five times
    Given I am a customer had been registering the account with the following details:
      | fullName        | Revvy                    |
      | email           | <your email>             |
      | mobileNumber    | <your phoneNumber>       |
      | password        | <your password>          |
      | confirmPassword | <your password>          |
    And I registering the account
    And I will directing to page terms and condition
    And I click button agree with terms and condition
    And I will directing to page privacy and policy 
    And I click button agree with privacy and policy
    And I will directing to page PDP
    And I click button agree to PDP
    And I check option already and read the condition PDP
    And I check option I agree Amarbank send me new information and innovation from the bank
    And I submit the PDP registration
    When I verifying my phone number by entering the wrong code five times
    Then I should be notified that I can reverify the phone number tomorrow

  Scenario: Create account with wrong code otp four times then input valid code
    Given I am a customer had been registering the account with the following details:
      | fullName        | Revvy                    |
      | email           | <your email>             |
      | mobileNumber    | <your phoneNumber>       |
      | password        | <your password>          |
      | confirmPassword | <your password>          |
    And I registering the account
    And I will directing to page terms and condition
    And I click button agree with terms and condition
    And I will directing to page privacy and policy 
    And I click button agree with privacy and policy
    And I will directing to page PDP
    And I click button agree to PDP
    And I check option already and read the condition PDP
    And I check option I agree Amarbank send me new information and innovation from the bank
    And I submit the PDP registration
    When I verifying my phone number by entering the wrong code four times
    And I verifying my phone number by entering the code sent to me
    Then I will directing to page verification email

  Scenario: Create account with phone number has been updated on the verification page
    Given I am a customer had been registering the account with the following details:
      | fullName        | Revvy                    |
      | email           | <your email>             |
      | mobileNumber    | <your phoneNumber>       |
      | password        | <your password>          |
      | confirmPassword | <your password>          |
    And I registering the account
    And I will directing to page terms and condition
    And I click button agree with terms and condition
    And I will directing to page privacy and policy 
    And I click button agree with privacy and policy
    And I will directing to page PDP
    And I click button agree to PDP
    And I check option already and read the condition PDP
    And I check option I agree Amarbank send me new information and innovation from the bank
    And I submit the PDP registration
    When I choose change phonenumber
    And I change my phonenumber into '"new phonenumber"'
    And I resend the OTP
    And I verifying my phone number by entering the code sent to me
    Then I will directing to page verification email

  Scenario: Change phonenumber with old phonenumber
    Given I am a customer had been registering the account with the following details:
      | fullName        | Revvy                    |
      | email           | <your email>             |
      | mobileNumber    | <your phoneNumber>       |
      | password        | <your password>          |
      | confirmPassword | <your password>          |
    And I registering the account
    And I will directing to page terms and condition
    And I click button agree with terms and condition
    And I will directing to page privacy and policy 
    And I click button agree with privacy and policy
    And I will directing to page PDP
    And I click button agree to PDP
    And I check option already and read the condition PDP
    And I check option I agree Amarbank send me new information and innovation from the bank
    And I submit the PDP registration
    When I choose change phonenumber
    And I filling new phonenumber with my old phonenumber
    Then I should see message error 'Nomor HP tidak boleh sama dengan nomor HP lama' in the below of field new phonenumber

  @validation_format_new_phonenumber
  Scenario Outline: Verifying new phone number with invalid value
    Given I am a customer had been registering the account with the following details:
      | fullName        | Revvy                    |
      | email           | <your email>             |
      | mobileNumber    | <your phoneNumber>       |
      | password        | <your password>          |
      | confirmPassword | <your password>          |
    And I registering the account
    And I will directing to page terms and condition
    And I click button agree with terms and condition
    And I will directing to page privacy and policy 
    And I click button agree with privacy and policy
    And I will directing to page PDP
    And I click button agree to PDP
    And I check option already and read the condition PDP
    And I check option I agree Amarbank send me new information and innovation from the bank
    And I submit the PDP registration
    When I choose change phonenumber
    And I filling new phonenumber with '<Value>'
    Then I should see message error '<Message>' in the below of field new phonenumber
    Examples:                                                                 ❸
      | testRailTag  | Value         | Message                                                       |
      | @            | 89561r12367   | Nomor handphone wajib diisi                                   |
      | @            | 8895611236738 | Panjang nomor handphone minimal 8 digit dan maksimal 15 digit |
      | @            | 8956          | Panjang nomor handphone minimal 8 digit dan maksimal 15 digit |
      | @            | 9678995676    | Nomor handphone tidak sesuai format                           |
      | @            | 8678 995676   | Nomor handphone wajib diisi                                   |
      | @            |               | Nomor handphone wajib diisi                                   |

  Scenario: Back to page Verification phonenumber from page change phonenumber
    Given I am a customer had been registering the account with the following details:
      | fullName        | Revvy                    |
      | email           | <your email>             |
      | mobileNumber    | <your phoneNumber>       |
      | password        | <your password>          |
      | confirmPassword | <your password>          |
    And I registering the account
    And I will directing to page terms and condition
    And I click button agree with terms and condition
    And I will directing to page privacy and policy 
    And I click button agree with privacy and policy
    And I will directing to page PDP
    And I click button agree to PDP
    And I check option already and read the condition PDP
    And I check option I agree Amarbank send me new information and innovation from the bank
    And I submit the PDP registration
    When I choose change phonenumber
    And I click button back in the header page
    Then I will direct to page verification phonenumber

  Scenario: Resend OTP more than five times
    Given I am a customer had been registering the account with the following details:
      | fullName        | Revvy                    |
      | email           | <your email>             |
      | mobileNumber    | <your phoneNumber>       |
      | password        | <your password>          |
      | confirmPassword | <your password>          |
    And I registering the account
    And I will directing to page terms and condition
    And I click button agree with terms and condition
    And I will directing to page privacy and policy 
    And I click button agree with privacy and policy
    And I will directing to page PDP
    And I click button agree to PDP
    And I check option already and read the condition PDP
    And I check option I agree Amarbank send me new information and innovation from the bank
    And I submit the PDP registration
    And I've requested OTP '5' times
    When I resend the OTP
    Then I should be notified that I can reverify the phone number tomorrow
    And I cannot change my phonenumber

  Scenario: Verify state count attempt error when try to resend OTP
    Given I am a customer had been registering the account with the following details:
      | fullName        | Revvy                    |
      | email           | <your email>             |
      | mobileNumber    | <your phoneNumber>       |
      | password        | <your password>          |
      | confirmPassword | <your password>          |
    And I registering the account
    And I will directing to page terms and condition
    And I click button agree with terms and condition
    And I will directing to page privacy and policy 
    And I click button agree with privacy and policy
    And I will directing to page PDP
    And I click button agree to PDP
    And I check option already and read the condition PDP
    And I check option I agree Amarbank send me new information and innovation from the bank
    And I submit the PDP registration
    When I verifying my phone number by entering the wrong code four times
    And I resend the OTP
    And I verifying my phone number by entering the wrong code four times
    Then I should be notified in the below of field OTP that 'Kode OTP yang dimasukkan salah'

  Scenario: Resend email verification
    Given I am a customer had been registering the account with the following details:
      | fullName        | Revvy                    |
      | email           | <your email>             |
      | mobileNumber    | <your phoneNumber>       |
      | password        | <your password>          |
      | confirmPassword | <your password>          |
    And I registering the account
    And I will directing to page terms and condition
    And I click button agree with terms and condition
    And I will directing to page privacy and policy 
    And I click button agree with privacy and policy
    And I will directing to page PDP
    And I click button agree to PDP
    And I check option already and read the condition PDP
    And I submit the PDP registration 
    And I verifying my phone number by entering the code sent to me
    When I resend email verification
    Then I will notify that resend email is successfully  