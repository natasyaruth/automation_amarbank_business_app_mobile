@regisAcc
Feature: Account registration
  In order to open an SMB account
  As a customer lead
  I want to register for an account
  
  @C159564
  Scenario: Validate wording carousel onboarding
    Given I am a customer open app amarbank business
    When I see carousel onboarding
    And I validate wording funding business
    And I swipe to next carousel
    And I validate wording financial management
    And I swipe to next carousel
    And I validate wording financial and data privacy

  @C159565  
  Scenario: Create a new account
    Given I am a customer lead wanting to open a new account
    When I choose menu registration
    And I filling in my account information with the following details:
      | fullName        | Natasya Lending         |
      | email           | natasyaruth007@yopmail.com |
      | mobileNumber    | 81293628             |
      | password        | 1234Test                |
      | confirmPassword | 1234Test                |
    And I registering the account
    And I will directing to page terms and condition
    And I click button agree with terms and condition
    And I will directing to page privacy and policy 
    And I click button agree with privacy and policy
    And I will directing to page PDP
    And I checked the 2 mandatory PDP checklists
    And I click button 'createAccountPDP'
    And I verifying my phone number by entering the code sent to me
    And I verifying my email by login by user id
    Then my account should be created

  @C159566
  Scenario: Verifying field fullname contain with special char (.-,')
    Given I am a customer want to access menu registration
    When I am filling field 'fullName' with 'John Doe S.Kom, M\'Kom-'
    Then I shouldn't see message error in the below of field 'fullName'

  @scenario_verify_field_has_been_filled_and_empty
  Scenario Outline: Verifying fields has been filled and then empty the fields
    Given I am a customer want to access menu registration
    When I am filling field '<Field>' with 'Testing'
    And I am clearing the field '<Field>'
    Then I should see message error '<Field Name> wajib diisi' in the below of field '<Field>'
    Examples:
      | testRailTag  | Field           | Field Name          |
      | @C159567     | fullName        | Nama lengkap        |
      | @C159568     | email           | E-mail              |
      | @C159569     | mobileNumber    | Nomor handphone     |
      | @C159570     | password        | Password            |
      | @C159571     | confirmPassword | Konfirmasi password |

  @scenario_verify_one_field_hasnot_been_filled_by_user   
  Scenario Outline: Verifying one fields hasn't been filled by user
    Given I am a customer want to access menu registration
    When I fill form registration except field '<Field>'
    And I submit form registration
    Then I should see message error '<Field Name> wajib diisi' in the below of field '<Field>'
    Examples:
      | testRailTag  | Field           | Field Name          |
      | @C159572     | fullName        | Nama lengkap        |
      | @C159573     | email           | E-mail              |
      | @C159574     | mobileNumber    | Nomor handphone     |
      | @C159576     | password        | Password            |
      | @C159577     | confirmPassword | Konfirmasi password |

  @scenario_verify_fullname_with_invalid_value 
  Scenario Outline: Verifying full name with invalid value
    Given I am a customer want to access menu registration
    When I am filling field 'fullName' with '<Value>'
    Then I should see message error '<Message>' in the below of field 'fullName'
    Examples:                                                                 ❸
      | testRailTag  | Value                                                | Message                                                                        |
      | @C159578     | Ruth N@tasya!                                        | Nama lengkap tidak boleh mengandung angka dan spesial karakter kecuali (.,\'-) |
      | @C159579     | Ruth Natasya 1                                       | Nama lengkap tidak boleh mengandung angka dan spesial karakter kecuali (.,\'-) |
      | @C159581     | Ruth Natasya Natasya Natasya Natasya Natasya Natasya | Nama lengkap minimal 3 & maksimal 50 karakter                                  |
      | @C159582     | Ru                                                   | Nama lengkap minimal 3 & maksimal 50 karakter                                  |
      | @C159583     |                                                      | Nama lengkap wajib diisi                                                       |

  @scenario_verify_email_with_invalid_value 
  Scenario Outline: Verifying email with invalid value
    Given I am a customer want to access menu registration
    When I am filling field 'email' with '<Value>'
    Then I should see message error '<Message>' in the below of field 'email'
    Examples:                                                                 ❸
      | testRailTag  | Value                  | Message                    |
      | @C159584     | ruth.natasyagmail.com  | E-mail tidak sesuai format |
      | @C159585     | ruth natasya@gmail.com | E-mail tidak sesuai format |
      | @C159587     |                        | E-mail wajib diisi         |

  @scenario_verify_phone_number_with_invalid_value
  Scenario Outline: Verifying phone number with invalid value
    Given I am a customer want to access menu registration
    When I am filling field 'mobileNumber' with '<Value>'
    Then I should see message error '<Message>' in the below of field 'mobileNumber'
    Examples:                                                                 ❸
      | testRailTag | Value         | Message                                                       |
      | @C159588     | 89561r12367   | Nomor handphone wajib diisi                                   |
      | @C159589     | 8895611236738 | Panjang nomor handphone minimal 8 digit dan maksimal 15 digit |
      | @C159590     | 8956          | Panjang nomor handphone minimal 8 digit dan maksimal 15 digit |
      | @C159591     | 9678995676    | Nomor handphone tidak sesuai format                           |
      | @C159592     | 8678 995676   | Nomor handphone wajib diisi                                   |
      | @C159593     |               | Nomor handphone wajib diisi                                   |

  @C159595 
  Scenario: Verifying autotrim 0 after label +62 in field phonenumber
    Given I am a customer want to access menu registration
    When I am filling field 'mobileNumber' with '0895611221700'
    Then I will see '895611221700' in field 'mobileNumber'

  @scenario_verify_password_with_invalid_value 
  Scenario Outline: Verifying password with invalid value
    Given I am a customer want to access menu registration
    When I am filling field 'password' with '<Value>'
    Then I should see message error '<Message>' in the below of field 'password'
    Examples:                                                                 ❸
      | testRailTag | Value           | Message                                                       |
      | @C159596     | TESTINGPASSWORD | Password harus kombinasi huruf kapital, huruf kecil dan angka |
      | @C159597     | testingpassword | Password harus kombinasi huruf kapital, huruf kecil dan angka |
      | @C159598	     | TestingPassword | Password harus kombinasi huruf kapital, huruf kecil dan angka |
      | @C159599	     | 1234567890      | Password harus kombinasi huruf kapital, huruf kecil dan angka |
      | @C159600     | Test1           | Password minimal 8 karakter                                   |
      | @C159601     |                 | Password wajib diisi                                          |

  @C159602 
  Scenario: Verifying field password contain with alphabeth, number and special character
    Given I am a customer want to access menu registration
    When I am filling field 'password' with 'Test1234!@'
    Then I shouldn't see message error in the below of field 'password'

  @scenario_verify_confirm_password_with_invalid_value  
  Scenario Outline: Verifying confirm password with invalid value
    Given I am a customer want to access menu registration
    When I am filling field 'confirmPassword' with '<Value>'
    Then I should see message error '<Message>' in the below of field 'confirmPassword'
    Examples:                                                                 ❸
      | testRailTag  | Value           | Message                                        |
      | @C159603     | TESTINGPASSWORD | Konfirmasi password harus sama dengan password |
      | @C159604     |                 | Konfirmasi password wajib diisi                |

  @C159606 
  Scenario: Verifying autotrim in field Full name
    Given I am a customer want to access menu registration
    When I am filling field 'fullName' with ' Ruth Natasya '
    Then I will see 'Ruth Natasya ' in field 'fullName'

  @scenario_mask_unmask_password 
  Scenario Outline: Unmask and mask the password and confirm password
    Given I am a customer want to access menu registration
    When I am filling field '<Field>' with 'Test1234'
    And I click icon eye in '<Field>' field
    Then I will see my password 'Test1234' in the field
    When I click icon eye in '<Field>' field
    Then I will not see my password 'Test1234' in the field
    Examples:
      | testRailTag  | Field           |
      | @C159607     | password        |
      | @C159608     | confirmPassword |

  @C159609
  Scenario: Access link login in page registration
    Given I am a customer want to access menu registration
    When I click link registration
    Then I will directing to page login

  
  # Scenario: Access link terms and condition in page registration
  #   Given I am a customer want to access menu registration
  #   When I click link terms and condition
  #   Then I will directing to web view terms and condition

  
  # Scenario: Access link privacy and policy in page registration
  #   Given I am a customer want to access menu registration
  #   When I click link privacy and policy
  #   Then I will directing to web view privacy and policy

  @C159610
  Scenario: Access call center on page registration
    Given I am a customer want to access menu registration
    When I click call center
    Then I will see helping center via email
    

  @C159612 
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

  @C159613 
  Scenario: Back to page Onboarding from page Registration
    Given I am a customer want to access menu registration
    When I click button back in the header page
    Then I will direct to page onboarding

   

  @C159614
  Scenario: Create account business with business unregistered code
    Given I am a customer lead wanting to register account business from invitation
    When I choose menu registration
    And I am filling field 'email' with 'test.automate@trash-mail.com'
    And I am filling field 'businessCode' with 'xxyy11'
    Then I should see message error 'Kode bisnis tidak valid, periksa e-mail kembali' in the below of field 'businessCode'

  @C159615
  Scenario: Create account business with email that is not belong to the business code
    Given I am a customer lead wanting to register account business from invitation
    When I choose menu registration
    And I am filling field 'email' with 'test@trash-mail.com'
    And I am filling field 'businessCode' with 'a85694'
    Then I should see message error 'E-mail tidak sesuai dengan kode bisnis.' in the below of field 'email'

  @C159616
  Scenario: Verifying field business code has been filled and then empty the field
    Given I am a customer want to access menu registration
    When I am filling field 'businessCode' with 'XYZ123'
    And I am clearing the field 'businessCode'
    Then I shouldn't see message error in the below of field 'businessCode'

  @C159617	 
  Scenario: Verifying the button "Buat Akun" with checked 2 mandatory PDP checklist
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
    And I checked the 2 mandatory PDP checklists
    Then I should see button Buat Akun will enable
  
  @C159618
  Scenario: Verifying the button "Buat Akun" with unchecked 2 mandatory PDP checklist and checked optional checklist
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
    And I unchecked the 2 mandatory PDP checklists
    And I checked the optional PDP checklist
    Then I should see button Buat Akun will disable

  @C159620 
  Scenario: Go to "Verifikasi No. HP" page after click button "Buat Akun" on PDP Page
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
    When I checked the 2 mandatory PDP checklists
    And I click button 'createAccountPDP'
    Then I should go to Verifikasi No. HP page
    And I get email including the information about PDP that i checked before

  @C159621  
  Scenario: Validate wording content on 3 PDP content
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
    When I am on page PDP consent
    Then I see text consent PDP 

  @C159622  
  Scenario: Verifying phone number with wrong OTP code
    Given I am a customer had been registering the account with the following details:
      | fullName        | Ruth Natasya       |
      | email           | fakemail@email.com |
      | mobileNumber    | 81234567870        |
      | password        | Test1234           |
      | confirmPassword | Test1234           |
    And I will directing to page terms and condition
    And I click button agree with terms and condition
    And I will directing to page privacy and policy 
    And I click button agree with privacy and policy
    And I will directing to page PDP
    When I checked the 2 mandatory PDP checklists
    And I click button 'createAccountPDP'
    Then I should go to Verifikasi No. HP page
    When I verifying my phone number by entering the wrong code
    Then I should be notified in the below of field OTP that 'Kode OTP yang dimasukkan salah'

  @C159623
  Scenario: Verifying phone number with expired OTP code
    Given I am a customer had been registering the account with the following details:
      | fullName        | Ruth Natasya       |
      | email           | fakemail@email.com |
      | mobileNumber    | 89994567866        |
      | password        | Test1234           |
      | confirmPassword | Test1234           |
    And I will directing to page terms and condition
    And I click button agree with terms and condition
    And I will directing to page privacy and policy 
    And I click button agree with privacy and policy
    And I will directing to page PDP
    When I checked the 2 mandatory PDP checklists
    And I click button 'createAccountPDP'
    Then I should go to Verifikasi No. HP page
    When I let the otp code expire
    And I verifying my phone number by entering the code sent to me
    Then I should be notified in the below of field OTP that 'Kode OTP yang dimasukan sudah kadaluarsa'

  @C159624
  Scenario: Verifying phone number with wrong OTP code five times
    Given I am a customer had been registering the account with the following details:
      | fullName        | Ruth Natasya       |
      | email           | fakemail@email.com |
      | mobileNumber    | 87539568672        |
      | password        | Test1234           |
      | confirmPassword | Test1234           |
    And I will directing to page terms and condition
    And I click button agree with terms and condition
    And I will directing to page privacy and policy 
    And I click button agree with privacy and policy
    And I will directing to page PDP
    When I checked the 2 mandatory PDP checklists
    And I click button 'createAccountPDP'
    Then I should go to Verifikasi No. HP page
    When I verifying my phone number by entering the wrong code five times
    Then I should be notified that I can reverify the phone number tomorrow

  @C159625
  Scenario: Create account with wrong code otp four times then input valid code
    Given I am a customer had been registering the account with the following details:
      | fullName        | Ruth Natasya        |
      | email           | ruth@trash-mail.com |
      | mobileNumber    | 81230057898         |
      | password        | Test1234            |
      | confirmPassword | Test1234            |
    And I will directing to page terms and condition
    And I click button agree with terms and condition
    And I will directing to page privacy and policy 
    And I click button agree with privacy and policy
    And I will directing to page PDP
    When I checked the 2 mandatory PDP checklists
    And I click button 'createAccountPDP'
    Then I should go to Verifikasi No. HP page
    When I verifying my phone number by entering the wrong code four times
    And I verifying my phone number by entering the code sent to me
    Then I will directing to page verification email

  @C159627
  Scenario: Create account with phone number has been updated on the verification page
    Given I am a customer had been registering the account with the following details:
      | fullName        | Ruth Natasya       |
      | email           | fakemail@email.com |
      | mobileNumber    | 81240455100        |
      | password        | Test1234           |
      | confirmPassword | Test1234           |
    And I will directing to page terms and condition
    And I click button agree with terms and condition
    And I will directing to page privacy and policy 
    And I click button agree with privacy and policy
    And I will directing to page PDP
    When I checked the 2 mandatory PDP checklists
    And I click button 'createAccountPDP'
    Then I should go to Verifikasi No. HP page
    When I choose change phonenumber
    And I change my phonenumber into '89577322178'
    And I resend the OTP
    And I verifying my phone number by entering the code sent to me
    Then I will directing to page verification email

  @C159628
  Scenario: Change phonenumber with old phonenumber
    Given I am a customer had been registering the account with the following details:
      | fullName        | Ruth Natasya       |
      | email           | fakemail@email.com |
      | mobileNumber    | 89834567892        |
      | password        | Test1234           |
      | confirmPassword | Test1234           |
    And I will directing to page terms and condition
    And I click button agree with terms and condition
    And I will directing to page privacy and policy 
    And I click button agree with privacy and policy
    And I will directing to page PDP
    When I checked the 2 mandatory PDP checklists
    And I click button 'createAccountPDP'
    Then I should go to Verifikasi No. HP page
    When I choose change phonenumber
    And I filling new phonenumber with my old phonenumber
    Then I should see message error 'Nomor HP tidak boleh sama dengan nomor HP lama' in the below of field new phonenumber

  @scenario_verify_new_phone_number_with_invalid_value
  Scenario Outline: Verifying new phone number with invalid value
    Given I am a customer had been registering the account with the following details:
      | fullName        | Ruth Natasya       |
      | email           | fakemail@email.com |
      | mobileNumber    | <Phone Number>     |
      | password        | Test1234           |
      | confirmPassword | Test1234           |
    And I will directing to page terms and condition
    And I click button agree with terms and condition
    And I will directing to page privacy and policy 
    And I click button agree with privacy and policy
    And I will directing to page PDP
    When I checked the 2 mandatory PDP checklists
    And I click button 'createAccountPDP'
    Then I should go to Verifikasi No. HP page
    When I choose change phonenumber
    And I filling new phonenumber with '<Value>'
    Then I should see message error '<Message>' in the below of field new phonenumber
    Examples:                                                                 ❸
      | testRailTag    | Value         | Message                                                       | Phone Number |
      | @C159629	     | 89561r12367   | Nomor handphone wajib diisi                                   | 89834567892  |
      | @C159630       | 8895611236738 | Panjang nomor handphone minimal 8 digit dan maksimal 15 digit | 81734567892  |
      | @C159631       | 8956          | Panjang nomor handphone minimal 8 digit dan maksimal 15 digit | 81534567892  |
      | @C159632       | 9678995676    | Nomor handphone tidak sesuai format                           | 81434567892  |
      | @C159634       | 8678 995676   | Nomor handphone wajib diisi                                   | 81334567892  |
      | @C159635	     |               | Nomor handphone wajib diisi                                   | 81234567892  |

  @C159636
  Scenario: Back to page Verification phonenumber from page change phonenumber
    Given I am a customer had been registering the account with the following details:
      | fullName        | Ruth Natasya       |
      | email           | fakemail@email.com |
      | mobileNumber    | 81288567890        |
      | password        | Test1234           |
      | confirmPassword | Test1234           |
    And I will directing to page terms and condition
    And I click button agree with terms and condition
    And I will directing to page privacy and policy 
    And I click button agree with privacy and policy
    And I will directing to page PDP
    When I checked the 2 mandatory PDP checklists
    And I click button 'createAccountPDP'
    Then I should go to Verifikasi No. HP page
    When I choose change phonenumber
    And I click button back in the header page
    Then I will direct to page verification phonenumber

  @C159637
  Scenario: First attempt resend OTP
    Given I am a customer had been registering the account with the following details:
      | fullName        | Yahya H       |
      | email           | yahya_baru03@email.com |
      | mobileNumber    | 81193628999        |
      | password        | Test1234           |
      | confirmPassword | Test1234           |
    And I will directing to page terms and condition
    And I click button agree with terms and condition
    And I will directing to page privacy and policy 
    And I click button agree with privacy and policy
    And I will directing to page PDP
    When I checked the 2 mandatory PDP checklists
    And I click button 'createAccountPDP'
    Then I should go to Verifikasi No. HP page
    When I get my first OTP
    And I resend the OTP
    Then I will get new OTP different with my first OTP
    And I will see attempts left '1/5'

  @C159638 
  Scenario: Second attempt resend OTP
    Given I am a customer had been registering the account with the following details:
      | fullName        | Yahya H       |
      | email           | yahya_baru04@email.com |
      | mobileNumber    | 81193629000        |
      | password        | Test1234           |
      | confirmPassword | Test1234           |
    And I will directing to page terms and condition
    And I click button agree with terms and condition
    And I will directing to page privacy and policy 
    And I click button agree with privacy and policy
    And I will directing to page PDP
    When I checked the 2 mandatory PDP checklists
    And I click button 'createAccountPDP'
    Then I should go to Verifikasi No. HP page
    And I've requested OTP '1' times
    When I get my first OTP
    And I resend the OTP
    Then I will get new OTP different with my first OTP
    And I will see attempts left '2/5'

  @C159639 
  Scenario: Third attempt resend OTP
    Given I am a customer had been registering the account with the following details:
      | fullName        | Yahya H       |
      | email           | yahya_baru05@email.com |
      | mobileNumber    | 81193629001        |
      | password        | Test1234           |
      | confirmPassword | Test1234           |
    And I will directing to page terms and condition
    And I click button agree with terms and condition
    And I will directing to page privacy and policy 
    And I click button agree with privacy and policy
    And I will directing to page PDP
    When I checked the 2 mandatory PDP checklists
    And I click button 'createAccountPDP'
    Then I should go to Verifikasi No. HP page
    And I've requested OTP '2' times
    When I get my first OTP
    And I resend the OTP
    Then I will get new OTP different with my first OTP
    And I will see attempts left '3/5'

  @C159641 
  Scenario: Fourth attempt resend OTP
    Given I am a customer had been registering the account with the following details:
      | fullName        | Yahya H       |
      | email           | yahya_baru06@email.com |
      | mobileNumber    | 81193629002        |
      | password        | Test1234           |
      | confirmPassword | Test1234           |
    And I will directing to page terms and condition
    And I click button agree with terms and condition
    And I will directing to page privacy and policy 
    And I click button agree with privacy and policy
    And I will directing to page PDP
    When I checked the 2 mandatory PDP checklists
    And I click button 'createAccountPDP'
    Then I should go to Verifikasi No. HP page
    And I've requested OTP '3' times
    When I get my first OTP
    And I resend the OTP
    Then I will get new OTP different with my first OTP
    And I will see attempts left '4/5'

  @C159642 
  Scenario: Fifth attempt resend OTP
    Given I am a customer had been registering the account with the following details:
      | fullName        | Yahya H       |
      | email           | yahya_baru11@email.com |
      | mobileNumber    | 81193629011        |
      | password        | Test1234           |
      | confirmPassword | Test1234           |
    And I will directing to page terms and condition
    And I click button agree with terms and condition
    And I will directing to page privacy and policy 
    And I click button agree with privacy and policy
    And I will directing to page PDP
    When I checked the 2 mandatory PDP checklists
    And I click button 'createAccountPDP'
    Then I should go to Verifikasi No. HP page
    And I've requested OTP '4' times
    When I get my first OTP
    And I resend the OTP
    Then I will get new OTP different with my first OTP
    And I will see attempts left '5/5'

  @C159643 
  Scenario: Resend OTP more than five times
    Given I am a customer had been registering the account with the following details:
      | fullName        | Yahya H       |
      | email           | yahya_baru12@email.com |
      | mobileNumber    | 81193629012        |
      | password        | Test1234           |
      | confirmPassword | Test1234           |
    And I will directing to page terms and condition
    And I click button agree with terms and condition
    And I will directing to page privacy and policy 
    And I click button agree with privacy and policy
    And I will directing to page PDP
    When I checked the 2 mandatory PDP checklists
    And I click button 'createAccountPDP'
    Then I should go to Verifikasi No. HP page
    And I've requested OTP '5' times
    When I resend the OTP
    Then I should be notified that I can reverify the phone number tomorrow
    And I cannot change my phonenumber

  @C159644 
  Scenario: Verify state count attempt error when try to resend OTP
    Given I am a customer had been registering the account with the following details:
      | fullName        | Yahya H       |
      | email           | yahya_baru15@email.com |
      | mobileNumber    | 81193629015        |
      | password        | Test1234           |
      | confirmPassword | Test1234           |
    And I will directing to page terms and condition
    And I click button agree with terms and condition
    And I will directing to page privacy and policy 
    And I click button agree with privacy and policy
    And I will directing to page PDP
    When I checked the 2 mandatory PDP checklists
    And I click button 'createAccountPDP'
    Then I should go to Verifikasi No. HP page
    When I verifying my phone number by entering the wrong code four times
    And I resend the OTP
    And I verifying my phone number by entering the wrong code four times
    Then I should be notified in the below of field OTP that 'Kode OTP yang dimasukkan salah'

  @C159645  
  Scenario: Resend email verification
    Given I am a customer had been registering the account with the following details:
      | fullName        | Yahya H       |
      | email           | yahya_baru23@email.com |
      | mobileNumber    | 81193629023        |
      | password        | Test1234           |
      | confirmPassword | Test1234           |
    And I will directing to page terms and condition
    And I click button agree with terms and condition
    And I will directing to page privacy and policy 
    And I click button agree with privacy and policy
    And I will directing to page PDP
    When I checked the 2 mandatory PDP checklists
    And I click button 'createAccountPDP'
    Then I should go to Verifikasi No. HP page
    When I resend email verification
    Then I will notify that resend email is successfully