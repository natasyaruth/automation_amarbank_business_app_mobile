@maker_approver_transaction
Feature: Maker and Approver Transaction
    In order to create transaction in business type company and CV
    As a director
    I want to approve or reject transaction from other director

    @C131460
    Scenario: Validate menu transaction approval with type individual
        Given I am a registered customer with following details:
            | userID      | auto20bf |
            | password    | 1234Test |
            | userIDstg   | ruthc61e |
            | passwordStg | 1234Test |
        And don't have any notification
        And I filling in form login with the following details:
            | userID      | auto20bf |
            | password    | 1234Test |
            | userIDstg   | ruthc61e |
            | passwordStg | 1234Test |
        And I click login
        And I click later in pop up biometric
        And I will see card account 'active'
        When I click tab profile
        Then I will not see menu transaction approval
        And I will not see menu download power of attorney
        And I will not see menu document management
        And I click back in header page
        And I click notification center
        And I don't see list pending task

    @C131461
    Scenario: Validate menu transaction approval with type individual business
        Given I am a registered customer with following details:
            | userID      | autoa645 |
            | password    | 1234Test |
            | userIDstg   | stage87c |
            | passwordStg | 1234Test |
        And don't have any notification
        And I filling in form login with the following details:
            | userID      | autoa645 |
            | password    | 1234Test |
            | userIDstg   | stage87c |
            | passwordStg | 1234Test |
        And I click login
        And I click later in pop up biometric
        And I will see card account 'active'
        When I click tab profile
        Then I will not see menu transaction approval
        And I will not see menu download power of attorney
        And I will not see menu document management
        And I click back in header page
        And I click notification center
        And I don't see list pending task

    @C131463
    Scenario: Validate card maker after make transfer out with type business other than company and CV
        Given I am a registered customer with following details:
            | userID      | ptpe5040 |
            | password    | 1234Test |
            | userIDstg   | ruthfdcb |
            | passwordStg | 1234Test |
        And don't have any notification
        And I filling in form login with the following details:
            | userID      | ptpe5040 |
            | password    | 1234Test |
            | userIDstg   | ruthfdcb |
            | passwordStg | 1234Test |
        And I click login
        And I click later in pop up biometric
        And I will see card account 'active'
        And I choose menu Transfer from main dashboard
        When I input name 'RUTH BISNIS A' from the search box
        And I choose the friendlist
        And I input amount '10000'
        And I choose category 'Pembayaran'
        And I submit to next flow
        And I click transfer now
        And I input PIN '111111'
        And I successfully transferred
        And I close page detail transfer
        Then I don't see any card transaction in main dashboard
        And I click notification center
        And I don't see list pending task
        And I click close in header page
        And I click tab profile
        And I will not see menu transaction approval

    @C131464
    Scenario: Validate page approval transaction empty state
        Given I am a registered customer with following details:
            | userID      | ruth91fd |
            | password    | 1234Test |
            | userIDstg   | stagcfb7 |
            | passwordStg | 1234Test |
        And don't have any notification
        And I filling in form login with the following details:
            | userID      | ruth91fd |
            | password    | 1234Test |
            | userIDstg   | stagcfb7 |
            | passwordStg | 1234Test |
        And I click login
        And I click later in pop up biometric
        When I will see card account 'active'
        And I don't see any card transaction in main dashboard
        And I don't see indicator red in tab profile
        And I click notification center
        And I don't see list pending task
        And I click close in header page 
        And I click tab profile
        And I don't see counter pending task
        And I click menu transaction approval
        Then I will see page transaction approval is empty
        And I click waiting approval section
        And I will see page transaction approval is empty
        And I click tab approval has been done
        And I will see page transaction approval is empty

    @C131465
    Scenario: Validate notification maker after make transfer out with type business company or CV
        Given I am a registered customer with following details:
            | userID      | rota3159 |
            | password    | 1234Test |
            | userIDstg   | stagfc98 |
            | passwordStg | 1234Test |
        And don't have any notification
        And don't have list pending task
        And I filling in form login with the following details:
            | userID      | rota3159 |
            | password    | 1234Test |
            | userIDstg   | stagfc98 |
            | passwordStg | 1234Test |
        And I click login
        And I click later in pop up biometric
        And I unmask my amount
        And I will see my active, blocking and total amount
        And I choose menu Transfer from main dashboard
        When I input name 'RUTH BISNIS A' from the search box
        And I choose the friendlist
        And I input amount '10000'
        And I choose category 'Pembayaran'
        And I submit to next flow
        And I click transfer now
        And I input PIN '111111'
        Then I will direct to page need approval from other director
        And I close page detail transfer
        And I unmask my amount
        And I will see my blocking amount increase but active balance decrease from amount transfer
        And I will see indicator red in tab profile
        And I see red dot notification center
        And I click notification center
        And I will see list maker transaction in notification center
        And I click notification maker transaction
        And I will direct to page need approval from other director
        And there is no button approve and reject the transaction

    @C131466
    Scenario: Back to bucketlist notification center from detail card maker
        Given I am a registered customer with following details:
            | userID      | mike2cf3 |
            | password    | 1234Test |
            | userIDstg   | staga810 |
            | passwordStg | 1234Test |
        And I filling in form login with the following details:
            | userID      | mike2cf3 |
            | password    | 1234Test |
            | userIDstg   | staga810 |
            | passwordStg | 1234Test |
        And I click login
        And I click later in pop up biometric
        When I click notification center
        And I click notification maker transaction
        And I close page detail transfer
        Then I will direct to page notification center

    @C131467
    Scenario: Back to page approve transaction from detail transaction waiting for approval
        Given I am a registered customer with following details:
            | userID      | mike2cf3 |
            | password    | 1234Test |
            | userIDstg   | staga810 |
            | passwordStg | 1234Test |
        And I filling in form login with the following details:
            | userID      | mike2cf3 |
            | password    | 1234Test |
            | userIDstg   | staga810 |
            | passwordStg | 1234Test |
        And I click login
        And I click later in pop up biometric
        And I will see card account 'active'
        When I click tab profile
        And I see counter pending task
        And I click menu transaction approval
        And I click waiting approval section
        And I click card maker transaction
        And I close page detail transfer
        Then I will direct to page transaction approval

    @C131474
    Scenario: Validate notification approver after another director make transfer out
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
        And we don't have any notification
        And we don't have list pending task
        And I filling in form login with the following details:
            | userID      | rota3159 |
            | password    | 1234Test |
            | userIDstg   | stagfc98 |
            | passwordStg | 1234Test |
        And I click login
        And I click later in pop up biometric
        And I choose menu Transfer from main dashboard
        When I input name 'RUTH BISNIS A' from the search box
        And I choose the friendlist
        And I input amount '10000'
        And I choose category 'Pembayaran'
        And I submit to next flow
        And I click transfer now
        And I input PIN '111111'
        And I will direct to page need approval from other director
        And I close page detail transfer
        And I will see indicator red in tab profile
        And I see red dot notification center
        And I click notification center
        And I will see list maker transaction in notification center
        And I click close in header page
        And I will see card account 'active'
        And I choose other
        And I click logout
        And I filling in form login with the following details:
            | userID      | rotacb82 |
            | password    | 1234Test |
            | userIDstg   | nata30bc |
            | passwordStg | 1234Test |
        And I click login
        And I click later in pop up biometric
        And I will see indicator red in tab profile
        And I see red dot notification center
        And I will see list approver transaction in notification center
        And I click notification approver transaction
        Then I will direct to page waiting for approval from other director
        And along with button approve and reject the transaction
    
    @C131472
    Scenario: Back to page approval transaction from detail transaction need to approve
        Given I am a registered customer with following details:
            | userID      | mich875d |
            | password    | 1234Test |
            | userIDstg   | nata8119 |
            | passwordStg | 1234Test |
        And I filling in form login with the following details:
            | userID      | mich875d |
            | password    | 1234Test |
            | userIDstg   | nata8119 |
            | passwordStg | 1234Test |
        And I click login
        And I click later in pop up biometric
        And I will see card account 'active'
        When I click tab profile
        And I click menu transaction approval
        And I click card approver transaction
        And I close page detail approval transaction
        Then I will direct to page transaction approval

    @C131473
    Scenario: Access call center in page detail transaction
        Given I am a registered customer with following details:
            | userID      | mich875d |
            | password    | 1234Test |
            | userIDstg   | nata8119 |
            | passwordStg | 1234Test |
        And I filling in form login with the following details:
            | userID      | mich875d |
            | password    | 1234Test |
            | userIDstg   | nata8119 |
            | passwordStg | 1234Test |
        And I click login
        And I click later in pop up biometric
        And I will see card account 'active'
        When I click tab profile
        And I click menu transaction approval
        And I click card approver transaction
        And I click help center
        Then I will see helping center via email

    @C131475
    Scenario: Back to bucketlist notification from detail card approver
        Given I am a registered customer with following details:
            | userID      | mich875d |
            | password    | 1234Test |
            | userIDstg   | nata8119 |
            | passwordStg | 1234Test |
        And I filling in form login with the following details:
            | userID      | mich875d |
            | password    | 1234Test |
            | userIDstg   | nata8119 |
            | passwordStg | 1234Test |
        And I click login
        And I click later in pop up biometric
        When I click notification center
        And I click notification approver transaction
        And I close page detail transfer
        Then I will direct to page notification center

    @C131476
    Scenario: Input wrong password once when user want to cancel transaction
        Given I am a registered customer with following details:
            | userID      | mike2cf3 |
            | password    | 1234Test |
            | userIDstg   | staga810 |
            | passwordStg | 1234Test |
        And don't have any notification
        And never entered wrong password
        And I filling in form login with the following details:
            | userID      | mike2cf3 |
            | password    | 1234Test |
            | userIDstg   | staga810 |
            | passwordStg | 1234Test |
        And I click login
        And I click later in pop up biometric
        When I click notification center
        And I click notification maker transaction
        And I canceled my transaction
        And I input incorrect password for approver
        And I submit my password for approver
        Then I will see pop up data is incorrect
        And I can click try again to input password

    @C131477
    Scenario: Input wrong password more than 3 times when user want to cancel transaction
        Given I am a registered customer with following details:
            | userID      | mike2cf3 |
            | password    | 1234Test |
            | userIDstg   | staga810 |
            | passwordStg | 1234Test |
        And don't have any notification
        And never entered wrong password
        And I filling in form login with the following details:
            | userID      | mike2cf3 |
            | password    | 1234Test |
            | userIDstg   | staga810 |
            | passwordStg | 1234Test |
        And I click login
        And I click later in pop up biometric
        When I click notification center
        And I click notification maker transaction
        And I canceled my transaction
        And I input incorrect password for approver
        And I submit my password for approver
        And I will see pop up data is incorrect
        And I try again to input password
        And I input incorrect password for approver
        And I submit my password for approver
        And I will see pop up data is incorrect
        And I try again to input password
        And I input incorrect password for approver
        And I submit my password for approver
        Then I will notify I will direct lo login page
        And I click button direct to login
        And I will directing to page login

    @C131478
    Scenario: Unmask password
        Given I am a registered customer with following details:
            | userID      | mike2cf3 |
            | password    | 1234Test |
            | userIDstg   | staga810 |
            | passwordStg | 1234Test |
        And don't have any notification
        And never entered wrong password
        And I filling in form login with the following details:
            | userID      | mike2cf3 |
            | password    | 1234Test |
            | userIDstg   | staga810 |
            | passwordStg | 1234Test |
        And I click login
        And I click later in pop up biometric
        When I click notification center
        And I click notification maker transaction
        And I canceled my transaction
        And I input password for approver
        And I Unmask the password
        Then I will see my password

    @C131479
    Scenario: Mask password
        Given I am a registered customer with following details:
            | userID      | mike2cf3 |
            | password    | 1234Test |
            | userIDstg   | staga810 |
            | passwordStg | 1234Test |
        And don't have any notification
        And never entered wrong password
        And I filling in form login with the following details:
            | userID      | mike2cf3 |
            | password    | 1234Test |
            | userIDstg   | staga810 |
            | passwordStg | 1234Test |
        And I click login
        And I click later in pop up biometric
        When I click notification center
        And I click notification maker transaction
        And I canceled my transaction
        And I input password for approver
        And I Unmask the password
        And I Mask the password
        Then I will not see my password

    @C131480
    Scenario: Close page input password entry point detail card from menu notification center
        Given I am a registered customer with following details:
            | userID      | mike2cf3 |
            | password    | 1234Test |
            | userIDstg   | staga810 |
            | passwordStg | 1234Test |
        And don't have any notification
        And never entered wrong password
        And I filling in form login with the following details:
            | userID      | mike2cf3 |
            | password    | 1234Test |
            | userIDstg   | staga810 |
            | passwordStg | 1234Test |
        And I click login
        And I click later in pop up biometric
        When I click notification center
        And I click notification maker transaction
        And I canceled my transaction
        And I close page password for transaction approval
        Then I will direct to page detail approval transaction

    @C131481
    Scenario: Close page input password entry point detail card from page transaction approval
        Given I am a registered customer with following details:
            | userID      | mike2cf3 |
            | password    | 1234Test |
            | userIDstg   | staga810 |
            | passwordStg | 1234Test |
        And don't have any notification
        And never entered wrong password
        And I filling in form login with the following details:
            | userID      | mike2cf3 |
            | password    | 1234Test |
            | userIDstg   | staga810 |
            | passwordStg | 1234Test |
        And I click login
        And I click later in pop up biometric
        When I click tab profile
        And I click menu transaction approval
        And I click waiting approval section
        And I click card maker transaction
        And I canceled my transaction
        And I input password for approver
        And I close page password for transaction approval
        Then I will direct to page detail approval transaction

    @C131482
    Scenario: Verifying wrong OTP code
        Given I am a registered customer with following details:
            | userID      | mike2cf3 |
            | password    | 1234Test |
            | userIDstg   | staga810 |
            | passwordStg | 1234Test |
        And don't have any notification
        And I reset attempt otp after login 
        And I filling in form login with the following details:
            | userID      | mike2cf3 |
            | password    | 1234Test |
            | userIDstg   | staga810 |
            | passwordStg | 1234Test |
        And I click login
        And I click later in pop up biometric
        When I click notification center
        And I click notification maker transaction
        And I canceled my transaction
        And I input password for approver
        And I submit my password for approver
        And I input incorrect OTP for approve transaction
        Then I will see message error 'Kode OTP yang dimasukkan salah' in the below of field otp for approver

    @C131483
    Scenario: Verifying expired OTP code
        Given I am a registered customer with following details:
            | userID      | mike2cf3 |
            | password    | 1234Test |
            | userIDstg   | staga810 |
            | passwordStg | 1234Test |
        And don't have any notification
        And I reset attempt otp after login 
        And I filling in form login with the following details:
            | userID      | mike2cf3 |
            | password    | 1234Test |
            | userIDstg   | staga810 |
            | passwordStg | 1234Test |
        And I click login
        And I click later in pop up biometric
        When I click notification center
        And I click notification maker transaction
        And I canceled my transaction
        And I input password for approver
        And I submit my password for approver
        And I let the otp code for approve transaction expire
        And I input OTP to approve transaction
        Then I will see message error 'Kode OTP yang dimasukkan sudah kedaluwarsa' in the below of field otp for approver

    @C131484
    Scenario: Verifying wrong OTP code five times
        Given I am a registered customer with following details:
            | userID      | mike2cf3 |
            | password    | 1234Test |
            | userIDstg   | staga810 |
            | passwordStg | 1234Test |
        And don't have any notification
        And I reset attempt otp after login 
        And I filling in form login with the following details:
            | userID      | mike2cf3 |
            | password    | 1234Test |
            | userIDstg   | staga810 |
            | passwordStg | 1234Test |
        And I click login
        And I click later in pop up biometric
        When I click notification center
        And I click notification maker transaction
        And I canceled my transaction
        And I input password for approver
        And I submit my password for approver
        And I input incorrect OTP '5' times
        Then I should be notified that I can verify the OTP tomorrow

    @C131485
    Scenario: Resend OTP code
        Given I am a registered customer with following details:
            | userID      | mike2cf3 |
            | password    | 1234Test |
            | userIDstg   | staga810 |
            | passwordStg | 1234Test |
        And don't have any notification
        And I reset attempt otp after login 
        And I filling in form login with the following details:
            | userID      | mike2cf3 |
            | password    | 1234Test |
            | userIDstg   | staga810 |
            | passwordStg | 1234Test |
        And I click login
        And I click later in pop up biometric
        When I click notification center
        And I click notification maker transaction
        And I canceled my transaction
        And I input password for approver
        And I submit my password for approver
        And I resend otp code to approve transaction
        Then I will get new OTP different with my first OTP to approve transaction
        And I will see attempt left '1/5'

    @C131486
    Scenario: Resend OTP code more than five times
        Given I am a registered customer with following details:
            | userID      | mike2cf3 |
            | password    | 1234Test |
            | userIDstg   | staga810 |
            | passwordStg | 1234Test |
        And don't have any notification
        And I reset attempt otp after login 
        And I filling in form login with the following details:
            | userID      | mike2cf3 |
            | password    | 1234Test |
            | userIDstg   | staga810 |
            | passwordStg | 1234Test |
        And I click login
        And I click later in pop up biometric
        When I click notification center
        And I click notification maker transaction
        And I canceled my transaction
        And I input password for approver
        And I submit my password for approver
        And I resend otp code to approve transaction more than five times
        Then I should be notified that I can verify the OTP tomorrow

    @C131487
    Scenario: Verifying wrong OTP code four times then input valid code
        Given I am a registered customer with following details:
            | userID      | mike2cf3 |
            | password    | 1234Test |
            | userIDstg   | staga810 |
            | passwordStg | 1234Test |
        And don't have any notification
        And I reset attempt otp after login 
        And I filling in form login with the following details:
            | userID      | mike2cf3 |
            | password    | 1234Test |
            | userIDstg   | staga810 |
            | passwordStg | 1234Test |
        And I click login
        And I click later in pop up biometric
        When I click notification center
        And I click notification maker transaction
        And I canceled my transaction
        And I input password for approver
        And I submit my password for approver
        And I input incorrect OTP '4' times
        And I input OTP to approve transaction
        Then I will see snackbar with wording 'Transaksi berhasil dibatalkan'

    @C131488
    Scenario: Input incorrect PIN approver once
        Given I am a registered customer with following details:
            | userID      | mich875d |
            | password    | 1234Test |
            | userIDstg   | nata8119 |
            | passwordStg | 1234Test |
        And never entered wrong password
        And I filling in form login with the following details:
            | userID      | mich875d |
            | password    | 1234Test |
            | userIDstg   | nata8119 |
            | passwordStg | 1234Test |
        And I click login
        And I click later in pop up biometric
        When I click notification center
        And I click notification approver transaction
        And I approve the transaction
        And I input wrong PIN
        Then I will see pop up data is incorrect
        And I can click try again to input PIN

    @C131489
    Scenario: Input incorrect PIN approver twice
        Given I am a registered customer with following details:
            | userID      | mich875d |
            | password    | 1234Test |
            | userIDstg   | nata8119 |
            | passwordStg | 1234Test |
        And never entered wrong password
        And I filling in form login with the following details:
            | userID      | mich875d |
            | password    | 1234Test |
            | userIDstg   | nata8119 |
            | passwordStg | 1234Test |
        And I click login
        And I click later in pop up biometric
        When I click notification center
        And I click notification approver transaction
        And I approve the transaction
        And I input wrong PIN
        And I will see pop up data is incorrect
        And I try again to input PIN
        And I input wrong PIN
        Then I will see pop up data is incorrect
        And I can click try again to input PIN

    @C131490
    Scenario: Input incorrect PIN approver three times
        Given I am a registered customer with following details:
            | userID      | mich875d |
            | password    | 1234Test |
            | userIDstg   | nata8119 |
            | passwordStg | 1234Test |
        And never entered wrong password
        And I filling in form login with the following details:
            | userID      | mich875d |
            | password    | 1234Test |
            | userIDstg   | nata8119 |
            | passwordStg | 1234Test |
        And I click login
        And I click later in pop up biometric
        When I click notification center
        And I click notification approver transaction
        And I approve the transaction
        And I input wrong PIN
        And I will see pop up data is incorrect
        And I try again to input PIN
        And I input wrong PIN
        And I will see pop up data is incorrect
        And I try again to input PIN
        And I input wrong PIN
        Then I will notify I will direct lo login page
        And I click button direct to login
        And I will directing to page login

    @C131491
    Scenario: Input incorrect PIN once and input correct PIN
        Given I am a registered customer with following details:
            | userID      | mich875d |
            | password    | 1234Test |
            | userIDstg   | nata8119 |
            | passwordStg | 1234Test |
        And never entered wrong password
        And I filling in form login with the following details:
            | userID      | mich875d |
            | password    | 1234Test |
            | userIDstg   | nata8119 |
            | passwordStg | 1234Test |
        And I click login
        And I click later in pop up biometric
        When I click notification center
        And I click notification approver transaction
        And I approve the transaction
        And I input wrong PIN
        And I will see pop up data is incorrect
        And I try again to input PIN
        And I input PIN '111111' approver
        Then I will direct to page transaction approval

    @C131492
    Scenario: Approve transaction from detail card maker in notification center
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
        And we don't have any notification
        And we don't have list pending task
        And I filling in form login with the following details:
            | userID      | rota3159 |
            | password    | 1234Test |
            | userIDstg   | stagfc98 |
            | passwordStg | 1234Test |
        And I click login
        And I click later in pop up biometric
        And I unmask my amount
        And I will see my active, blocking and total amount
        And I choose menu Transfer from main dashboard
        When I input name 'RUTH BISNIS A' from the search box
        And I choose the friendlist
        And I input amount '10000'
        And I choose category 'Pembayaran'
        And I submit to next flow
        And I click transfer now
        And I input PIN '111111'
        And I will direct to page need approval from other director
        And I close page detail transfer
        And I unmask my amount
        And I will see my blocking amount increase but active balance decrease from amount transfer
        And I will see indicator red in tab profile
        And I see red dot notification center
        And I click notification center
        And I will see list maker transaction in notification center
        And I click close in header page
        And I will see card account 'active'
        And I choose other
        And I click logout
        And I filling in form login with the following details:
            | userID      | rotacb82 |
            | password    | 1234Test |
            | userIDstg   | nata30bc |
            | passwordStg | 1234Test |
        And I click login
        And I click later in pop up biometric
        And I will see indicator red in tab profile
        And I see red dot notification center
        And I click notification center
        And I will see list approver transaction in notification center
        And I click notification approver transaction
        And I approve the transaction
        And I input PIN '111111' approver
        Then I will see snackbar with wording 'Anda telah menyetujui transaksi'
        And I will direct to page notification center
        And I will not see list approver transaction in notification center
        And I see notification transaction is approved from other director
        And I click close in header page
        And I click tab profile
        And I click menu transaction approval
        And I click tab approval has been done
        And I will see card maker that has been approved
        And I can click detail card completed
        And I will see detail card maker that has been approved
        And I close page detail card completed
        And I click button back in the header page
        And I unmask my amount
        And I will see my active balance and total amount are decreased but my blocking amount back like in beginning

    @C131493
    Scenario: Approve transaction with transfer using notes
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
        And we don't have any notification
        And we don't have list pending task
        And I filling in form login with the following details:
            | userID      | rota3159 |
            | password    | 1234Test |
            | userIDstg   | stagfc98 |
            | passwordStg | 1234Test |
        And I click login
        And I click later in pop up biometric
        And I unmask my amount
        And I will see my active, blocking and total amount
        And I choose menu Transfer from main dashboard
        When I input name 'RUTH BISNIS A' from the search box
        And I choose the friendlist
        And I input amount '10000'
        And I choose category 'Pembayaran'
        And I input notes with 'Pembayaran BPJS'
        And I submit to next flow
        And I click transfer now
        And I input PIN '111111'
        And I will direct to page need approval from other director
        And I close page detail transfer
        And I unmask my amount
        And I will see my blocking amount increase but active balance decrease from amount transfer
        And I will see indicator red in tab profile
        And I see red dot notification center
        And I click notification center
        And I will see list maker transaction in notification center
        And I click close in header page
        And I will see card account 'active'
        And I choose other
        And I click logout
        And I filling in form login with the following details:
            | userID      | rotacb82 |
            | password    | 1234Test |
            | userIDstg   | nata30bc |
            | passwordStg | 1234Test |
        And I click login
        And I click later in pop up biometric
        And I will see indicator red in tab profile
        And I see red dot notification center
        And I click notification center
        And I will see list approver transaction in notification center
        And I click notification approver transaction
        And I approve the transaction
        And I input PIN '111111' approver
        Then I will see snackbar with wording 'Anda telah menyetujui transaksi'
        And I will direct to page notification center
        And I will not see list approver transaction in notification center
        And I see notification transaction is approved from other director
        And I click close in header page
        And I click tab profile
        And I click menu transaction approval
        And I click tab approval has been done
        And I will see card maker that has been approved
        And I can click detail card completed
        And I will see detail card maker that has been approved
        And I close page detail card completed
        And I click button back in the header page
        And I unmask my amount
        And I will see my active balance and total amount are decreased but my blocking amount back like in beginning

    @C131494
    Scenario: Reject transaction from detail card maker in notification center
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
        And we don't have any notification
        And we don't have list pending task
        And I filling in form login with the following details:
            | userID      | rota3159 |
            | password    | 1234Test |
            | userIDstg   | stagfc98 |
            | passwordStg | 1234Test |
        And I click login
        And I click later in pop up biometric
        And I unmask my amount
        And I will see my active, blocking and total amount
        And I choose menu Transfer from main dashboard
        When I input name 'RUTH BISNIS A' from the search box
        And I choose the friendlist
        And I input amount '10000'
        And I choose category 'Pembayaran'
        And I submit to next flow
        And I click transfer now
        And I input PIN '111111'
        And I will direct to page need approval from other director
        And I close page detail transfer
        And I unmask my amount
        And I will see my blocking amount increase but active balance decrease from amount transfer
        And I will see indicator red in tab profile
        And I see red dot notification center
        And I click notification center
        And I will see list maker transaction in notification center
        And I click close in header page
        And I will see card account 'active'
        And I choose other
        And I click logout
        And I filling in form login with the following details:
            | userID      | rotacb82 |
            | password    | 1234Test |
            | userIDstg   | nata30bc |
            | passwordStg | 1234Test |
        And I click login
        And I will see indicator red in tab profile
        And I see red dot notification center
        And I click notification center
        And I will see list approver transaction in notification center
        And I click notification approver transaction
        And I reject the transaction
        And I input PIN '111111' approver
        Then I will see snackbar with wording 'Anda telah menolak transaksi'
        And I will direct to page notification center
        And I will not see list approver transaction in notification center
        And I see notification transaction is rejected from other director
        And I click close in header page
        And I click tab profile
        And I click menu transaction approval
        And I click tab approval has been done
        And I will see card maker that has been rejected
        And I can click detail card completed
        And I will see detail card maker that has been rejected
        And I close page detail card completed
        And I click button back in the header page
        And I unmask my amount
        And I will see my active balance, blocking amount and total amount back like in the beginning

    @C131495
    Scenario: Approve transaction to other bank
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
        And we don't have any notification
        And we don't have list pending task
        And I filling in form login with the following details:
            | userID      | rota3159 |
            | password    | 1234Test |
            | userIDstg   | stagfc98 |
            | passwordStg | 1234Test |
        And I click login
        And I click later in pop up biometric
        And I choose menu Transfer from main dashboard
        When I input name 'Surya Edwin' from the search box
        And I choose the friendlist
        And I input amount '10000'
        And I choose category 'Pembayaran'
        And I click choose bank transfer service
        And I choose transfer service BIFAST
        And I click transfer
        And I click transfer now
        And I input PIN '111111'
        And I will direct to page need approval from other director
        And I close page detail transfer
        And I will see indicator red in tab profile
        And I see red dot notification center
        And I click notification center
        And I will see list maker transaction in notification center
        And I click close in header page
        And I will see card account 'active'
        And I choose other
        And I click logout
        And I filling in form login with the following details:
            | userID      | rotacb82 |
            | password    | 1234Test |
            | userIDstg   | nata30bc |
            | passwordStg | 1234Test |
        And I click login
        And I click later in pop up biometric
        And I will see indicator red in tab profile
        And I see red dot notification center
        And I click notification center
        And I will see list approver transaction in notification center
        And I click notification approver transaction
        And I approve the transaction
        And I input PIN '111111' approver
        Then I will see snackbar with wording 'Anda telah menyetujui transaksi'
        And I will direct to page notification center
        And I will not see list approver transaction in notification center
        And I see notification transaction is approved from other director
        And I click close in header page
        And I click tab profile
        And I click menu transaction approval
        And I click tab approval has been done
        And I will see card maker that has been approved
        And I can click detail card completed
        And I will see detail card maker that has been approved
        And I close page detail card completed
        And I click button back in the header page
        And I unmask my amount
        And I will see my active balance and total amount are decreased but my blocking amount back like in beginning

    @C131496
    Scenario: Reject transaction to other bank
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
        And we don't have any notification
        And we don't have list pending task
        And I filling in form login with the following details:
            | userID      | rota3159 |
            | password    | 1234Test |
            | userIDstg   | stagfc98 |
            | passwordStg | 1234Test |
        And I click login
        And I click later in pop up biometric
        And I choose menu Transfer from main dashboard
        When I input name 'Surya Edwin' from the search box
        And I choose the friendlist
        And I input amount '10000'
        And I choose category 'Pembayaran'
        And I click choose bank transfer service
        And I choose transfer service BIFAST
        And I click transfer
        And I click transfer now
        And I input PIN '111111'
        And I will direct to page need approval from other director
        And I close page detail transfer
        And I will see indicator red in tab profile
        And I see red dot notification center
        And I click notification center
        And I will see list maker transaction in notification center
        And I click close in header page
        And I will see card account 'active'
        And I choose other
        And I click logout
        And I filling in form login with the following details:
            | userID      | rotacb82 |
            | password    | 1234Test |
            | userIDstg   | nata30bc |
            | passwordStg | 1234Test |
        And I click login
        And I click later in pop up biometric
        And I will see indicator red in tab profile
        And I see red dot notification center
        And I click notification center
        And I will see list approver transaction in notification center
        And I click notification approver transaction
        And I reject the transaction
        And I input PIN '111111' approver
        Then I will see snackbar with wording 'Anda telah menolak transaksi'
        And I will direct to page notification center
        And I will not see list approver transaction in notification center
        And I see notification transaction is rejected from other director
        And I click close in header page
        And I click tab profile
        And I click menu transaction approval
        And I click tab approval has been done
        And I will see card maker that has been rejected
        And I can click detail card completed
        And I will see detail card maker that has been rejected
        And I close page detail card completed
        And I click button back in the header page
        And I unmask my amount
        And I will see my active balance, blocking amount and total amount back like in the beginning

    @C131497
    Scenario: Make transfer out and then cancel directly
        Given I am a registered customer with following details:
            | userID      | rota3159 |
            | password    | 1234Test |
            | userIDstg   | stagfc98 |
            | passwordStg | 1234Test |
        And I don't have any notification
        And I don't have list pending task
        And I filling in form login with the following details:
            | userID      | rota3159 |
            | password    | 1234Test |
            | userIDstg   | stagfc98 |
            | passwordStg | 1234Test |
        And I click login
        And I click later in pop up biometric
        And I choose menu Transfer from main dashboard
        When I input name 'RUTH BISNIS A' from the search box
        And I choose the friendlist
        And I input amount '10000'
        And I choose category 'Pembayaran'
        And I submit to next flow
        And I click transfer now
        And I input PIN '111111'
        And I will direct to page need approval from other director
        And I canceled my transaction
        And I input password for approver
        And I submit my password for approver
        And I input OTP to approve transaction
        Then I will see snackbar with wording 'Transaksi berhasil dibatalkan'
        And I will direct to page notification center
        And I will not see list maker transaction in notification center
        And I click close in header page
        And I click tab profile
        And I click menu transaction approval
        And I click waiting approval section
        And I will not see card maker that has been canceled
        And I click tab approval has been done
        And I will see card with status has been canceled

    @C131498
    Scenario: Cancel Transaction from Menu Notification center
        Given I am a registered customer with following details:
            | userID      | rota3159 |
            | password    | 1234Test |
            | userIDstg   | stagfc98 |
            | passwordStg | 1234Test |
        And I don't have any notification
        And I don't have list pending task
        And I filling in form login with the following details:
            | userID      | rota3159 |
            | password    | 1234Test |
            | userIDstg   | stagfc98 |
            | passwordStg | 1234Test |
        And I click login
        And I click later in pop up biometric
        And I unmask my amount
        And I will see my active, blocking and total amount
        And I choose menu Transfer from main dashboard
        When I input name 'RUTH BISNIS A' from the search box
        And I choose the friendlist
        And I input amount '10000'
        And I choose category 'Pembayaran'
        And I submit to next flow
        And I click transfer now
        And I input PIN '111111'
        And I will direct to page need approval from other director
        And I close page detail transfer 
        And I unmask my amount
        And I will see my blocking amount increase but active balance decrease from amount transfer
        And I will see indicator red in tab profile
        And I see red dot notification center
        And I click notification center
        And I will see list maker transaction in notification center
        And I click notification maker transaction
        And I will direct to page need approval from other director
        And I canceled my transaction
        And I input password for approver
        And I submit my password for approver
        And I input OTP to approve transaction
        Then I will see snackbar with wording 'Transaksi berhasil dibatalkan'
        And I will direct to page notification center
        And I will not see list maker transaction in notification center
        And I click close in header page
        And I unmask my amount
        And I will see my active balance, blocking amount and total amount back like in the beginning
        And I click tab profile
        And I click menu transaction approval
        And I click waiting approval section
        And I will not see card maker that has been canceled
        And I click tab approval has been done
        And I will see card with status has been canceled

    @C131499
    Scenario: Cancel Transaction from Detail Approval Transaction
        Given I am a registered customer with following details:
            | userID      | rota3159 |
            | password    | 1234Test |
            | userIDstg   | stagfc98 |
            | passwordStg | 1234Test |
        And I don't have any notification
        And I don't have list pending task
        And I filling in form login with the following details:
            | userID      | rota3159 |
            | password    | 1234Test |
            | userIDstg   | stagfc98 |
            | passwordStg | 1234Test |
        And I click login
        And I click later in pop up biometric
        And I choose menu Transfer from main dashboard
        When I input name 'RUTH BISNIS A' from the search box
        And I choose the friendlist
        And I input amount '10000'
        And I choose category 'Pembayaran'
        And I submit to next flow
        And I click transfer now
        And I input PIN '111111'
        And I will direct to page need approval from other director
        And I close page detail transfer
        And I click tab profile
        And I click menu transaction approval
        And I click waiting approval section
        And I click card maker transaction
        And I will direct to page need approval from other director
        And I canceled my transaction
        And I input password for approver
        And I submit my password for approver
        And I input OTP to approve transaction
        Then I will see snackbar with wording 'Transaksi berhasil dibatalkan'
        And I will see card with status has been canceled
        And I can click detail card completed
        And I will see detail card maker that has been canceled
        And I close page detail card completed

    @C131500
    Scenario: Cancel Transaction then create again and approve the transaction
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
        And we don't have any notification
        And we don't have list pending task
        And I filling in form login with the following details:
            | userID      | rota3159 |
            | password    | 1234Test |
            | userIDstg   | stagfc98 |
            | passwordStg | 1234Test |
        And I click login
        And I click later in pop up biometric
        And I choose menu Transfer from main dashboard
        When I input name 'RUTH BISNIS A' from the search box
        And I choose the friendlist
        And I input amount '10000'
        And I choose category 'Pembayaran'
        And I submit to next flow
        And I click transfer now
        And I input PIN '111111'
        And I will direct to page need approval from other director
        And I close page detail transfer
        And I will see indicator red in tab profile
        And I see red dot notification center
        And I click notification center
        And I will see list maker transaction in notification center
        And I click notification maker transaction
        And I will direct to page need approval from other director
        And I canceled my transaction
        And I input password for approver
        And I submit my password for approver
        And I input OTP to approve transaction
        And I will see snackbar with wording 'Transaksi berhasil dibatalkan'
        And I will direct to page notification center
        And I will not see list maker transaction in notification center
        And I click close in header page
        And I choose menu Transfer from main dashboard
        And I input name 'RUTH BISNIS A' from the search box
        And I choose the friendlist
        And I input amount '10000'
        And I choose category 'Pembayaran'
        And I submit to next flow
        And I click transfer now
        And I input PIN '111111'
        And I will direct to page need approval from other director
        And I close page detail transfer
        And I will see card account 'active'
        And I choose other
        And I click logout
        And I filling in form login with the following details:
            | userID      | rotacb82 |
            | password    | 1234Test |
            | userIDstg   | nata30bc |
            | passwordStg | 1234Test |
        And I click login
        And I click later in pop up biometric
        And I will see indicator red in tab profile
        And I see red dot notification center
        And I click notification center
        And I will see list approver transaction in notification center
        And I click notification approver transaction
        And I approve the transaction
        And I input PIN '111111' approver
        Then I will see snackbar with wording 'Anda telah menyetujui transaksi'
        And I will direct to page notification center
        And I will not see list approver transaction in notification center
        And I click close in header page
        And I click tab profile
        And I click menu transaction approval
        And I click tab approval has been done
        And I will see card maker that has been approved
        And I can click detail card completed
        And I will see detail card maker that has been approved
        And I close page detail card completed

    @C131501
    Scenario: Approve transaction with all approval has different PIN
        Given I am a registered customer with following details:
            | userID      | nata511a |
            | password    | 1234Test |
            | userIDstg   | nata66a0 |
            | passwordStg | 1234Test |
        And I don't have any notification
        And I filling in form login with the following details:
            | userID      | nata511a |
            | password    | 1234Test |
            | userIDstg   | nata66a0 |
            | passwordStg | 1234Test |
        And I click login
        And I click later in pop up biometric
        And I choose menu Transfer from main dashboard
        When I input name 'RUTH BISNIS A' from the search box
        And I choose the friendlist
        And I input amount '10000'
        And I choose category 'Pembayaran'
        And I submit to next flow
        And I click transfer now
        And I input PIN '333333'
        And I will direct to page need approval from other director
        And I close page detail transfer
        And I will see indicator red in tab profile
        And I see red dot notification center
        And I choose other
        And I click logout
        And I filling in form login with the following details:
            | userID      | nata2082 |
            | password    | 1234Test |
            | userIDstg   | nataab7d |
            | passwordStg | 1234Test |
        And I click login
        And I click later in pop up biometric
        And I will see indicator red in tab profile
        And I see red dot notification center
        And I click notification center
        And I will see list approver transaction in notification center
        And I click notification approver transaction
        And I approve the transaction
        And I input PIN '222222' approver
        Then I will see snackbar with wording 'Anda telah menyetujui transaksi'
        And I will direct to page notification center
        And I will see notification approval change to waiting from other director
        And I click notification maker transaction
        And I will direct to page waiting approval from other director
        And I click close in header page
        And I click button back in the header page
        And I will see indicator red in tab profile
        And I see red dot notification center
        And I choose other
        And I click logout
        And I filling in form login with the following details:
            | userID      | devef63e |
            | password    | 1234Test |
            | userIDstg   | stagd02c |
            | passwordStg | 1234Test |
        And I click login
        And I click later in pop up biometric
        And I will see indicator red in tab profile
        And I see red dot notification center
        And I click notification center
        And I will see list approver transaction in notification center
        And I click notification approver transaction
        And I approve the transaction
        And I input PIN '111111' approver
        Then I will see snackbar with wording 'Anda telah menyetujui transaksi'
        And I will direct to page notification center
        And I will not see list approver transaction in notification center
        And I will not see notification approval change to waiting from other director
        And I see notification transaction is approved from other director
        And I click close in header page
        And I will not see indicator red in tab profile
        And I don't see red dot notification center
        And I click tab profile
        And I don't see counter pending task
        And I click menu transaction approval
        And I click tab approval has been done
        And I will see card maker that has been approved
        And I can click detail card completed
        And I will see detail card maker that has been approved
        And I close page detail card completed