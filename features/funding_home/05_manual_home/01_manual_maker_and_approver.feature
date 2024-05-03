Feature: Maker and Approver Transaction Manual Cases
    In order to create transaction in business type company and CV
    As a director
    I want to approve or reject transaction from other director

    Scenario: Validate number card approval transaction in main dashboard (Only maker)
        Given Maker create transaction transfer out more than 5 times
        When User login as maker
        And User directly to main dashboard
        Then User will see card maker in main dashboard with maximum 5 cards
        And User can swipe the card

    Scenario: Validate number card approval transaction in main dashboard (Only approver)
        Given Maker create transaction transfer out more than 5 times
        When User login as approver
        And User directly to main dashboard
        Then User will see card approver in main dashboard with maximum 5 cards
        And User can swipe the card

    Scenario: Validate number card approval transaction in main dashboard (Maker+Approver)
        Given Maker and approver create transaction transfer out more than 5 times
        When User login as approver or maker
        And User directly to main dashboard
        Then User will see card approver in main dashboard with maximum 5 cards contain with need approval and waiting approval cards
        And User can swipe the card

    Scenario: Validate card maker and approval after make transfer out
        Given I am a registered customer with following details:
            | userID   | autocaea |
            | password | 1234Test |
        And I filling in form login with the following details:
            | userID   | autocaea |
            | password | 1234Test |
        And I click login
        And I click later
        When I choose menu Transfer from main dashboard
        And I input name 'Surya Edwin' from the search box
        And I choose the friendlist
        And I input amount '1000000'
        And I choose category 'Pembayaran'
        And I submit to next flow
        And I click transfer now
        And I input PIN '111111'
        And I will direct to page need approval from other director
        And I close page detail transfer
        And I will see card maker transaction in main dashboard
        And I choose other
        And I click logout
        And I filling in form login with the following details:
            | userID   | autocaea |
            | password | 1234Test |
        And I click login
        And I click later
        And I choose menu Transfer from main dashboard
        And I input name 'Nadya Larosa' from the search box
        And I choose the friendlist
        And I input amount '1000000'
        And I choose category 'Pembayaran'
        And I submit to next flow
        And I click transfer now
        And I input PIN '111111'
        And I will direct to page need approval from other director
        And I close page detail transfer
        Then I will see card maker transaction in main dashboard
        And I swipe card transaction
        And I will see card approver transaction in main dashboard

    Scenario: Receive notification need approval transaction from maker
        Given Maker create transaction transfer out in device A
        And Approver using device B
        When Maker success transfer out using device A
        Then Approver will receive notificaton in device B with wording 'Ada transaksi yang membutuhkan persetujuan Anda. Silahkan cek disini'
        And subject is 'Amar Bank Bisnis'
        And along with icon amarbank business

    Scenario: Receive OTP SMS
        Given Maker create transaction transfer out
        And service to approve/reject transaction is error
        When User login as last approver
        And User click card approver
        And User reject the transaction
        And User input password
        And User submit password
        Then User will receive SMS along with otp code

    Scenario: Checking time and attempt resend OTP
        Given Maker create transaction transfer out
        And service to approve/reject transaction is error
        When User login as last approver
        And User click card approver
        And User reject the transaction
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

    Scenario: Drop off in page input OTP
        Given Maker create transaction transfer out
        And service to approve/reject transaction is error
        When User login as last approver
        And User click card approver
        And User reject the transaction
        And User input password
        And User submit password
        And User drop off or kill app in page OTP
        And User login again as approver
        And User click card approver
        And User reject the transaction
        And User input password
        And User submit password
        Then User will see count down back to default 1 minutes with attempt left '1/5'

    Scenario: Approve transaction more than one
        Given Maker create transaction transfer out more than 2 times
        When User login as approver
        And User click card approver A
        And User approve the transaction A
        And User input password
        And User submit password
        And User input OTP code
        And User click link see detail transaction A
        And User will direct to section done
        Then Card transaction A will move to section done with status 'Transaksi Disetujui'
        And User back to main dashboard
        And User will see card approver A is no longer in main dashboard
        And User click card approver B
        And User approve the transaction B
        And User input password
        And User submit password
        And User input OTP code
        And User click link see detail transaction B
        And User will direct to section done
        And Card transaction B will move to section done with status 'Transaksi Disetujui'
        And User back to main dashboard
        And User will see card approver B is no longer in main dashboard

    Scenario: Approve transaction with approval more than 1 director
        Given Maker create transaction transfer out
        And approver more than one
        When User login as approver
        And User click card approver
        And User approve the transaction
        And User input password
        And User submit password
        And User input OTP code
        And User click link see detail transaction
        And User will direct to tab in process at section waiting for approval
        And card transaction will move to tab in process at section waiting for approval

    Scenario: Reject transaction when other director approve the transaction
        Given Maker create transaction transfer out
        And approver more than one
        And other approver already approve the transaction
        When User login as last approver
        And User click card approver
        And User reject the transaction
        And User input password
        And User submit password
        And User input OTP code
        And User click link see detail transaction
        And User will direct to section done
        Then Card transaction A will move to section done with status 'Transaksi Ditolak'
        And User back to main dashboard
        And User will see card approver is no longer in main dashboard

    Scenario: Approve/reject transaction when server is error
        Given Maker create transaction transfer out
        And service to approve/reject transaction is error
        When User login as last approver
        And User click card approver
        And User reject the transaction
        And User input password
        And User submit password
        And User input OTP code
        Then User User will direct to section in progress
        And User will see snackbar 'Sedang terjadi kesalahan sistem.'

    Scenario: Receive notification approved from approver
        Given Maker create transaction transfer out using device A
        When User login as approver using device B
        And User click card approver
        And User approve the transaction
        And User input password
        And User submit password
        And User input OTP code
        And User will direct to section done
        And Card transaction B will move to section done with status 'Transaksi Disetujui'
        Then Maker in device A will receive notification with wording 'Transaksi Anda telah disetujui oleh Direksi lainnya.'
        And receive email approved from amarbank business

    Scenario: Receive notification rejected from approver
        Given Maker create transaction transfer out using device A
        When User login as approver using device B
        And User click card approver
        And User reject the transaction
        And User input password
        And User submit password
        And User input OTP code
        And User will direct to section done
        And Card transaction B will move to section done with status 'Transaksi Ditolak'
        Then Maker in device A will receive notification with wording 'Transaksi Anda telah ditolak oleh Direksi lainnya.'
        And receive email rejected from amarbank business

    Scenario: Check card maker in main dashboard and detail approval transaction after transaction was cancelled
        Given Maker create transaction transfer out using device A
        When Maker cancel their transaction
        And Maker input password
        And Maker submit password
        And Maker input OTP code
        And Maker will direct to main dashboard
        And Maker will see snackbar with wording 'Transaksi berhasil dibatalkan'
        Then Maker will not see card maker that already been cancelled
        And Maker click tab profile
        And Maker click menu transaction approval
        And Maker click waiting approval section
        And Maker will not see card maker that already been cancelled
        And Maker click tab approval has been done
        And Maker will see card with status has been canceled
        And Maker can click detail card completed
        And Maker will see detail card maker that has been canceled

    Scenario: Cancel transaction with one approval already accept the transaction (Level approval more than 1 director)
        Given Maker create transaction transfer out using device A
        And level approval more than 1 director
        And one approver have been approved the transaction
        When Maker canceled the transaction
        And Maker input password
        And Maker submit password
        And Maker input OTP code
        And Maker will direct to main dashboard
        And Maker will see snackbar with wording 'Transaksi berhasil dibatalkan'
        Then Maker will not see card maker that already been cancelled
        And in all approver, that transaction should be not exist anymore
        And in history completed card, the transaction will get status 'Transaksi Dibatalkan'

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

    Scenario: Approve transaction when transaction was cancelled at the same time (Level approval 1 director, state approve in page input password)
        Given Maker create transaction transfer out using device A
        And level approval only 1 director
        And Approver open detail card approval using device B
        And Approver click button approve
        And Maker canceled the transaction
        And Approver input password
        And Approver submit password
        And Approver input OTP code
        Then Approver will see snackbar error system
        And Approver close page transaction
        And Approver will direct main dashboard
        And Approver will not see the card approver in main dashboard
        And Approver will not see the card approver in menu transaction need approval
        And Approver will see history transaction in tab completed with status "Transaksi Dibatalkan"
        And Approver can click detail card completed
        And Approver will see detail card maker that has been cancelled

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

    Scenario: Reject transaction when transaction was cancelled at the same time (Level approval 1 director, state reject in page input password)
        Given Maker create transaction transfer out using device A
        And level approval only 1 director
        And Approver open detail card approval using device B
        And Approver click button reject
        And Maker canceled the transaction
        And Approver input password
        And Approver submit password
        And Approver input OTP code
        Then Approver will see snackbar error system
        And Approver close page transaction
        And Approver will direct main dashboard
        And Approver will not see the card approver in main dashboard
        And Approver will not see the card approver in menu transaction need approval
        And Approver will see history transaction in tab completed with status "Transaksi Dibatalkan"
        And Approver can click detail card completed
        And Approver will see detail card maker that has been cancelled

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