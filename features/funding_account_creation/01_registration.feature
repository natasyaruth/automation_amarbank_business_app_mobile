@registration1
Feature: Account registration
  In order to open an SMB account
  As a customer lead
  I want to register for an account

  @C165847
  Scenario: Validate wording carousel onboarding
    Given I am a customer open app amarbank business
    When I see carousel onboarding
    And I validate wording funding business
    And I swipe to next carousel
    And I validate wording financial management
    And I swipe to next carousel
    And I validate wording financial and data privacy

  @C165848
  Scenario: Create a new account
    Given I am a customer lead wanting to open a new account
    When I choose menu registration
    And I filling in my account information with the following details:
      | fullName        | Revvy                    |
      | email           | test_stg_1@gmail.com     |
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

  @C165849
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
      | @C165850     | fullName        | Nama lengkap        |
      | @C165851     | email           | E-mail              |
      | @C165852     | mobileNumber    | Nomor handphone     |
      | @C165853     | password        | Password            |
      | @C165854     | confirmPassword | Konfirmasi password |

  @validation_one_empty_fields
  Scenario Outline: Verifying one fields hasn't been filled by user
    Given I am a customer want to access menu registration
    When I fill form registration except field '<Field>'
    And I submit form registration
    Then I should see message error '<Field Name> wajib diisi' in the below of field '<Field>'
    Examples:
      | testRailTag  | Field           | Field Name          |
      | @C165855     | fullName        | Nama lengkap        |
      | @C165856     | email           | E-mail              |
      | @C165857     | mobileNumber    | Nomor handphone     |
      | @C165858     | password        | Password            |
      | @C165859     | confirmPassword | Konfirmasi password |

  @validation_format_fullname
  Scenario Outline: Verifying full name with invalid value
    Given I am a customer want to access menu registration
    When I am filling field 'fullName' with '<Value>'
    Then I should see message error '<Message>' in the below of field 'fullName'
    Examples:                                                                 ❸
      | testRailTag  | Value                                                | Message                                                                        |
      | @C165860     | Ruth N@tasya!                                        | Nama lengkap tidak boleh mengandung angka dan spesial karakter kecuali (.,\'-) |
      | @C165861     | Ruth Natasya 1                                       | Nama lengkap tidak boleh mengandung angka dan spesial karakter kecuali (.,\'-) |
      | @C165862     | Ruth Natasya Natasya Natasya Natasya Natasya Natasya | Nama lengkap minimal 3 & maksimal 50 karakter                                  |
      | @C165863     | Ru                                                   | Nama lengkap minimal 3 & maksimal 50 karakter                                  |
      | @C165864     |                                                      | Nama lengkap wajib diisi                                                       |

  @validation_format_email
  Scenario Outline: Verifying email with invalid value
    Given I am a customer want to access menu registration
    When I am filling field 'email' with '<Value>'
    Then I should see message error '<Message>' in the below of field 'email'
    Examples:                                                                 ❸
      | testRailTag  | Value                  | Message                    |
      | @C165865     | ruth.natasyagmail.com  | E-mail tidak sesuai format |
      | @C165866     | ruth natasya@gmail.com | E-mail tidak sesuai format |
      | @C165867     |                        | E-mail wajib diisi         |

  @validation_format_phonenumber
  Scenario Outline: Verifying phone number with invalid value
    Given I am a customer want to access menu registration
    When I am filling field 'mobileNumber' with '<Value>'
    Then I should see message error '<Message>' in the below of field 'mobileNumber'
    Examples:                                                                 ❸
      | testRailTag  | Value         | Message                                                       |
      | @C165868     | 89561r12367   | Nomor handphone wajib diisi                                   |
      | @C165869     | 8895611236738 | Panjang nomor handphone minimal 8 digit dan maksimal 15 digit |
      | @C165870     | 8956          | Panjang nomor handphone minimal 8 digit dan maksimal 15 digit |
      | @C165871     | 9678995676    | Nomor handphone tidak sesuai format                           |
      | @C165872     | 8678 995676   | Nomor handphone wajib diisi                                   |
      | @C165873     |               | Nomor handphone wajib diisi                                   |

  @C165874
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
      | @C165875     | TESTINGPASSWORD | Password harus kombinasi huruf kapital, huruf kecil dan angka |
      | @C165876     | testingpassword | Password harus kombinasi huruf kapital, huruf kecil dan angka |
      | @C165877     | TestingPassword | Password harus kombinasi huruf kapital, huruf kecil dan angka |
      | @C165878     | 1234567890      | Password harus kombinasi huruf kapital, huruf kecil dan angka |
      | @C165879     | Test1           | Password minimal 8 karakter                                   |
      | @C165880     |                 | Password wajib diisi                                          |

  @C165881
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
      | @C165882     | TESTINGPASSWORD | Konfirmasi password harus sama dengan password |
      | @C165883     |                 | Konfirmasi password wajib diisi                |

  @C165884
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
      | @C165885     | password        |
      | @C165886     | confirmPassword |

  @C165887
  Scenario: Access link login in page registration
    Given I am a customer want to access menu registration
    When I click link registration
    Then I will directing to page login

  @C165888
  Scenario: Access call center on page registration
    Given I am a customer want to access menu registration
    When I click call center
    Then I will see helping center via email

  @C165889
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

  @C165890
  Scenario: Back to page Onboarding from page Registration
    Given I am a customer want to access menu registration
    When I click button back in the header page
    Then I will direct to page onboarding

  @C165891
  Scenario: Create account business with business code from invitation email
    Given I am a customer that recently registered to amarbank business with data as below
      | fullName        | Testing                 |
      | email           | test_stg_2@gmail.com    |
      | phoneNumber     | 899967754041            |
      | password        | 1234Test                |
    And I login using my user id that I recently receive through email
    And I click later in pop up biometric
    And I will directing to Hook 1 Onboarding Account Opening
    And I click later
    And I register initiator with partner as below 
      | fullName        | RUDI                   |
      | email           | partner_stg_1@gmail.com|
      | phoneNumber     | 899960054041           |
      | password        | 1234Test               |
    And I choose other
    And I click logout
    And I click back in header page
    And I choose menu registration
    And I filling in my account business information
    And I submit form registration
    And I will see pop up confirmation registration with company name
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
    And I verifying phone number invitee by entering the code
    And I verifying email invitee through login with user id invitee
    Then account invitee should be created

  @C165892
  Scenario: Submit registration without business code using email that still not complete registration for invitee
    Given I am a customer that recently registered to amarbank business with data as below
      | fullName        | Testing                 |
      | email           | testing_21@gmail.com    |
      | phoneNumber     | 899967754041            |
      | password        | 1234Test                |
    And I login using my user id that I recently receive through email
    And I click later in pop up biometric
    And I will directing to Hook 1 Onboarding Account Opening
    And I click later
    And I register initiator with partner as below
      | fullName        | RUDI                   |
      | email           | testing_94@gmail.com   |
      | phoneNumber     | 899960054041           |
      | password        | 1234Test               |
    And I choose other
    And I click logout
    And I click back in header page
    And I choose menu registration
    And I filling in my account business information without business code
    And I submit form registration
    Then I should see message error register code business first with the email

  @C165893
  Scenario: Complete registration with business code and then continue to create another account
    Given I am a customer that recently registered to amarbank business with data as below
      | fullName        | Testing                 |
      | email           | testing_21@gmail.com    |
      | phoneNumber     | 899967754041            |
      | password        | 1234Test                |
    And I login using my user id that I recently receive through email
    And I click later in pop up biometric
    And I will directing to Hook 1 Onboarding Account Opening
    And I click later
    And I register initiator with partner as below
      | fullName        | RUDI                   |
      | email           | testing_35@gmail.com   |
      | phoneNumber     | 899960054041           |
      | password        | 1234Test               |
    And I choose other
    And I click logout
    And I click back in header page
    And I choose menu registration
    And I filling in my account business information
    And I submit form registration
    And I will see pop up confirmation registration with company name
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
    And I verifying phone number invitee by entering the code
    And I click button first login
    And I click back in header page
    And I choose menu registration
    And I filling in my account information with the following details:
      | fullName        | RUDI                     |
      | email           | testing_35@gmail.com     |
      | mobileNumber    | 899960054041             |
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
    And I verifying email invitee through login with user id invitee
    Then my account should be created 

  @C165894
  Scenario: Open information of business code
    Given I am a customer want to access menu registration
    When I click icon info business code
    Then I will see information of business code
    And I close bottom sheet info business code
    
  @C165895
  Scenario: Create account business with business unregistered code
    Given I am a customer lead wanting to register account business from invitation
    When I choose menu registration
    And I am filling field 'email' with 'test.automate@trash-mail.com'
    And I am filling field 'businessCode' with 'xxyy11'
    Then I should see message error 'Kode bisnis tidak valid, periksa e-mail kembali' in the below of field 'businessCode'

  @C165896
  Scenario: Create account business with email that is not belong to the business code
    Given I am a customer that recently registered to amarbank business with data as below
      | fullName        | Testing                 |
      | email           | testing_29@gmail.com    |
      | phoneNumber     | 899967756641            |
      | password        | 1234Test                |
    And I login using my user id that I recently receive through email
    And I click later in pop up biometric
    And I will directing to Hook 1 Onboarding Account Opening
    And I click later
    When I register initiator with partner as below
      | fullName        | RUDI                   |
      | email           | testing_29@gmail.com   |
      | phoneNumber     | 899960054041           |
      | password        | 1234Test               |
    And I choose other
    And I click logout
    And I click back in header page
    And I choose menu registration
    And I filling in my account business information with different email
    And I submit form registration
    Then I should see message error 'E-mail tidak sesuai dengan kode bisnis' in the below of field 'businessCode'
  
  @C165897
  Scenario: Verifying field business code has been filled and then empty the field
    Given I am a customer want to access menu registration
    When I am filling field 'businessCode' with 'XYZ123'
    And I am clearing the field 'businessCode'
    Then I shouldn't see message error in the below of field 'businessCode'

  @C165898
  Scenario: Register invitee after resend business code
    Given I am a customer that recently registered to amarbank business with data as below
      | fullName        | Testing                 |
      | email           | testing_25@gmail.com    |
      | phoneNumber     | 899967754041            |
      | password        | 1234Test                |
    And I login using my user id that I recently receive through email
    And I click later in pop up biometric
    And I will directing to Hook 1 Onboarding Account Opening
    And I click later
    When I register initiator with partner as below
      | fullName        | RUDI                   |
      | email           | testing_37@gmail.com   |
      | phoneNumber     | 899960054041           |
      | password        | 1234Test               |
    And I choose other
    And I click logout
    And I login using my user id that I recently receive through email
    And I will see card continue to complete registration director list
    And I can continue to page 'Registration Director'
    And I can see details registration director
    And I click button resend business code
    And I confirm resend business code
    And I will see snackbar success resend business code
    And I will not see button resend business code
    And I get same business code with the first one
    And I click back in header page
    And I choose other
    And I click logout
    And I click back in header page
    And I choose menu registration
    And I filling in my account business information
    And I submit form registration
    And I will see pop up confirmation registration with company name
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
    And I verifying phone number invitee by entering the code
    And I verifying email invitee through login with user id invitee
    Then account invitee should be created

  @C165899
  Scenario: Register invitee after change with different email
    Given I am a customer that recently registered to amarbank business with data as below
      | fullName        | Testing                 |
      | email           | testing_26@gmail.com    |
      | phoneNumber     | 899967754041            |
      | password        | 1234Test                |
    And I login using my user id that I recently receive through email
    And I click later in pop up biometric
    And I will directing to Hook 1 Onboarding Account Opening
    And I click later
    When I register initiator with partner as below
      | fullName        | RUDI                   |
      | email           | testing_41@gmail.com   |
      | phoneNumber     | 899960054041           |
      | password        | 1234Test               |
    And I choose other
    And I click logout
    And I login using my user id that I recently receive through email
    And I will see card continue to complete registration director list
    And I can continue to page 'Registration Director'
    And I can see details registration director
    And I click button change email partner
    And I input new email invitee with 'testing_74@gmail.com'
    And I save and resend business code
    And I will see pop up contain with old email and new email invitee
    And I change the email invitee
    And I will see snackbar success change new email invitee and resend business code
    And I will not see button resend business code and change email invitee
    And I will see email invitee is update with new email
    And I will get same business code in my new email
    And I click back in header page
    And I choose other
    And I click logout
    And I click back in header page    
    And I choose menu registration
    And I filling in my account business information with new email
    And I submit form registration
    And I will see pop up confirmation registration with company name
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
    And I verifying phone number invitee by entering the code
    And I verifying new email invitee through login with user id invitee
    Then account invitee should be created

  @C165900
  Scenario: Register invitee after change with same email
    Given I am a customer that recently registered to amarbank business with data as below
      | fullName        | Testing                 |
      | email           | testing_26@gmail.com    |
      | phoneNumber     | 899967754041            |
      | password        | 1234Test                |
    And I login using my user id that I recently receive through email
    And I click later in pop up biometric
    And I will directing to Hook 1 Onboarding Account Opening
    And I click later
    When I register initiator with partner as below
      | fullName        | RUDI                   |
      | email           | testing_37@gmail.com   |
      | phoneNumber     | 899960054041           |
      | password        | 1234Test               |
    And I choose other
    And I click logout
    And I login using my user id that I recently receive through email
    And I will see card continue to complete registration director list
    And I can continue to page 'Registration Director'
    And I can see details registration director
    And I click button change email partner
    And I save and resend business code
    And I will see pop up contain with old email and new email invitee
    And I change the email invitee
    And I will see snackbar success change new email invitee and resend business code
    And I will not see button resend business code and change email invitee
    And I will see email invitee is not change
    And I click back in header page
    And I choose other
    And I click logout
    And I click back in header page
    And I choose menu registration
    And I filling in my account business information
    And I submit form registration
    And I will see pop up confirmation registration with company name
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
    And I verifying phone number invitee by entering the code
    And I verifying email invitee through login with user id invitee
    Then account invitee should be created

  @C165901
  Scenario: Register invitee after resend business code and change with same email
    Given I am a customer that recently registered to amarbank business with data as below
      | fullName        | Testing                 |
      | email           | testing_27@gmail.com    |
      | phoneNumber     | 899967754041            |
      | password        | 1234Test                |
    And I login using my user id that I recently receive through email
    And I click later in pop up biometric
    And I will directing to Hook 1 Onboarding Account Opening
    And I click later
    When I register initiator with partner as below
      | fullName        | RUDI                   |
      | email           | testing_44@gmail.com   |
      | phoneNumber     | 899960054041           |
      | password        | 1234Test               |
    And I choose other
    And I click logout
    And I login using my user id that I recently receive through email
    And I will see card continue to complete registration director list
    And I can continue to page 'Registration Director'
    And I can see details registration director
    And I click button resend business code
    And I confirm resend business code
    And I will see snackbar success resend business code
    And I will not see button resend business code
    And I see button change email invitee
    And I click button change email partner
    And I save and resend business code
    And I will see pop up contain with old email and new email invitee
    And I change the email invitee
    And I will see snackbar success change new email invitee and resend business code
    And I will not see button resend business code and change email invitee
    And I will see email invitee is not change
    And I click back in header page
    And I choose other
    And I click logout
    And I click back in header page
    And I choose menu registration
    And I filling in my account business information
    And I submit form registration
    And I will see pop up confirmation registration with company name
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
    And I verifying phone number invitee by entering the code
    And I verifying email invitee through login with user id invitee
    Then account invitee should be created

  @C165902
  Scenario: Register invitee after resend business code and change with different email
    Given I am a customer that recently registered to amarbank business with data as below
      | fullName        | Testing                 |
      | email           | testing_28@gmail.com    |
      | phoneNumber     | 899967754041            |
      | password        | 1234Test                |
    And I login using my user id that I recently receive through email
    And I click later in pop up biometric
    And I will directing to Hook 1 Onboarding Account Opening
    And I click later
    When I register initiator with partner as below
      | fullName        | RUDI                   |
      | email           | testing_45@gmail.com   |
      | phoneNumber     | 899960054041           |
      | password        | 1234Test               |
    And I choose other
    And I click logout
    And I login using my user id that I recently receive through email
    And I will see card continue to complete registration director list
    And I can continue to page 'Registration Director'
    And I can see details registration director
    And I click button resend business code
    And I confirm resend business code
    And I will see snackbar success resend business code
    And I will not see button resend business code
    And I see button change email invitee
    And I click button change email partner
    And I input new email invitee with 'testing_75@gmail.com'
    And I save and resend business code
    And I will see pop up contain with old email and new email invitee
    And I change the email invitee
    And I will see snackbar success change new email invitee and resend business code
    And I will not see button resend business code and change email invitee
    And I will see email invitee is update with new email
    And I will get same business code in my new email
    And I click back in header page
    And I choose other
    And I click logout
    And I click back in header page    
    And I choose menu registration
    And I filling in my account business information with new email
    And I submit form registration
    And I will see pop up confirmation registration with company name
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
    And I verifying phone number invitee by entering the code
    And I verifying new email invitee through login with user id invitee
    Then account invitee should be created

  @C165903
  Scenario: Register invitee with old email after change email invitee
    Given I am a customer that recently registered to amarbank business with data as below
      | fullName        | Testing                 |
      | email           | testing_30@gmail.com    |
      | phoneNumber     | 899967754041            |
      | password        | 1234Test                |
    And I login using my user id that I recently receive through email
    And I click later in pop up biometric
    And I will directing to Hook 1 Onboarding Account Opening
    And I click later
    When I register initiator with partner as below
      | fullName        | RUDI                   |
      | email           | testing_46@gmail.com   |
      | phoneNumber     | 899960054041           |
      | password        | 1234Test               |
    And I choose other
    And I click logout
    And I login using my user id that I recently receive through email
    And I will see card continue to complete registration director list
    And I can continue to page 'Registration Director'
    And I can see details registration director
    And I click button change email partner
    And I input new email invitee with 'testing_76@gmail.com'
    And I save and resend business code
    And I will see pop up contain with old email and new email invitee
    And I change the email invitee
    And I will see snackbar success change new email invitee and resend business code
    And I will not see button resend business code and change email invitee
    And I will see email invitee is update with new email
    And I click back in header page
    And I choose other
    And I click logout
    And I click back in header page    
    And I choose menu registration
    And I filling in my account business information with old email and business code from new email
    And I submit form registration 
    Then I should see message error 'E-mail tidak sesuai dengan kode bisnis' in the below of field 'businessCode'

  @C165904
  Scenario: Register invitee with new email and then edit with old email after change email invitee
    Given I am a customer that recently registered to amarbank business with data as below
      | fullName        | Testing                 |
      | email           | testing_30@gmail.com    |
      | phoneNumber     | 899967754041            |
      | password        | 1234Test                |
    And I login using my user id that I recently receive through email
    And I click later in pop up biometric
    And I will directing to Hook 1 Onboarding Account Opening
    And I click later
    When I register initiator with partner as below
      | fullName        | RUDI                   |
      | email           | testing_46@gmail.com   |
      | phoneNumber     | 899960054041           |
      | password        | 1234Test               |
    And I choose other
    And I click logout
    And I login using my user id that I recently receive through email
    And I will see card continue to complete registration director list
    And I can continue to page 'Registration Director'
    And I can see details registration director
    And I click button change email partner
    And I input new email invitee with 'testing_76@gmail.com'
    And I save and resend business code
    And I will see pop up contain with old email and new email invitee
    And I change the email invitee
    And I will see snackbar success change new email invitee and resend business code
    And I will not see button resend business code and change email invitee
    And I will see email invitee is update with new email
    And I click back in header page
    And I choose other
    And I click logout
    And I click back in header page    
    And I choose menu registration
    And I filling in my account business information with new email
    And I submit form registration
    And I will see pop up confirmation registration with company name
    And I click button back to page registration
    And I edit field email with old email invitee
    And I submit form registration
    Then I should see message error 'E-mail tidak sesuai dengan kode bisnis' in the below of field 'businessCode'

  @C165905
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

  @C165906
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

  @C165907
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

  @C165908
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
    When I click button back in the header page
    And I will directing to page privacy and policy
    And I click button back in the header page
    And I will directing to page terms and condition
    And I click button back in the header page
    Then I will direct to Registration page

  @C165909
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
    And I submit the PDP registration
    When I verifying my phone number by entering the wrong code
    Then I should be notified in the below of field OTP that 'Kode OTP yang dimasukkan salah'

  @C165910
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
    And I submit the PDP registration
    When I let the otp code expire
    And I verifying my phone number by entering the code sent to me
    Then I should be notified in the below of field OTP that 'Kode OTP yang dimasukkan sudah kedaluwarsa'

  @C165911
  Scenario: Verifying phone number with wrong OTP code five times
    Given I am a customer had been registering the account with the following details:
      | fullName        | Ruth Natasya       |
      | email           | fakemail@email.com |
      | mobileNumber    | 87830990672        |
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
    And I submit the PDP registration
    When I verifying my phone number by entering the wrong code five times
    Then I should be notified that I can reverify the phone number tomorrow

  @C165912
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
    And I submit the PDP registration
    When I verifying my phone number by entering the wrong code four times
    And I verifying my phone number by entering the code sent to me
    Then I will directing to page verification email

  @C165913
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
    And I submit the PDP registration
    When I choose change phonenumber
    And I change my phonenumber into '89577322178'
    And I resend the OTP
    And I verifying my phone number by entering the code sent to me
    Then I will directing to page verification email

  @C165914
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
    And I submit the PDP registration
    When I choose change phonenumber
    And I filling new phonenumber with my old phonenumber
    Then I should see message error 'Nomor HP tidak boleh sama dengan nomor HP lama' in the below of field new phonenumber

  @validation_format_new_phonenumber
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
    And I submit the PDP registration
    When I choose change phonenumber
    And I filling new phonenumber with '<Value>'
    Then I should see message error '<Message>' in the below of field new phonenumber
    Examples:                                                                 ❸
      | testRailTag  | Value         | Message                                                       | Phone Number |
      | @C165915     | 89561r12367   | Nomor handphone wajib diisi                                   | 89834567892  |
      | @C165916     | 8895611236738 | Panjang nomor handphone minimal 8 digit dan maksimal 15 digit | 81734567892  |
      | @C165917     | 8956          | Panjang nomor handphone minimal 8 digit dan maksimal 15 digit | 81534567892  |
      | @C165918     | 9678995676    | Nomor handphone tidak sesuai format                           | 81434567892  |
      | @C165919     | 8678 995676   | Nomor handphone wajib diisi                                   | 81334567892  |
      | @C165920     |               | Nomor handphone wajib diisi                                   | 81234567892  |

  @C165921
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
    And I submit the PDP registration
    When I choose change phonenumber
    And I click button back in the header page
    Then I will direct to page verification phonenumber

  @C165922
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
    And I submit the PDP registration
    When I get my first OTP
    And I resend the OTP
    Then I will get new OTP different with my first OTP
    And I will see attempts left '1/5'

  @C165923
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
    And I submit the PDP registration
    And I've requested OTP '1' times
    When I get my first OTP
    And I resend the OTP
    Then I will get new OTP different with my first OTP
    And I will see attempts left '2/5'

  @C165924
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
    And I submit the PDP registration
    And I've requested OTP '2' times
    When I get my first OTP
    And I resend the OTP
    Then I will get new OTP different with my first OTP
    And I will see attempts left '3/5'

  @C165925
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
    And I submit the PDP registration
    And I've requested OTP '3' times
    When I get my first OTP
    And I resend the OTP
    Then I will get new OTP different with my first OTP
    And I will see attempts left '4/5'

  @C165926
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
    And I submit the PDP registration
    And I've requested OTP '4' times
    When I get my first OTP
    And I resend the OTP
    Then I will get new OTP different with my first OTP
    And I will see attempts left '5/5'

  @C165927
  Scenario: Resend OTP more than five times
    Given I am a customer had been registering the account with the following details:
      | fullName        | Ruth Natasya       |
      | email           | fakemail@email.com |
      | mobileNumber    | 81261339239        |
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
    And I submit the PDP registration
    And I've requested OTP '5' times
    When I resend the OTP
    Then I should be notified that I can reverify the phone number tomorrow
    And I cannot change my phonenumber

  @C165928
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
    And I submit the PDP registration
    When I verifying my phone number by entering the wrong code four times
    And I resend the OTP
    And I verifying my phone number by entering the wrong code four times
    Then I should be notified in the below of field OTP that 'Kode OTP yang dimasukkan salah'

  @C165929
  Scenario: Resend email verification
    Given I am a customer had been registering the account with the following details:
      | fullName        | Ruth Natasya                 |
      | email           | fakemail@email.com           |
      | mobileNumber    | 89561338639                  |
      | password        | Test1234                     |
      | confirmPassword | Test1234                     |
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