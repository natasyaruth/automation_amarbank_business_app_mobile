@kycUploadSelfieUD
Feature: Account Opening KYC UD - Upload Selfie Photo
  In order to opening my Giro account with legality business type UD in SMB
  As a customer
  I want to upload my selfie photo as part of the KYC Process

  Background: User choose legality business type UD
    Given I am a registered customer with following details:
      | userID      | natabe66 |
      | password    | Test1234 |
      | userIDstg   | ruth73e1 |
      | passwordStg | 1234Test |
    And I filling in form login with the following details:
      | userID      | natabe66 |
      | password    | Test1234 |
      | userIDstg   | ruth73e1 |
      | passwordStg | 1234Test |
    And I click login
    And I click later in pop up biometric
    And I will directing to Hook 1 Onboarding Account Opening
    And I swipe to card Giro Account
    And I choose Giro Account
    And I choose Giro Account MSME
    And I choose legality business type 'ud'
    And I submit my legality type
    And I update my last journey step to 'Data KTP'

  @C131843
  Scenario: Upload selfie image successfully business type UD
    Given I am a customer who has submitted my information identity details
    And my information about my account opening is 'Pembentukan rekening memerlukan foto diri pemilik bisnis'
    When I click take my photo selfie
    And I will direct to page take selfie picture KYC
    And I take selfie picture
    And I will direct to page preview selfie picture KYC
    And I submit my selfie photo
    Then I will notify my photo selfie has successfully submitted
    And I will direct to page take a selfie with KTP
    And I reset my state journey
