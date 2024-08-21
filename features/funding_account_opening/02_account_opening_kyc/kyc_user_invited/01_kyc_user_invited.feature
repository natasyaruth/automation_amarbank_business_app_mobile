@kycUserInvited
Feature: Account Opening KYC - User Invited
  In order to opening my Giro account with legality business type UD in SMB
  As a customer
  I want to upload my selfie photo as part of the KYC Process

  Background: User choose legality business
    Given I am a customer that recently registered to amarbank business with data as below
      | fullName        | Revvy                   |
      | email           | revvy@gmail.com         |
      | phoneNumber     | 899967754041            |
      | password        | 1234Test                |
    And I login using my user id that I recently receive through email
    And I click later in pop up biometric
    And I click later
    And I register initiator with partner as below
      | fullName        | RUDI                   |
      | email           | rudi.bagus@gmail.com   |
      | phoneNumber     | 899969154041           |
      | password        | 1234Test               |
    And I choose other
    And I click logout
    And I register invitee with business code
    And I login using user id partner
    And I click later in pop up biometric
    And I will direct to page continue to register KYC Invitee
    And I continue to register my KYC data

  @C131848 @FuntionalTestDemo
  Scenario: User invited complete KYC
    Given I am a invited customer wants to complete my KYC data
    When I click take photo eKTP
    And I take photo eKTP
    And I submit my eKTP photo
    And I fill all information identity details as followings:
      | eKtpNumber    | 3174034313750003          |
      | fullName      | JOHAN HOPKINS             |
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
    And I will direct to page capture selfie
    And I click take my photo selfie
    And I take selfie picture
    And I submit my selfie photo
    And I will direct to page take a selfie with KTP
    And I click take photo selfie with KTP
    And I click take photo
    And I submit my selfie with KTP 
    Then I will notify that my personal data details needs to be verified first
    And I will notify that my personal data details needs to be verified in main dashboard