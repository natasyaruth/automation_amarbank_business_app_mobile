Feature: Manual Account login
    In order to go to SMB dashboard after registration
    As a customer lead
    I want to login with registered account

    @C165990
    Scenario: Login again after waiting 10 minutes temporary blocking
        Given I am a customer that was waiting 10 minutes temporary blocking login
        When I fill my user id and password
        And I click button login
        Then I will direct to dashboard

    @C165991
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

    @C165992
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

    @C165993
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

    @C165994
    Scenario: Login with incorrect biometric once
        Given I am a registered customer
        And already activated biometric
        And already in page login
        When I click button login using biometric
        And I will see pop up information to touch the sensor area on my device
        And I put my wrong finger in the sensor area on my device
        Then I will see pop up biometric is failed with information biometric is not recognize

    @C165995
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

    @C165996
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

    @C165997
    Scenario: Login again using user id after incorrect biometric in many times
        Given I am a registered customer
        And was failed many times login using biometric
        When I fill user id and password
        And I click button login
        Then I will direct to main dashboard

    @C165998
    Scenario: Login again using biometric after incorrect biometric in many times
        Given I am a registered customer
        And was failed many times login using biometric
        When I click button login using biometric
        Then I will see pop up should login using user id and password

    @C165999
    Scenario: First login using biometric and second using user id password
        Given I am a registered customer
        And was login using biometric before
        When I click tab other
        And I click logout
        And I fill user id and password
        And I click button login
        Then I will direct to main dashboard

    @C166000
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

    @C166001
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

    @C166002
    Scenario: Activated biometric app using incorrect biometric
        Given I am a registered customer
        And had activated biometric in device
        And already in main dashboard
        When I click tab other
        And I click toogle on biometric 
        And I will see pop up information to touch the sensor area on my device
        And I put my wrong finger in the sensor area on my device
        Then I will see pop up biometric is failed with information biometric is not recognize

    @C166003
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

    @C166004
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

    @C166005 
    Scenario: Login account by email
        Given I am a user want login by email
        When I do process register 
        And I input otp code
        And I got email notification 
        And I open the email
        And I click button "Masuk Akun" on email
        Then I directly to app on login page
        And User ID will automatically fill on field user ID
        And I can login by email
        And I direct to dashboard

    @C166006
    Scenario: Validate email content
        Given I am a user want login by email
        When I do process register 
        And I input otp code
        Then I got email notification
        And I validate email content according to figma 

    @C174861
    Scenario: Login with biometric after change password with account active initiator
        Given I am a registered customer with account active initiator
        And already activated biometric
        And already in page other
        And I click menu change password
        And I click next to input new password
        And I input new password
        And I input confirm new password
        And I confirm my new password
        And I will see snackbar OTP successfully sent
        And I input OTP change password
        And I will direct to page success change password
        And I click button direct to page login
        When I click button login using biometric
        Then I will see pop up information that login with biometric not active

    @C174862
    Scenario: Login with biometric after forgot password with account active initiator
        Given I am a registered customer with account active initiator
        And already activated biometric
        And I am a customer want to reset password
        And I am filling field User ID
        And I input email for reset password
        And I click button Reset Password
        And I should be notified that email Reset Password successfully sent
        And I click reset password link in email
        And I input new password
        And I input confirm new password
        And I click reset password
        And I will direct to page reset password successful changes
        And I can click button direct to login
        When I click button login using biometric
        Then I will see pop up information that login with biometric not active
    
    @C174863
    Scenario: Login with biometric after change password with account active partner
        Given I am a registered customer with account active partner
        And already activated biometric
        And already in page other
        And I click menu change password
        And I click next to input new password
        And I input new password
        And I input confirm new password
        And I confirm my new password
        And I will see snackbar OTP successfully sent
        And I input OTP change password
        And I will direct to page success change password
        And I click button direct to page login
        When I click button login using biometric
        Then I will see pop up information that login with biometric not active

    @@C174864
    Scenario: Login with biometric after forgot password with account active partner
        Given I am a registered customer with account active partner
        And already activated biometric
        And I am a customer want to reset password
        And I am filling field User ID
        And I input email for reset password
        And I click button Reset Password
        And I should be notified that email Reset Password successfully sent
        And I click reset password link in email
        And I input new password
        And I input confirm new password
        And I click reset password
        And I will direct to page reset password successful changes
        And I can click button direct to login
        When I click button login using biometric
        Then I will see pop up information that login with biometric not active

    @C174865
    Scenario: Login with biometric after change password with account status is not opening
        Given I am a registered customer with account status is not opening
        And already activated biometric
        And already in page other
        And I click menu change password
        And I click next to input new password
        And I input new password
        And I input confirm new password
        And I confirm my new password
        And I will see snackbar OTP successfully sent
        And I input OTP change password
        And I will direct to page success change password
        And I click button direct to page login
        When I click button login using biometric
        Then I will see pop up information that login with biometric not active

    @C174866
    Scenario: Login with biometric after forgot password with account status is not opening
        Given I am a registered customer with account status is not opening
        And already activated biometric
        And I am a customer want to reset password
        And I am filling field User ID
        And I input email for reset password
        And I click button Reset Password
        And I should be notified that email Reset Password successfully sent
        And I click reset password link in email
        And I input new password
        And I input confirm new password
        And I click reset password
        And I will direct to page reset password successful changes
        And I can click button direct to login
        When I click button login using biometric
        Then I will see pop up information that login with biometric not active

    @C174867
    Scenario: Login with biometric after change password with account status wating verification on CRM
        Given I am a registered customer with account status wating verification on CRM
        And already activated biometric
        And already in page other
        And I click menu change password
        And I click next to input new password
        And I input new password
        And I input confirm new password
        And I confirm my new password
        And I will see snackbar OTP successfully sent
        And I input OTP change password
        And I will direct to page success change password
        And I click button direct to page login
        When I click button login using biometric
        Then I will see pop up information that login with biometric not active

    @C174868
    Scenario: Login with biometric after forgot password with account status wating verification on CRM
        Given I am a registered customer with account status wating verification on CRM
        And already activated biometric
        And I am a customer want to reset password
        And I am filling field User ID
        And I input email for reset password
        And I click button Reset Password
        And I should be notified that email Reset Password successfully sent
        And I click reset password link in email
        And I input new password
        And I input confirm new password
        And I click reset password
        And I will direct to page reset password successful changes
        And I can click button direct to login
        When I click button login using biometric
        Then I will see pop up information that login with biometric not active