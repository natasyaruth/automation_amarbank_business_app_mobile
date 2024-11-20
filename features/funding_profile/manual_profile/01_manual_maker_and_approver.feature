Feature: Maker and Approver Transaction Manual Cases
    In order to create transaction in business type company and CV
    As a director
    I want to approve or reject transaction from other director

    @C132508
    Scenario: Validate card maker and approval after make transfer out
        Given I am a registered customer with following details:
            | userID      | rota3159 |
            | password    | 1234Test |
            | userIDstg   | stagfc98 |
            | passwordStg | 1234Test |
        And has partner with following details:
            | userID      | rotacb82 |
            | password    | 1234Test |
            | userIDstg   | nata30bc |
            | passwordStg | 1234Test |
        And we both eligible to be maker and approver
        When I login as initiator
        And I transfer out transaction
        And I will see notification red dot in notification center
        And I will see notification red dot in menu profile
        And I will not see any card pending task in main dashboard
        And I click menu notification center
        And I will see notification waiting for approval
        And I back to dashboard
        And I click menu profile
        And I will see count pending task is 1
        And I back to dashboard
        And I go to menu other
        And I logout
        And I login as partner
        And I will see notification red dot in notification center
        And I will see notification red dot in menu profile
        And I will not see any card pending task in main dashboard
        And I click menu notification center
        And I will see notification need for approval
        And I back to dashboard
        And I will see notification red dot in notification center
        And I will see notification red dot in menu profile
        And I transfer out transaction
        And I click menu notification center
        Then I will see notification waiting for approval in the bottom of notification need approval
        And I back to dashboard
        And I click menu profile
        And I will see count pending task is 2
        And I back to dashboard
        And I go to menu other
        And I logout
        And I login as initiator
        And I click menu notification center
        And I will see notification waiting for approval in the bottom of notification need approval
        And I back to dashboard
        And I click menu profile
        And I will see count pending task is 2

    @C132509
    Scenario: Receive notification need approval transaction from maker
        Given Maker create transaction transfer out in device A
        And Approver using device B
        When Maker success transfer out using device A
        Then Approver will receive notificaton in device B with wording 'Ada transaksi yang membutuhkan persetujuan Anda. Silahkan cek disini'
        And subject is 'Amar Bank Bisnis'
        And along with icon amarbank business

    @C132510
    Scenario: Receive OTP SMS
        Given Maker create transaction transfer out
        When User open notification waiting approval in notification center
        And User cancel the transaction
        And User input password
        And User submit password
        Then User will receive SMS along with otp code

    @C132511
    Scenario: Checking time and attempt resend OTP
        Given Maker create transaction transfer out
        When User open notification waiting approval in notification center
        And User cancel the transaction
        And User input password
        And User submit password
        And User will see count down time 1 minutes with attempt '0/5'
        When User try to resend OTP
        Then User will see count down time reset to 1 minutes with attempt '1/5'
        And User try to resend OTP
        Then User will see count down time reset to 1 minutes with attempt '2/5'
        And User try to resend OTP
        Then User will see count down time reset to 1 minutes with attempt '3/5'
        And User try to resend OTP
        Then User will see count down time reset to 1 minutes with attempt '4/5'
        And User try to resend OTP
        Then User will see count down time reset to 1 minutes with attempt '5/5'

    @C132512
    Scenario: Drop off in page input OTP
        Given Maker create transaction transfer out
        When User open notification waiting approval in notification center
        And User cancel the transaction
        And User input password
        And User submit password
        And User drop off or kill app in page OTP
        And User login again as approver
        And User click card approver
        And User reject the transaction
        And User input password
        And User submit password
        Then User will see count down back to default 1 minutes with attempt left '1/5'

    @C132513
    Scenario: Approve transaction more than one
        Given Maker create transaction transfer out more than 2 times (the first one is A and then is B)
        When User login as approver
        And User open notification center
        And User see 2 notification approval in the top of other notification
        And the ordering is A and then followed by B
        And User open approver A
        And User approve the transaction A
        And User input PIN A
        And User will direct to menu notification center with snackbar success approved
        And the notification is not there anymore
        And transaction A will move to section done with status 'Transaksi Disetujui'
        And User back to menu notification center
        And User open approver B
        And User approve the transaction B
        And User input PIN B
        And User will direct to menu notification center with snackbar success approved
        And the notification is not there anymore
        And card transaction B will move to section done with status 'Transaksi Disetujui'
        And User back to main dashboard
        And User will see card approver B is no longer in main dashboard

    @C132514
    Scenario: Approve transaction with approval more than 1 director
        Given Maker create transaction transfer out
        And approver more than one
        When User login as first approver
        And User open notification center
        And User open the notification transaction need approval
        And User approve the transaction
        And User input PIN
        And User will direct to menu notification center with snackbar success approved
        And notification transaction is change into waiting approval from other director
        And card transaction will move to tab in process at section waiting for approval in menu transaction pending task
        And User login as last approval
        And User open notification center
        And User open the notification transaction need approval
        And User approve the transaction
        And User input PIN
        And User will direct to menu notification center with snackbar success approved
        Then the notification is change into transaction is approved
        And all director will get this notification

    @C132515
    Scenario: Reject transaction when other director approve the transaction
        Given Maker create transaction transfer out
        And approver more than one
        When User login as first approver
        And User open notification center
        And User open the notification transaction need approval
        And User approve the transaction
        And User input PIN
        And User will direct to menu notification center with snackbar success approved
        And notification transaction is change into waiting approval from other director
        And card transaction will move to tab in process at section waiting for approval in menu transaction pending task
        And User login as last approval
        And User open notification center
        And User open the notification transaction need approval
        And User reject the transaction
        And User input PIN
        And User will direct to menu notification center with snackbar success rejected
        Then the notification is change into transaction is rejected
        And all director will get this notification

    @C132516
    Scenario: Approve/reject transaction when server is error
        Given Maker create transaction transfer out
        And service to approve/reject transaction is error
        When User login as last approver
        And User open notification center
        And User open the notification transaction need approval
        And User approve the transaction
        And User input PIN
        Then User will direct to notification center
        And User will see snackbar 'Sedang terjadi kesalahan sistem.'

    @C132517
    Scenario: Receive notification approved from approver
        Given Maker create transaction transfer out using device A
        When User login as approver using device B
        And User open notification center
        And User open the notification transaction need approval
        And User approve the transaction
        And User input PIN
        And User will direct to notification center
        Then Maker receive email approved from amarbank business

    @C132518
    Scenario: Receive notification rejected from approver
        Given Maker create transaction transfer out using device A
        When User login as approver using device B
        And User open notification center
        And User open the notification transaction need approval
        And User reject the transaction
        And User input PIN
        And User will direct to notification center
        Then Maker will receive email rejected from amarbank business

    @C132519
    Scenario: Check card maker in main dashboard and detail approval transaction after transaction was cancelled
        Given Maker create transaction transfer out using device A
        When Maker cancel their transaction
        And Maker input password
        And Maker submit password
        And Maker input OTP code
        And Maker will direct to main dashboard
        And Maker will see snackbar with wording 'Transaksi berhasil dibatalkan'
        Then Maker will not see notification maker that already been cancelled in notification center
        And Maker click tab profile
        And Maker click menu transaction approval
        And Maker click waiting approval section
        And Maker will not see card maker that already been cancelled
        And Maker click tab approval has been done
        And Maker will see card with status has been canceled
        And Maker can click detail card completed
        And Maker will see detail card maker that has been canceled

    @C132521
    Scenario: Cancel transaction when transaction was accepted at the same time (Level approval 1 director, state cancelation in page detail maker)
        Given Maker create transaction transfer out using device A
        And level approval only 1 director
        And Approver accept the transaction while maker try to cancel the transaction in device B
        And Maker click button cancel transaction
        Then Maker will see snackbar with wording "Transaksi tidak dapat dibatalkan."
        And Maker close page transaction
        And Maker will direct main dashboard
        And Maker will not see the card maker in main dashboard
        And Maker will not see the card maker in menu transaction approval
        And Maker will see history transaction in tab completed with status "Transaksi Disetujui"
        And Maker can click detail card completed
        And Maker will see detail card maker that has been approved

    @C132522
    Scenario: Cancel transaction when transaction was accepted at the same time (Level approval 1 director, state cancelation in page input password)
        Given Maker create transaction transfer out using device A
        And level approval only 1 director
        When Maker click button cancel transaction
        And Approver accept the transaction while maker try to cancel the transaction in device B
        And Maker click button cancel transaction
        And Maker input password
        And Maker submit password
        And Maker input OTP code
        Then Maker will see snackbar with wording "Transaksi tidak dapat dibatalkan."
        And Maker close page transaction
        And Maker will direct main dashboard
        And Maker will not see the card maker in main dashboard
        And Maker will not see the card maker in menu transaction approval
        And Maker will see history transaction in tab completed with status "Transaksi Disetujui"
        And Maker can click detail card completed
        And Maker will see detail card maker that has been approved

    @C132523
    Scenario: Cancel transaction when transaction was accepted at the same time (Level approval 1 director, state cancelation in page input otp)
        Given Maker create transaction transfer out using device A
        And level approval only 1 director
        When Maker click button cancel transaction
        And Maker click button cancel transaction
        And Maker input password
        And Maker submit password
        And Approver accept the transaction while maker try to cancel the transaction in device B
        And Maker input OTP code
        Then Maker will see snackbar with wording "Transaksi tidak dapat dibatalkan."
        And Maker close page transaction
        And Maker will direct main dashboard
        And Maker will not see the card maker in main dashboard
        And Maker will not see the card maker in menu transaction approval
        And Maker will see history transaction in tab completed with status "Transaksi Disetujui"
        And Maker can click detail card completed
        And Maker will see detail card maker that has been approved

    @C132524
    Scenario: Approve transaction when transaction was cancelled at the same time (Level approval 1 director, state approve in page detail maker)
        Given Maker create transaction transfer out using device A
        And level approval only 1 director
        And Maker canceled the transaction
        And Approver open detail card approval using device B
        And Approver click button approve
        Then Approver will see snackbar error system
        And Approver close page transaction
        And Approver will direct main dashboard
        And Approver will not see the card approver in main dashboard
        And Approver will not see the card approver in menu transaction need approval
        And Approver will see history transaction in tab completed with status "Transaksi Dibatalkan"
        And Approver can click detail card completed
        And Approver will see detail card maker that has been cancelled

    @C132526
    Scenario: Approve transaction when transaction was cancelled at the same time (Level approval 1 director, state approve in page input otp)
        Given Maker create transaction transfer out using device A
        And level approval only 1 director
        And Approver open detail card approval using device B
        And Approver click button approve
        And Approver input password
        And Approver submit password
        And Maker canceled the transaction
        And Approver input OTP code
        Then Approver will see snackbar error system
        And Approver close page transaction
        And Approver will direct main dashboard
        And Approver will not see the card approver in main dashboard
        And Approver will not see the card approver in menu transaction need approval
        And Approver will see history transaction in tab completed with status "Transaksi Dibatalkan"
        And Approver can click detail card completed
        And Approver will see detail card maker that has been cancelled

    @C132527
    Scenario: Reject transaction when transaction was cancelled at the same time (Level approval 1 director, state reject in page detail maker)
        Given Maker create transaction transfer out using device A
        And level approval only 1 director
        And Maker canceled the transaction
        And Approver open detail card approval using device B
        And Approver click button Reject
        Then Approver will see snackbar error system
        And Approver close page transaction
        And Approver will direct main dashboard
        And Approver will not see the card approver in main dashboard
        And Approver will not see the card approver in menu transaction need approval
        And Approver will see history transaction in tab completed with status "Transaksi Dibatalkan"
        And Approver can click detail card completed
        And Approver will see detail card maker that has been cancelled

    @C132529
    Scenario: Reject transaction when transaction was cancelled at the same time (Level approval 1 director, state reject in page input otp)
        Given Maker create transaction transfer out using device A
        And level approval only 1 director
        And Approver open detail card approval using device B
        And Approver click button reject
        And Approver input password
        And Approver submit password
        And Maker canceled the transaction
        And Approver input OTP code
        Then Approver will see snackbar error system
        And Approver close page transaction
        And Approver will direct main dashboard
        And Approver will not see the card approver in main dashboard
        And Approver will not see the card approver in menu transaction need approval
        And Approver will see history transaction in tab completed with status "Transaksi Dibatalkan"
        And Approver can click detail card completed
        And Approver will see detail card maker that has been cancelled

    @C132530
    Scenario: Approve transaction with user still not create PIN yet
        Given Login to app using account as a approver
        And has notification transaction that need to approved
        And didn't set the PIN yet
        When I click notification Approver in notification center
        And I open the notification transaction need approval
        And I approve the transaction
        And I click button create PIN
        And I input password
        And I input new PIN with "111111"
        And I input confirm new PIN
        And I input OTP 
        And I click button next
        Then I will direct to page detail transaction that need to approve
        And I approve the transaction
        And I input PIN transaction
        And I will direct to page notification center
        And I will see snackbar success
        And I will see notification need approve is change into transaction is approved

    @C132531
    Scenario: Reject transaction with user still not create PIN yet
        Given Login to app using account as a approver
        And has notification transaction that need to approved
        And didn't set the PIN yet
        When I click notification Approver in notification center
        And I open the notification transaction need approval
        And I reject the transaction
        And I click button create PIN
        And I input password
        And I input new PIN with "111111"
        And I input confirm new PIN
        And I input OTP 
        And I click button next
        Then I will direct to page detail transaction that need to approve
        And I reject the transaction
        And I input PIN transaction
        And I will direct to page notification center
        And I will see snackbar success
        And I will see notification need approve is change into transaction is rejected

    @C164029
    Scenario: Checking ordering list pending task in notification center
        Given I am an initiator
        And has two other partner
        And we have eligibilty as maker or approver
        And we can call the partner as Director A and Director B
        When I login as initiator
        And I create pending transaction X
        And I will see transaction X in notification center with position is always in the top before the general notification
        And I create again pending transaction Y
        And I will see pending task X in in the top and then followed with transaction Y
        And I login as Director A
        And I will see transaction X and Y need approval in notification center
        And I as Director A create another pending transaction A
        And I will see list pending transaction with order list are Approval transaction X, Approval transaction Y and Pending transaction A
        And I login as Director B
        And I will see list need approval transaction with order list are Approval transaction X, Approval transaction Y and Approval transaction A
        And I as Director B create another pending transaction B
        Then I will see list pending transaction with order list are Approval transaction X, Approval transaction Y, Approval transaction A and Pending transaction B