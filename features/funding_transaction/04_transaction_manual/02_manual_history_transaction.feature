Feature: Manual Transaction History
    In home
    As a customer
    I need to see detail history transaction

    @C133866
    Scenario: Check ordering date history transaction
        Given I am a customer that has 1 week history transaction
        When I login to app
        And I click menu history transaction
        Then I will see list history is ordered from latest to oldest

    @C133867
    Scenario: Share and check transaction history
        Given I am a customer that has history transaction
        When I login to app
        And I click menu history transaction
        And I click latest history transaction
        And I click button share history transaction
        And I choose share via email
        Then I will get an email contain with history transaction
        And the detail same as figma 

    @C136563
    Scenario: Validate item bucketlist transfer in
        Given I am a customer that has history transaction transfer in from method overbook, BIFAST and RTOL
        And I filling in form login with the following details:
        And I click login
        And I will direct to dashboard
        And I want to click button history transaction
        And I will redirect to history transaction page
        And I see tab filter all transaction, inbound transaction and outbound transaction
        When I click tab inbound transaction
        And I will see in bucketlist transfer in with detail sender in bucketlist from method overbook, BIFAST and RTOL
        And I will see information transfer in from other method without detail sender

    @C136575
    Scenario: Validate detail transfer in RTOL
        Given I am a registered customer with following details:
            | userID      | deveb931 |
            | password    | 1234Test |
            | userIDstg   | stag4400 |
            | passwordStg | Test1234 |
        And I filling in form login with the following details:
            | userID      | deveb931 |
            | password    | 1234Test |
            | userIDstg   | stag4400 |
            | passwordStg | Test1234 |
        And I click login
        And I will direct to dashboard
        And I want to click button history transaction
        And I will redirect to history transaction page
        When I want to click list transfer in
        And I click detail card transaction transfer in RTOL
        Then I will see detail transaction transfer without detail sender and recipient
        And I close page detail history transaction

    @C136576
    Scenario: Validate detail transfer in BI-FAST
        Given I am a registered customer with following details:
            | userID      | deve3b14 |
            | password    | 1234Test |
            | userIDstg   | staga7d0 |
            | passwordStg | Test1234 |
        And I filling in form login with the following details:
            | userID      | deve3b14 |
            | password    | 1234Test |
            | userIDstg   | staga7d0 |
            | passwordStg | Test1234 |
        And I click login
        And I will direct to dashboard
        And I want to click button history transaction
        And I will redirect to history transaction page
        When I want to click list transfer in
        And I click detail card transaction transfer in BIFAST
        Then I will see detail transaction transfer without detail sender and recipient
        And I close page detail history transaction

    @C136577
    Scenario: Validate detail transfer in overbooking
        Given I am a registered customer with following details:
            | userID      | deve1a6f |
            | password    | 1234Test |
            | userIDstg   | stag323d |
            | passwordStg | Test1234 |
        And I filling in form login with the following details:
            | userID      | deve1a6f |
            | password    | 1234Test |
            | userIDstg   | stag323d |
            | passwordStg | Test1234 |
        And I click login
        And I will direct to dashboard
        And I want to click button history transaction
        And I will redirect to history transaction page
        When I want to click list transfer in
        And I click detail card transaction transfer in Overbooking
        Then I will see detail transaction transfer without detail sender and recipient
        And I close page detail history transaction

    @C133868
    Scenario: Validate detail transfer out RTGS with approval transaction more than one approval
        Given I am a customer active with approval more than one approval
        And I have history transaction with approval more than one approval
        And with method RTGS
        When I login to app
        And I click menu history transaction
        And I click history transaction that has approval more than one
        Then I will see detail history transaction with correct list approval name 

    @C133869
    Scenario: Validate detail transfer out SKN with approval transaction more than one approval
        Given I am a customer active with approval more than one approval
        And I have history transaction with approval more than one approval
        And with method SKN
        When I login to app
        And I click menu history transaction
        And I click history transaction that has approval more than one
        Then I will see detail history transaction with correct list approval name 

    @C133870
    Scenario: Validate detail transfer out BIFAST with approval transaction more than one approval
        Given I am a customer active with approval more than one approval
        And I have history transaction with approval more than one approval
        And with method BIFAST
        When I login to app
        And I click menu history transaction
        And I click history transaction that has approval more than one
        Then I will see detail history transaction with correct list approval name 

    @C133871
    Scenario: Validate detail transfer out RTOL with approval transaction more than one approval
        Given I am a customer active with approval more than one approval
        And I have history transaction with approval more than one approval
        And with method RTOL
        When I login to app
        And I click menu history transaction
        And I click history transaction that has approval more than one
        Then I will see detail history transaction with correct list approval name 

    @C133872
    Scenario: Validate detail transfer out Overbooking with approval transaction more than one approval
        Given I am a customer active with approval more than one approval
        And I have history transaction with approval more than one approval
        And with method Overbooking
        When I login to app
        And I click menu history transaction
        And I click history transaction that has approval more than one
        Then I will see detail history transaction with correct list approval name 