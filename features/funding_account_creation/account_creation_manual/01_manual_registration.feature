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

    Scenario: Try to register with business code after 24 hours
        Given I am a customer that has business code to register as invitee
        When after 24 hours
        And I register as partner
        Then I success create my user id with business code

    Scenario: Register after resend business code for each director with same email
        Given I am a customer that has list uncomplete register director more than one
        And their emails are same
        When I resend business code for each director
        And each partner receive business code in same email
        And they register account with the business code
        And they success register account with business code
        And each of them receive different user id

    Scenario: Register after resend business code for each director with different email
        Given I am a customer that has list uncomplete register director more than one
        And their emails are different
        When I resend business code for each director
        And each partner receive business code in their email
        And they register account with the business code
        And they success register account with business code
        And each of them receive different user id

    Scenario: Register invitee with business code from more than one company
        Given I am a customer that has invited by more than one company
        And I have different email business code from each company
        When I register with business code A from Company A
        And I will see pop up contain with phonenumber and company A
        And I complete the register
        And I success register and get the user id
        And I back again to menu registration
        And I try register without business code
        And I will see message error in field business code that notify me to register first with business code
        And I register with business code B from Company B
        And I will see pop up contain with phonenumber and company B
        And I complete the register
        And I success register and get the user id
        And I back again to menu registration
        And I try register without business code
        Then I will not see validation to register with business code again