@kycUploadKtpCV
Feature: Account Opening KYC CV - Upload KTP Photo
  In order to opening my Giro account with legality business type CV in SMB
  As a customer
  I want to upload eKTP photo as part of the KYC Process

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
    # And I fill NPWP Business
    # And I click continue to data personal
    # And I click confirm NPWP Business
    # And I see page 'Upload eKTP'

  @C141156
  Scenario: Re-upload eKTP photo successfully
    Given I am a customer who has selected the business type CV
    When I click take photo eKTP
    And I will directing to page take photo eKTP
    And I take photo eKTP
    And I will direct to page preview eKTP picture
    And I retake photo eKTP
    Then I will directing to page take photo eKTP
    And I reset my state journey

  @C131819
  Scenario: Upload eKTP photo successfully business type CV
    Given I am a customer who has selected the business type CV
    When I click take photo eKTP
    And I will directing to page take photo eKTP
    And I take photo eKTP
    And I will direct to page preview eKTP picture
    And I submit my eKTP photo
    Then I will directing to page submit form KTP
    And I reset my state journey