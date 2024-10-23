
Feature: AUTOMATED Edge Cases Account registration
  In order to open an SMB account
  As a customer lead
  I want to register for an account

  
  Scenario: AUTOMATED Validate wording carousel onboarding
    Given I am a customer open app amarbank business
    When I see carousel onboarding
    And I validate wording funding business
    And I swipe to next carousel
    And I validate wording financial management
    And I swipe to next carousel
    And I validate wording financial and data privacy

  
  Scenario: AUTOMATED Verifying field fullname contain with special char (.-,')
    Given I am a customer want to access menu registration
    When I am filling field 'fullName' with 'John Doe S.Kom, M\'Kom-'
    Then I shouldn't see message error in the below of field 'fullName'

  
  Scenario Outline: Verifying fields has been filled and then empty the fields
    Given I am a customer want to access menu registration
    When I am filling field '<Field>' with 'Testing'
    And I am clearing the field '<Field>'
    Then I should see message error '<Field Name> wajib diisi' in the below of field '<Field>'
    Examples:
    |testRailTag  | Field           | Field Name          |
    | @C159512    | fullName        | Nama lengkap        |
    | @C159513    | email           | E-mail              |
    | @C159514    | mobileNumber    | Nomor handphone     |
    | @C159515    | password        | Password            |
    | @C159516    | confirmPassword | Konfirmasi password |

  
  Scenario Outline: Verifying one fields hasn't been filled by user
    Given I am a customer want to access menu registration
    When I fill form registration except field '<Field>'
    And I submit form registration
    Then I should see message error '<Field Name> wajib diisi' in the below of field '<Field>'
    Examples:
    | testRailTag  | Field           | Field Name          |
    | @C159517     | fullName        | Nama lengkap        |
    | @C159518     | email           | E-mail              |
    | @C159519     | mobileNumber    | Nomor handphone     |
    | @C159520     | password        | Password            |
    | @C159521     | confirmPassword | Konfirmasi password |

  
  Scenario Outline: Verifying full name with invalid value
    Given I am a customer want to access menu registration
    When I am filling field 'fullName' with '<Value>'
    Then I should see message error '<Message>' in the below of field 'fullName'
    Examples:                                                                 ❸
    | testRailTag    | Value                                                | Message                                                                        |
    | @C159522       | Ruth N@tasya!                                        | Nama lengkap tidak boleh mengandung angka dan spesial karakter kecuali (.,\'-) |
    | @C159523       | Ruth Natasya 1                                       | Nama lengkap tidak boleh mengandung angka dan spesial karakter kecuali (.,\'-) |
    | @C159524       | Ruth Natasya Natasya Natasya Natasya Natasya Natasya | Nama lengkap minimal 3 & maksimal 50 karakter                                  |
    | @C159525       | Ru                                                   | Nama lengkap minimal 3 & maksimal 50 karakter                                  |
    | @C159526       |                                                      | Nama lengkap wajib diisi                                                       |

  
  Scenario Outline: Verifying email with invalid value
    Given I am a customer want to access menu registration
    When I am filling field 'email' with '<Value>'
    Then I should see message error '<Message>' in the below of field 'email'
    Examples:                                                                 ❸
      | testRailTag    | Value                  | Message                    |
      | @C159527       | ruth.natasyagmail.com  | E-mail tidak sesuai format |
      | @C159528       | ruth natasya@gmail.com | E-mail tidak sesuai format |
      | @C159529       |                        | E-mail wajib diisi         |

   
  Scenario Outline: Verifying phone number with invalid value
    Given I am a customer want to access menu registration
    When I am filling field 'mobileNumber' with '<Value>'
    Then I should see message error '<Message>' in the below of field 'mobileNumber'
    Examples:                                                                 ❸
    |testRailTag  | Value         | Message                                                       |
    | @C159530    | 89561r12367   | Nomor handphone wajib diisi                                   |
    | @C159531    | 8895611236738 | Panjang nomor handphone minimal 8 digit dan maksimal 15 digit |
    | @C159532    | 8956          | Panjang nomor handphone minimal 8 digit dan maksimal 15 digit |
    | @C159533    | 9678995676    | Nomor handphone tidak sesuai format                           |
    | @C159534    | 8678 995676   | Nomor handphone wajib diisi                                   |
    | @C159535    |               | Nomor handphone wajib diisi                                   |

  
  Scenario: AUTOMATED Verifying autotrim 0 after label +62 in field phonenumber
    Given I am a customer want to access menu registration
    When I am filling field 'mobileNumber' with '0895611221700'
    Then I will see '895611221700' in field 'mobileNumber'

   
  Scenario Outline: Verifying password with invalid value
    Given I am a customer want to access menu registration
    When I am filling field 'password' with '<Value>'
    Then I should see message error '<Message>' in the below of field 'password'
    Examples:                                                                 
    | testRailTag  | Value           | Message                                                       |
    | @C159537     | TESTINGPASSWORD | Password harus kombinasi huruf kapital, huruf kecil dan angka |
    | @C159538     | testingpassword | Password harus kombinasi huruf kapital, huruf kecil dan angka |
    | @C159539     | TestingPassword | Password harus kombinasi huruf kapital, huruf kecil dan angka |
    | @C159540     | 1234567890      | Password harus kombinasi huruf kapital, huruf kecil dan angka |
    | @C159541     | Test1           | Password minimal 8 karakter                                   |
    | @C159542     |                 | Password wajib diisi                                          |

  
  Scenario: AUTOMATED Verifying field password contain with alphabeth, number and special character
    Given I am a customer want to access menu registration
    When I am filling field 'password' with 'Test1234!@'
    Then I shouldn't see message error in the below of field 'password'

  
  Scenario Outline: Verifying confirm password with invalid value
    Given I am a customer want to access menu registration
    When I am filling field 'confirmPassword' with '<Value>'
    Then I should see message error '<Message>' in the below of field 'confirmPassword'
    Examples:                                                                 ❸
    | testRailTag  | Value           | Message                                        |
    |  @C159544    | TESTINGPASSWORD | Konfirmasi password harus sama dengan password |
    |  @C159545    |                 | Konfirmasi password wajib diisi                |

  
  Scenario: AUTOMATED Verifying autotrim in field Full name
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
    | @C159547     | password        |
    | @C159548     | confirmPassword |

  
  Scenario: AUTOMATED Access link login in page registration
    Given I am a customer want to access menu registration
    When I click link registration
    Then I will directing to page login

  
  Scenario: AUTOMATED Access call center on page registration
    Given I am a customer want to access menu registration
    When I click call center
    Then I will see helping center via email

  
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

  
  Scenario: AUTOMATED Back to page Onboarding from page Registration
    Given I am a customer want to access menu registration
    When I click button back in the header page
    Then I will direct to page onboarding

  
  Scenario: AUTOMATED Create account business with business unregistered code
    Given I am a customer lead wanting to register account business from invitation
    When I choose menu registration
    And I am filling field 'email' with 'yahya_auto21@yopmail.com'
    And I am filling field 'businessCode' with 'xxyy11'
    Then I should see message error 'Kode bisnis tidak valid, periksa e-mail kembali' in the below of field 'businessCode'

  
  Scenario: AUTOMATED Create account business with email that is not belong to the business code
    Given I am a customer lead wanting to register account business from invitation
    When I choose menu registration
    And I am filling field 'email' with 'yahya_auto20@yopmail.com'
    And I am filling field 'businessCode' with '0becd0'
    Then I should see message error 'E-mail tidak sesuai dengan kode bisnis.' in the below of field 'email'

  
  Scenario: AUTOMATED Verifying field business code has been filled and then empty the field
    Given I am a customer want to access menu registration
    When I am filling field 'businessCode' with 'XYZ123'
    And I am clearing the field 'businessCode'
    Then I shouldn't see message error in the below of field 'businessCode'