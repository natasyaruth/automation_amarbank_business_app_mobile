Feature: User have friend list
    In order to transfer
    As a customer
    I want to check friend list

    Background: User has registered and login to dashboard
        Given I am a registered customer with following details:
            | userID   | ruth17a5 |
            | password | Test1234 |
        When I filling in form login with the following details:
            | userID   | ruth17a5 |
            | password | Test1234 |
        And I click login
        Then I will direct to dashboard

    Scenario: User has no friend list
        Given I am a customer who wants to Transfer and has no friend list
        When I choose menu Transfer from main dashboard
        And I will direct to Friend list Page
        Then I can see message "Belum ada Nama Penerima"

    Scenario: User search friend list
        Given I am a customer who wants to Transfer
        When I choose menu Transfer from main dashboard
        And I will direct to friend list page
        And I input name 'Nurul Septariani' from the search box
        Then the name is found from the list

    Scenario: User search friend list and the name is not found
        Given I am a customer who wants to Transfer
        When I choose menu Transfer from main dashboard
        And I will direct to friend list page
        And I input name 'Nurul Septariani' from the search box
        Then the name is not found from the list

    Scenario: Account number was not found
        Given I am a customer who wants to Transfer
        When I choose menu Transfer from main dashboard
        And I will direct to friend list page
        And I click Transfer ke Penerima Baru
        And I can choose Bank name
        And I can input and search bank name
        And I tap on bank name
        And I input account number
        And I click on check
        Then I will see error message "Nomor Rekening tidak ditemukan "

    Scenario: User add friend list and validate account number and name
        Given I am a customer who wants to Transfer
        When I choose menu Transfer from main dashboard
        And I will direct to friend list page
        And I click Transfer ke Penerima Baru
        And I can choose Bank name
        And I can input and search bank name
        And I tap on bank name
        And I input account number
        And I click on Check
        And User check on the checkbox "Simpan data di Daftar Penerima"
        And I click on Next
        Then I can see toastbar "Data berhasil disimpan ke daftar penerima"

    Scenario: User has friend list
        Given I am a customer who wants to Transfer and already has friend list
        When I choose menu Transfer from main dashboard
        Then I will direct to Friend list page
        And I can see list of friends









