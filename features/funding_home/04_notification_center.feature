Feature: Home - Notification Center
    In order user to get notified
    As a Customer
    I want to see all notification from SMB App in Main dashboard

    @C160816
    Scenario: Close page notification center
        Given I am a registered customer with following details:
            | userID      | autocaea |
            | password    | 1234Test |
            | userIDstg   | staga29c |
            | passwordStg | 1234Test |
        And has been filled survey rating account opening    
        And I filling in form login with the following details:
            | userID      | autocaea |
            | password    | 1234Test |
            | userIDstg   | staga29c |
            | passwordStg | 1234Test |
        And I click login
        And I click later in pop up biometric
        When I click notification center
        And I will direct to page notification center
        And I close page notification center
        Then I will see card account 'active'  

    @C160817
    Scenario: Back to page notification center from back in header page
        Given I am a registered customer with following details:
            | userID      | autocaea |
            | password    | 1234Test |
            | userIDstg   | staga29c |
            | passwordStg | 1234Test |
        And has been filled survey rating account opening    
        And I filling in form login with the following details:
            | userID      | autocaea |
            | password    | 1234Test |
            | userIDstg   | staga29c |
            | passwordStg | 1234Test |
        And I click login
        And I click later in pop up biometric
        When I click notification center
        And I click bucketlist notification info
        And I click back in header page
        Then I will direct to page notification center

    @C160818
    Scenario: Validate page notification center with notification still empty
        Given I am a registered customer with following details:
            | userID      | autocaea |
            | password    | 1234Test |
            | userIDstg   | staga29c |
            | passwordStg | 1234Test |
        And has been filled survey rating account opening    
        And I filling in form login with the following details:
            | userID      | autocaea |
            | password    | 1234Test |
            | userIDstg   | staga29c |
            | passwordStg | 1234Test |
        And I click login
        And I click later in pop up biometric
        And I don't see red dot notification center
        When I click notification center
        Then I will see notification is empty
        And I click tab Info notification
        And I will see notification is empty
        And I click tab Transaction notification
        And I will see notification is empty
        And I click tab Loan notification
        And I will see notification is empty
        And I click tab All notification
        And I will see notification is empty

    @C160819
    Scenario: Checking Detail notification app in maintenance
        Given I am a registered customer with following details:
            | userID      | autocaea |
            | password    | 1234Test |
            | userIDstg   | staga29c |
            | passwordStg | 1234Test |
        And has been filled survey rating account opening
        And I only have '1' notification 'Maintenance App' in notification center
        And I filling in form login with the following details:
            | userID      | autocaea |
            | password    | 1234Test |
            | userIDstg   | staga29c |
            | passwordStg | 1234Test |
        And I click login
        And I click later in pop up biometric
        And I will see card account 'active'
        And I see red dot notification center
        When I click notification center
        Then I see notification Maintenance App Temporary
        And I click bucketlist notification info
        And I will direct to detail Maintenance App Temporary
        And I click understand the notification
        And I will direct to page notification center

    @C160820
    Scenario: Checking Detail notification PIN successfully change
        Given I am a registered customer with following details:
            | userID      | autocaea |
            | password    | 1234Test |
            | userIDstg   | staga29c |
            | passwordStg | 1234Test |
        And has been filled survey rating account opening
        And don’t have any notification
        And I filling in form login with the following details:
            | userID      | autocaea |
            | password    | 1234Test |
            | userIDstg   | staga29c |
            | passwordStg | 1234Test |
        And I click login
        And I click later in pop up biometric
        And I will see card account 'active'
        When I click tab other
        And I click change transaction pin
        And I input old PIN with "111111"
        And I input new PIN with "123456"
        And I input confirmation new PIN
        And I input OTP
        And I will direct to page PIN has been successfully changes
        And I click understand
        And I will see card account 'active'
        And I see red dot notification center
        And I click notification center
        Then I see notification PIN successfully changes
        And I click bucketlist notification info
        And I will direct to detail notification PIN successfully changes
        And I click understand the notification
        And I will direct to page notification center
        And I reset back my PIN Transaction

    @C160821
    Scenario: Checking Detail notification password successfully change
        Given I am a registered customer with following details:
            | userID      | autocaea |
            | password    | 1234Test |
            | userIDstg   | staga29c |
            | passwordStg | 1234Test |
        And has been filled survey rating account opening
        And don’t have any notification
        And I filling in form login with the following details:
            | userID      | autocaea |
            | password    | 1234Test |
            | userIDstg   | staga29c |
            | passwordStg | 1234Test |
        And I click login
        And I click later in pop up biometric
        And I will see card account 'active'
        When I click tab other
        And I click menu change password
        And I input my old password
        And I click next to input new password
        And I input field 'newPassword' with value 'Test1234'
        And I input field 'confirmPassword' with value 'Test1234'
        And I confirm my new password
        And I will see snackbar OTP successfully sent
        And I input OTP change password
        And I will direct to page success change password
        And I click button direct to page login
        And I login again with my new password
        And I see red dot notification center
        And I click notification center
        Then I see notification password successfully changes
        And I click bucketlist notification info
        And I will direct to detail password successfully changes
        And I click understand the notification
        And I will direct to page notification center
        And I reset back my password

    @C160822
    Scenario: Checking Detail notification Transfer In Overbook
        Given I am a registered customer with following details:
            | userID      | natace13 |
            | password    | 1234Test |
            | userIDstg   | ruth1600 |
            | passwordStg | 1234Test |    
        And has been filled survey rating account opening
        And don’t have any notification
        And has friendlist with following details:
            | userID      | ruth6a44 |
            | password    | 1234Test |
            | userIDstg   | stag4cce |
            | passwordStg | 1234Test |
        And I filling in form login with the following details:
            | userID      | natace13 |
            | password    | 1234Test |
            | userIDstg   | ruth1600 |
            | passwordStg | 1234Test |
        And I click login
        And I click later in pop up biometric
        And I will see card account 'active'
        When I choose menu Transfer from main dashboard
        And I input name 'RUTH BISNIS A' from the search box 
        And I choose the friendlist
        And I input amount '50000'
        And I choose category "Pembayaran"
        And I submit to next flow
        And I click transfer now
        And I input PIN '111111'
        And I successfully transferred
        And I close page detail transfer
        And I will see card account 'active'
        And I choose other
        And I click logout
        And I login with account friendlist
        And I click later in pop up biometric
        And I see red dot notification center
        And I click notification center
        And I click tab Transaction notification
        Then I see notification transfer in successfully
        And I click bucketlist notification transaction
        And I will direct to detail transfer in successfully
        And I click understand the notification
        And I will direct to page notification center

    @C160823
    Scenario: Checking Detail notification Transfer Out BIFAST
        Given I am a registered customer with following details:
            | userID      | natace13 |
            | password    | 1234Test |
            | userIDstg   | ruth1600 |
            | passwordStg | 1234Test |    
        And has been filled survey rating account opening
        And don’t have any notification
        And I filling in form login with the following details:
            | userID      | natace13 |
            | password    | 1234Test |
            | userIDstg   | ruth1600 |
            | passwordStg | 1234Test |
        And I click login
        And I click later in pop up biometric
        And I will see card account 'active'
        When I choose menu Transfer from main dashboard
        And I input name 'Surya Edwin' from the search box
        And I choose the friendlist
        And I input amount '10000'
        And I choose category 'Pembayaran'
        And I click choose bank transfer service
        And I choose transfer service BIFAST
        And I click transfer
        And I click transfer now
        And I input PIN '111111'
        And I successfully transferred
        And I close page detail transfer
        And I will see card account 'active'
        And I see red dot notification center
        And I click notification center
        And I click tab Transaction notification
        Then I see notification transfer out successfully
        And I click bucketlist notification transaction
        And I will direct to detail transfer out successfully
        And I click understand the notification
        And I will direct to page notification center

    @C160824
    Scenario: Checking Detail notification Transfer Out RTOL
        Given I am a registered customer with following details:
            | userID      | natace13 |
            | password    | 1234Test |
            | userIDstg   | ruth1600 |
            | passwordStg | 1234Test |    
        And has been filled survey rating account opening
        And don’t have any notification
        And I filling in form login with the following details:
            | userID      | natace13 |
            | password    | 1234Test |
            | userIDstg   | ruth1600 |
            | passwordStg | 1234Test |
        And I click login
        And I click later in pop up biometric
        And I will see card account 'active'
        When I choose menu Transfer from main dashboard
        And I input name 'Surya Edwin' from the search box
        And I choose the friendlist
        And I input amount '20000'
        And I choose category 'Pembayaran'
        And I click choose bank transfer service
        And I choose transfer service RTOL
        And I click transfer
        And I click transfer now
        And I input PIN '111111'
        And I successfully transferred
        And I close page detail transfer
        And I will see card account 'active'
        And I see red dot notification center
        And I click notification center
        And I click tab Transaction notification
        Then I see notification transfer out successfully
        And I click bucketlist notification transaction
        And I will direct to detail transfer out successfully
        And I click understand the notification
        And I will direct to page notification center

    @C160825
    Scenario: Checking Detail notification Transfer Out SKN
        Given I am a registered customer with following details:
            | userID      | natace13 |
            | password    | 1234Test |
            | userIDstg   | ruth1600 |
            | passwordStg | 1234Test |    
        And has been filled survey rating account opening
        And don’t have any notification
        And I filling in form login with the following details:
            | userID      | natace13 |
            | password    | 1234Test |
            | userIDstg   | ruth1600 |
            | passwordStg | 1234Test |
        And I click login
        And I click later in pop up biometric
        And I will see card account 'active'
        When I choose menu Transfer from main dashboard
        And I input name 'Surya Edwin' from the search box
        And I choose the friendlist
        And I input amount '50000'
        And I choose category 'Pembayaran'
        And I click choose bank transfer service
        And I choose transfer service SKN
        And I click transfer
        And I click transfer now
        And I input PIN '111111'
        And I successfully transferred
        And I close page detail transfer
        And I will see card account 'active'
        And I see red dot notification center
        And I click notification center
        And I click tab Transaction notification
        Then I see notification transfer out successfully
        And I click bucketlist notification transaction
        And I will direct to detail transfer out successfully
        And I click understand the notification
        And I will direct to page notification center

    @C160826
    Scenario: Checking Detail notification Transfer Out RTGS
        Given I am a registered customer with following details:
            | userID      | natace13 |
            | password    | 1234Test |
            | userIDstg   | ruth1600 |
            | passwordStg | 1234Test |    
        And has been filled survey rating account opening
        And don’t have any notification
        And I filling in form login with the following details:
            | userID      | natace13 |
            | password    | 1234Test |
            | userIDstg   | ruth1600 |
            | passwordStg | 1234Test |
        And I click login
        And I click later in pop up biometric
        And I will see card account 'active'
        When I choose menu Transfer from main dashboard
        And I input name 'Surya Edwin' from the search box
        And I choose the friendlist
        And I input amount '110000000'
        And I choose category 'Pembayaran'
        And I click choose bank transfer service
        And I choose transfer service RTGS
        And I click transfer
        And I click transfer now
        And I input PIN '111111'
        And I successfully transferred
        And I close page detail transfer
        And I will see card account 'active'
        And I see red dot notification center
        And I click notification center
        And I click tab Transaction notification
        Then I see notification transfer out successfully
        And I click bucketlist notification transaction
        And I will direct to detail transfer out successfully
        And I click understand the notification
        And I will direct to page notification center

    @C160827
    Scenario: Checking Detail notification Transfer Out Overbook
        Given I am a registered customer with following details:
            | userID      | natace13 |
            | password    | 1234Test |
            | userIDstg   | ruth1600 |
            | passwordStg | 1234Test |    
        And has been filled survey rating account opening
        And don’t have any notification
        And I filling in form login with the following details:
            | userID      | natace13 |
            | password    | 1234Test |
            | userIDstg   | ruth1600 |
            | passwordStg | 1234Test |
        And I click login
        And I click later in pop up biometric
        And I will see card account 'active'
        When I choose menu Transfer from main dashboard
        And I input name 'RUTH BISNIS A' from the search box 
        And I choose the friendlist
        And I input amount '50000'
        And I choose category "Pembayaran"
        And I submit to next flow
        And I click transfer now
        And I input PIN '111111'
        And I successfully transferred
        And I close page detail transfer
        And I will see card account 'active'
        And I see red dot notification center
        And I click notification center
        And I click tab Transaction notification
        Then I see notification transfer out successfully
        And I click bucketlist notification transaction
        And I will direct to detail transfer out successfully
        And I click understand the notification
        And I will direct to page notification center

    @C160828
    Scenario: Checking Detail notification Transfer Out to account Individual
        Given I am a registered customer with following details:
            | userID      | natace13 |
            | password    | 1234Test |
            | userIDstg   | ruth1600 |
            | passwordStg | 1234Test |    
        And has been filled survey rating account opening
        And don’t have any notification
        And I filling in form login with the following details:
            | userID      | natace13 |
            | password    | 1234Test |
            | userIDstg   | ruth1600 |
            | passwordStg | 1234Test |
        And I click login
        And I click later in pop up biometric
        And I will see card account 'active'
        When I choose menu Transfer from main dashboard
        And I input name 'RUTH NATASYA' from the search box 
        And I choose the friendlist
        And I input amount '50000'
        And I choose category "Pembayaran"
        And I submit to next flow
        And I click transfer now
        And I input PIN '111111'
        And I successfully transferred
        And I close page detail transfer
        And I will see card account 'active'
        And I see red dot notification center
        And I click notification center
        And I click tab Transaction notification
        Then I see notification transfer out successfully
        And I click bucketlist notification transaction
        And I will direct to detail transfer out successfully
        And I click understand the notification
        And I will direct to page notification center

    @C160829
    Scenario: Checking ordering list notification center
        Given I am a registered customer with following details:
            | userID      | natace13 |
            | password    | 1234Test |
            | userIDstg   | ruth1600 |
            | passwordStg | 1234Test |    
        And has been filled survey rating account opening
        And has notification in notification center
        And I filling in form login with the following details:
            | userID      | natace13 |
            | password    | 1234Test |
            | userIDstg   | ruth1600 |
            | passwordStg | 1234Test |
        And I click login
        And I click later in pop up biometric
        And I will see card account 'active'
        When I click notification center
        And I will direct to page notification center
        Then I will see notification is sorted by the latest to oldest

    @C160830
    Scenario: Categorize notification center based on Info
        Given I am a registered customer with following details:
            | userID      | natace13 |
            | password    | 1234Test |
            | userIDstg   | ruth1600 |
            | passwordStg | 1234Test |    
        And has been filled survey rating account opening
        And has notification in notification center
        And I filling in form login with the following details:
            | userID      | natace13 |
            | password    | 1234Test |
            | userIDstg   | ruth1600 |
            | passwordStg | 1234Test |
        And I click login
        And I click later in pop up biometric
        And I will see card account 'active'
        When I click notification center
        And I will direct to page notification center
        And I click tab Info notification
        Then I will see notification categorize by Info

    @C160831
    Scenario: Categorize notification center based on transaction
        Given I am a registered customer with following details:
            | userID      | natace13 |
            | password    | 1234Test |
            | userIDstg   | ruth1600 |
            | passwordStg | 1234Test |    
        And has been filled survey rating account opening
        And has notification in notification center
        And I filling in form login with the following details:
            | userID      | natace13 |
            | password    | 1234Test |
            | userIDstg   | ruth1600 |
            | passwordStg | 1234Test |
        And I click login
        And I click later in pop up biometric
        And I will see card account 'active'
        When I click notification center
        And I will direct to page notification center
        And I click tab Transaction notification
        Then I will see notification categorize by Transaction

    @C160832
    Scenario: Categorize notification center based on Loan
        Given I am a registered customer with following details:
            | userID      | natace13 |
            | password    | 1234Test |
            | userIDstg   | ruth1600 |
            | passwordStg | 1234Test |    
        And has been filled survey rating account opening
        And has notification in notification center
        And I filling in form login with the following details:
            | userID      | natace13 |
            | password    | 1234Test |
            | userIDstg   | ruth1600 |
            | passwordStg | 1234Test |
        And I click login
        And I click later in pop up biometric
        And I will see card account 'active'
        When I click notification center
        And I will direct to page notification center
        And I click tab Loan notification
        Then I will see notification is empty

    @C160833
    Scenario: Categorize notification center based on All
        Given I am a registered customer with following details:
            | userID      | natace13 |
            | password    | 1234Test |
            | userIDstg   | ruth1600 |
            | passwordStg | 1234Test |    
        And has been filled survey rating account opening
        And has notification in notification center
        And I filling in form login with the following details:
            | userID      | natace13 |
            | password    | 1234Test |
            | userIDstg   | ruth1600 |
            | passwordStg | 1234Test |
        And I click login
        And I click later in pop up biometric
        And I will see card account 'active'
        When I click notification center
        And I will direct to page notification center
        And I click tab Info notification
        And I will see notification categorize by Info
        And I click tab All notification
        Then I will see all categorize notification

    @C160834
    Scenario: Read all notification
        Given I am a registered customer with following details:
            | userID      | natace13 |
            | password    | 1234Test |
            | userIDstg   | ruth1600 |
            | passwordStg | 1234Test |    
        And has been filled survey rating account opening
        And don’t have any notification
        And I filling in form login with the following details:
            | userID      | natace13 |
            | password    | 1234Test |
            | userIDstg   | ruth1600 |
            | passwordStg | 1234Test |
        And I have '3' notification 'Maintenance App' in notification center
        And I click login
        And I click later in pop up biometric
        And I will see card account 'active'
        And I see red dot notification center
        And I click notification center
        When I open all unread notification
        And I close page notification center
        Then I don't see red dot notification center

    @C160835
    Scenario: Read some notification
        Given I am a registered customer with following details:
            | userID      | natace13 |
            | password    | 1234Test |
            | userIDstg   | ruth1600 |
            | passwordStg | 1234Test |    
        And has been filled survey rating account opening
        And don’t have any notification
        And I filling in form login with the following details:
            | userID      | natace13 |
            | password    | 1234Test |
            | userIDstg   | ruth1600 |
            | passwordStg | 1234Test |
        And I have '3' notification 'Maintenance App' in notification center
        And I click login
        And I click later in pop up biometric
        And I will see card account 'active'
        And I see red dot notification center
        And I click notification center
        When I open the latest notification
        And I close page notification center
        Then I see red dot notification center