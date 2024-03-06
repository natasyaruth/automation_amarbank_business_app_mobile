Feature: User add friend list
    In order to transfer
    As a customer
    I need to create my friendlist

    # ATTENTION
    # please use user id with friendlist still not created yet
    Background: User has registered and login to dashboard
        Given I am a registered customer with following details:
            # | userID   | mohaf6df |
            # | password | Test1234 |
            | userID   | niza9813 |
            | password | Test1234 |
        When I filling in form login with the following details:
            # | userID   | mohaf6df |
            # | password | Test1234 |
            | userID   | niza9813 |
            | password | Test1234 |
        And I click login        
        Then I will direct to dashboard

    # @TR271
    Scenario: User click back button
        Given I am a customer who wants to Transfer and has no friend list
        And I choose menu Transfer from main dashboard
        And I click button back in the header page
        Then I will direct to dashboard

    # @TR272
    Scenario: User search friend list
        Given I am a customer who wants to Transfer and has friend list
        When I choose menu Transfer from main dashboard
        And I input name 'NEGARA ADIL MAKMUR' from the search box
        Then I find name 'NEGARA ADIL MAKMUR' from the list

    # @TR273
    Scenario: User search friend list and the name is not found
        Given I am a customer who wants to Transfer and has friend list
        When I choose menu Transfer from main dashboard
        Then I input name 'Nurul Septariani' from the search box
        And I can't find the name 'Nurul Septariani' from the list

    # @TR274
    Scenario: Account number was not found
        Given I am a customer who wants to Transfer and has no friend list
        When I choose menu Transfer from main dashboard
        And I click Transfer to Receiver Name
        And I can choose Bank name
        And I search 'BCA' in search box bank name
        And I tap on bank name
        And I input account number '9001600005'
        And I click on check
        Then I will see error message "Nomor rekening tidak ditemukan"

    # @TR275
    Scenario: User close bottom sheet list bank name
        Given I am a customer who wants to Transfer and has friend list
        When I choose menu Transfer from main dashboard
        And I click Transfer to Receiver Name
        And I can choose Bank name
        And I close bottom sheet list bank name
        Then I will not see bottom sheet list bank name

    # @TR276
    Scenario: User choose another bank name after inquiry
        Given I am a customer who wants to Transfer and has friend list
        When I choose menu Transfer from main dashboard
        And I click Transfer to Receiver Name
        And I can choose Bank name
        And I search 'BCA' in search box bank name
        And I tap on bank name
        And I input account number '00520000002300'
        And I click on check
        And I choose bank name again
        And I search 'BNI' in search box bank name
        And I tap on bank name
        Then I will see bank name is change
    
    # @TR277
    Scenario: User uncheck checkbox save as friend list
        Given I am a customer who wants to Transfer and has friend list
        When I choose menu Transfer from main dashboard
        And I click Transfer to Receiver Name
        And I can choose Bank name
        And I search 'BCA' in search box bank name
        And I tap on bank name
        And I input account number '00520000002300'
        And I click on check
        And I uncheck on the checkbox save as friend list
        And I process to transfer detail
        Then I can't see toastbar "Data berhasil disimpan ke daftar penerima"
        And name of receiver should not be added in friendlist

    # @TR278
    Scenario: User add friend list and validate account number and name
        Given I am a customer who wants to Transfer and has friend list
        When I choose menu Transfer from main dashboard
        And I click Transfer to Receiver Name
        And I can choose Bank name
        And I search 'Bank Amar (Senyumku)' in search box bank name
        And I tap on bank name
        And I input account number '1602000018'
        And I click on check
        And I check on the checkbox save as friend list
        And I process to transfer detail
        Then I can see toastbar "Data berhasil disimpan ke daftar penerima"
        And name of receiver should be added in friendlist

    # @TR279
    Scenario: User has friend list
        Given I am a customer who wants to Transfer and has friend list
        When I choose menu Transfer from main dashboard
        Then I will go to Friend list page
        And I can see list of friends