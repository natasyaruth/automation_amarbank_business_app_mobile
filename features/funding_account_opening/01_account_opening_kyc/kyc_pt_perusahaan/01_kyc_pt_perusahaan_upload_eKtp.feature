@kycUploadKtpCompanyPTPerusahaan
Feature: Account Opening KYC PT Perusahaan - Upload KTP Photo
  In order to opening my Giro account with legality business type PT Perusahaan in SMB
  As a customer
  I want to upload eKTP photo as part of the KYC Process

  Background: User choose legality business type PT Perusahaan
    Given I am a registered customer with following details:
      | userID   | ruthfe15 |
      | password | Test1234 |
    And I filling in form login with the following details:
      | userID   | ruthfe15 |
      | password | Test1234 |
    And I click login
    Then I will direct to dashboard
    When I swipe to card Giro Account
    And I choose Giro Account
    And I choose legality business type 'company'
    And I submit my legality type
    
  Scenario: Upload eKTP photo successfully business type PT Perusahaan
    Given I am a customer who has selected the business type PT Perusahaan
    When I upload my eKTP photo
    Then I will directing to page submit form KTP