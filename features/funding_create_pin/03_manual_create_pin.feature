Scenario: User receive email and check email content
        Given I am a customer who wants to create PIN 
        When I choose other
        And I click create transcation pin
        And I input password
        And I submit my password
        And I input new PIN
        And I input confirmation new PIN
        Then I receive email for OTP and checking email content
        