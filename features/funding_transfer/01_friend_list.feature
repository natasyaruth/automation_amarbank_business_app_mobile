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
        Then I will direct to Friend list Page
        And I can see message "Belum ada Nama Penerima"

    Scenario: User click back button
        Given I am a customer who wants to Transfer and has no friend list
        When I choose menu Transfer from main dashboard
        And I will direct to Friend list page
        And I click back button
        Then I will go back to main Dashboard

    Scenario: User search friend list
        Given I am a customer who wants to Transfer and has friend list
        When I choose menu Transfer from main dashboard
        And I input name 'Nurul Septariani' from the search box
        Then I find name 'Nurul Septariani' from the list

    Scenario: User search friend list and the name is not found
        Given I am a customer who wants to Transfer and has friend list
        When I choose menu Transfer from main dashboard
        Then I input name 'Nurul Septariani' from the search box
        And I can't find the name 'Nurul Septariani' from the list

    Scenario: Account number was not found
        Given I am a customer who wants to Transfer and has no friend list
        When I choose menu Transfer from main dashboard
        And I click Transfer ke Penerima Baru
        And I can choose Bank name
        And I search 'Bank BCA' in search box bank name
        And I tap on bank name
        And I input account number '4500300700'
        And I click on check
        Then I will see error message "Nomor Rekening tidak ditemukan"

    Scenario: User close bottom sheet list bank name
        Given I am a customer who wants to Transfer and has friend list
        When I choose menu Transfer from main dashboard
        And I will direct to friend list page
        And I click Transfer ke Penerima Baru
        And I can choose Bank name
        Then I close bottom sheet list bank name

    Scenario: User choose another bank name after inquiry
        Given I am a customer who wants to Transfer and has friend list
        When I choose menu Transfer from main dashboard
        And I will direct to friend list page
        And I click Transfer ke Penerima Baru
        And I can choose Bank name
        And I search 'Bank BNI' in search box bank name
        And I tap on bank name
        And I input account number '0354779001'
        And I click on check
        And I click Bank name
        Then I will go back to choose bank name  

    Scenario: User uncheck checkbox save as friend list
        Given I am a customer who wants to Transfer and has friend list
        When I choose menu Transfer from main dashboard
        And I will direct to friend list page
        And I click Transfer ke Penerima Baru
        And I can choose Bank name
        And I search 'Bank BNI' in search box bank name
        And I tap on bank name
        And I input account number '0354779001'
        And I click on check
        And I uncheck on the checkbox save as friend list
        And I click on Next
        Then I can't see toastbar "Data berhasil disimpan ke daftar penerima"

    Scenario: User add friend list and validate account number and name
        Given I am a customer who wants to Transfer and has friend list
        When I choose menu Transfer from main dashboard
        And I will direct to friend list page
        And I click Transfer ke Penerima Baru
        And I can choose Bank name
        And I search 'Bank BNI' in search box bank name
        And I tap on bank name
        And I input account number '0354779001'
        And I click on check
        And I check on the checkbox save as friend list
        And I click on Next
        Then I can see toastbar "Data berhasil disimpan ke daftar penerima"
        And I can see friend name on friend list page

    Scenario: User has friend list
        Given I am a customer who wants to Transfer and already has friend list
        When I choose menu Transfer from main dashboard
        Then I will direct to Friend list page
        And I can see list of friends









