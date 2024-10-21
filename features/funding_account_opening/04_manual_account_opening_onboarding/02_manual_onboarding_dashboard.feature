Feature: Manual Account Opening Main Dashboard
    In order to opening my Giro account in SMB
    As a customer
    I can see my latest information in main dashboard

    Scenario: Check state button resend business code and change email after director continue the KYC
        Given I am customer with list uncomplete register director
        When I register director till KYC upload eKTP
        And I login again as initiator
        And I open widget list director in main dashboard
        Then I see progress registration 1/4
        And button resend business code and change email is not there anymore

    Scenario: Resend business code with journey from combine journey
        Given I am customer that register from combine journey
        And I have added all my partner
        When I open widget list director in main dashboard
        And I click resend business code
        And I confirm resend business code
        Then I see snackbar success resend business code
        And partner get new email contain with business code to register as part of our director

    Scenario: Check email invitee from add invitee
        Given I am a customer that recently add my partner as our directors
        When My partner receive email
        Then they will receive business code to register as part of our director

    Scenario: Check email invitee from resend business code
        Given I am customer with list uncomplete register director
        When I open widget list director in main dashboard
        And I click resend business code
        And I confirm resend business code
        Then I see snackbar success resend business code
        And partner get new email contain with business code to register as part of our director

    Scenario: Check email invitee from change email invitee with same email
        Given I am customer with list uncomplete register director
        When I open widget list director in main dashboard
        And I click change email invitee
        And I see my email
        And I submit my email
        And I confirm to save and resend business code
        Then I see snackbar success save email and resend business code
        And partner will receive business code in their old email

    Scenario: Check email invitee from change email invitee with different email
        Given I am customer with list uncomplete register director
        When I open widget list director in main dashboard
        And I click change email invitee
        And I see my email
        And I input new email invitee
        And I submit my email
        And I confirm to save and resend business code
        Then I see snackbar success save email and resend business code
        And partner will receive business code only in newly updated email

    Scenario: Check email invitee from resend business code and change email invitee with same email
        Given I am customer with list uncomplete register director
        When I open widget list director in main dashboard
        And I click resend business code
        And I confirm resend business code
        And I see snackbar success resend business code
        And I click change email invitee
        And I see my email
        And I submit my email
        And I confirm to save and resend business code
        Then I see snackbar success save email and resend business code
        And partner will receive two email invited with same business code

    Scenario: Check email invitee from resend business code and change email invitee with different email
        Given I am customer with list uncomplete register director
        When I open widget list director in main dashboard
        And I click resend business code
        And I confirm resend business code
        And I see snackbar success resend business code
        And I click change email invitee
        And I see my email
        And I input new email invitee
        And I submit my email
        And I confirm to save and resend business code
        Then I see snackbar success save email and resend business code
        And partner will receive email invited in both old email and new email with same business code

    Scenario: Resend business code after 24 hours
        Given I am a customer recently resend business code
        When after 24 hours
        And I open widget list director in main dashboard
        Then I will see button resend business code and change email invitee

    Scenario: Change email invitee after 24 hours
        Given I am a customer recently change email partner
        When after 24 hours
        And I open widget list director in main dashboard
        Then I will see button resend business code and change email invitee