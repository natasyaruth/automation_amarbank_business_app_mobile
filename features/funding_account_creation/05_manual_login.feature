Feature: Account login
    In order to go to SMB dashboard after registration
    As a customer lead
    I want to login with registered account

    Scenario: Login again after waiting 10 minutes temporary blocking
        Given I am a customer that was waiting 10 minutes temporary blocking login
        When I fill my user id and password
        And I click button login
        Then I will direct to dashboard

    Scenario: Activated my biometric at first login
        Given I am a registered customer
        And already in page login
        When I fill user id and password
        And I click button login
        And I will see pop up suggest to activated login biometric
        And I click button activated now
        And I click toogle on biometric
        And I input password
        And I submit my password
        Then I will direct to page other with toogle is on
        And in paralel I got email my biometric login is successfully activated
        And I can login using my biometric

    Scenario: Activated my biometric after click later in pop up activated biometric
        Given I am a registered customer
        And already in page login
        When I fill user id and password
        And I click button login
        And I will see pop up suggest to activated login biometric
        And I click button later
        And I click tab other
        And I click toogle on biometric
        And I input password
        And I submit my password
        Then I will direct to page other with toogle is on
        And in paralel I got email my biometric login is successfully activated
        And I can login using my biometric

    Scenario: Login using biometric
        Given I am a registered customer
        And already activated biometric
        And already in page login
        When I click button login using biometric
        And I will see pop up information to touch the sensor area on my device
        And I put my finger in the sensor area on my device
        Then I will see pop up biometric is success authenticated
        And I will see loading icon
        And I will direct to main dashboard

    Scenario: Login with incorrect biometric once
        Given I am a registered customer
        And already activated biometric
        And already in page login
        When I click button login using biometric
        And I will see pop up information to touch the sensor area on my device
        And I put my wrong finger in the sensor area on my device
        Then I will see pop up biometric is failed with information biometric is not recognize

    Scenario: Login with incorrect biometric twice
        Given I am a registered customer
        And already activated biometric
        And already in page login
        When I click button login using biometric
        And I will see pop up information to touch the sensor area on my device
        And I put wrong finger in the sensor area on my device
        And I will see pop up biometric is failed with information biometric is not recognize
        And I try again with wrong finger
        And I will see pop up biometric is failed with information biometric is not recognize

    Scenario: Login with incorrect biometric three times
        Given I am a registered customer
        And already activated biometric
        And already in page login
        When I click button login using biometric
        And I will see pop up information to touch the sensor area on my device
        And I put wrong finger in the sensor area on my device
        And I will see pop up biometric is failed with information biometric is not recognize
        And I try again with wrong finger
        And I will see pop up biometric is failed with information biometric is not recognize
        And I try again with wrong finger
        Then I will see pop up biometric is failed with information need to login using user id and password
        And I click button understand
        And I will direct to page login

    Scenario: Login again using user id after incorrect biometric three times
        Given I am a registered customer
        And was failed three times login using biometric
        When I fill user id and password
        And I click button login
        Then I will direct to main dashboard

    Scenario: Login again using biometric after incorrect biometric three times
        Given I am a registered customer
        And was failed three times login using biometric
        When I click button login using biometric
        And I click button login
        Then I will direct to main dashboard

    Scenario: First login using biometric and second using user id password
        Given I am a registered customer
        And was login using biometric before
        When I click tab other
        And I click logout
        And I fill user id and password
        And I click button login
        Then I will direct to main dashboard