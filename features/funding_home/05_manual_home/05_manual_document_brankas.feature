Feature: Document Brankas
    In order to open and manage my Document
    As a Customer
    I want to see and secure my document business and loan

    Scenario: Check condition widget document safe in main dashboard if user need complete document and registration business partner
        Given I login using account with status need complete document and registration business partner
        When I already in main dashboard
        And I scroll to the end of screen
        Then I will see the widget document safe is not overwrite other widget in main dashboard

    Scenario: Check condition widget document safe in main dashboard if user has loan and account active
        Given I login using account with status active and has loan
        When I already in main dashboard
        And I scroll to the end of screen
        Then I will see the widget document safe is not overwrite other widget in main dashboard

    Scenario: Check condition widget document safe in main dashboard if account is active and has transaction maker approver
        Given I login using account with status account is active and has transaction maker approver
        When I already in main dashboard
        And I scroll to the end of screen
        Then I will see the widget document safe is not overwrite other widget in main dashboard