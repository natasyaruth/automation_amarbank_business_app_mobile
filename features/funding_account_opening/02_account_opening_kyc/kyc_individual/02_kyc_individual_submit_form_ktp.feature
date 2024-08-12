@kycSubmitFormKtpIndividual
Feature: Account Opening KYC Individual - Submit Form KTP
  In order to opening my Giro account with legality business type Individual in SMB
  As a customer
  I want to submit my identity information as part of the KYC Process

  Background: User choose legality business type Individual
    Given I am a registered customer with following details:
      | userID      | ruth0c1c |
      | password    | 1234Test |
      | userIDstg   | ruth530f |
      | passwordStg | 1234Test |
    And I filling in form login with the following details:
      | userID      | ruth0c1c |
      | password    | 1234Test |
      | userIDstg   | ruth530f |
      | passwordStg | 1234Test |
    And I click login
    And I click later in pop up biometric
    And I will directing to Hook 1 Onboarding Account Opening
    And I swipe to card Giro Account
    And I choose Giro Account
    And I choose Giro Account MSME
    And I choose legality business type 'individual'
    And I submit my legality type

  Scenario Outline: Verifying form KTP fields has been filled and then empty the fields
    Given I am a customer want to fill my information identity details
    When I fill field '<Field>' with '1234' in form KTP
    And I clear the field '<Field>' in form KTP
    Then I should see message error '<Field Name> wajib diisi' in the below of field '<Field>' in form KTP
    And I reset my state journey
    Examples:
      | testRailTag | Field        | Field Name     |
      | @C131679    | eKtpNumber   | Nomor KTP      |
      | @C131680    | fullName     | Nama lengkap   |
      | @C131681    | placeOfBirth | Tempat lahir   |
      | @C131682    | address      | Alamat lengkap |
      | @C131683    | rt           | RT             |
      | @C131684    | rw           | RW             |

  Scenario Outline: Verifying one fields hasn't been filled by user in form KTP
    Given I am a customer want to fill my information identity details
    When I fill form KTP except field '<Field>'
    And I submit my information identity details
    And I swipe to field '<Field>' in form KTP
    Then I should see message error '<Field Name> wajib diisi' in the below of field '<Field>' in form KTP
    And I reset my state journey
    Examples:
      | testRailTag | Field         | Field Name        |
      | @C131685    | eKtpNumber    | Nomor KTP         |
      | @C131686    | fullName      | Nama lengkap      |
      | @C131687    | placeOfBirth  | Tempat lahir      |
      | @C131688    | dateOfBirth   | Tanggal lahir     |
      | @C131689    | gender        | Jenis kelamin     |
      | @C131690    | address       | Alamat lengkap    |
      | @C131691    | rt            | RT                |
      | @C131692    | rw            | RW                |
      | @C131693    | province      | Provinsi          |
      | @C131694    | city          | Kota/Kabupaten    |
      | @C131695    | district      | Kecamatan         |
      | @C131696    | village       | Kelurahan         |
      | @C131697    | religion      | Agama             |
      | @C131698    | maritalStatus | Status perkawinan |

  Scenario Outline: Verifying eKTP number with invalid value in form KTP
    Given I am a customer want to fill my information identity details
    When I fill field 'eKtpNumber' with '<Value>' in form KTP
    Then I should see message error '<Message>' in the below of field 'eKtpNumber' in form KTP
    And I reset my state journey
    Examples:                                                                 ❸
      | testRailTag | Value              | Message                             |
      | @C131699    | 31730aa601860007   | Nomor KTP tidak sesuai format       |
      | @C131700    | 31730@!601860007   | Nomor KTP tidak sesuai format       |
      | @C131701    | 31730 601860007    | Nomor KTP tidak sesuai format       |
      | @C131702    | 31730356018607     | Nomor KTP harus 16 digit            |
      | @C131703    | 317303560186000712 | Nomor KTP harus 16 digit            |
      | @C131704    | 417303560186000712 | Nomor KTP tidak boleh diawali 0 & 4 |

  Scenario Outline: Verifying full name with invalid value in form KTP
    Given I am a customer want to fill my information identity details
    When I fill field 'fullName' with '<Value>' in form KTP
    Then I should see message error '<Message>' in the below of field 'fullName' in form KTP
    And I reset my state journey
    Examples:                                                                 ❸
      | testRailTag | Value                                               | Message                                                                        |
      | @C131705    | 31245                                               | Nama lengkap tidak boleh mengandung angka dan spesial karakter kecuali (.,\'-) |
      | @C131706    | Ruth Natasya 1                                      | Nama lengkap tidak boleh mengandung angka dan spesial karakter kecuali (.,\'-) |
      | @C131707    | Ruth Natasya Natasya Natasya Natasya Natasya Natasy | Nama lengkap minimal 3 & maksimal 50 karakter                                  |
      | @C131708    | Ru                                                  | Nama lengkap minimal 3 & maksimal 50 karakter                                  |

  @C131709
  Scenario: Verifying field fullname contain with special char (.-,')
    Given I am a customer want to fill my information identity details
    When I fill field 'fullName' with 'John Doe S.Kom, M\'Kom-' in form KTP
    Then I shouldn't see message error in the below of field 'fullName' in form KTP
    And I reset my state journey

  Scenario Outline: Verifying birthplace with invalid value in form KTP
    Given I am a customer want to fill my information identity details
    When I fill field 'placeOfBirth' with '<Value>' in form KTP
    Then I should see message error '<Message>' in the below of field 'placeOfBirth' in form KTP
    And I reset my state journey
    Examples:                                                                 ❸
      | testRailTag | Value                                                          | Message                                       |
      | @C131710    | 31245                                                          | Tempat lahir tidak sesuai format              |
      | @C131711    | Pancoran Pancoran Pancoran Pancoran Pancoran Pancoran Pancoran | Tempat lahir minimal 2 & maksimal 40 karakter |
      | @C131712    | P                                                              | Tempat lahir minimal 2 & maksimal 40 karakter |

  Scenario Outline: Verifying length address in form KTP
    Given I am a customer want to fill my information identity details
    When I fill field 'address' with '<Value>' in form KTP
    Then I should see message error '<Message>' in the below of field 'address' in form KTP
    And I reset my state journey
    Examples:                                                                 ❸
      | testRailTag | Value                                                                                                                                                   | Message                                  |
      | @C131713    | Offline123457890 licenses are for using KSE without the internet. Once generated, the license cannot be revoked or transferred to a different machine.. | Alamat minimal 3 & maksimal 150 karakter |
      | @C131714    | Pa                                                                                                                                                      | Alamat minimal 3 & maksimal 150 karakter |

  @C131715
  Scenario: Verifying field address contain with special char and number
    Given I am a customer want to fill my information identity details
    When I fill field 'address' with 'John Doe S.Kom, M\'Kom- 11233' in form KTP
    Then I shouldn't see message error in the below of field 'address' in form KTP
    And I reset my state journey

  Scenario Outline: Verifying rt with invalid value in form KTP
    Given I am a customer want to fill my information identity details
    When I fill field 'rt' with '<Value>' in form KTP
    Then I should see message error '<Message>' in the below of field 'rt' in form KTP
    And I reset my state journey
    Examples:                                                                 ❸
      | testRailTag | Value | Message                |
      | @C131716    | ab    | RT tidak sesuai format |
      | @C131717    | !@    | RT tidak sesuai format |
      | @C131718    | 3124  | RT maksimal 3          |

  @C131719
  Scenario: Verifying field rt contain with -
    Given I am a customer want to fill my information identity details
    When I fill field 'rt' with '-' in form KTP
    Then I shouldn't see message error in the below of field 'rt' in form KTP
    And I reset my state journey

  Scenario Outline: Verifying rw with invalid value in form KTP
    Given I am a customer want to fill my information identity details
    When I fill field 'rw' with '<Value>' in form KTP
    Then I should see message error '<Message>' in the below of field 'rw' in form KTP
    Examples:                                                                 ❸
      | testRailTag | Value | Message                |
      | @C131720    | ab    | RW tidak sesuai format |
      | @C131721    | !@    | RW tidak sesuai format |
      | @C131722    | 3124  | RW maksimal 3          |

  @C131723
  Scenario: Verifying field rw contain with -
    Given I am a customer want to fill my information identity details
    When I fill field 'rt' with '-' in form KTP
    Then I shouldn't see message error in the below of field 'rw' in form KTP
    And I reset my state journey

  @C135996
  Scenario: Submit form KTP with date of birth more than 17 years old
    Given I am a customer want to fill my information identity details
    When I choose birthdate with current date
    And I fill all information identity details as followings:
      | eKtpNumber    | 3174055109900003          |
      | fullName      | NADYA LAROSA              |
      | placeOfBirth  | MEDAN                     |
      | gender        | Laki-laki                 |
      | address       | Jl. Durian Runtuh No. 13  |
      | rt            | 01                        |
      | rw            | 05                        |
      | province      | DKI JAKARTA               |
      | city          | KOTA ADM. JAKARTA SELATAN |
      | district      | KEBAYORAN BARU            |
      | village       | SENAYAN                   |
      | religion      | Katolik                   |
      | maritalStatus | Belum Kawin               |
    And I submit my information identity details
    Then I will notify my age should above 17 years old
    And I close page rejected account
    And I will see card continue to data personal
    And I can continue to page 'Data KTP'
    And I reset my state journey

  @C131724
  Scenario: Submit form KTP successfully business type Individual
    Given I am a customer want to fill my information identity details
    When I fill all information identity details as followings:
      | eKtpNumber    | 3173035601860007          |
      | fullName      | NADYA LAROSA              |
      | placeOfBirth  | MEDAN                     |
      | dateOfBirth   | 11/11/1995                |
      | gender        | Laki-laki                 |
      | address       | Jl. Durian Runtuh No. 13  |
      | rt            | 01                        |
      | rw            | 05                        |
      | province      | DKI JAKARTA               |
      | city          | KOTA ADM. JAKARTA SELATAN |
      | district      | KEBAYORAN BARU            |
      | village       | SENAYAN                   |
      | religion      | Katolik                   |
      | maritalStatus | Belum Kawin               |
    And I submit my information identity details
    Then I will notify my information identity details has successfully submitted
    And I will direct to page capture selfie
    And I reset my state journey