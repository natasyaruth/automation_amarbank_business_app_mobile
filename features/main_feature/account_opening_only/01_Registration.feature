@regisAcc
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
      | email           | staging_revi_01@gmail.com|
      | mobileNumber    | 8999677540               |
      | password        | 1234Test                 |
      | confirmPassword | 1234Test                 |
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
    And I click button create account
    And I verifying my phone number by entering the code sent to me
    And I verifying my email by login by user id
    Then my account should be created

  Scenario: Verifying field fullname contain with special char (.-,')
    Given I am a customer want to access menu registration
    When I am filling field 'fullName' with 'John Doe S.Kom, M\'Kom-'
    Then I shouldn't see message error in the below of field 'fullName'

  Scenario Outline: Verifying fields has been filled and then empty the fields
    Given I am a customer want to access menu registration
    When I am filling field '<Field>' with 'Testing'
    And I am clearing the field '<Field>'
    Then I should see message error '<Field Name> wajib diisi' in the below of field '<Field>'
    Examples:
      | testRailTag  | Field           | Field Name          |
      |              | fullName        | Nama lengkap        |
      |              | email           | E-mail              |
      |              | mobileNumber    | Nomor handphone     |
      |              | password        | Password            |
      |              | confirmPassword | Konfirmasi password |

  Scenario Outline: Verifying one fields hasn't been filled by user
    Given I am a customer want to access menu registration
    When I fill form registration except field '<Field>'
    And I submit form registration
    Then I should see message error '<Field Name> wajib diisi' in the below of field '<Field>'
    Examples:
      | testRailTag  | Field           | Field Name          |
      |              | fullName        | Nama lengkap        |
      |              | email           | E-mail              |
      |              | mobileNumber    | Nomor handphone     |
      |              | password        | Password            |
      |              | confirmPassword | Konfirmasi password |

  Scenario Outline: Verifying full name with invalid value
    Given I am a customer want to access menu registration
    When I am filling field 'fullName' with '<Value>'
    Then I should see message error '<Message>' in the below of field 'fullName'
    Examples:                                                                 ❸
      | testRailTag  | Value                                                | Message                                                                        |
      |              | Ruth N@tasya!                                        | Nama lengkap tidak boleh mengandung angka dan spesial karakter kecuali (.,\'-) |
      |              | Ruth Natasya 1                                       | Nama lengkap tidak boleh mengandung angka dan spesial karakter kecuali (.,\'-) |
      |              | Ruth Natasya Natasya Natasya Natasya Natasya Natasya | Nama lengkap minimal 3 & maksimal 50 karakter                                  |
      |              | Ru                                                   | Nama lengkap minimal 3 & maksimal 50 karakter                                  |
      |              |                                                      | Nama lengkap wajib diisi                                                       |

  Scenario Outline: Verifying email with invalid value
    Given I am a customer want to access menu registration
    When I am filling field 'email' with '<Value>'
    Then I should see message error '<Message>' in the below of field 'email'
    Examples:                                                                 ❸
      | testRailTag  | Value                  | Message                    |
      |              | ruth.natasyagmail.com  | E-mail tidak sesuai format |
      |              | ruth natasya@gmail.com | E-mail tidak sesuai format |
      |              |                        | E-mail wajib diisi         |

  Scenario Outline: Verifying phone number with invalid value
    Given I am a customer want to access menu registration
    When I am filling field 'mobileNumber' with '<Value>'
    Then I should see message error '<Message>' in the below of field 'mobileNumber'
    Examples:                                                                 ❸
      | testRailTag  | Value         | Message                                                       |
      |              | 89561r12367   | Nomor handphone wajib diisi                                   |
      |              | 8895611236738 | Panjang nomor handphone minimal 8 digit dan maksimal 15 digit |
      |              | 8956          | Panjang nomor handphone minimal 8 digit dan maksimal 15 digit |
      |              | 9678995676    | Nomor handphone tidak sesuai format                           |
      |              | 8678 995676   | Nomor handphone wajib diisi                                   |
      |              |               | Nomor handphone wajib diisi                                   |

  Scenario: Verifying autotrim 0 after label +62 in field phonenumber
    Given I am a customer want to access menu registration
    When I am filling field 'mobileNumber' with '0895611221700'
    Then I will see '895611221700' in field 'mobileNumber'

  Scenario Outline: Verifying password with invalid value
    Given I am a customer want to access menu registration
    When I am filling field 'password' with '<Value>'
    Then I should see message error '<Message>' in the below of field 'password'
    Examples:                                                                 ❸
      | testRailTag  | Value           | Message                                                       |
      |              | TESTINGPASSWORD | Password harus kombinasi huruf kapital, huruf kecil dan angka |
      |              | testingpassword | Password harus kombinasi huruf kapital, huruf kecil dan angka |
      |              | TestingPassword | Password harus kombinasi huruf kapital, huruf kecil dan angka |
      |              | 1234567890      | Password harus kombinasi huruf kapital, huruf kecil dan angka |
      |              | Test1           | Password minimal 8 karakter                                   |
      |              |                 | Password wajib diisi                                          |

  Scenario: Verifying field password contain with alphabeth, number and special character
    Given I am a customer want to access menu registration
    When I am filling field 'password' with 'Test1234!@'
    Then I shouldn't see message error in the below of field 'password'

  Scenario Outline: Verifying confirm password with invalid value
    Given I am a customer want to access menu registration
    When I am filling field 'confirmPassword' with '<Value>'
    Then I should see message error '<Message>' in the below of field 'confirmPassword'
    Examples:                                                                 ❸
      | testRailTag | Value           | Message                                        |
      |             | TESTINGPASSWORD | Konfirmasi password harus sama dengan password |
      |             |                 | Konfirmasi password wajib diisi                |

  Scenario: Verifying autotrim in field Full name
    Given I am a customer want to access menu registration
    When I am filling field 'fullName' with ' Ruth Natasya '
    Then I will see 'Ruth Natasya ' in field 'fullName'

  Scenario Outline: Unmask and mask the password and confirm password
    Given I am a customer want to access menu registration
    When I am filling field '<Field>' with 'Test1234'
    And I click icon eye in '<Field>' field
    Then I will see my password 'Test1234' in the field
    When I click icon eye in '<Field>' field
    Then I will not see my password 'Test1234' in the field
    Examples:
      | testRailTag  | Field           |
      |              | password        |
      |              | confirmPassword |

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

  Scenario: Back to page Onboarding from page Registration
    Given I am a customer want to access menu registration
    When I click button back in the header page
    Then I will direct to page onboarding

  Scenario: Create account business with business code from invitation email
    Given I am a customer lead wanting to register account business from invitation
    When I choose menu registration
    And I filling in my account business information with the following details:
      | fullName        | Johan Hopkins                |
      | email           | johan.hopkins@trash-mail.com |
      | mobileNumber    | 8776230006                   |
      | password        | 1234Test                     |
      | confirmPassword | 1234Test                     |
    And I registering the account
    And I will directing to page terms and condition
    And I click button agree with terms and condition
    And I will directing to page privacy and policy 
    And I click button agree with privacy and policy
    And I will directing to page PDP
    And I click button agree to PDP
    And I check option already and read the condition PDP
    And I check option I agree Amarbank send me new information and innovation from the bank
    And I click button create account
    And I verifying my phone number by entering the code sent to me
    And I verifying my email by login by user id
    Then my account should be created

  Scenario: Create account business with business unregistered code
    Given I am a customer lead wanting to register account business from invitation
    When I choose menu registration
    And I am filling field 'email' with 'test.automate@trash-mail.com'
    And I am filling field 'businessCode' with 'xxyy11'
    Then I should see message error 'Kode bisnis tidak valid, periksa e-mail kembali' in the below of field 'businessCode'

  Scenario: Create account business with email that is not belong to the business code
    Given I am a customer lead wanting to register account business from invitation
    When I choose menu registration
    And I am filling field 'email' with 'test@trash-mail.com'
    And I am filling field 'businessCode' with 'a85694'
    Then I should see message error 'E-mail tidak sesuai dengan kode bisnis.' in the below of field 'email'
  
  Scenario: Verifying field business code has been filled and then empty the field
    Given I am a customer want to access menu registration
    When I am filling field 'businessCode' with 'XYZ123'
    And I am clearing the field 'businessCode'
    Then I shouldn't see message error in the below of field 'businessCode'

  Scenario: Verifying the button "Buat Akun" with checked mandatory PDP checklist
    Given I am a customer want to access menu registration
    When I filling in my account information with the following details:
      | fullName        | barat daya              |
      | email           | baratdaya01@yopmail.com |
      | mobileNumber    | 85765114480             |
      | password        | 1234Test                |
      | confirmPassword | 1234Test                |
    And I registering the account
    And I will directing to page terms and condition
    And I click button agree with terms and condition
    And I will directing to page privacy and policy 
    And I click button agree with privacy and policy
    And I will directing to page PDP
    And I click button agree to PDP
    And I check option already and read the condition PDP 
    Then I should see button Buat Akun will enable

  Scenario: Verifying the button "Buat Akun" with check PDP checklist and uncheck optional checklist
    Given I am a customer want to access menu registration
    When I filling in my account information with the following details:
      | fullName        | barat daya              |
      | email           | baratdaya01@yopmail.com |
      | mobileNumber    | 85765114480             |
      | password        | 1234Test                |
      | confirmPassword | 1234Test                |
    And I registering the account
    And I will directing to page terms and condition
    And I click button agree with terms and condition
    And I will directing to page privacy and policy 
    And I click button agree with privacy and policy
    And I will directing to page PDP
    And I click button agree to PDP
    And I check option already and read the condition PDP
    And I check option I agree Amarbank send me new information and innovation from the bank
    And I uncheck option I agree Amarbank send me new information and innovation from the bank
    Then I should see button Buat Akun will enable

  Scenario: Verifying the button "Buat Akun" with unchecked option PDP required
    Given I am a customer want to access menu registration
    When I filling in my account information with the following details:
      | fullName        | barat daya              |
      | email           | baratdaya01@yopmail.com |
      | mobileNumber    | 85765114480             |
      | password        | 1234Test                |
      | confirmPassword | 1234Test                |
    And I registering the account
    And I will directing to page terms and condition
    And I click button agree with terms and condition
    And I will directing to page privacy and policy 
    And I click button agree with privacy and policy
    And I will directing to page PDP
    And I click button agree to PDP
    And I check option already and read the condition PDP
    And I check option I agree Amarbank send me new information and innovation from the bank
    And I uncheck option already and read the condition PDP
    Then I should see button Buat Akun will disable

  Scenario: Back to page registration 1 from page PDP
    Given I am a customer want to access menu registration
    When I filling in my account information with the following details:
      | fullName        | barat daya              |
      | email           | baratdaya01@yopmail.com |
      | mobileNumber    | 85765114480             |
      | password        | 1234Test                |
      | confirmPassword | 1234Test                |
    And I registering the account
    And I will directing to page terms and condition
    And I click button agree with terms and condition
    And I will directing to page privacy and policy 
    And I click button agree with privacy and policy
    And I will directing to page PDP
    And I click button agree to PDP
    When I click button back in the header page
    And I will directing to page privacy and policy
    And I click button back in the header page
    And I will directing to page terms and condition
    And I click button back in the header page
    Then I will direct to Registration page

  Scenario: Verifying phone number with wrong OTP code
    Given I am a customer had been registering the account with the following details:
      | fullName        | Ruth Natasya       |
      | email           | fakemail@email.com |
      | mobileNumber    | 81234567870        |
      | password        | Test1234           |
      | confirmPassword | Test1234           |
    And I registering the account
    And I will directing to page terms and condition
    And I click button agree with terms and condition
    And I will directing to page privacy and policy 
    And I click button agree with privacy and policy
    And I will directing to page PDP
    And I click button agree to PDP
    And I check option already and read the condition PDP
    And I check option I agree Amarbank send me new information and innovation from the bank
    And I click button create account
    When I verifying my phone number by entering the wrong code
    Then I should be notified in the below of field OTP that 'Kode OTP yang dimasukkan salah'

  Scenario: Verifying phone number with expired OTP code
    Given I am a customer had been registering the account with the following details:
      | fullName        | Ruth Natasya       |
      | email           | fakemail@email.com |
      | mobileNumber    | 89994567866        |
      | password        | Test1234           |
      | confirmPassword | Test1234           |
    And I registering the account
    And I will directing to page terms and condition
    And I click button agree with terms and condition
    And I will directing to page privacy and policy 
    And I click button agree with privacy and policy
    And I will directing to page PDP
    And I click button agree to PDP
    And I check option already and read the condition PDP
    And I check option I agree Amarbank send me new information and innovation from the bank
    And I click button create account
    When I let the otp code expire
    And I verifying my phone number by entering the code sent to me
    Then I should be notified in the below of field OTP that 'Kode OTP yang dimasukan sudah kadaluarsa'

  Scenario: Verifying phone number with wrong OTP code five times
    Given I am a customer had been registering the account with the following details:
      | fullName        | Ruth Natasya       |
      | email           | fakemail@email.com |
      | mobileNumber    | 87539568672        |
      | password        | Test1234           |
      | confirmPassword | Test1234           |
    And I registering the account
    And I will directing to page terms and condition
    And I click button agree with terms and condition
    And I will directing to page privacy and policy 
    And I click button agree with privacy and policy
    And I will directing to page PDP
    And I click button agree to PDP
    And I check option already and read the condition PDP
    And I check option I agree Amarbank send me new information and innovation from the bank
    And I click button create account
    When I verifying my phone number by entering the wrong code five times
    Then I should be notified that I can reverify the phone number tomorrow

  Scenario: Create account with wrong code otp four times then input valid code
    Given I am a customer had been registering the account with the following details:
      | fullName        | Ruth Natasya        |
      | email           | ruth@trash-mail.com |
      | mobileNumber    | 81230057898         |
      | password        | Test1234            |
      | confirmPassword | Test1234            |
    And I registering the account
    And I will directing to page terms and condition
    And I click button agree with terms and condition
    And I will directing to page privacy and policy 
    And I click button agree with privacy and policy
    And I will directing to page PDP
    And I click button agree to PDP
    And I check option already and read the condition PDP
    And I check option I agree Amarbank send me new information and innovation from the bank
    And I click button create account
    When I verifying my phone number by entering the wrong code four times
    And I verifying my phone number by entering the code sent to me
    Then I will directing to page verification email

  Scenario: Create account with phone number has been updated on the verification page
    Given I am a customer had been registering the account with the following details:
      | fullName        | Ruth Natasya       |
      | email           | fakemail@email.com |
      | mobileNumber    | 81240455100        |
      | password        | Test1234           |
      | confirmPassword | Test1234           |
    And I registering the account
    And I will directing to page terms and condition
    And I click button agree with terms and condition
    And I will directing to page privacy and policy 
    And I click button agree with privacy and policy
    And I will directing to page PDP
    And I click button agree to PDP
    And I check option already and read the condition PDP
    And I check option I agree Amarbank send me new information and innovation from the bank
    And I click button create account
    When I choose change phonenumber
    And I change my phonenumber into '89577322178'
    And I resend the OTP
    And I verifying my phone number by entering the code sent to me
    Then I will directing to page verification email

  Scenario: Change phonenumber with old phonenumber
    Given I am a customer had been registering the account with the following details:
      | fullName        | Ruth Natasya       |
      | email           | fakemail@email.com |
      | mobileNumber    | 89834567892        |
      | password        | Test1234           |
      | confirmPassword | Test1234           |
    And I registering the account
    And I will directing to page terms and condition
    And I click button agree with terms and condition
    And I will directing to page privacy and policy 
    And I click button agree with privacy and policy
    And I will directing to page PDP
    And I click button agree to PDP
    And I check option already and read the condition PDP
    And I check option I agree Amarbank send me new information and innovation from the bank
    And I click button create account
    When I choose change phonenumber
    And I filling new phonenumber with my old phonenumber
    Then I should see message error 'Nomor HP tidak boleh sama dengan nomor HP lama' in the below of field new phonenumber

  Scenario Outline: Verifying new phone number with invalid value
    Given I am a customer had been registering the account with the following details:
      | fullName        | Ruth Natasya       |
      | email           | fakemail@email.com |
      | mobileNumber    | <Phone Number>     |
      | password        | Test1234           |
      | confirmPassword | Test1234           |
    And I registering the account
    And I will directing to page terms and condition
    And I click button agree with terms and condition
    And I will directing to page privacy and policy 
    And I click button agree with privacy and policy
    And I will directing to page PDP
    And I click button agree to PDP
    And I check option already and read the condition PDP
    And I check option I agree Amarbank send me new information and innovation from the bank
    And I click button create account
    When I choose change phonenumber
    And I filling new phonenumber with '<Value>'
    Then I should see message error '<Message>' in the below of field new phonenumber
    Examples:                                                                 ❸
      | testRailTag  | Value         | Message                                                       | Phone Number |
      |              | 89561r12367   | Nomor handphone wajib diisi                                   | 89834567892  |
      |              | 8895611236738 | Panjang nomor handphone minimal 8 digit dan maksimal 15 digit | 81734567892  |
      |              | 8956          | Panjang nomor handphone minimal 8 digit dan maksimal 15 digit | 81534567892  |
      |              | 9678995676    | Nomor handphone tidak sesuai format                           | 81434567892  |
      |              | 8678 995676   | Nomor handphone wajib diisi                                   | 81334567892  |
      |              |               | Nomor handphone wajib diisi                                   | 81234567892  |

  Scenario: Back to page Verification phonenumber from page change phonenumber
    Given I am a customer had been registering the account with the following details:
      | fullName        | Ruth Natasya       |
      | email           | fakemail@email.com |
      | mobileNumber    | 81288567890        |
      | password        | Test1234           |
      | confirmPassword | Test1234           |
    And I registering the account
    And I will directing to page terms and condition
    And I click button agree with terms and condition
    And I will directing to page privacy and policy 
    And I click button agree with privacy and policy
    And I will directing to page PDP
    And I click button agree to PDP
    And I check option already and read the condition PDP
    And I check option I agree Amarbank send me new information and innovation from the bank
    And I click button create account
    When I choose change phonenumber
    And I click button back in the header page
    Then I will direct to page verification phonenumber

  Scenario: First attempt resend OTP
    Given I am a customer had been registering the account with the following details:
      | fullName        | Ruth Natasya       |
      | email           | fakemail@email.com |
      | mobileNumber    | 81193628993        |
      | password        | Test1234           |
      | confirmPassword | Test1234           |
    And I registering the account
    And I will directing to page terms and condition
    And I click button agree with terms and condition
    And I will directing to page privacy and policy 
    And I click button agree with privacy and policy
    And I will directing to page PDP
    And I click button agree to PDP
    And I check option already and read the condition PDP
    And I check option I agree Amarbank send me new information and innovation from the bank
    And I click button create account
    When I get my first OTP
    And I resend the OTP
    Then I will get new OTP different with my first OTP
    And I will see attempts left '1/5'

  Scenario: Second attempt resend OTP
    Given I am a customer had been registering the account with the following details:
      | fullName        | Ruth Natasya       |
      | email           | fakemail@email.com |
      | mobileNumber    | 88793628993        |
      | password        | Test1234           |
      | confirmPassword | Test1234           |
    And I registering the account  
    And I will directing to page terms and condition
    And I click button agree with terms and condition
    And I will directing to page privacy and policy 
    And I click button agree with privacy and policy
    And I will directing to page PDP
    And I click button agree to PDP
    And I check option already and read the condition PDP
    And I check option I agree Amarbank send me new information and innovation from the bank
    And I click button create account
    And I've requested OTP '1' times
    When I get my first OTP
    And I resend the OTP
    Then I will get new OTP different with my first OTP
    And I will see attempts left '2/5'

  Scenario: Third attempt resend OTP
    Given I am a customer had been registering the account with the following details:
      | fullName        | Ruth Natasya       |
      | email           | fakemail@email.com |
      | mobileNumber    | 84493628993        |
      | password        | Test1234           |
      | confirmPassword | Test1234           |
    And I registering the account
    And I will directing to page terms and condition
    And I click button agree with terms and condition
    And I will directing to page privacy and policy 
    And I click button agree with privacy and policy
    And I will directing to page PDP
    And I click button agree to PDP
    And I check option already and read the condition PDP
    And I check option I agree Amarbank send me new information and innovation from the bank
    And I click button create account
    And I've requested OTP '2' times
    When I get my first OTP
    And I resend the OTP
    Then I will get new OTP different with my first OTP
    And I will see attempts left '3/5'

  Scenario: Fourth attempt resend OTP
    Given I am a customer had been registering the account with the following details:
      | fullName        | Ruth Natasya       |
      | email           | fakemail@email.com |
      | mobileNumber    | 81293508106        |
      | password        | Test1234           |
      | confirmPassword | Test1234           |
    And I registering the account
    And I will directing to page terms and condition
    And I click button agree with terms and condition
    And I will directing to page privacy and policy 
    And I click button agree with privacy and policy
    And I will directing to page PDP
    And I click button agree to PDP
    And I check option already and read the condition PDP
    And I check option I agree Amarbank send me new information and innovation from the bank
    And I click button create account
    And I've requested OTP '3' times
    When I get my first OTP
    And I resend the OTP
    Then I will get new OTP different with my first OTP
    And I will see attempts left '4/5'

  Scenario: Fifth attempt resend OTP
    Given I am a customer had been registering the account with the following details:
      | fullName        | Ruth Natasya       |
      | email           | fakemail@email.com |
      | mobileNumber    | 81273598106        |
      | password        | Test1234           |
      | confirmPassword | Test1234           |
    And I registering the account
    And I will directing to page terms and condition
    And I click button agree with terms and condition
    And I will directing to page privacy and policy 
    And I click button agree with privacy and policy
    And I will directing to page PDP
    And I click button agree to PDP
    And I check option already and read the condition PDP
    And I check option I agree Amarbank send me new information and innovation from the bank
    And I click button create account
    And I've requested OTP '4' times
    When I get my first OTP
    And I resend the OTP
    Then I will get new OTP different with my first OTP
    And I will see attempts left '5/5'

  Scenario: Resend OTP more than five times
    Given I am a customer had been registering the account with the following details:
      | fullName        | Ruth Natasya       |
      | email           | fakemail@email.com |
      | mobileNumber    | 89561339239        |
      | password        | Test1234           |
      | confirmPassword | Test1234           |
    And I registering the account
    And I will directing to page terms and condition
    And I click button agree with terms and condition
    And I will directing to page privacy and policy 
    And I click button agree with privacy and policy
    And I will directing to page PDP
    And I click button agree to PDP
    And I check option already and read the condition PDP
    And I check option I agree Amarbank send me new information and innovation from the bank
    And I click button create account
    And I've requested OTP '5' times
    When I resend the OTP
    Then I should be notified that I can reverify the phone number tomorrow
    And I cannot change my phonenumber

  Scenario: Verify state count attempt error when try to resend OTP
    Given I am a customer had been registering the account with the following details:
      | fullName        | Ruth Natasya       |
      | email           | fakemail@email.com |
      | mobileNumber    | 89561338639        |
      | password        | Test1234           |
      | confirmPassword | Test1234           |
    And I registering the account
    And I will directing to page terms and condition
    And I click button agree with terms and condition
    And I will directing to page privacy and policy 
    And I click button agree with privacy and policy
    And I will directing to page PDP
    And I click button agree to PDP
    And I check option already and read the condition PDP
    And I check option I agree Amarbank send me new information and innovation from the bank
    And I click button create account
    When I verifying my phone number by entering the wrong code four times
    And I resend the OTP
    And I verifying my phone number by entering the wrong code four times
    Then I should be notified in the below of field OTP that 'Kode OTP yang dimasukkan salah'

  Scenario: Resend email verification
    Given I am a customer had been registering the account with the following details:
      | fullName        | Ruth Natasya       |
      | email           | fakemail@email.com |
      | mobileNumber    | 81293697203        |
      | password        | Test1234           |
      | confirmPassword | Test1234           |
    And I registering the account
    And I will directing to page terms and condition
    And I click button agree with terms and condition
    And I will directing to page privacy and policy 
    And I click button agree with privacy and policy
    And I will directing to page PDP
    And I click button agree to PDP
    And I check option already and read the condition PDP
    And I check option I agree Amarbank send me new information and innovation from the bank
    And I click button create account  
    And I verifying my phone number by entering the code sent to me
    When I resend email verification
    Then I will notify that resend email is successfully