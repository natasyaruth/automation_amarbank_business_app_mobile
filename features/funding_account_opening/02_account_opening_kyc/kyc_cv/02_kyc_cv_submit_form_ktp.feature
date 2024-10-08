@kycSubmitFormKtpCV
Feature: Account Opening KYC CV - Submit Form KTP
  In order to opening my Giro account with legality business type CV in SMB
  As a customer
  I want to submit my identity information as part of the KYC Process

  Background: User choose legality business type CV
    Given I am a registered customer with following details:
      | userID      | ruth07f9 |
      | password    | 1234Test |
      | userIDstg   | ruthf5d5 |
      | passwordStg | 1234Test |
    And I filling in form login with the following details:
      | userID      | ruth07f9 |
      | password    | 1234Test |
      | userIDstg   | ruthf5d5 |
      | passwordStg | 1234Test |
    And I click login
    And I click later in pop up biometric
    And I will directing to Hook 1 Onboarding Account Opening
    And I swipe to card Giro Account
    And I choose Giro Account
    And I choose Giro Account Corporate
        And I submit my giro type
    And I choose legality business type 'cv'
    And I submit my legality type
    And I fill NPWP Business
    And I click continue to data personal
    And I click confirm NPWP Business
    And I see page 'Upload eKTP'
    And I upload my eKTP photo

  @C136005
  Scenario: Submit form KTP successfully business type CV with NIK user Individual that already registered
    Given I am a customer who has uploaded my eKTP photo
    When I fill all information identity details as followings:
      | eKtpNumber    | 3171131810770033          |
      | eKtpNumberStg | 3494397967994519          |
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

  @C136006
  Scenario: Submit form KTP successfully business type CV with NIK user Business that already registered
    Given I am a customer who has uploaded my eKTP photo
    When I fill all information identity details as followings:
      | eKtpNumber    | 3171131810910033          |
      | eKtpNumberStg | 3275123009920078          |
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
    And my information about my account opening is 'Pembentukan rekening memerlukan foto diri salah satu direktur' 
    And I reset my state journey

  @C131820
  Scenario: Submit form KTP successfully business type CV
    Given I am a customer who has uploaded my eKTP photo
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
    And my information about my account opening is 'Pembentukan rekening memerlukan foto diri salah satu direktur'
    And I reset my state journey