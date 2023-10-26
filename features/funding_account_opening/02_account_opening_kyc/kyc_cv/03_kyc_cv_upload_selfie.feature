@kycUploadSelfieCV
Feature: Account Opening KYC CV - Upload Selfie Photo
  In order to opening my Giro account with legality business type CV in SMB
  As a customer
  I want to upload my selfie photo as part of the KYC Process

  Background: User choose legality business type CV
    Given I am a registered customer with following details:
      | userID   | ruth5a50 |
      | password | 1234Test |
    And I filling in form login with the following details:
      | userID   | ruth5a50 |
      | password | 1234Test |
    And I click login
    And I will directing to Hook 1 Onboarding Account Opening
    And I swipe to card Giro Account
    And I choose Giro Account
    And I choose legality business type 'cv'
    And I submit my legality type
    And I upload my eKTP photo
    And I fill all information identity details as followings:
      | eKtpNumber    | 3175044501980004          |
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

  Scenario: Upload selfie image successfully business type CV
    Given I am a customer who has submitted my information identity details
    And my information about my account opening is 'Pembentukan rekening memerlukan foto diri salah satu direktur'
    When I upload my selfie photo
    Then I will notify my photo selfie has successfully submitted
    And I will directing to page submit Data Personal
    