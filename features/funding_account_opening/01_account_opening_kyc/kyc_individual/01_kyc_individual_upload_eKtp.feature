@kycUploadKtp
Feature: Account Opening KYC Individual - Upload KTP Photo
  In order to opening my Giro account with legality business type Individual in SMB
  As a customer
  I want to upload eKTP photo as part of the KYC Process

  Background: User choose legality business type Individual
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
    And I choose legality business type 'individual'
    And I submit my legality type
    
  Scenario: Upload eKTP photo successfully
    Given I am a customer who has selected the business type Individual
    When I upload my eKTP photo
    Then I will directing to page submit form KTP