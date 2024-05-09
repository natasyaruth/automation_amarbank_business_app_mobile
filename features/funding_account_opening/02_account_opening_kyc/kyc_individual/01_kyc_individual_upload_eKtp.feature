@kycUploadKtpIndividual
Feature: Account Opening KYC Individual - Upload KTP Photo
  In order to opening my Giro account with legality business type Individual in SMB
  As a customer
  I want to upload eKTP photo as part of the KYC Process

  Background: User choose legality business type Individual
    Given I am a registered customer with following details:
      | userID      | ruth07f9 |
      | password    | 1234Test |
      | userIDstg   | ruth530f |
      | passwordStg | 1234Test |
    And I filling in form login with the following details:
      | userID      | ruth07f9 |
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

  @C96523
  Scenario: Upload eKTP photo successfully business type Individual
    Given I am a customer who has selected the business type Individual
    When I upload my eKTP photo
    Then I will directing to page submit form KTP