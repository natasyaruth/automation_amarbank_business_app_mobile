
Feature: Checking Loan Type AP and Direct AP with Status Active
        As a customer
        I am able to verify limit active loan type AP and direct AP in history page

        Background: Login with registered account
                Given I am a registered customer with following details:
                        | userID   | botseb19   |
                        | password | TestSmb123 |
                When I filling in form login with the following details:
                        | userID   | botseb19   |
                        | password | TestSmb123 |
                And I click login
                And I click later
                Then I will direct to dashboard
                And I click menu tab testing
                Then I will direct to dashboard

        Scenario: Validate Confirm Invoice For Type Loan AP
                Given I have been on Loan Dashboard to see the loan type of Loan AP
                When I validate the card of "Loan AP"
                Then I should see the wording dan card design of "Loan AP"
                And user should see text view "Konfirmasi Invoice" on bottom sheet "titleKonfirmasiInvoice"
                And user should see text bottom sheet "Dokumen Invoice" in field "titleDokumenInvoice"
                And user click button Preview
                And user click button Lihat Perhitungan Pencairan
                And user click button Komplain
