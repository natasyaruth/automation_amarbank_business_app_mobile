@CreateAccountBusinessCodeInv
Feature: BusinessCodeInv
  In order to open an SMB account
  As a customer lead
  I want to register for an account

   #@coba1
   Scenario: Create a new account
    Given I am a customer lead wanting to open a new account
    When I choose menu registration
    And I filling in my account information with the following details:
      | fullName        | yahyahihi                   |
      | email           | yahya_auto20@yopmail.com    |
      | mobileNumber    | 8999677511              |
      | password        | 1234Test                |
      | confirmPassword | 1234Test                |
    And I registering the account
    And I will directing to page terms and condition
    And I click button agree with terms and condition
    And I will directing to page privacy and policy 
    And I click button agree with privacy and policy
    And I will directing to page PDP
    And I checked the 2 mandatory PDP checklists
    And I click button 'createAccountPDP'
    And I verifying my phone number by entering the code sent to me
    And I verifying my email by login by user id
    Then my account should be created
    And I click later in pop up biometric

    @coba
    Scenario: Login with registered account
    Given I am a registered customer with following details:
      | userIDstg   | yahydfc3  |
      | passwordStg | 1234Test  |
    When I filling in form login with the following details:
      | userIDstg   | yahydfc3  |
      | passwordStg | 1234Test  |
    And I click login
    And I click later in pop up biometric
    # When I click later
    And I choose Giro Account
    Then I will see details info of giro account MSME
    And I will see details info of giro account Corporate
    And I choose Giro Account Corporate
    And I will directing to page legality business
    And I choose legality business type 'company'
    And I submit my legality type
    Then I will see bottom sheet NPWP Business
    And I fill NPWP business
    
    

#     @C131952
#     Scenario: User choose Giro Account
#         Given I am a customer want to open Giro Account
#         When I swipe to card Giro Account
#         And I see information and benefit of Giro Account
#         And I choose Giro Account
#         Then I will see details info of giro account MSME
#         And I will see details info of giro account Corporate
  
#   @casebusinesscode2
#   Scenario: Create account business with business code from invitation email
#     Given I am a customer lead wanting to register account business from invitation
#     And My company name is 'PT CV INTEGRATE SEBELAS'
#     When I choose menu registration
#     And I filling in my account business information with the following details:
#       | fullName        | Yahya Ha                     |
#       | email           | test_amar@yopmail.com        |
#       | mobileNumber    | 85156253226                  |
#       | password        | Akuntes1                     |
#       | confirmPassword | Akuntes1                     |
#     And I registering the account
#     And I verifying my phone number by entering the code sent to me
#     And I verifying my email by login by user id
#     Then my account business should be created