Feature: Registration from Lending
    As a customer
    I want to register from loan application

    Background:
        Given I am a registered customer with following details:
            | userID   | ruth0236 |
            | password | Test1234 |
        When I filling in form login with the following details:
            | userID   | ruth0236 |
            | password | Test1234 |
        And I click login
        And I swipe to card Giro Account
        And I choose Giro Account

    Scenario: Validate Checkbox T&C in page Data Employment business type Individual when product type is MSME
        Given I am a customer want choose product type MSME
        When I click menu tab testing
        And I successed go to dashbord
        And I click button loan dashboard
        And user click button ajukan pinjaman
        And user select loan type "AP"
        And user click button lihat skema pinjaman
        And user click button select the schema
        And user on the anchor page
        And user click icon other anchor
        And user on anchor cooperating page
        And user fill a field "anchorName" with "UD Dagangan"
        And user select industry type
        And user select the date cooperating
        And user click button next
        And user filling field "amountLoanField" with "500000000"
        And user select the tenor "1Month"
        And user click button next on select loan amount page
        And user select location jabodetabek
        And user click button continue complete the data
        And I choose legality business type 'individual'
        And I submit my legality type
        And I update my last journey step to 'Data Domicile Address'
        Then I will see checkbox Rights & Policy, T&C about loan and Privy

    Scenario: Validate Checkbox T&C in page Data Employment business type Company when product type is MSME
        Given I am a customer want choose product type MSME
        When I click menu tab testing
        And I successed go to dashbord
        And I click button loan dashboard
        And user click button ajukan pinjaman
        And user select loan type "AP"
        And user click button lihat skema pinjaman
        And user click button select the schema
        And user on the anchor page
        And user click icon other anchor
        And user on anchor cooperating page
        And user fill a field "anchorName" with "UD Dagangan"
        And user select industry type
        And user select the date cooperating
        And user click button next
        And user filling field "amountLoanField" with "500000000"
        And user select the tenor "1Month"
        And user click button next on select loan amount page
        And user select location jabodetabek
        And user click button continue complete the data
        And I choose legality business type 'cv'
        And I submit my legality type
        And I update my last journey step to 'Data Domicile Address'
        Then I will see checkbox Rights & Policy, T&C about loan and Privy

    Scenario: Validate Checkbox T&C in page Data Employment business type Individual when product type is BB
        Given I am a customer want choose product type BB
        When I click menu tab testing
        And I successed go to dashbord
        And I click button loan dashboard
        And user click button ajukan pinjaman
        And user select loan type "AP"
        And user click button lihat skema pinjaman
        And user click button select the schema
        And user on the anchor page
        And user click icon other anchor
        And user on anchor cooperating page
        And user fill a field "anchorName" with "UD Dagangan"
        And user select industry type
        And user select the date cooperating
        And user click button next
        And user filling field "amountLoanField" with "500000000"
        And user select the tenor "1Month"
        And user click button next on select loan amount page
        And user select location jabodetabek
        And user click button continue complete the data
        And I choose legality business type 'individual'
        And I submit my legality type
        And I update my last journey step to 'Data Domicile Address'
        Then I will see checkbox Rights & Policy and T&C about loan

    Scenario: Validate Checkbox T&C in page Data Employment business type Company when product type is BB
        Given I am a customer want choose product type BB
        When I click menu tab testing
        And I successed go to dashbord
        And I click button loan dashboard
        And user click button ajukan pinjaman
        And user select loan type "AP"
        And user click button lihat skema pinjaman
        And user click button select the schema
        And user on the anchor page
        And user click icon other anchor
        And user on anchor cooperating page
        And user fill a field "anchorName" with "UD Dagangan"
        And user select industry type
        And user select the date cooperating
        And user click button next
        And user filling field "amountLoanField" with "500000000"
        And user select the tenor "1Month"
        And user click button next on select loan amount page
        And user select location jabodetabek
        And user click button continue complete the data
        And I choose legality business type 'cv'
        And I submit my legality type
        And I update my last journey step to 'Data Domicile Address'
        Then I will see checkbox Rights & Policy and T&C about loan

