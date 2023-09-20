Feature: Submit Loan Type AR Status is Approved
    As a customer lead
    I want to submit loan and Approved by VP of bussiness

    Background:
        Given I am a registered customer with foll
            | userID   | niza59ce  |
            | password | Feb042017 |
        When I filling in form login with the foll
            | userID   | niza59ce  |
            | password | Feb042017 |
        And I click login
        Then I successed go to dashbord
        And I click button loan dashboard
        And user click button ajukan pinjaman
        And user on loan type page
        And user select loan type "AR"
        And user click button lihat skema pinjaman
        And user on loan schema "AR"
        And user click button select the schema

    @C83807 @LoanApp
    Scenario: User success fill data buyer and submit the loan
        Given user on buyer cooperating page
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
        And user validate description prepare the following documents
        And user close button
        And user click button upload documents
        # section upload document
        Given user upload document nib
        And user upload document deed of company
        And user upload document sk kemenkumham
        And user upload document npwp of company
        And user upload document proof of purchase with the buyer
        And user upload document payment mutation for the last 6 months
        And user upload document financial reports in the last 1 year
        And user click button refresh
        And user click back button to loan processing
        # section trigered status loan
        And user trigered api change status loan is "approved"
        And user validate status is "approved"