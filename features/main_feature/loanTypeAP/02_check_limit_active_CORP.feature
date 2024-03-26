
Feature: Checking Loan Type AP and Direct AP with Status Active
        In order to checking limit active for loan type AP and Direct AP
        As a customer
        I am able to verify limit active loan type AP and direct AP in history page

        Background: Login with registered account
                Given I am a registered customer with following details:
                        | userID   | cokr3b4e   |
                        | password | Test1234 |
                When I filling in form login with the following details:
                        | userID   | cokr3b4e   |
                        | password | Test1234 |
                And I click login
                And I click later
                Then I will direct to dashboard
                And I click menu tab testing
                Then I will direct to dashboard

        @debt86
        Scenario: Validate Card Limit For Type Loan AP
                Given I have been on Loan Dashboard to see the loan type of Loan AP
                When I validate the card of "Loan AP"
                Then I should see the wording dan card design of "Loan AP"
                And user click button back
                And user should see text view "Selamat, Limit Pinjaman Telah Aktif" on bottom sheet "titleLimitPinjaman"
                And user should see text bottom sheet "Limit Tersedia" in field "titleLimitTersedia"
                And user should see text bottom sheet "Supplier" in field "titleSupplier"
                And user should see text bottom sheet "No. Pinjaman" in field "titleNoPinjaman"
                And user click button copy
                And user should see text bottom sheet "Informasi Tambahan" in field "titleInformasiTambahan"
                And user click button lihat pinjaman

# Scenario: Validate Card Limit For Type Loan AP Direct Loan
#         Given I have been on Loan Dashboard to see the loan type of Loan AP Direct Loan
#         When I validate the card of "Loan AP direct loan"
#         Then I should see the wording dan card design of "Loan AP Direct Loan"

