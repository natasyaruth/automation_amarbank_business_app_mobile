@transfer_negative_cases
Feature: User Want to Transfer with Negative Cases
    In home
    As a customer
    I need to transfer with negative cases

    Background: User must login to home dashboard
        Given I am a registered customer with following details:
            | userID      | niza9813 |
            | password    | Test1234 |
            | userIDstg   | stag76ee |
            | passwordStg | Test1234 |
        When I filling in form login with the following details:
            | userID      | niza9813 |
            | password    | Test1234 |
            | userIDstg   | stag76ee |
            | passwordStg | Test1234 |
        And I click login
        Then I will direct to dashboard
        And I choose menu Transfer from main dashboard
        And I am on receiver list page

    @C96924
    Scenario: User transfer input notes with emoji
        Given I am a customer who wants to Transfer and has friend list
        When I input name 'Surya Edwin' from the search box
        And I choose the friendlist
        And I input amount '900000'
        And I choose category "Pembayaran"
        And I input notes with 'Pembayaran #Oktober!@#'
        Then I should see error message "Catatan tidak menggunakan emoji & symbol" in field "notes"

    @C96925
    Scenario: User transfer input notes with symbol
        Given I am a customer who wants to Transfer and has friend list
        When I input name 'Surya Edwin' from the search box
        And I choose the friendlist
        And I input amount '900000'
        And I choose category "Pembayaran"
        And I input notes with 'Pembayaran Okt 😆'
        Then I should see error message "Catatan tidak menggunakan emoji & symbol" in field "notes"

    @C96926
    Scenario: User Transfer with under minimum transfer amount
        Given I am a customer who wants to Transfer and has friend list
        When I input name 'Surya Edwin' from the search box
        And I choose the friendlist
        And I input amount '9000'
        Then I should see error message "Minimal transfer Rp 10.000" in field "amount"

    @C96927
    Scenario: User Transfer with saldo aktik tidak mencukupi
        Given I am a customer who wants to Transfer and has friend list
        When I input name 'Surya Edwin' from the search box
        And I choose the friendlist
        And I input amount '90000000'
        Then I should see error message "Saldo aktif tidak mencukupi" in field "amount"

    @C96928
    Scenario: User Transfer with category not selected
        Given I am a customer who wants to Transfer and has friend list
        When I input name 'Surya Edwin' from the search box
        And I choose the friendlist
        And I input amount '900000'
        And I click choose bank transfer service
        Then I should see error message "Kategori wajib diisi" in field "dropDownErrorField"