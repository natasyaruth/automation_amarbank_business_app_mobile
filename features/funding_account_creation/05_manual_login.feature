Feature: Account login
    In order to go to SMB dashboard after registration
    As a customer lead
    I want to login with registered account

    Scenario: Login again after waiting 10 minutes temporary blocking
        Given I am a customer that was waiting 10 minutes temporary blocking login
        When I fill my user id and password
        And I click button login
        Then I will direct to dashboard