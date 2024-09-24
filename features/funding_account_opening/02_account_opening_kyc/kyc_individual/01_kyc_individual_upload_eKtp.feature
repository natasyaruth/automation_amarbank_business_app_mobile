@kycUploadKtpIndividual
Feature: Account Opening KYC Individual - Upload KTP Photo
  In order to opening my Giro account with legality business type Individual in SMB
  As a customer
  I want to upload eKTP photo as part of the KYC Process

  Background: User choose legality business type Individual
    Given I am a registered customer with following details:
      | userID      | ruth0c1c |
      | password    | 1234Test |
      | userIDstg   | ruth530f |
      | passwordStg | 1234Test |
    And I filling in form login with the following details:
      | userID      | ruth0c1c |
      | password    | 1234Test |
      | userIDstg   | ruth530f |
      | passwordStg | 1234Test |
    And I click login
    And I click later in pop up biometric
    And I will directing to Hook 1 Onboarding Account Opening
    And I swipe to card Giro Account
    And I choose Giro Account
    And I choose Giro Account MSME
    And I choose legality business type 'individual'
    And I submit my legality type

  @C131678
  Scenario: Upload eKTP photo successfully business type Individual
    Given I am a customer who has selected the business type Individual
    When I click take photo eKTP
    And I will directing to page take photo eKTP
    And I take photo eKTP
    And I will direct to page preview eKTP picture
    And I submit my eKTP photo
    Then I will directing to page submit form KTP
    And I reset my state journey