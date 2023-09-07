Feature: History Page
    In order to test history loan page
    As a customer
    I am able to view all history limit loan

    Background: Login with registered account
        Given I am registered customer with following details:
            | userID   | ruthad74 |
            | password | Test1234 |
        When I am filling in my account information with the following details:
            | userID   | ruthad74 |
            | password | Test1234 |
        And login with registered account
        Then I successed go to dashbord

    Scenario: Access History Limit Dashboard
        Given I have been access loan dashboard to see history loan
        When I am accessing history
        Then History loan page will be showed

    Scenario: Access History Dashboard For 'Pencairan' Bar
        Given I have been access history loan to see menu 'Pencairan'
        When I access menu bar 'Pencairan'
        Then I should see history 'Pencairan'

    Scenario: Access History Dashboard For 'Limit' Bar
        Given I have been access history loan to see menu 'Limit'
        When I access menu bar 'Limit'
        Then I should see history 'Limit'

    Scenario: Access History Dashboard For 'Tagihan' Bar
        Given I have been access history loan to see menu 'Tagihan'
        When I access menu bar 'Tagihan'
        Then I should see history 'Tagihan'

    Scenario: Access History Limit Dashboard For 'Dalam Proses' Bar
        Given I have been access history loan limit to see status 'Dalam Proses'
        When I access menu bar limit with status 'Dalam Proses'
        Then I should see history limit on process

    Scenario: Access History Limit Dashboard For 'Aktif' Bar
        Given I have been access history loan limit to see status 'Aktif'
        When I access menu bar limit with status 'Aktif'
        Then I should see history limit active

    Scenario: Access History Limit Dashboard For 'Selesai' Bar
        Given I have been access history loan limit to see status 'Selesai'
        When I access menu bar limit with status 'Selesai'
        Then I should see history limit done