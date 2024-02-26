Feature: Maker and Approver Transaction
    In order to create transaction in business type company and CV
    As a director
    I want to approve or reject transaction from other director

    Scenario: Validate menu transaction approval with type individual
        Given I am a registered customer with following details:
            | userID   | autocaea |
            | password | 1234Test |
        And I filling in form login with the following details:
            | userID   | autocaea |
            | password | 1234Test |
        And I click login
        And I click later
        When I click tab profile
        Then I will not see menu transaction approval
        And I will not see menu download power of attorney
        And I will not see menu document management

    Scenario: Validate menu transaction approval with type individual business
        Given I am a registered customer with following details:
            | userID   | autocaea |
            | password | 1234Test |
        And I filling in form login with the following details:
            | userID   | autocaea |
            | password | 1234Test |
        And I click login
        And I click later
        When I click tab profile
        Then I will not see menu transaction approval
        And I will see menu download power of attorney
        And I will see menu document management

    Scenario: Validate menu transaction approval with type UD
        Given I am a registered customer with following details:
            | userID   | autocaea |
            | password | 1234Test |
        And I filling in form login with the following details:
            | userID   | autocaea |
            | password | 1234Test |
        And I click login
        And I click later
        When I click tab profile
        Then I will not see menu transaction approval
        And I will see menu download power of attorney
        And I will see menu document management

    Scenario: Validate card maker after make transfer out with type business other than company and CV
        Given I am a registered customer with following details:
            | userID   | autocaea |
            | password | 1234Test |
        And I filling in form login with the following details:
            | userID   | autocaea |
            | password | 1234Test |
        And I click login
        And I click later
        And I choose menu Transfer from main dashboard
        When I input name 'Surya Edwin' from the search box
        And I choose the friendlist
        And I input amount '1000000'
        And I choose category 'Pembayaran'
        And I submit to next flow
        And I click transfer now
        And I input PIN '111111'
        And I successfully transferred
        And I close page detail transfer
        Then I don't see any card transaction in main dashboard

    Scenario: Validate page approval transaction empty state
        Given I am a registered customer with following details:
            | userID   | autocaea |
            | password | 1234Test |
        And I filling in form login with the following details:
            | userID   | autocaea |
            | password | 1234Test |
        And I click login
        And I click later
        And I don't see any card transaction in main dashboard
        When I click tab profile
        And I click menu transaction approval
        Then I will see page transaction approval is empty
        And I click waiting approval section
        And I will see page transaction approval is empty
        And I click tab approval has been done
        And I will see page transaction approval is empty

    Scenario: Validate card maker after make transfer out with type business company or CV
        Given I am a registered customer with following details:
            | userID   | autocaea |
            | password | 1234Test |
        And I filling in form login with the following details:
            | userID   | autocaea |
            | password | 1234Test |
        And I click login
        And I click later
        And I choose menu Transfer from main dashboard
        When I input name 'Surya Edwin' from the search box
        And I choose the friendlist
        And I input amount '1000000'
        And I choose category 'Pembayaran'
        And I submit to next flow
        And I click transfer now
        And I input PIN '111111'
        Then I will direct to page need approval from other director
        And I close page detail transfer
        And I will see card maker transaction in main dashboard
        And I click card maker transaction
        And I will direct to page need approval from other director
        And there is no button approve and reject the transaction

    Scenario: Back to main dashboard from detail card maker
        Given I am a registered customer with following details:
            | userID   | autocaea |
            | password | 1234Test |
        And I filling in form login with the following details:
            | userID   | autocaea |
            | password | 1234Test |
        And I click login
        And I click later
        When I click card maker transaction
        And I close page detail transfer
        Then I will see card maker transaction

    Scenario: Back to page approve transaction from detail transaction waiting for approval
        Given I am a registered customer with following details:
            | userID   | autocaea |
            | password | 1234Test |
        And I filling in form login with the following details:
            | userID   | autocaea |
            | password | 1234Test |
        And I click login
        And I click later
        When I click tab profile
        And I click menu transaction approval
        And I click waiting approval section
        And I click card maker transaction
        And I close page detail transfer
        Then I will direct to page transaction approval

    Scenario: Back to menu profile from detail approval transaction
        Given I am a registered customer with following details:
            | userID   | autocaea |
            | password | 1234Test |
        And I filling in form login with the following details:
            | userID   | autocaea |
            | password | 1234Test |
        And I click login
        And I click later
        When I click tab profile
        And I click menu transaction approval
        And I will direct to page transaction approval
        And I click button back in the header page
        Then I will direct to tab profile

    Scenario: Validate card maker in approval transaction from main dashboard
        Given I am a registered customer with following details:
            | userID   | autocaea |
            | password | 1234Test |
        And I filling in form login with the following details:
            | userID   | autocaea |
            | password | 1234Test |
        And I click login
        And I click later
        And I see card maker transaction
        When I click see all approval transaction from main dashboard
        And I click waiting approval section
        And I will see card maker with information same with card in main dashboard

    Scenario: Back to main dashboard from detail approval transaction
        Given I am a registered customer with following details:
            | userID   | autocaea |
            | password | 1234Test |
        And I filling in form login with the following details:
            | userID   | autocaea |
            | password | 1234Test |
        And I click login
        And I click later
        And I see card maker transaction
        When I click see all approval transaction from main dashboard
        And I click button back in the header page
        Then I will see card maker transaction

    Scenario: Validate detail transaction need to approve
        Given I am a registered customer with following details:
            | userID   | autocaea |
            | password | 1234Test |
        And I filling in form login with the following details:
            | userID   | autocaea |
            | password | 1234Test |
        And I click login
        And I click later
        And I choose menu Transfer from main dashboard
        When I input name 'Surya Edwin' from the search box
        And I choose the friendlist
        And I input amount '1000000'
        And I choose category 'Pembayaran'
        And I submit to next flow
        And I click transfer now
        And I input PIN '111111'
        And I will direct to page need approval from other director
        And I close page detail transfer
        And I will see card maker transaction
        And I choose other
        And I click logout
        And I filling in form login with the following details:
            | userID   | autocaea |
            | password | 1234Test |
        And I click login
        And I click later
        And I will see card approver transaction in main dashboard
        When I click card approver transaction
        Then I will direct to page waiting for approval from other director
        And along with button approve and reject the transaction

    Scenario: Back to page approval transaction from detail transaction need to approve
        Given I am a registered customer with following details:
            | userID   | autocaea |
            | password | 1234Test |
        And I filling in form login with the following details:
            | userID   | autocaea |
            | password | 1234Test |
        And I click login
        And I click later
        When I click tab profile
        And I click menu transaction approval
        And I click card approver transaction
        And I close page detail approval transaction
        Then I will direct to page transaction approval

    Scenario: Access call center in page detail transaction
        Given I am a registered customer with following details:
            | userID   | autocaea |
            | password | 1234Test |
        And I filling in form login with the following details:
            | userID   | autocaea |
            | password | 1234Test |
        And I click login
        And I click later
        And I click card approver transaction
        And I click help center
        Then I will see helping center via whatsapp and email

    Scenario: Validate card approver after another director make transfer out
        Given I am a registered customer with following details:
            | userID   | autocaea |
            | password | 1234Test |
        And I filling in form login with the following details:
            | userID   | autocaea |
            | password | 1234Test |
        And I click login
        And I click later
        And I choose menu Transfer from main dashboard
        When I input name 'Surya Edwin' from the search box
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
        Then I will see card approver transaction in main dashboard

    Scenario: Back to main dashboard from detail card approver
        Given I am a registered customer with following details:
            | userID   | autocaea |
            | password | 1234Test |
        And I filling in form login with the following details:
            | userID   | autocaea |
            | password | 1234Test |
        And I click login
        And I click later
        When I click card approver transaction
        And I close page detail transfer
        Then I will see card approver transaction

    Scenario: Input wrong password once when user want to approve transaction
        Given I am a registered customer with following details:
            | userID   | autocaea |
            | password | 1234Test |
        And I filling in form login with the following details:
            | userID   | autocaea |
            | password | 1234Test |
        And I click login
        And I click later
        When I click card approver transaction
        And I approve the transaction
        And I input incorrect password for approver
        And I submit my password for approver
        Then I will see pop up password is incorrect

    Scenario: Input wrong password more than 3 times when user want to approve transaction
        Given I am a registered customer with following details:
            | userID   | autocaea |
            | password | 1234Test |
        And I filling in form login with the following details:
            | userID   | autocaea |
            | password | 1234Test |
        And I click login
        And I click later
        When I click card approver transaction
        And I approve the transaction
        And I input incorrect password for approver
        And I submit my password for approver
        And I will see pop up password is incorrect
        And I try again to input password
        And I input incorrect password for approver
        And I submit my password for approver
        And I will see pop up password is incorrect
        And I try again to input password
        And I input incorrect password for approver
        And I submit my password for approver
        Then I will notify I will direct lo login page
        And I click button direct to login
        And I will directing to page login

    Scenario: Unmask password
        Given I am a registered customer with following details:
            | userID   | autocaea |
            | password | 1234Test |
        And I filling in form login with the following details:
            | userID   | autocaea |
            | password | 1234Test |
        And I click login
        And I click later
        When I click card approver transaction
        And I approve the transaction
        And I input password for approver
        And I Unmask the password
        Then I will not see my password

    Scenario: Mask password
        Given I am a registered customer with following details:
            | userID   | autocaea |
            | password | 1234Test |
        And I filling in form login with the following details:
            | userID   | autocaea |
            | password | 1234Test |
        And I click login
        And I click later
        When I click card approver transaction
        And I approve the transaction
        And I input password for approver
        And I Unmask the password
        And I Mask the password
        Then I will see my password

    Scenario: Close page input password entry point detail card from main dashboard
        Given I am a registered customer with following details:
            | userID   | autocaea |
            | password | 1234Test |
        And I filling in form login with the following details:
            | userID   | autocaea |
            | password | 1234Test |
        And I click login
        And I click later
        When I click card approver transaction
        And I approve the transaction
        And I close page password for transaction approval
        Then I will direct to page detail approval transaction

    Scenario: Close page input password entry point detail card from page transaction approval
        Given I am a registered customer with following details:
            | userID   | autocaea |
            | password | 1234Test |
        And I filling in form login with the following details:
            | userID   | autocaea |
            | password | 1234Test |
        And I click login
        And I click later
        When I click tab profile
        And I click menu transaction approval
        And I click card approver transaction
        And I approve the transaction
        And I input password for approver
        And I close page password for transaction approval
        Then I will direct to page detail approval transaction

    Scenario: Close page input password entry point card from page transaction approval
        Given I am a registered customer with following details:
            | userID   | autocaea |
            | password | 1234Test |
        And I filling in form login with the following details:
            | userID   | autocaea |
            | password | 1234Test |
        And I click login
        And I click later
        When I click tab profile
        And I click menu transaction approval
        And I approve the transaction
        And I input password for approver
        And I close page password for transaction approval
        Then I will direct to page detail approval transaction

    Scenario: Verifying wrong OTP code
        Given I am a registered customer with following details:
            | userID   | autocaea |
            | password | 1234Test |
        And I filling in form login with the following details:
            | userID   | autocaea |
            | password | 1234Test |
        And I click login
        And I click later
        When I click card approver transaction
        And I approve the transaction
        And I input password for approver
        And I input incorrect OTP for approve transaction
        Then I will see message error 'Kode OTP yang dimasukkan salah' in the below of field otp for approver

    Scenario: Verifying expired OTP code
        Given I am a registered customer with following details:
            | userID   | autocaea |
            | password | 1234Test |
        And I filling in form login with the following details:
            | userID   | autocaea |
            | password | 1234Test |
        And I click login
        And I click later
        When I click card approver transaction
        And I approve the transaction
        And I input password for approver
        And I let the otp code for approve transaction expire
        And I input OTP to approve transaction
        Then I will see message error 'Kode OTP yang dimasukan sudah kadaluarsa' in the below of field otp for approver

    Scenario: Verifying wrong OTP code five times
        Given I am a registered customer with following details:
            | userID   | autocaea |
            | password | 1234Test |
        And I filling in form login with the following details:
            | userID   | autocaea |
            | password | 1234Test |
        And I click login
        And I click later
        When I click card approver transaction
        And I approve the transaction
        And I input password for approver
        And I input incorrect OTP '5' times
        Then I should be notified that I can verify the OTP tomorrow

    Scenario: Resend OTP code
        Given I am a registered customer with following details:
            | userID   | autocaea |
            | password | 1234Test |
        And I filling in form login with the following details:
            | userID   | autocaea |
            | password | 1234Test |
        And I click login
        And I click later
        When I click card approver transaction
        And I approve the transaction
        And I input password for approver
        And I resend otp code to approve transaction
        Then I will get new OTP different with my first OTP to approve transaction
        And I will see attempt left '1/5'

    Scenario: Resend OTP code more than five times
        Given I am a registered customer with following details:
            | userID   | autocaea |
            | password | 1234Test |
        And I filling in form login with the following details:
            | userID   | autocaea |
            | password | 1234Test |
        And I click login
        And I click later
        When I click card approver transaction
        And I approve the transaction
        And I input password for approver
        And I resend otp code to approve transaction five times
        Then I should be notified that I can verify the OTP tomorrow

    Scenario: Verifying wrong OTP code four times then input valid code
        Given I am a registered customer with following details:
            | userID   | autocaea |
            | password | 1234Test |
        And I filling in form login with the following details:
            | userID   | autocaea |
            | password | 1234Test |
        And I click login
        And I click later
        And I choose menu Transfer from main dashboard
        When I input name 'Surya Edwin' from the search box
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
        When I click card approver transaction
        And I approve the transaction
        And I input password for approver
        And I input incorrect OTP '4' times
        And I input OTP to approve transaction
        Then I will direct to page transaction approval

    Scenario: Approve transaction from detail card maker
        Given I am a registered customer with following details:
            | userID   | autocaea |
            | password | 1234Test |
        And I filling in form login with the following details:
            | userID   | autocaea |
            | password | 1234Test |
        And I click login
        And I click later
        And I choose menu Transfer from main dashboard
        When I input name 'Surya Edwin' from the search box
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
        When I click card approver transaction
        And I approve the transaction
        And I input password for approver
        And I input OTP to approve transaction
        Then I will direct to page transaction approval
        And I will not see card approver that has been approved
        And I will see snackbar with wording 'Anda telah menyetujui transaksi '
        And I can click link to see the transaction with status 'Transaksi Disetujui'

    Scenario: Approve transaction from detail approval transaction
        Given I am a registered customer with following details:
            | userID   | autocaea |
            | password | 1234Test |
        And I filling in form login with the following details:
            | userID   | autocaea |
            | password | 1234Test |
        And I click login
        And I click later
        And I choose menu Transfer from main dashboard
        When I input name 'Surya Edwin' from the search box
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
        When I click tab profile
        And I click menu transaction approval
        And I approve the transaction
        And I input password for approver
        And I input OTP to approve transaction
        Then I will direct to page transaction approval
        And I will not see card approver that has been approved
        And I will see snackbar with wording 'Anda telah menyetujui transaksi '
        And I can click link to see the transaction with status 'Transaksi Disetujui'

    Scenario: Reject transaction from detail card maker
        Given I am a registered customer with following details:
            | userID   | autocaea |
            | password | 1234Test |
        And I filling in form login with the following details:
            | userID   | autocaea |
            | password | 1234Test |
        And I click login
        And I click later
        And I choose menu Transfer from main dashboard
        When I input name 'Surya Edwin' from the search box
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
        When I click card approver transaction
        And I reject the transaction
        And I input password for approver
        And I input OTP to approve transaction
        Then I will direct to page transaction approval
        And I will not see card approver that has been rejected
        And I will see snackbar with wording 'Anda telah menolak transaksi'
        And I can click link to see the transaction with status 'Transaksi Ditolak'

    Scenario: Reject transaction from detail approval transaction
        Given I am a registered customer with following details:
            | userID   | autocaea |
            | password | 1234Test |
        And I filling in form login with the following details:
            | userID   | autocaea |
            | password | 1234Test |
        And I click login
        And I click later
        And I choose menu Transfer from main dashboard
        When I input name 'Surya Edwin' from the search box
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
        When I click tab profile
        And I click menu transaction approval
        And I reject the transaction
        And I input password for approver
        And I input OTP to approve transaction
        Then I will direct to page transaction approval
        And I will not see card approver that has been rejected
        And I will see snackbar with wording 'Anda telah menolak transaksi'
        And I can click link to see the transaction with status 'Transaksi Ditolak'