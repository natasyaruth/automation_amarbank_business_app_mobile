@kycUploadSelfiePTPerusahaan
Feature: Account Opening KYC PT Perusahaan - Upload Selfie Photo
  In order to opening my Giro account with legality business type PT Perusahaan in SMB
  As a customer
  I want to upload my selfie photo as part of the KYC Process

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
        And I submit my giro type
    And I choose legality business type 'company'
    And I submit my legality type
    And I fill NPWP Business
    And I click continue to data personal
    And I click confirm NPWP Business
    And I see page 'Upload eKTP'
    And I update my last journey step to 'Data KTP'

  @C170855
  Scenario: Upload selfie image successfully business type PT Perusahaan
    Given I am a customer who has submitted my information identity details
    And my information about my account opening is 'Pembentukan rekening memerlukan foto diri salah satu direktur'
    When I click take my photo selfie
    And I will direct to page take selfie picture KYC
    And I take selfie picture
    And I will direct to page preview selfie picture KYC
    And I submit my selfie photo
    Then I will notify my photo selfie has successfully submitted
    And I will direct to page take a selfie with KTP
    And I reset my state journey
