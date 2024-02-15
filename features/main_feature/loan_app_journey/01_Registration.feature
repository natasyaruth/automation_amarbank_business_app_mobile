@registration_lending
Feature: Registration from Lending
    As a customer
    I want to register from loan application

    Background:
        Given I am a registered customer with following details:
            | userID   | alfi00e5 |
            | password | 1234Test |
        When I filling in form login with the following details:
            | userID   | alfi00e5 |
            | password | 1234Test |
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
        And user fill search anchor "PT Tirta Investama"
        And user select result of search
        And user select the date cooperating
        And user click button next
        And user filling field "amountLoanField" with "5000000000"
        And user select the tenor "1Month"
        And user click button next on select loan amount page
        And user select location jabodetabek
        And user click button continue complete the data
        And user click button next
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
        And user fill search anchor "PT Tirta Investama"
        And user select result of search
        And user select the date cooperating
        And user click button next
        And user filling field "amountLoanField" with "5000000000"
        And user select the tenor "1Month"
        And user click button next on select loan amount page
        And user select location jabodetabek
        And user click button continue complete the data
        And user click button next
        And I choose legality business type 'cv'
        And I submit my legality type
        And I update my last journey step to 'Data Employment'
        And I continue to process KYB
        And I fill my business profile as followings:
            | businessName      | PT. BOTOL MINUM PERKASA RAYA DAN JAYA |
            | industry          | Jasa                                  |
            | businessField     | Restoran                              |
            | monthlyIncome     | 30 - 50 juta                          |
            | npwp              | 906283213036000                       |
            | nib               | 9129106701234                         |
            | businessDateStart | 10/10/2010                            |
        And I submit my business profile
        And I submit business director list
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
        And user fill search anchor "PT Tirta Investama"
        And user select result of search
        And user select the date cooperating
        And user click button next
        And user filling field "amountLoanField" with "5000000000"
        And user select the tenor "1Month"
        And user click button next on select loan amount page
        And user select location jabodetabek
        And user click button continue complete the data
        And user click button next
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
        And user fill search anchor "PT Tirta Investama"
        And user select result of search
        And user select the date cooperating
        And user click button next
        And user filling field "amountLoanField" with "5000000000"
        And user select the tenor "1Month"
        And user click button next on select loan amount page
        And user select location jabodetabek
        And user click button continue complete the data
        And user click button next
        And I choose legality business type 'cv'
        And I submit my legality type
        And I update my last journey step to 'Data Employment'
        And I continue to process KYB
        And I fill my business profile as followings:
            | businessName      | PT. BOTOL MINUM PERKASA RAYA DAN JAYA |
            | industry          | Jasa                                  |
            | businessField     | Restoran                              |
            | monthlyIncome     | 30 - 50 juta                          |
            | npwp              | 906283213036000                       |
            | nib               | 9129106701234                         |
            | businessDateStart | 10/10/2010                            |
        And I submit my business profile
        And I submit business director list
        Then I will see checkbox Rights & Policy and T&C about loan