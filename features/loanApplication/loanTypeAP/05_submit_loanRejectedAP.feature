Feature: Submit Loan Type AP Status is Rejected
    As a customer lead
    I want to submit loan and rejected by vp of bussiness

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

    Scenario: User AP success fill data buyer and submit the loan and rejected the limit
        Given I click button loan dashboard
        And user click button ajukan pinjaman
        And user on loan type page
        And user select loan type "AP"
        And user click button lihat skema pinjaman
        And user on loan schema "AP"
        And user click button select the schema
        When user on the anchor page
        And user click icon other anchor
        And user fill a field "anchorName" with "UD Combo Box Fire"
        And user select industry type
        And user select the date cooperating
        When user click button next
        And user on select loan amount page
        And user filling field "amountLoanField" with "200000000"
        And user select the tenor "1Month"
        And user click button next on select loan amount page
        And user on legality business page
        And user select legality business type
        And user select business establishment date
        And user select the day date "Previous"
        And user select the month date "Previous"
        And user select the year date "Previous"
        Then user choose the date
        And user click button next on legality business page
        And user on head office location page
        And user select location jabodetabek
        And user click button next on head office location page
        And user on success apply loan page
        And user click button continue complete the data
        And user click button next completed data
        And user close the bottom sheet
        And user on monitoring loan process page
        And user click view required documents button
        And user validate text prepare the following documents
        And user validate description prepare the following documents "AP"
        And user click button upload documents
        # section upload document
        Given user on upload document page
        # When user upload document "nib"
        # And user upload document "deedOfComp"
        # And user upload document "SKKemen"
        # And user upload document "npwpOfComp"
        And user upload document "proofOfPurchase"
        And user upload document "paymentMutation"
        And user upload document "financialReports"
        And user click button refresh
        And user click back button to loan processing
        # section trigered status loan
        And user trigered api change status loan is rejected

    Scenario: User AP validate Limit Loan Activation Rejected
        Given I have been access history loan limit to see status "Selesai"
        When I access menu bar limit with status "Selesai"
        Then I select first list card loan rejected
        And user validate status is rejected
        And user validate content limit rejected page
