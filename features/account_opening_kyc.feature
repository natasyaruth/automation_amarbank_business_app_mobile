Feature: Account Opening KYC UD
    In order to opening my Giro account with legality business type UD in SMB
    As a customer
    I want to complete my KYC data

    Background: User choose legality business type UD
      Given I am a registered customer with following details:
            | userID   | ruthfe15 |
            | password | Test1234 |
      And I filling in form login with the following details:
            | userID   | ruthfe15 |
            | password | Test1234 |
      And I click login
      Then I will direct to dashboard
      And I choose Giro Account
      And I choose legality business type 'ud'
      And I submit my legality type
      Then I will directing to page capture eKTP with information 'Pembentukan rekening memerlukan foto eKTP pemilik bisnis'

    @test_ktp
    Scenario: Upload eKTP photo successfully
      Given I am a customer who has selected the business type UD
      When I continue to take eKTP photo
      And I capture my eKTP photo
      Then I will directing to page submit form KTP