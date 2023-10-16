Feature: Submit Loan Type AR until sign privy
    As a customer lead
    I want to submit loan and Approved by VP of bussiness

    Background:
        Given I am a registered customer with foll
            | userID   | bots2912  |
            | password | TestSmb123 |
        When I filling in form login with the foll
            | userID   | bots2912  |
            | password | TestSmb123 |
        And I click login
        Then I successed go to dashbord

    Scenario: User AR validate Limit Loan Activation Approved
        Given I have been access history loan limit to see status "Dalam Proses"
        When I access menu bar limit with status "Dalam Proses"
        Then I select first list card loan approved
        And user validate status is approved
        And user validate content limit approved page
        And user click accept the limit offer
        And user on tnc sign digital with privy page
        And user should see countdown timer is showing
        And user validate anountion information about privy
        And user validate anountion prepare the documents
        And user click button view additional document
        And user validate bottom sheet anountion "AR"
        And user should see digital signature privy aggrement page
        And user should see tnc privy page
        And user click button read and sign
        ## section sign loan aggrement on privy ##
        And user should see aggrement sign privy page
        And user click button sign on privy
        And user click button next on privy
        And user should see otp dialog
        And user click button confirmation
        And user should see notificaiton sign success
        ## section sign personal aggrement on privy ##
        And user should see aggrement sign privy page
        And user click button sign on privy
        And user click button next on privy
        And user should see otp dialog
        And user should see notif tosh otp send
        And user click button confirmation
        And user should see notificaiton sign success
        ## section waiting activation limit ##
        And user on waiting activation limit page
        And user validate title waiting check status "Proses Aktivasi Limit Pinjaman" on field "titleWaitingLimitActivation"
        And user validate subtitle waiting check status "Mohon menunggu, butuh 1-3 menit untuk mengaktivasi layanan pinjaman. " on field "subTitleWaitingLimitActivation"
        And user click button check status