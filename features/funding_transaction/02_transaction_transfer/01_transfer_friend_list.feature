@friendList
Feature: User add friend list
    In order to transfer
    As a customer
    I need to create my friendlist

    Background: User has registered and login to dashboard
        Given I am a registered customer with following details:
            | userID      | niza9813 |
            | password    | Test1234 |
            | userIDstg   | ruth1600 |
            | passwordStg | 1234Test |
        When I filling in form login with the following details:
            | userID      | niza9813 |
            | password    | Test1234 |
            | userIDstg   | ruth1600 |
            | passwordStg | 1234Test |
        And I click login
        And I click later in pop up biometric
        And I will direct to dashboard

    @C173822
    Scenario: User click back button
        Given I am a customer who wants to Transfer and has friend list
        And I choose menu Transfer from main dashboard
        And I click button back in the header page
        Then I will direct to dashboard

    @C173823
    Scenario: User search friend list
        Given I am a customer who wants to Transfer and has friend list
        When I choose menu Transfer from main dashboard
        And I input name 'NEGARA ADIL MAKMUR' from the search box
        Then I find name 'NEGARA ADIL MAKMUR' from the list

    @C173824
    Scenario: User search friend list and the name is not found
        Given I am a customer who wants to Transfer and has friend list
        When I choose menu Transfer from main dashboard
        Then I input name 'Nurul Septariani' from the search box
        And I can't find the name 'Nurul Septariani' from the list

    @C173825
    Scenario: Account number was not found
        Given I am a customer who wants to Transfer and has no friend list
        When I choose menu Transfer from main dashboard
        And I click Transfer to Receiver Name
        And I can choose Bank name
        And I search 'BCA' in search box bank name
        And I tap on bank name
        And I input account number
            | accNumberDev | 9001600005 |
            | accNumberStg | 9001600010 |
        And I click on check
        Then I will see error message "Nomor rekening tidak ditemukan"

    @C173826
    Scenario: User close bottom sheet list bank name
        Given I am a customer who wants to Transfer and has friend list
        When I choose menu Transfer from main dashboard
        And I click Transfer to Receiver Name
        And I can choose Bank name
        And I close bottom sheet list bank name
        Then I will not see bottom sheet list bank name

    @C173827
    Scenario: User choose another bank name after inquiry
        Given I am a customer who wants to Transfer and has friend list
        When I choose menu Transfer from main dashboard
        And I click Transfer to Receiver Name
        And I can choose Bank name
        And I search 'BCA' in search box bank name
        And I tap on bank name
        And I input account number
            | accNumberDev | 00520000002300 |
            | accNumberStg | 00520000002300 |
        And I click on check
        And I choose bank name again
        And I search 'BNI' in search box bank name
        And I tap on bank name
        Then I will see bank name is change

    @C173828
    Scenario: User uncheck checkbox save as friend list
        Given I am a customer who wants to Transfer and has friend list
        When I choose menu Transfer from main dashboard
        And I click Transfer to Receiver Name
        And I can choose Bank name
        And I search 'Bank Amar Indonesia' in search box bank name
        And I tap on bank name
        And I input account number
            | accNumberDev | 1702000054 |
            | accNumberStg | 1702000098 |
        And I click on check
        And I will see detail inquiry
        And I uncheck on the checkbox save as friend list
        And I process to transfer detail
        And I can't see toastbar "Data berhasil disimpan ke daftar penerima"
        And I click back in header page
        And I click back in header page
        And I input receiver name that I added before
        Then name of receiver should not be added in friendlist

    @C173829
    Scenario: User add friend list and validate account number and name
        Given I am a customer who wants to Transfer and has friend list
        When I choose menu Transfer from main dashboard
        And I click Transfer to Receiver Name
        And I can choose Bank name
        And I search 'Bank Amar Indonesia' in search box bank name
        And I tap on bank name
        And I input account number
            | accNumberDev | 1602000018 |
            | accNumberStg | 1702000099 |
        And I click on check
        And I check on the checkbox save as friend list
        And I process to transfer detail
        Then I can see toastbar "Data berhasil disimpan ke daftar penerima"
        And name of receiver should be added in friendlist

    @C173830
    Scenario: User has friend list
        Given I am a customer who wants to Transfer and has friend list
        When I choose menu Transfer from main dashboard
        Then I will go to Friend list page
        And I can see list of friends

    @C173831
    Scenario: Inquiry Amar Bank account with Deleted status is true and Dormant status is false
        Given I am a customer who wants to Transfer and has no friend list
        When I choose menu Transfer from main dashboard
        And I click Transfer to Receiver Name
        And I can choose Bank name
        And I search 'Bank Amar Indonesia' in search box bank name
        And I tap on bank name
        And I input account number
            | accNumberDev | 1602000184 |
            | accNumberStg | 1602000423 |
        And I click on check
        Then I will see error message "Nomor rekening tidak aktif"

    @C173832
    Scenario: Inquiry Amar Bank account with Dormant status is true and Deleted status is false
        Given I am a customer who wants to Transfer and has no friend list
        When I choose menu Transfer from main dashboard
        And I click Transfer to Receiver Name
        And I can choose Bank name
        And I search 'Bank Amar Indonesia' in search box bank name
        And I tap on bank name
        And I input account number
            | accNumberDev | 1503372327 |
            | accNumberStg | 1503372327 |
        And I click on check
        And I check on the checkbox save as friend list
        And I process to transfer detail
        Then I can see toastbar "Data berhasil disimpan ke daftar penerima"
        And name of receiver should be added in friendlist

    @C173833
    Scenario: Inquiry Amar Bank account with both status Dormant and Deleted is true
        Given I am a customer who wants to Transfer and has no friend list
        When I choose menu Transfer from main dashboard
        And I click Transfer to Receiver Name
        And I can choose Bank name
        And I search 'Bank Amar Indonesia' in search box bank name
        And I tap on bank name
        And I input account number
            | accNumberDev | 1519000003 |
            | accNumberStg | 1503482963 |
        And I click on check
        Then I will see error message "Nomor rekening tidak aktif"