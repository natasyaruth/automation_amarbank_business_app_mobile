@kycUploadKtpCompanyPTPerusahaan
Feature: Account Opening KYC PT Perusahaan - Upload KTP Photo
  In order to opening my Giro account with legality business type PT Perusahaan in SMB
  As a customer
  I want to upload eKTP photo as part of the KYC Process

  Background: User choose legality business type PT Perusahaan
    Given I am a registered customer with following details:
      | userID      | ruth0c1c |
      | password    | 1234Test |
      | userIDstg   | ruth8f27 |
      | passwordStg | 1234Test |
    And I filling in form login with the following details:
      | userID      | ruth0c1c |
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

  @C131826
  Scenario: Upload eKTP photo successfully business type PT Perusahaan
    Given I am a customer who has selected the business type PT Perusahaan
    When I upload my eKTP photo
    Then I will directing to page submit form KTP