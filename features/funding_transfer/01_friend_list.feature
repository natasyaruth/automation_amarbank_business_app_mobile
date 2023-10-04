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

    Scenario: User has friend list
        Given I am a customer wants to Transfer
        When I choose menu Transfer from main dashboard
        And I have a PIN
        And I have friends list
        Then I will direct to Daftar Penerima page

    Scenario: User has not friend list
        Given I am a customer who have PIN
        When I choose menu Transfer from main dashboard
        And I will direct to Daftar Penerima Page
        Then I can see message "Belum ada Nama Penerima"

    Scenario: User search friend list
        Given I am a customer who have PIN and friend list
        When I am in Daftar Penerima page
        And I can see friend list is sorted alphabetically
        And I can scroll up and down the list
        And I input the name from the search box
        Then the name is found from the list
       
    Scenario: User search friend list and the name is not found
        Given I am a customer who have PIN and friend list
        When I am in Daftar Penerima page
        And I can see friend list is sorted alphabetically
        And I can scroll up and down the list
        And I input the name from search box
        Then the name is  not found from the list

    Scenario: Account number was not found 
        Given I am a customer who have PIN 
        When I am in Daftar Penerima page
        And I click on Transfer ke Penerima Baru
        And I can choose Bank name
        And I can input and search bank name
        And I can see the correct bank name
        And I tap on bank name
        And I input account number
        And I click on Periksa
        Then System will check the account
        Then I should see error message "Nomor Rekening tidak ditemukan "


Scenario: User add friend list and validate account number and name
    Given I am a customer who have PIN 
    When I am in Daftar Penerima page
    And I click on Transfer ke Penerima Baru
    And I can choose Bank name
    And I can input and search bank name
    And I can see the correct bank name
    And I tap on bank name
    And I input account number
    And I click on Periksa
    And System will check the account
    And User check on the checkbox "Simpan data di Daftar Penerima"
    And System will automatically save the account name 
    And I click on Selanjutnya
    Then I can see toastbar "Data berhasil disimpan ke daftar penerima"











