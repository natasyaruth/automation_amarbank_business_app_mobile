@topBarFeedback
Feature: Validate Feedback on Disbursement Page
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

    @C161795
    Scenario: Submit feedback on disbursement rejection
        Given the user is on the disbursement page
        When the user selects the feedback option "Disbursement rejected"
        And the user enters a comment explaining the issue
        And the user submits the feedback
        Then the system should store the feedback and display a success message

    @C161796
    Scenario: Submit feedback without providing a comment
        Given the user is on the disbursement page
        When the user selects the feedback option "Disbursement process took too long"
        And the user does not enter a comment
        Then the system should display an error message indicating that the comment is mandatory