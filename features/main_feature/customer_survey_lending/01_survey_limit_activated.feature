Feature: CSAT for Lending
    In order to give feedback after limit activated
    As a Customer
    I want to give rating and feedback


Background: User must login to home dashboard
    Given I am a registered customer with following details:
      | userID   | trys5524 |
      | password | Eca12345 |
    When I filling in form login with the following details:
      | userID   | trys5524 |
      | password | Eca12345 |
    And I click login
    And I click later
    Then I will direct to main dashboard


    Scenario: Validate CSAT will displayed after limit has been activated on AP MSME
        Given I am a customer who wants to see CSAT after activated limit
        When I received push notif on mobile
        And I click the notif
        And I will direct to page Offering limit AP MSME
        And I see CSAT will displayed in page active loan 

    Scenario: Validate CSAT will displayed after limit has been activated on AR MSME
        Given I am a customer who wants to see CSAT after activated limit
        When I received push notif on mobile
        And I click the notif
        And I will direct to page Offering limit AR MSME
        And I see CSAT will displayed in page active loan 

    Scenario: Validate CSAT will displayed after limit has been activated on PO MSME
        Given I am a customer who wants to see CSAT after activated limit
        When I received push notif on mobile
        And I click the notif
        And I will direct to page Offering limit PO MSME
        And I see CSAT will displayed in page active loan 

    Scenario: Validate CSAT will displayed after limit has been activated on AP Corp
        Given I am a customer who wants to see CSAT after activated limit
        When I received push notif on mobile
        And I click the notif
        And I will direct to page Offering limit AP Corp
        And I see CSAT will displayed in page active loan 

    Scenario: Validate CSAT will displayed after limit has been activated on AR Corp
        Given I am a customer who wants to see CSAT after activated limit
        When I received push notif on mobile
        And I click the notif
        And I will direct to page Offering limit AR Corp
        And I see CSAT will displayed in page active loan 


    Scenario: Add scenario for give 5 rating on after limit activated
        Given I am a customer who wants to see CSAT after activated limit
        When I received push notif on mobile
        And I click the notif
        And I will direct to page Offering limit AR Corp
        And I see CSAT will displayed in page active loan 
        And I give '5' for activated limit
        And I click Kirim Penilaian
        Then I will see toastbar my survey is sent
        And I will not see rating survey is in active loan

     Scenario: Add scenario for give 4 rating on after limit activated
        Given I am a customer who wants to see CSAT after activated limit
        When I received push notif on mobile
        And I click the notif
        And I will direct to page Offering limit AR Corp
        And I see CSAT will displayed in page active loan 
        And I give '4' for activated limit
        And I click Kirim Penilaian
        Then I will see toastbar my survey is sent
        And I will not see rating survey is in active loan

    Scenario: Add scenario for give 3 rating on after limit activated
        Given I am a customer who wants to see CSAT after activated limit
        When I received push notif on mobile
        And I click the notif
        And I will direct to page Offering limit AR Corp
        And I see CSAT will displayed in page active loan 
        And I give '3' for activated limit
        And I will see comment box to give feedback
        And I input feedback survey 'Not good'
        And I click Kirim Penilaian
        Then I will see toastbar my survey is sent
        And I will not see rating survey is in active loan

    Scenario: Add scenario for give 2 rating on after limit activated
        Given I am a customer who wants to see CSAT after activated limit
        When I received push notif on mobile
        And I click the notif
        And I will direct to page Offering limit AR Corp
        And I see CSAT will displayed in page active loan 
        And I give '2' for activated limit
        And I will see comment box to give feedback
        And I input feedback survey 'Not good'
        And I click Kirim Penilaian
        Then I will see toastbar my survey is sent
        And I will not see rating survey is in active loa

    Scenario: Add scenario for give 1 rating on after limit activated
        Given I am a customer who wants to see CSAT after activated limit
        When I received push notif on mobile
        And I click the notif
        And I will direct to page Offering limit AR Corp
        And I see CSAT will displayed in page active loan 
        And I give '1' for activated limit
        And I will see comment box to give feedback
        And I input feedback survey 'Not good'
        And I click Kirim Penilaian
        Then I will see toastbar my survey is sent
        And I will not see rating survey is in active loan

    Scenario: Validate CSAT will open on main dashboard if limit created page not open
        Given I am a customer who wants to see CSAT after activated limit
        When I received push notif on mobile
        And I click the notif
        And I will direct to page Offering limit AR Corp
        And I see CSAT will displayed in page active loan 
        And I close the apps
        And I go back to
        Then I will see pop up rating survey is in main dashboard
        
    Scenario: failed send CSAT
        Given I am a customer who wants to see CSAT after activated limit
        When I received push notif on mobile
        And I click the notif
        And I will direct to page Offering limit AR Corp
        And I see CSAT will displayed in page active loan 
        And I give '1' for activated limit
        And I will see comment box to give feedback
        And I click Kirim Penilaian
        Then I will see toastbar my survey is failed




    
        