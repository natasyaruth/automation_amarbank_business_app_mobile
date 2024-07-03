@kycSubmitFormKtpPTPerusahaan
Feature: Account Opening KYC PT Perusahaan - Submit Form KTP
  In order to opening my Giro account with legality business type PT Perusahaan in SMB
  As a customer
  I want to submit my identity information as part of the KYC Process

  Background: User choose legality business type PT Perusahaan
    Given I am a registered customer with following details:
      | userID      | ruth0aea |
      | password    | 1234Test |
      | userIDstg   | ruth8f27 |
      | passwordStg | 1234Test |
    And I filling in form login with the following details:
      | userID      | ruth0aea |
      | password    | 1234Test |
      | userIDstg   | ruth8f27 |
      | passwordStg | 1234Test |
    And I click login
    And I click later in pop up biometric
    And I will directing to Hook 1 Onboarding Account Opening
    And I swipe to card Giro Account
    And I choose Giro Account
    And I choose Giro Account Corporate
    And I choose legality business type 'company'
    And I submit my legality type
    And I upload my eKTP photo

  @C131827
  Scenario: Submit form KTP successfully business type PT Perusahaan
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