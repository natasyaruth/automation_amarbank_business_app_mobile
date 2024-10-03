@topBarFeedback
Feature: Validate Feedback on Loan Program Selection Page
    In order to ensure the application provides an optimal user experience
    As a customer
    I allowed to give the feedback when I encounter confusion or difficulty in loan scheme page

    Background: User has registered and login to dashboard
        Given I am a registered customer with following details:
            | userID      | johnbf89 |
            | password    | 1234Test |
            | userIDstg   | stagda20 |
            | passwordStg | 1234Test |
        When I filling in form login with the following details:
            | userID      | johnbf89 |
            | password    | 1234Test |
            | userIDstg   | stagda20 |
            | passwordStg | 1234Test |
        And I click login
        And I click later in pop up biometric
        And I will directing to Hook 1 Onboarding Account Opening
        And I choose "Ajukan Limit Kredit"
        And I click the top bar feedback icon

    @C161789
    Scenario: Submit valid feedback on loan program selection page
        Given the user is on the loan program selection page
        When the user selects the feedback option "Loan options do not match my business needs"
        And the user enters a comment with fewer than 256 characters
        And the user submits the feedback
        Then the system should store the feedback and display a success message

    @C161790
    Scenario: Feedback submission without comment
        Given the user is on the loan program selection page
        When the user selects the feedback option "Need explanation about terms and conditions"
        And the user does not enter a comment
        Then the system should display an error message indicating that the comment box is mandatory