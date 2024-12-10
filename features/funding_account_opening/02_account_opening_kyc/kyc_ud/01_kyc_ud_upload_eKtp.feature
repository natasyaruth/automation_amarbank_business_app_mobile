@kycUploadKtpUD
Feature: Account Opening KYC UD - Upload KTP Photo
  In order to opening my Giro account with legality business type UD in SMB
  As a customer
  I want to upload eKTP photo as part of the KYC Process

  Background: User choose legality business type UD
    Given I am a registered customer with following details:
      | userID      | nataf8ec |
      | password    | Test1234 |
      | userIDstg   | ruth73e1 |
      | passwordStg | 1234Test |
    And I filling in form login with the following details:
      | userID      | nataf8ec |
      | password    | Test1234 |
      | userIDstg   | ruth73e1 |
      | passwordStg | 1234Test |
    And I click login
    And I click later in pop up biometric
    And I will directing to Hook 1 Onboarding Account Opening
    And I swipe to card Giro Account
    And I choose Giro Account
    And I choose Giro Account MSME
        And I submit my giro type
    And I choose legality business type 'ud'
    And I submit my legality type
    And I fill NPWP Business
    And I click continue to data personal
    And I click confirm NPWP Business
    And I see page 'Upload eKTP'

  @C171083
  Scenario: Upload eKTP photo successfully business type UD
    Given I am a customer who has selected the business type UD
    When I click take photo eKTP
    And I will directing to page take photo eKTP
    And I take photo eKTP
    And I will direct to page preview eKTP picture
    And I submit my eKTP photo
    Then I will directing to page submit form KTP
    And I reset my state journey