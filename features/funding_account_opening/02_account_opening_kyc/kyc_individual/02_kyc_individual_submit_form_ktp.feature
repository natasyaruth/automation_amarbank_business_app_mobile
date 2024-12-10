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
    And I reset my state journey  
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
    And I submit my giro type
    And I choose legality business type 'individual'
    And I submit my legality type
    And I fill NPWP Business
    And I click continue to data personal
    And I click confirm NPWP Business
    And I see page 'Upload eKTP'

  Scenario Outline: Verifying form KTP fields has been filled and then empty the fields
    Given I am a customer want to fill my information identity details
    When I fill field '<Field>' with '1234' in form KTP
    And I clear the field '<Field>' in form KTP
    Then I should see message error '<Field Name> wajib diisi' in the below of field '<Field>' in form KTP
    And I reset my state journey
    Examples:
      | testRailTag | Field        | Field Name     |
      | @C170864    | eKtpNumber   | Nomor KTP      |
      | @C170865    | fullName     | Nama lengkap   |
      | @C170866    | placeOfBirth | Tempat lahir   |
      | @C170867    | address      | Alamat lengkap |
      | @C170868    | rt           | RT             |
      | @C170869    | rw           | RW             |

  Scenario Outline: Verifying one fields hasn't been filled by user in form KTP
    Given I am a customer want to fill my information identity details
    When I fill form KTP except field '<Field>'
    And I submit my information identity details
    And I swipe to field '<Field>' in form KTP
    Then I should see message error '<Field Name> wajib diisi' in the below of field '<Field>' in form KTP
    And I reset my state journey
    Examples:
      | testRailTag | Field         | Field Name        |
      | @C170870    | eKtpNumber    | Nomor KTP         |
      | @C170871    | fullName      | Nama lengkap      |
      | @C170872    | placeOfBirth  | Tempat lahir      |
      | @C170873    | dateOfBirth   | Tanggal lahir     |
      | @C170874    | gender        | Jenis kelamin     |
      | @C170875    | address       | Alamat lengkap    |
      | @C170876    | rt            | RT                |
      | @C170877    | rw            | RW                |
      | @C170878    | province      | Provinsi          |
      | @C170879    | city          | Kota/Kabupaten    |
      | @C170880    | district      | Kecamatan         |
      | @C170881    | village       | Kelurahan         |
      | @C170882    | religion      | Agama             |
      | @C170883    | maritalStatus | Status perkawinan |

  Scenario Outline: Verifying eKTP number with invalid value in form KTP
    Given I am a customer want to fill my information identity details
    When I fill field 'eKtpNumber' with '<Value>' in form KTP
    Then I should see message error '<Message>' in the below of field 'eKtpNumber' in form KTP
    And I reset my state journey
    Examples:                                                                 ❸
      | testRailTag | Value              | Message                             |
      | @C170884    | 31730aa601860007   | Nomor KTP tidak sesuai format       |
      | @C170885    | 31730@!601860007   | Nomor KTP tidak sesuai format       |
      | @C170886    | 31730 601860007    | Nomor KTP tidak sesuai format       |
      | @C170887    | 31730356018607     | Nomor KTP harus 16 digit            |
      | @C170888    | 317303560186000712 | Nomor KTP harus 16 digit            |
      | @C170889    | 417303560186000712 | Nomor KTP tidak boleh diawali 0 & 4 |

  Scenario Outline: Verifying full name with invalid value in form KTP
    Given I am a customer want to fill my information identity details
    When I fill field 'fullName' with '<Value>' in form KTP
    Then I should see message error '<Message>' in the below of field 'fullName' in form KTP
    And I reset my state journey
    Examples:                                                                 ❸
      | testRailTag | Value                                               | Message                                                                        |
      | @C170890    | 31245                                               | Nama lengkap tidak boleh mengandung angka dan spesial karakter kecuali (.,\'-) |
      | @C170891    | Ruth Natasya 1                                      | Nama lengkap tidak boleh mengandung angka dan spesial karakter kecuali (.,\'-) |
      | @C170892    | Ruth Natasya Natasya Natasya Natasya Natasya Natasy | Nama lengkap minimal 3 & maksimal 50 karakter                                  |
      | @C170893    | Ru                                                  | Nama lengkap minimal 3 & maksimal 50 karakter                                  |

  @C170894
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
      | @C170895    | 31245                                                          | Tempat lahir tidak sesuai format              |
      | @C170896    | Pancoran Pancoran Pancoran Pancoran Pancoran Pancoran Pancoran | Tempat lahir minimal 2 & maksimal 40 karakter |
      | @C170897    | P                                                              | Tempat lahir minimal 2 & maksimal 40 karakter |

  Scenario Outline: Verifying length address in form KTP
    Given I am a customer want to fill my information identity details
    When I fill field 'address' with '<Value>' in form KTP
    Then I should see message error '<Message>' in the below of field 'address' in form KTP
    And I reset my state journey
    Examples:                                                                 ❸
      | testRailTag | Value                                                                                                                                                   | Message                                  |
      | @C170898    | Offline123457890 licenses are for using KSE without the internet. Once generated, the license cannot be revoked or transferred to a different machine.. | Alamat minimal 3 & maksimal 150 karakter |
      | @C170899    | Pa                                                                                                                                                      | Alamat minimal 3 & maksimal 150 karakter |

  @C170900
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
      | @C170901    | ab    | RT tidak sesuai format |
      | @C170902    | !@    | RT tidak sesuai format |
      | @C170903    | 3124  | RT maksimal 3          |

  @C170904
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
      | @C170905    | ab    | RW tidak sesuai format |
      | @C170906    | !@    | RW tidak sesuai format |
      | @C170907    | 3124  | RW maksimal 3          |

  @C170908
  Scenario: Verifying field rw contain with -
    Given I am a customer want to fill my information identity details
    When I fill field 'rt' with '-' in form KTP
    Then I shouldn't see message error in the below of field 'rw' in form KTP
    And I reset my state journey

  @C170909
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

  @C170910
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