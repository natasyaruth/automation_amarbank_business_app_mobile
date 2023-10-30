Feature: Submit Loan Type AP Status is Approved
    As a customer lead
    I want to submit loan and Approved by VP of bussiness

    Background:
        Given I am a registered customer with foll
            | userID   | botseb19   |
            | password | TestSmb123 |
        When I filling in form login with the foll
            | userID   | botseb19   |
            | password | TestSmb123 |
        And I click login
        And I click later
        Then I will direct to dashboard
        And I click menu tab testing
        Then I successed go to dashbord

    Scenario: Validate PDC Delivery For Type Loan AP
                Given I have been on the Business Loan Dashboard to see the loan types from AP Loans
                When I validate the card of "Loan AP"
                Then I should see the wording dan card design of "Loan AP"
                And user should see text view "Pengiriman PDC (Cek Mundur)" on bottom sheet "titlePengirimanPDC"
                And user should see text bottom sheet "Segera mengirimkan PDC (cek mundur) sebagai jaminan ke alamat berikut" in field "titleJaminanPDC"
                And user should see text bottom sheet "Alamat Pengiriman" in field "titleAlamatPengiriman"
                And user click button copy