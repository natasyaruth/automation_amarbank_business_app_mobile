@kycUploadSelfieCV
Feature: Account Opening KYC CV - Upload Selfie Photo
  In order to opening my Giro account with legality business type CV in SMB
  As a customer
  I want to upload my selfie photo as part of the KYC Process

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
    And I choose legality business type 'cv'
    And I submit my legality type
    And I update my last journey step to 'Data KTP'

  Scenario: Re-upload selfie image successfully
    Given I am a customer who has submitted my information identity details
    And my information about my account opening is 'Pembentukan rekening memerlukan foto diri salah satu direktur'
    When I click take my photo selfie
    And I will direct to page take selfie
    And I take picture selfie for matching the face
    And I will direct to page preview selfie picture
    And I retake picture selfie
    Then I will direct to page take selfie
    And I reset my state journey

  @C131821
  Scenario: Upload selfie image successfully business type CV
    Given I am a customer who has submitted my information identity details
    And my information about my account opening is 'Pembentukan rekening memerlukan foto diri salah satu direktur'
    When I click take my photo selfie
    And I will direct to page take selfie
    And I take picture selfie for matching the face
    And I will direct to page preview selfie picture
    And I submit my selfie photo
    Then I will notify my photo selfie has successfully submitted
    And I will direct to page take a selfie with KTP
    And I reset my state journey