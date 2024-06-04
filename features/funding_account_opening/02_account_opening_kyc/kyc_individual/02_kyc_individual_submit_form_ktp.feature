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
    Examples:
      | testRailTag | Field        | Field Name     |
      | @C101177    | eKtpNumber   | Nomor KTP      |
      | @C101178    | fullName     | Nama lengkap   |
      | @C101179    | placeOfBirth | Tempat lahir   |
      | @C101180    | address      | Alamat lengkap |
      | @C101181    | rt           | RT             |
      | @C101182    | rw           | RW             |

  Scenario Outline: Verifying one fields hasn't been filled by user in form KTP
    Given I am a customer want to fill my information identity details
    When I fill form KTP except field '<Field>'
    And I submit my information identity details
    And I swipe to field '<Field>' in form KTP
    Then I should see message error '<Field Name> wajib diisi' in the below of field '<Field>' in form KTP
    Examples:
      | testRailTag | Field         | Field Name        |
      | @C101183    | eKtpNumber    | Nomor KTP         |
      | @C101184    | fullName      | Nama lengkap      |
      | @C101185    | placeOfBirth  | Tempat lahir      |
      | @C101186    | dateOfBirth   | Tanggal lahir     |
      | @C101187    | gender        | Jenis kelamin     |
      | @C101188    | address       | Alamat lengkap    |
      | @C101189    | rt            | RT                |
      | @C101190    | rw            | RW                |
      | @C101191    | province      | Provinsi          |
      | @C101192    | city          | Kota/Kabupaten    |
      | @C101193    | district      | Kecamatan         |
      | @C101194    | village       | Kelurahan         |
      | @C101195    | religion      | Agama             |
      | @C101196    | maritalStatus | Status perkawinan |

  Scenario Outline: Verifying eKTP number with invalid value in form KTP
    Given I am a customer want to fill my information identity details
    When I fill field 'eKtpNumber' with '<Value>' in form KTP
    Then I should see message error '<Message>' in the below of field 'eKtpNumber' in form KTP
    Examples:                                                                 ❸
      | testRailTag | Value              | Message                             |
      | @C101197    | 31730aa601860007   | Nomor KTP tidak sesuai format       |
      | @C101198    | 31730@!601860007   | Nomor KTP tidak sesuai format       |
      | @C101199    | 31730 601860007    | Nomor KTP tidak sesuai format       |
      | @C101200    | 31730356018607     | Nomor KTP harus 16 digit            |
      | @C101201    | 317303560186000712 | Nomor KTP harus 16 digit            |
      | @C101202    | 417303560186000712 | Nomor KTP tidak boleh diawali 0 & 4 |

  Scenario Outline: Verifying full name with invalid value in form KTP
    Given I am a customer want to fill my information identity details
    When I fill field 'fullName' with '<Value>' in form KTP
    Then I should see message error '<Message>' in the below of field 'fullName' in form KTP
    Examples:                                                                 ❸
      | testRailTag | Value                                               | Message                                                                        |
      | @C101203    | 31245                                               | Nama lengkap tidak boleh mengandung angka dan spesial karakter kecuali (.,\'-) |
      | @C101204    | Ruth Natasya 1                                      | Nama lengkap tidak boleh mengandung angka dan spesial karakter kecuali (.,\'-) |
      | @C101205    | Ruth Natasya Natasya Natasya Natasya Natasya Natasy | Nama lengkap minimal 3 & maksimal 50 karakter                                  |
      | @C101206    | Ru                                                  | Nama lengkap minimal 3 & maksimal 50 karakter                                  |

  @C101207
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
      | @C101208    | 31245                                                          | Tempat lahir tidak sesuai format              |
      | @C101209    | Pancoran Pancoran Pancoran Pancoran Pancoran Pancoran Pancoran | Tempat lahir minimal 2 & maksimal 40 karakter |
      | @C101210    | P                                                              | Tempat lahir minimal 2 & maksimal 40 karakter |

  Scenario Outline: Verifying length address in form KTP
    Given I am a customer want to fill my information identity details
    When I fill field 'address' with '<Value>' in form KTP
    Then I should see message error '<Message>' in the below of field 'address' in form KTP
    Examples:                                                                 ❸
      | testRailTag | Value                                                                                                                                                   | Message                                  |
      | @C101211    | Offline123457890 licenses are for using KSE without the internet. Once generated, the license cannot be revoked or transferred to a different machine.. | Alamat minimal 3 & maksimal 150 karakter |
      | @C101212    | Pa                                                                                                                                                      | Alamat minimal 3 & maksimal 150 karakter |

  @C101213
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
      | @C101214    | ab    | RT tidak sesuai format |
      | @C101215    | !@    | RT tidak sesuai format |
      | @C101216    | 3124  | RT maksimal 3          |

  @C101217
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
      | @C101218    | ab    | RW tidak sesuai format |
      | @C101219    | !@    | RW tidak sesuai format |
      | @C101220    | 3124  | RW maksimal 3          |

  @C101221
  Scenario: Verifying field rw contain with -
    Given I am a customer want to fill my information identity details
    When I fill field 'rt' with '-' in form KTP
    Then I shouldn't see message error in the below of field 'rw' in form KTP  

  @C101222
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