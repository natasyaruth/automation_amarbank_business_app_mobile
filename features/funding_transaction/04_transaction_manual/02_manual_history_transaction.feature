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