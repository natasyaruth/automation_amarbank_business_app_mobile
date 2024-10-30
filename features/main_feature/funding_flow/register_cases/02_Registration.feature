@automated_account_regist
Feature: AUTOMATED Account registration
  In order to open an SMB account
  As a customer lead
  I want to register for an account

  @C163442
  Scenario: AUTOMATED Create a new account
  Given I am a customer lead wanting to open a new account
    When I choose menu registration
    And I filling in my account information with the following details:
      | fullName        | Revvy                    |
      | email           | yahya_auto20@gmail.com  |
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
    And I submit the PDP registration
    And I verifying my phone number by entering the code sent to me
    And I verifying my email by login by user id
    Then my account should be created

  @C163443
  Scenario: AUTOMATED Verifying the button "Buat Akun" with checked mandatory PDP checklist
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
  
  @C163444
  Scenario: AUTOMATED Verifying the button "Buat Akun" with check PDP checklist and uncheck optional checklist
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

  @C163445
  Scenario: AUTOMATED Verifying the button "Buat Akun" with unchecked option PDP required
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

  @C163446
  Scenario: AUTOMATED Back to page registration 1 from page PDP
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

  @C163447
  Scenario: AUTOMATED Verifying phone number with wrong OTP code
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

  @C163448
  Scenario: AUTOMATED Verifying phone number with expired OTP code
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

  @C163449
  Scenario: AUTOMATED Verifying phone number with wrong OTP code five times
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

  @C163450
  Scenario: AUTOMATED Create account with wrong code otp four times then input valid code
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

  @C163451
  Scenario: AUTOMATED Create account with phone number has been updated on the verification page
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

  @C163452
  Scenario: AUTOMATED Change phonenumber with old phonenumber
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

  @verifying_new_phone_number_with_invalid_value 
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
      | testRailTag    | Value         | Message                                                       | Phone Number |
      |@C163453        | 89561r12367   | Nomor handphone wajib diisi                                   | 89834567892  |
      |@C163454        | 8895611236738 | Panjang nomor handphone minimal 8 digit dan maksimal 15 digit | 81734567892  |
      |@C163455        | 8956          | Panjang nomor handphone minimal 8 digit dan maksimal 15 digit | 81534567892  |
      |@C163456	       | 9678995676    | Nomor handphone tidak sesuai format                           | 81434567892  |
      |@C163457        | 8678 995676   | Nomor handphone wajib diisi                                   | 81334567892  |
      |@C163458        |               | Nomor handphone wajib diisi                                   | 81234567892  |

  @C163459
  Scenario: AUTOMATED Back to page Verification phonenumber from page change phonenumber
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

  @C163460
  Scenario: AUTOMATED First attempt resend OTP
    Given I am a customer had been registering the account with the following details:
      | fullName        | Yahya H       |
      | email           | yahya_baru03@email.com |
      | mobileNumber    | 81193628999        |
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

  @C163461
  Scenario: AUTOMATED Second attempt resend OTP
    Given I am a customer had been registering the account with the following details:
      | fullName        | Yahya H       |
      | email           | yahya_baru04@email.com |
      | mobileNumber    | 81193629000        |
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

  @C163462
  Scenario: AUTOMATED Third attempt resend OTP
    Given I am a customer had been registering the account with the following details:
      | fullName        | Yahya H       |
      | email           | yahya_baru05@email.com |
      | mobileNumber    | 81193629001        |
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

  @C163463
  Scenario: AUTOMATED Fourth attempt resend OTP
    Given I am a customer had been registering the account with the following details:
      | fullName        | Yahya H       |
      | email           | yahya_baru06@email.com |
      | mobileNumber    | 81193629002        |
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

  @C163464
  Scenario: AUTOMATED Fifth attempt resend OTP
    Given I am a customer had been registering the account with the following details:
      | fullName        | Yahya H       |
      | email           | yahya_baru11@email.com |
      | mobileNumber    | 81193629011        |
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

  @C163465
  Scenario: AUTOMATED Resend OTP more than five times
    Given I am a customer had been registering the account with the following details:
      | fullName        | Yahya H       |
      | email           | yahya_baru12@email.com |
      | mobileNumber    | 81193629012        |
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

  @C163466
  Scenario: AUTOMATED Verify state count attempt error when try to resend OTP
    Given I am a customer had been registering the account with the following details:
      | fullName        | Yahya H       |
      | email           | yahya_baru15@email.com |
      | mobileNumber    | 81193629015        |
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

  @C163467
  Scenario: AUTOMATED Resend email verification
    Given I am a customer had been registering the account with the following details:
      | fullName        | Yahya H       |
      | email           | yahya_auto20@yopmail.com |
      | mobileNumber    | 81293628        |
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
    When I resend email verification
    Then I will notify that resend email is successfully