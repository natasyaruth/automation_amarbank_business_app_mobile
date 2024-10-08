Feature: Account registration
  In order to open an SMB account
  As a customer lead
  I want to register for an account

    @C162103
    Scenario: Check email user ID with checklist PDP only required
        Given I am a customer that recently register to SMB app
        And I accept only the required PDP checklist
        When I receive the email
        And I check the email
        Then I will see email contain with my user id
        And contain with information I agree my personal is used by Amarbank
        And not aggree to receive new information from innovation product Amarbank

    @C162104
    Scenario: Check email user ID with checklist all option PDP
        Given I am a customer that recently register to SMB app
        And I accept all PDP checklist
        When I receive the email
        And I check the email
        Then I will see email contain with my user id
        And contain with information I agree my personal is used by Amarbank
        And I aggree to receive new information from innovation product Amarbank

    @C162105
    Scenario: Check email after login and submit PDP with checklist only required
        Given I am an existing customer of SMB app
        And I still not submit the PDP concern
        When I login
        And I accept to read the T&C
        And I aggree with PDP concern
        And I accept only the required PDP checklist
        And I receive the email
        And I check the email
        Then I will see email contain with information I agree my personal is used by Amarbank
        And not aggree to receive new information from innovation product Amarbank
        And the email is not contain with my user id

    @C162106
    Scenario: Check email after login and submit all PDP option
        Given I am an existing customer of SMB app
        And I still not submit the PDP concern
        When I login
        And I accept to read the T&C
        And I aggree with PDP concern
        And I accept all PDP checklist
        And I receive the email
        And I check the email
        Then I will see email contain with information I agree my personal is used by Amarbank
        And not aggree to receive new information from innovation product Amarbank
        And the email is not contain with my user id