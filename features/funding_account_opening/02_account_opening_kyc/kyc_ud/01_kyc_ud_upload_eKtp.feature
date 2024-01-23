@kycUploadKtpUD
Feature: Account Opening KYC UD - Upload KTP Photo
  In order to opening my Giro account with legality business type UD in SMB
  As a customer
  I want to upload eKTP photo as part of the KYC Process

  Background: User choose legality business type UD
    Given I am a registered customer with following details:
      | userID   | nataf8ec |
      | password | Test1234 |
    And I filling in form login with the following details:
      | userID   | nataf8ec |
      | password | Test1234 |
    And I click login
    And I will directing to Hook 1 Onboarding Account Opening
    And I swipe to card Giro Account
    And I choose Giro Account
    And I choose Giro Account MSME
    And I choose legality business type 'ud'
    And I submit my legality type

  @C96544
  Scenario: Upload eKTP photo successfully business type UD
    Given I am a customer who has selected the business type UD
    When I upload my eKTP photo
    Then I will directing to page submit form KTP