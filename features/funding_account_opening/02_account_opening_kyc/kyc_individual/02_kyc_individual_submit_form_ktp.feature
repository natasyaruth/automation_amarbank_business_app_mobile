@kycSubmitFormKtpIndividual
Feature: Account Opening KYC Individual - Submit Form KTP
  In order to opening my Giro account with legality business type Individual in SMB
  As a customer
  I want to submit my identity information as part of the KYC Process

  Background: User choose legality business type Individual
    Given I am a registered customer with following details:
      | userID   | ruth0c1c |
      | password | 1234Test |
    And I filling in form login with the following details:
      | userID   | ruth0c1c |
      | password | 1234Test |
    And I click login
    And I will directing to Hook 1 Onboarding Account Opening
    And I swipe to card Giro Account
    And I choose Giro Account
    And I choose legality business type 'individual'
    And I submit my legality type

  Scenario Outline: Verifying form KTP fields has been filled and then empty the fields
    Given I am a customer want to fill my information identity details
    When I fill field '<Field>' with '1234' in form KTP
    And I clear the field '<Field>' in form KTP
    Then I should see message error '<Field Name> wajib diisi' in the below of field '<Field>' in form KTP
    Examples:
      | testRailTag | Field        | Field Name     |
      |             | eKtpNumber   | Nomor KTP      |
      |             | fullName     | Nama lengkap   |
      |             | placeOfBirth | Tempat lahir   |
      |             | address      | Alamat lengkap |
      |             | rt           | RT             |
      |             | rw           | RW             |

  Scenario Outline: Verifying one fields hasn't been filled by user in form KTP
    Given I am a customer want to fill my information identity details
    When I fill form KTP except field '<Field>'
    And I submit my information identity details
    And I swipe to field '<Field>' in form KTP
    Then I should see message error '<Field Name> wajib diisi' in the below of field '<Field>' in form KTP
    Examples:
      | testRailTag | Field         | Field Name        |
      |             | eKtpNumber    | Nomor KTP         |
      |             | fullName      | Nama lengkap      |
      |             | placeOfBirth  | Tempat lahir      |
      |             | dateOfBirth   | Tanggal lahir     |
      |             | gender        | Jenis kelamin     |
      |             | address       | Alamat lengkap    |
      |             | rt            | RT                |
      |             | rw            | RW                |
      |             | province      | Provinsi          |
      |             | city          | Kota/Kabupaten    |
      |             | district      | Kecamatan         |
      |             | village       | Kelurahan         |
      |             | religion      | Agama             |
      |             | maritalStatus | Status perkawinan |

  Scenario Outline: Verifying eKTP number with invalid value in form KTP
    Given I am a customer want to fill my information identity details
    When I fill field 'eKtpNumber' with '<Value>' in form KTP
    Then I should see message error '<Message>' in the below of field 'eKtpNumber' in form KTP
    Examples:                                                                 ❸
      | testRailTag | Value              | Message                             |
      |             | 31730aa601860007   | Nomor KTP tidak sesuai format       |
      |             | 31730@!601860007   | Nomor KTP tidak sesuai format       |
      |             | 31730 601860007    | Nomor KTP tidak sesuai format       |
      |             | 31730356018607     | Nomor KTP harus 16 digit            |
      |             | 317303560186000712 | Nomor KTP harus 16 digit            |
      |             | 417303560186000712 | Nomor KTP tidak boleh diawali 0 & 4 |

  Scenario Outline: Verifying full name with invalid value in form KTP
    Given I am a customer want to fill my information identity details
    When I fill field 'fullName' with '<Value>' in form KTP
    Then I should see message error '<Message>' in the below of field 'fullName' in form KTP
    Examples:                                                                 ❸
      | testRailTag | Value                                               | Message                                                                        |
      |             | 31245                                               | Nama lengkap tidak boleh mengandung angka dan spesial karakter kecuali (.,\'-) |
      |             | Ruth Natasya 1                                      | Nama lengkap tidak boleh mengandung angka dan spesial karakter kecuali (.,\'-) |
      |             | Ruth Natasya Natasya Natasya Natasya Natasya Natasy | Nama lengkap minimal 3 & maksimal 50 karakter                                  |
      |             | Ru                                                  | Nama lengkap minimal 3 & maksimal 50 karakter                                  |

  Scenario: Verifying field fullname contain with special char (.-,')
    Given I am a customer want to fill my information identity details
    When I fill field 'fullName' with 'John Doe S.Kom, M\'Kom-' in form KTP
    Then I shouldn't see message error in the below of field 'fullName' in form KTP

  Scenario Outline: Verifying birthplace with invalid value in form KTP
    Given I am a customer want to fill my information identity details
    When I fill field 'placeOfBirth' with '<Value>' in form KTP
    Then I should see message error '<Message>' in the below of field 'placeOfBirth' in form KTP
    Examples:                                                                 ❸
      | testRailTag | Value                                                          | Message                                       |
      |             | 31245                                                          | Tempat lahir tidak sesuai format              |
      |             | Pancoran Pancoran Pancoran Pancoran Pancoran Pancoran Pancoran | Tempat lahir minimal 2 & maksimal 40 karakter |
      |             | P                                                              | Tempat lahir minimal 2 & maksimal 40 karakter |

  Scenario Outline: Verifying length address in form KTP
    Given I am a customer want to fill my information identity details
    When I fill field 'address' with '<Value>' in form KTP
    Then I should see message error '<Message>' in the below of field 'address' in form KTP
    Examples:                                                                 ❸
      | testRailTag | Value                                                                                                                                                   | Message                                  |
      |             | Offline123457890 licenses are for using KSE without the internet. Once generated, the license cannot be revoked or transferred to a different machine.. | Alamat minimal 3 & maksimal 150 karakter |
      |             | Pa                                                                                                                                                      | Alamat minimal 3 & maksimal 150 karakter |

  Scenario: Verifying field address contain with special char and number
    Given I am a customer want to fill my information identity details
    When I fill field 'address' with 'John Doe S.Kom, M\'Kom- 11233' in form KTP
    Then I shouldn't see message error in the below of field 'address' in form KTP

  Scenario Outline: Verifying rt with invalid value in form KTP
    Given I am a customer want to fill my information identity details
    When I fill field 'rt' with '<Value>' in form KTP
    Then I should see message error '<Message>' in the below of field 'rt' in form KTP
    Examples:                                                                 ❸
      | testRailTag | Value | Message                |
      |             | ab    | RT tidak sesuai format |
      |             | !@    | RT tidak sesuai format |
      |             | 3124  | RT maksimal 3          |

  Scenario: Verifying field rt contain with -
    Given I am a customer want to fill my information identity details
    When I fill field 'rt' with '-' in form KTP
    Then I shouldn't see message error in the below of field 'rt' in form KTP

  Scenario Outline: Verifying rw with invalid value in form KTP
    Given I am a customer want to fill my information identity details
    When I fill field 'rw' with '<Value>' in form KTP
    Then I should see message error '<Message>' in the below of field 'rw' in form KTP
    Examples:                                                                 ❸
      | testRailTag | Value | Message                |
      |             | ab    | RW tidak sesuai format |
      |             | !@    | RW tidak sesuai format |
      |             | 3124  | RW maksimal 3          |

  Scenario: Verifying field rw contain with -
    Given I am a customer want to fill my information identity details
    When I fill field 'rt' with '-' in form KTP
    Then I shouldn't see message error in the below of field 'rw' in form KTP

  @C96524
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