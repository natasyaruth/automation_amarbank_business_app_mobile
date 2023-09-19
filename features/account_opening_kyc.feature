Feature: Account Opening Onboarding
    In order to opening my Giro account in SMB
    As a customer
    I want to choose Giro Account and my legality business type

    Background: User has registered and login to dashboard
        Given I am a registered customer with following details:
            | userID   | rutha013 |
            | password | 1234Test |
        When I filling in form login with the following details:
            | userID   | rutha013 |
            | password | 1234Test |
        And I click login
        Then I will direct to dashboard