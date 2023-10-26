@kycUserInvited
Feature: Account Opening KYC - User Invited
  In order to opening my Giro account with legality business type UD in SMB
  As a customer
  I want to upload my selfie photo as part of the KYC Process

  Background: User choose legality business type UD
    Given I am a registered customer business invited with following details:
      | userID   | ruth17a5 |
      | password | Test1234 |
    When I filling in form login with the following details:
      | userID   | ruth17a5 |
      | password | Test1234 |
    And I click login
    And I continue to register my KYC data

  Scenario: User invited complete KYC
    Given I am a invited customer wants to complete my KYC data
    When I upload my eKTP photo
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
    And I upload my selfie photo
    Then I will notify that my personal data details needs to be verified first