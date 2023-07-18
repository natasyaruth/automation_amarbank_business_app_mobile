Feature: Account registration
  In order to open an SMB account
  As a customer lead
  I want to register for an account

  Scenario: Create a new account
    Given I am a customer lead wanting to open a new account
    When I am filling in my account information with the following details:
      | fullName        | John Doe           |
      | email           | john.doe@email.com |
      | mobileNumber    | 0400000000         |
      | password        | password           |
      | confirmPassword | password           |
    And registering the account
    And verifying my phone number by entering the code sent to me
    Then my account should be created

  Scenario: Create a new account with fullname contain with special char (.-,')
    Given I am a customer lead wanting to open a new account 
    When I am filling in my account information with the following details:
      | fullName        | John Doe S.Kom, M'Kom- |
      | email           | john.doe@email.com |
      | mobileNumber    | 0400000000         |
      | password        | password           |
      | confirmPassword | password           |
    And registering the account
    And verifying my phone number by entering the code sent to me
    Then my account should be created

  Scenario: Input fullname contain with special char other than (.-,')
    Given I am a customer lead wanting to open a new account 
    When I am filling field 'fullName' with 'John Doe#@!'
    Then I should see message error 'Nama lengkap tidak boleh mengandung angka dan spesial karakter kecuali (.,-)' in the below of field 'fullname'

  Scenario: Input fullname contain with number
    Given I am a customer lead wanting to open a new account 
    When I am filling field 'fullName' with '12345'
    Then I should see message error 'Nama lengkap tidak boleh mengandung angka dan spesial karakter kecuali (.,-)' in the below of field 'fullname'

  Scenario: Verifying phone number with invalid code
    Given I am a customer lead wanting to open a new account
    And had been registering the account with the following details:
      | fullName        | John Doe           |
      | email           | john.doe@email.com |
      | mobileNumber    | 0400000000         |
      | password        | password           |
      | confirmPassword | password           |
    And The verification code sent to me is '123456'
    When I am verifying my phone number with the code '213456'
    Then I should be notified that the code is invalid

