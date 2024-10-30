@automated_edge_regist
Feature: AUTOMATED Edge Cases Account registration
  In order to open an SMB account
  As a customer lead
  I want to register for an account

  @C163396
  Scenario: AUTOMATED Validate wording carousel onboarding
    Given I am a customer open app amarbank business
    When I see carousel onboarding
    And I validate wording funding business
    And I swipe to next carousel
    And I validate wording financial management
    And I swipe to next carousel
    And I validate wording financial and data privacy

  @C163397	
  Scenario: AUTOMATED Verifying field fullname contain with special char (.-,')
    Given I am a customer want to access menu registration
    When I am filling field 'fullName' with 'John Doe S.Kom, M\'Kom-'
    Then I shouldn't see message error in the below of field 'fullName'

  @verify_field_filled_and_empty_the_field
  Scenario Outline: Verifying fields has been filled and then empty the fields
    Given I am a customer want to access menu registration
    When I am filling field '<Field>' with 'Testing'
    And I am clearing the field '<Field>'
    Then I should see message error '<Field Name> wajib diisi' in the below of field '<Field>'
    Examples:
    |testRailTag  | Field           | Field Name          |
    | @C163398    | fullName        | Nama lengkap        |
    | @C163399    | email           | E-mail              |
    | @C163400    | mobileNumber    | Nomor handphone     |
    | @C163401    | password        | Password            |
    | @C163402    | confirmPassword | Konfirmasi password |

  @verify_field_hasnot_been_filled_by_user
  Scenario Outline: Verifying one fields hasn't been filled by user
    Given I am a customer want to access menu registration
    When I fill form registration except field '<Field>'
    And I submit form registration
    Then I should see message error '<Field Name> wajib diisi' in the below of field '<Field>'
    Examples:
    | testRailTag  | Field           | Field Name          |
    | @C163403     | fullName        | Nama lengkap        |
    | @C163404     | email           | E-mail              |
    | @C163405	   | mobileNumber    | Nomor handphone     |
    | @C163406     | password        | Password            |
    | @C163407     | confirmPassword | Konfirmasi password |

  @verify_fullname_with_invalid_value
  Scenario Outline: Verifying full name with invalid value
    Given I am a customer want to access menu registration
    When I am filling field 'fullName' with '<Value>'
    Then I should see message error '<Message>' in the below of field 'fullName'
    Examples:                                                                 ❸
    | testRailTag    | Value                                                | Message                                                                        |
    | @C163408       | Ruth N@tasya!                                        | Nama lengkap tidak boleh mengandung angka dan spesial karakter kecuali (.,\'-) |
    | @C163409       | Ruth Natasya 1                                       | Nama lengkap tidak boleh mengandung angka dan spesial karakter kecuali (.,\'-) |
    | @C163410       | Ruth Natasya Natasya Natasya Natasya Natasya Natasya | Nama lengkap minimal 3 & maksimal 50 karakter                                  |
    | @C163411       | Ru                                                   | Nama lengkap minimal 3 & maksimal 50 karakter                                  |
    | @C163412       |                                                      | Nama lengkap wajib diisi                                                       |

  @verify_email_with_invalid_value
  Scenario Outline: Verifying email with invalid value
    Given I am a customer want to access menu registration
    When I am filling field 'email' with '<Value>'
    Then I should see message error '<Message>' in the below of field 'email'
    Examples:                                                                 ❸
      | testRailTag    | Value                  | Message                    |
      | @C163413       | ruth.natasyagmail.com  | E-mail tidak sesuai format |
      | @C163414       | ruth natasya@gmail.com | E-mail tidak sesuai format |
      | @C163415       |                        | E-mail wajib diisi         |

  @verify_phone_number_with_invalid_value 
  Scenario Outline: Verifying phone number with invalid value
    Given I am a customer want to access menu registration
    When I am filling field 'mobileNumber' with '<Value>'
    Then I should see message error '<Message>' in the below of field 'mobileNumber'
    Examples:                                                                 ❸
    |testRailTag  | Value         | Message                                                       |
    | @C163416	  | 89561r12367   | Nomor handphone wajib diisi                                   |
    | @C163417    | 8895611236738 | Panjang nomor handphone minimal 8 digit dan maksimal 15 digit |
    | @C163418    | 8956          | Panjang nomor handphone minimal 8 digit dan maksimal 15 digit |
    | @C163419    | 9678995676    | Nomor handphone tidak sesuai format                           |
    | @C163420    | 8678 995676   | Nomor handphone wajib diisi                                   |
    | @C163421    |               | Nomor handphone wajib diisi                                   |

  @C163422
  Scenario: AUTOMATED Verifying autotrim 0 after label +62 in field phonenumber
    Given I am a customer want to access menu registration
    When I am filling field 'mobileNumber' with '0895611221700'
    Then I will see '895611221700' in field 'mobileNumber'

  @verifying_password_with_invalid_value 
  Scenario Outline: Verifying password with invalid value
    Given I am a customer want to access menu registration
    When I am filling field 'password' with '<Value>'
    Then I should see message error '<Message>' in the below of field 'password'
    Examples:                                                                 
    | testRailTag  | Value           | Message                                                       |
    | @C163423     | TESTINGPASSWORD | Password harus kombinasi huruf kapital, huruf kecil dan angka |
    | @C163424     | testingpassword | Password harus kombinasi huruf kapital, huruf kecil dan angka |
    | @C163425     | TestingPassword | Password harus kombinasi huruf kapital, huruf kecil dan angka |
    | @C163426     | 1234567890      | Password harus kombinasi huruf kapital, huruf kecil dan angka |
    | @C163427     | Test1           | Password minimal 8 karakter                                   |
    | @C163428	   |                 | Password wajib diisi                                          |

  @C163429
  Scenario: AUTOMATED Verifying field password contain with alphabeth, number and special character
    Given I am a customer want to access menu registration
    When I am filling field 'password' with 'Test1234!@'
    Then I shouldn't see message error in the below of field 'password'

  @verifying_confirm_password_with_invalid_value
  Scenario Outline: Verifying confirm password with invalid value
    Given I am a customer want to access menu registration
    When I am filling field 'confirmPassword' with '<Value>'
    Then I should see message error '<Message>' in the below of field 'confirmPassword'
    Examples:                                                                 ❸
    | testRailTag  | Value           | Message                                        |
    |  @C163430    | TESTINGPASSWORD | Konfirmasi password harus sama dengan password |
    |  @C163431    |                 | Konfirmasi password wajib diisi                |

  @C163432
  Scenario: AUTOMATED Verifying autotrim in field Full name
    Given I am a customer want to access menu registration
    When I am filling field 'fullName' with ' Ruth Natasya '
    Then I will see 'Ruth Natasya ' in field 'fullName'

  @unmask_and_mask_the_password_and_confirm_password
  Scenario Outline: Unmask and mask the password and confirm password
    Given I am a customer want to access menu registration
    When I am filling field '<Field>' with 'Test1234'
    And I click icon eye in '<Field>' field
    Then I will see my password 'Test1234' in the field
    When I click icon eye in '<Field>' field
    Then I will not see my password 'Test1234' in the field
    Examples:
    | testRailTag  | Field           |
    | @C163433     | password        |
    | @C163434     | confirmPassword |

  @C163435
  Scenario: AUTOMATED Access link login in page registration
    Given I am a customer want to access menu registration
    When I click link registration
    Then I will directing to page login

  @C163436
  Scenario: AUTOMATED Access call center on page registration
    Given I am a customer want to access menu registration
    When I click call center
    Then I will see helping center via email

  @C163437
  Scenario: AUTOMATED Back to page form registration from pop up confirmation
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

  @C163438
  Scenario: AUTOMATED Back to page Onboarding from page Registration
    Given I am a customer want to access menu registration
    When I click button back in the header page
    Then I will direct to page onboarding

  @C163439
  Scenario: AUTOMATED Create account business with business unregistered code
    Given I am a customer lead wanting to register account business from invitation
    When I choose menu registration
    And I am filling field 'email' with 'yahya_auto21@yopmail.com'
    And I am filling field 'businessCode' with 'xxyy11'
    Then I should see message error 'Kode bisnis tidak valid, periksa e-mail kembali' in the below of field 'businessCode'

  @C163440
  Scenario: AUTOMATED Create account business with email that is not belong to the business code
    Given I am a customer lead wanting to register account business from invitation
    When I choose menu registration
    And I am filling field 'email' with 'yahya_auto20@yopmail.com'
    And I am filling field 'businessCode' with '0becd0'
    Then I should see message error 'E-mail tidak sesuai dengan kode bisnis.' in the below of field 'email'

  @C163441
  Scenario: AUTOMATED Verifying field business code has been filled and then empty the field
    Given I am a customer want to access menu registration
    When I am filling field 'businessCode' with 'XYZ123'
    And I am clearing the field 'businessCode'
    Then I shouldn't see message error in the below of field 'businessCode'