Feature: Manual Registering New Device
    In order to login to the new device
    As a customer
    I want to register my new device
    So that SMB app recognize my new device

    @C133930
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

    @C135662
    Scenario: Login to new device with condition account still login in old device
        Given I have two device A and B
        And device A in condition login with user id A
        When I try to register device B with user id A till success
        And I back to my old device
        Then I will see the app is auto logout

    @C133931
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

    @C133932
    Scenario: Login different account in same device and other user want to activated the biometric
        Given I have two Account A and B
        And one device with biometric already activated with account A
        And account B is registered with same device id
        When I try to login using account B with user id and password
        And I will direct to main dashboard
        And I will see pop up to activated biometric
        And I try to activated biometric
        And I input biometric
        Then I will see biometric is not recognize
        And I try to logout
        And I click login via biometric
        And I will see bottom sheet biometric still not activated yet
        And I can success login via user id and password

    @C133934
    Scenario: Register device with permission still not allowed yet
        Given I disallowed permission camera and location for SMB app via settings
        When I try to login using account and device still not registered yet
        And I continue to register my device
        And I continue to take selfie
        And I allowed permission camera
        And I allowed permission location
        Then I will direct to page take selfie picture 

    @C133935
    Scenario: Make sure selfie photo is not replaced in CRM after register new device
        Given I register new device using account active
        When I go to CRM
        And I go to menu CRM
        And I search my user id
        And I open detail customer
        Then I will see my picture selfie in KYC section is not replaced my selfie from register new device

    @C133936
    Scenario: Validate email success register new device
        Given I have user id with my device still not registered yet
        When I try to login
        And I register my device successfully
        Then I will receive notification email login with new device same as figma

    @C133937
    Scenario: Validate email failed register new device - first attempt
        Given I have user id with my device still not registered yet
        When I try to login
        And I register my device 
        And my face is not match at first attempt
        Then I will receive notification email that someone try to login with new device but failed

    @C133938
    Scenario: Validate email failed register new device - second attempt
        Given I have user id with my device still not registered yet
        When I try to login
        And I register my device 
        And my face is not match at first attempt
        And I will receive notification email that someone try to login with new device but failed
        And I try again with face still not match at second attempt
        Then I will receive notification email that someone try to login with new device but failed

    @C133939
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

    @C133940
    Scenario: Validate email user account blocked in agent side
        Given I try to register my device but failed
        And my account was blocked
        Then agent will receive notification email that my account is blocked

    @C137066
    Scenario: Login and register other device success after got blocking from my device
        Given I get blocked after failed to register my device id using device A
        When I try to login in device B
        And I will see bottom sheet to register new device id
        And I register new device success in device B
        And I try again to login in device A
        Then I will see bottom sheet blocked information

    @C137067
    Scenario: Login and register other device failed after got blocking from my device
        Given I get blocked after failed to register my device id using device A
        When I try to login in device B
        And I will see bottom sheet to register new device id
        And I register new device but failed till blocked in device B
        And I try again to login in device B
        Then I will see bottom sheet blocked information    
        And I try again to login in device A
        Then I will see bottom sheet blocked information    

    @C137070
    Scenario: Register in device that same with other user
        Given I have user id A with device A already registered
        When I try to register again using device A
        And I will get new user id B
        And there is no flag in data verification user id B in CRM
        And user id B is accepted from CRM
        And I try to login with user id A
        Then I will direct to main dashboard
        And I try to login with user id B
        Then I will direct to main dashboard