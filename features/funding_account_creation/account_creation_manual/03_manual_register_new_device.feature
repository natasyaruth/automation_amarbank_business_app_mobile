Feature: Manual Registering New Device
    In order to login to the new device
    As a customer
    I want to register my new device
    So that SMB app recognize my new device

    Scenario: Login same account with different device using biometric and condition both devices already activated the biometric
        Given I have two device A and B
        And both device already activated login biometric and same account
        When I click login via biometric in device B
        And I will see pop up information to touch the sensor area on my device
        And I put my finger in the sensor area on my device
        And I will see pop up biometric is success authenticated
        And I will see loading icon
        And I will see bottom sheet to register new device id
        And I register my new device
        And I can login again without register again the device id
        And I click login via biometric in device A
        And I will see pop up information to touch the sensor area on my device
        And I put my finger in the sensor area on my device
        And I will see pop up biometric is success authenticated
        And I will see loading icon
        Then I will see bottom sheet to register new device id

    Scenario: Login same account with different device using user id password
        Given I have two device A and B
        When I try to login using user id and password in device B
        And I will see loading icon
        And I will see bottom sheet to register new device id
        And I register my new device
        And I can login again without register again the device id
        And I try to login using user id and password in device A
        And I will see loading icon
        Then I will see bottom sheet to register new device id
        And I register my new device
        And I can login again without register again the device id


    Scenario: Login different account with same device using biometric and condition devices already activated the biometric
        Given I have two Account A and B
        And one device with biometric already activated with account B
        When I try to login using account A via biometric
        And I will see bottom sheet biometric still not activated
        And I try to login using account A via user id and password
        And I will see loading icon
        Then I will see bottom sheet to register new device id
        And I try to login using account B via biometric
        And I will see bottom sheet biometric still not activated
        And I try to login using account B via user id and password
        And I will see loading icon
        Then I will see bottom sheet to register new device id

    Scenario: Login different account with same device using user id password
        Given I have two Account A and B
        And one device with biometric still not activated
        When I try to login using account A via user id and password
        And I will see loading icon
        And I will see bottom sheet to register new device id
        And I try to login using account B via user id and password
        And I will see loading icon
        Then I will see bottom sheet to register new device id

    Scenario: Register device with permission still not allowed yet
        Given I disallowed permission camera and location for SMB app via settings
        When I try to login using account and device still not registered yet
        And I continue to register my device
        And I continue to take selfie
        And I allowed permission camera
        And I allowed permission location
        Then I will direct to page take selfie picture 

    Scenario: Make sure selfie photo is not replaced in CRM after register new device
        Given I register new device using account active
        When I go to CRM
        And I go to menu CRM
        And I search my user id
        And I open detail customer
        Then I will see my picture selfie in KYC section is not replaced my selfie from register new device

    Scenario: Validate email success register new device
        Given I have user id with my device still not registered yet
        When I try to login
        And I register my device successfully
        Then I will receive notification email login with new device same as figma

    Scenario: Validate email failed register new device - first attempt
        Given I have user id with my device still not registered yet
        When I try to login
        And I register my device 
        And my face is not match at first attempt
        Then I will receive notification email that someone try to login with new device but failed

    Scenario: Validate email failed register new device - second attempt
        Given I have user id with my device still not registered yet
        When I try to login
        And I register my device 
        And my face is not match at first attempt
        And I will receive notification email that someone try to login with new device but failed
        And I try again with face still not match at second attempt
        Then I will receive notification email that someone try to login with new device but failed

    Scenario: Validate email failed register new device - third attempt (account blocked)
        Given I have user id with my device still not registered yet
        When I try to login
        And I register my device 
        And my face is not match at first attempt
        And I will receive notification email that someone try to login with new device but failed
        And I try again with face still not match at second attempt
        And I will receive notification email that someone try to login with new device but failed
        And I try again with face still not match at third attempt
        Then I will receive notification email that my account is blocked

    Scenario: Validate email user account blocked in agent side
        Given I try to register my device but failed
        And my account was blocked
        Then agent will receive notification email that my account is blocked