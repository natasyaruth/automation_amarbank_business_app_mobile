Feature: Submit Loan Type AP until sign privy
    As a customer lead
    I want to submit loan and Approved by VP of bussiness

    Background:
        Given I am a registered customer with foll
            | userID   | botseb19  |
            | password | TestSmb123 |
        When I filling in form login with the foll
            | userID   | botseb19  |
            | password | TestSmb123 |
        And I click login
        And I click later
        Then I will direct to dashboard
        And I click menu tab testing
        Then I successed go to dashbord

    Scenario: User AP validate Limit Loan Activation Approved
        Given I have been access history loan limit to see status "Dalam Proses"
        When I access menu bar limit with status "Dalam Proses"
        Then I select first list card loan approved
        And user validate status is approved
        And user validate content limit approved page
        And user click accept the limit offer
        And user should see text view "Dokumen Surat Kuasa" on bottom sheet "titleSuratKuasa"
        And user should see label tnc information download surat kuasa
        And user should see step "first" download surat kuasa
        And user should see step "two" download surat kuasa
        And user should see step "three" download surat kuasa
        And user should see step "four" download surat kuasa
        And user click button Download Dokumen Surat Kuasa
        And user validate tosh message success download
        And user click field Download Surat Kuasa
        And user click button Nanti Saja Dokumen Surat Kuasa
        And user click field Download Surat Kuasa
        And user click button close on bottom sheet 
        And user click icon information Tanda Tangan Digital via Privy
        And user validate text view information privy
        And user validate text view prepare document
        And user click checkbox tnc
        ##And user on tnc sign digital with privy page
        ##And user should see countdown timer is showing
        ##And user validate anountion information about privy
        ##And user validate anountion prepare the documents
        ##And user click button view additional document
        ##And user validate bottom sheet anountion "AP"
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