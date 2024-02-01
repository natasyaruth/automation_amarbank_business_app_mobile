Feature: User open e-Statement History
    In order to e-Statement History
    As a customer
    I want to see e-Statement History


    Background: User has registered and login to dashboard
        Given I am a registered customer with following details:
            | userID   | mukl8e4d |
            | password | 1234Test |
        When I filling in form login with the following details:
            | userID   | mukl8e4d |
            | password | 1234Test |
        And I click login
        And I will direct to dashboard

    @e-Statement1
    Scenario: User open transaction history
        Given I am a customer who want to open transaction history
        When I click history menu
        Then I direct to history page
        And I will see the button e-Statement
    
    @e-Statement2
    Scenario: Download e-Statement by the latest month
        Given I am a customer who want to download e-Statement based on the latest month
        When I click history menu
        And I click button e-Statement download
        And I choose the latest month to download e-Statement
        Then The e-Statement downloaded
        And Receive notification email
    
    @e-Statement3
    Scenario: Download e-Statement when e-Statement not exist
        Given I am a customer who want to download e-Statement when e-Statement not exist
        When I click history menu
        And I click button e-Statement download
        Then Notification e-Statement not exist will appear
    
    @e-Statement4
    Scenario: Show alert bar when success download e-Statement
        Given I am a customer who want to download e-Statement based on the latest month
        When I click history menu
        And I click button e-Statement download
        And I choose the latest month to download e-Statement
        Then Alert bar success will appear 
    
    @e-Statement5
    Scenario: Show alert bar when failed download e-Statement
        Given I am a customer who want to download e-Statement based on the latest month
        When I click history menu
        And I click button e-Statement download
        And I choose the latest month to download e-Statement
        Then Alert bar failed will appear 
    


