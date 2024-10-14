Feature: CSAT for Lending
    In order to give feedback after limit rejected
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


    Scenario: Validate CSAT will displayed after limit has been rejected on AP MSME
        Given I am a customer whose limit has been rejected
        When I go to Aktivitas Pinjaman
        And I click tab Selesai
        And I click card AP MSME reject status
        And I will direct to page rejected limit AP MSME
        Then I see CSAT will displayed in page rejected limit

     Scenario: Validate CSAT will displayed after limit has been rejected on AR MSME
        Given I am a customer whose limit has been rejected
        When I go to Aktivitas Pinjaman
        And I click tab Selesai
        And I click card AP MSME reject status
        And I will direct to page rejected limit AR MSME
        Then I see CSAT will displayed in page rejected limit

     Scenario: Validate CSAT will displayed after limit has been rejected on PO MSME
        Given I am a customer whose limit has been rejected
        When I go to Aktivitas Pinjaman
        And I click tab Selesai
        And I click card AP MSME reject status
        And I will direct to page rejected limit PO MSME
        Then I see CSAT will displayed in page rejected limit

    Scenario: Add scenario for give 5 rating on after rejected limit
        Given I am a customer whose limit has been rejected
        When I go to Aktivitas Pinjaman
        And I click tab Selesai
        And I click card AP MSME reject status
        And I will direct to page rejected limit PO MSME
        And I see CSAT will displayed in page rejected limit
        And I give '5' for rejected  limit
        And I click Kirim Penilaian
        Then I will see toastbar my survey is sent


     Scenario: Add scenario for give 4 rating on after rejected limit
       Given I am a customer whose limit has been rejected
        When I go to Aktivitas Pinjaman
        And I click tab Selesai
        And I click card AP MSME reject status
        And I will direct to page rejected limit PO MSME
        And I see CSAT will displayed in page rejected limit
        And I give '4' for rejected limit
        And I click Kirim Penilaian
        Then I will see toastbar my survey is sent

    Scenario: Add scenario for give 3 rating on after rejected limit
       Given I am a customer whose limit has been rejected
        When I go to Aktivitas Pinjaman
        And I click tab Selesai
        And I click card AP MSME reject status
        And I see CSAT will displayed in page rejected limit
        And I give '3' for rejected limit
        And I will see comment box to give feedback
        And I input feedback survey 'Not good'
        And I click Kirim Penilaian
        Then I will see toastbar my survey is sent

    Scenario: Add scenario for give 2 rating on after rejected limit
        Given I am a customer whose limit has been rejected
        When I go to Aktivitas Pinjaman
        And I click tab Selesai
        And I click card AP MSME reject status
        And I see CSAT will displayed in page rejected limit
        And I give '2' for rejected limit
        And I will see comment box to give feedback
        And I input feedback survey 'Not good'
        And I click Kirim Penilaian
        Then I will see toastbar my survey is sent

    Scenario: Add scenario for give 1 rating on after rejected limit
        Given I am a customer whose limit has been rejected
        When I go to Aktivitas Pinjaman
        And I click tab Selesai
        And I click card AP MSME reject status
        And I will direct to page rejected limit PO MSME
        And I see CSAT will displayed in page rejected limit
        And I give '1' for rejected  limit
        And I will see comment box to give feedback
        And I input feedback survey 'Not good'
        And I click Kirim Penilaian
        Then I will see toastbar my survey is sent
         
    Scenario: failed send CSAT
      Given I am a customer whose limit has been rejected
        When I go to Aktivitas Pinjaman
        And I click tab Selesai
        And I click card AP MSME reject status       
        And I see CSAT will displayed in page rejected limit
        And I give '3' for activated limit
        And I will see comment box to give feedback
        And I input feedback survey 'Not good'
        And I click Kirim Penilaian
        Then I will see toastbar my survey is sent