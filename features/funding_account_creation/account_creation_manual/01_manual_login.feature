Feature: Manual Account login
    In order to go to SMB dashboard after registration
    As a customer lead
    I want to login with registered account

    @C131560
    Scenario: Login again after waiting 10 minutes temporary blocking
        Given I am a customer that was waiting 10 minutes temporary blocking login
        When I fill my user id and password
        And I click button login
        Then I will direct to dashboard

    @C131561
    Scenario: Activated my biometric at first login
        Given I am a registered customer
        And already in page login
        When I fill user id and password
        And I click button login
        And I will see pop up suggest to activated login biometric
        And I click button activated now
        And I click toogle on biometric
        And I will see pop up information to touch the sensor area on my device
        And I put my finger in the sensor area on my device
        And I will see pop up biometric is success authenticated
        And I input password
        And I submit my password
        Then I will direct to page other with toogle is on
        And in paralel I got email my biometric login is successfully activated
        And I can login using my biometric

    @C131562
    Scenario: Activated my biometric after click later in pop up activated biometric
        Given I am a registered customer
        And already in page login
        When I fill user id and password
        And I click button login
        And I will see pop up suggest to activated login biometric
        And I click button later
        And I click tab other
        And I click toogle on biometric
        And I will see pop up information to touch the sensor area on my device
        And I put my finger in the sensor area on my device
        And I will see pop up biometric is success authenticated
        And I input password
        And I submit my password
        Then I will direct to page other with toogle is on
        And in paralel I got email my biometric login is successfully activated
        And I can login using my biometric

    @C131563
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

    @C131564
    Scenario: Login with incorrect biometric once
        Given I am a registered customer
        And already activated biometric
        And already in page login
        When I click button login using biometric
        And I will see pop up information to touch the sensor area on my device
        And I put my wrong finger in the sensor area on my device
        Then I will see pop up biometric is failed with information biometric is not recognize

    @C131565
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

    @C131566
    Scenario: Login with incorrect biometric many times
        Given I am a registered customer
        And already activated biometric
        And already in page login
        When I click button login using biometric
        And I will see pop up information to touch the sensor area on my device
        And I put wrong finger many times in the sensor area on my device
        Then I will see information from device too many attempts failed biometric 
        And I will see pop up biometric is failed with information need to login using user id and password
        And I click button understand
        And I will direct to page login

    @C131567
    Scenario: Login again using user id after incorrect biometric in many times
        Given I am a registered customer
        And was failed many times login using biometric
        When I fill user id and password
        And I click button login
        Then I will direct to main dashboard

    @C131568
    Scenario: Login again using biometric after incorrect biometric in many times
        Given I am a registered customer
        And was failed many times login using biometric
        When I click button login using biometric
        Then I will see pop up should login using user id and password

    @C131569
    Scenario: First login using biometric and second using user id password
        Given I am a registered customer
        And was login using biometric before
        When I click tab other
        And I click logout
        And I fill user id and password
        And I click button login
        Then I will direct to main dashboard

    @C131849
    Scenario: Activated my biometric with existing account active
        Given I am a registered customer
        And have existing account
        And already in page login
        When I fill user id and password
        And I click button login
        And I will see pop up suggest to activated login biometric
        And I click button activated now
        And I click toogle on biometric
        And I will see pop up information to touch the sensor area on my device
        And I put my finger in the sensor area on my device
        And I will see pop up biometric is success authenticated
        And I input password
        And I submit my password
        Then I will direct to page other with toogle is on
        And in paralel I got email my biometric login is successfully activated
        And I can login using my biometric

    @C131850
    Scenario: Deactivated my biometric
        Given I am a registered customer
        And my biometric was activated before
        And already in main dashboard
        When I click tab other
        And I click toogle off biometric
        And I input password
        And I submit my password
        Then I will direct to page other with toogle is off
        And in paralel I got email my biometric login is successfully deactivated
        And I logout from app
        And I click button login via biometric
        Then I should see bottom sheet that biometric still not activated yet
        And I close bottom sheet biometric 

    @C141150
    Scenario: Activated biometric app using incorrect biometric
        Given I am a registered customer
        And had activated biometric in device
        And already in main dashboard
        When I click tab other
        And I click toogle on biometric 
        And I will see pop up information to touch the sensor area on my device
        And I put my wrong finger in the sensor area on my device
        Then I will see pop up biometric is failed with information biometric is not recognize

    @C141151
    Scenario: Login with incorrect biometric twice
        Given I am a registered customer
        And had activated biometric in device
        And already in main dashboard
        When I click tab other
        And I click toogle on biometric 
        And I will see pop up information to touch the sensor area on my device
        And I put wrong finger in the sensor area on my device
        And I will see pop up biometric is failed with information biometric is not recognize
        And I try again with wrong finger
        And I will see pop up biometric is failed with information biometric is not recognize

    @C141152
    Scenario: Login with incorrect biometric many times
        Given I am a registered customer
        And had activated biometric in device
        And already in main dashboard
        When I click tab other
        And I click toogle on biometric 
        And I will see pop up information to touch the sensor area on my device
        And I put wrong finger many times in the sensor area on my device
        Then I will see information from device too many attempts failed biometric 
        And I will see pop up biometric is failed with information need to login using user id and password
        And I click button understand
        And I will direct to page login     