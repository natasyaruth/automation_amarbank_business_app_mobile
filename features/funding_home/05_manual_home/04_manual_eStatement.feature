Feature: Manual e-Statement
    In e-statement feature
    As a customer
    I want to download e-statement and make sure i get email after download

@C141448
Scenario: User get email after download e-statement
    Given I am a customer that has history transaction
    When I login to app
    And I click menu history transaction
    And I click button download e-statement
    And I click the latest e-statement
    And I fill valid password
    Then e-Statement downloaded notification show
    And I get email notification that contain e-statement file 
    When I click e-statement document on email 
    And I can open the document