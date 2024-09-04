Feature: FAQ
    In FAQ feature
    As a customer
    I want to figure out more about Amar bank business

@C156766
Scenario: User open menu FAQ (Business)
    Given I am a customer that want know more about Amar Bank Business
    When I login to app
    And I click menu Lainnya
    And I click menu FAQ
    Then I direct to page FAQ with web view
    And I see all category
    And I see button exit 
    And I see pagination

@C156767
Scenario: User open FAQ category (Business)
    Given I am a customer that want know more about Amar Bank Business
    When I login to app
    And I click menu Lainnya
    And I click menu FAQ
    And I click one of category
    Then I direct to page question
    And Pagination change according user last page

@C156768
Scenario: User open detail of question on FAQ page (Business)
    Given I am a customer that want know more about Amar Bank Business
    When I login to app
    And I click menu Lainnya
    And I click menu FAQ
    And I click one of category
    And I click one of question
    Then Detail of question will display

@C156769
Scenario: User click button back on FAQ page (Business)
    Given I am a customer that want know more about Amar Bank Business
    When I login to app
    And I click menu Lainnya
    And I click menu FAQ
    And I click one of category
    And I click button back
    Then I returned to the previous page
    And Pagination change according user last page
    
@C156770
Scenario: User click button close on FAQ page (Business)
    Given I am a customer that want know more about Amar Bank Business
    When I login to app
    And I click menu Lainnya
    And I click menu FAQ
    And I click one of category
    And I click button close on FAQ page
    Then I direct to mobile application
    And I direct to menu Lainnya
    
@C156771
Scenario: User open menu FAQ (Individual)
    Given I am a customer that want know more about Amar Bank Business
    When I login to app
    And I click menu Lainnya
    And I click menu FAQ
    Then I direct to page FAQ with web view
    And I see all category
    And I see button exit 
    And I see pagination

@C156772
Scenario: User open FAQ category (Individual)
    Given I am a customer that want know more about Amar Bank Business
    When I login to app
    And I click menu Lainnya
    And I click menu FAQ
    And I click one of category
    Then I direct to page question
    And Pagination change according user last page

@C156773
Scenario: User open detail of question on FAQ page (Individual)
    Given I am a customer that want know more about Amar Bank Business
    When I login to app
    And I click menu Lainnya
    And I click menu FAQ
    And I click one of category
    And I click one of question
    Then Detail of question will display

@C156774
Scenario: User click button back on FAQ page (Individual)
    Given I am a customer that want know more about Amar Bank Business
    When I login to app
    And I click menu Lainnya
    And I click menu FAQ
    And I click one of category
    And I click button back
    Then I returned to the previous page
    And Pagination change according user last page
    
@C156775
Scenario: User click button close on FAQ page (Individual)
    Given I am a customer that want know more about Amar Bank Business
    When I login to app
    And I click menu Lainnya
    And I click menu FAQ
    And I click one of category
    And I click button close on FAQ page
    Then I direct to mobile application
    And I direct to menu Lainnya
    