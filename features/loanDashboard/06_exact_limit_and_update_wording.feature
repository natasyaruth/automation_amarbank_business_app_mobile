Feature: Exact limit request when apply loan and update wording
    As a customer 
    I want request amount limit credit 
    So that I can apply loan 

    Background: Login with registered account
        Given I am a registered customer with following details:
            | userID      | ecap2158 |
            | password    | Eca12345 |
            | userIDstg   | perob6d5 |
            | passwordStg | Eca12345 |
        When I filling in form login with the following details:
            | userID      | ecap2158 |
            | password    | Eca12345 |
            | userIDstg   | perob6d5 |
            | passwordStg | Eca12345 |
        And I click login
        When I click button ajukan limit
        And I choose type loan 
        Then I shoud see form pengajuan limit kredit bisnis

    
    Scenario: input nominal limit credit with valid data 
        Given I am on the busines credit limit application form page
        When I input nominal limit kredit valid 
        And I input Tenor pembayaran pinjaman valid 
        And I click button lanjut isi data supplier
        Then I should see form data supplier

    Scenario: input nominal less than 50.000.000 and a notification message appears
        Given I am on the busines credit limit application form page
        When I input nominal less than 50.000.000
        And I should see message error minimal nominal RP 50.000.000

    Scenario: input nominal more than 25.000.000.000 and a notification message appears
        Given I am on the busines credit limit application form page
        When I input nominal more than 25.000.000.000
        And I should see message error maksimal nominal RP 25.000.000.000

    Scenario: do not input the nominal limit credit field and continue and a notification message appears
        Given I am on the busines credit limit application form page
        When I do not input the nominal limit credit field 
        And I input Tenor pembayaran pinjaman valid 
        And I click button lanjut 
        Then I sould see message error Nominal Limit kredit wajib di isi
    
    Scenario: do not input tenor pembayaran field and continue and a notification message appears
        Given I am on the busines credit limit application form page
        When I input nominal limit kredit valid 
        And I do not input Tenor pembayaran pinjaman 
        And I click button lanjut 
        Then I sould see message error Tenor Limit kredit wajib di isi

    Scenario: do not input tenor and nominal amount fields and a notification message appears
        Given I am on the busines credit limit application form page
        When I do not input the nominal limit credit field 
        And I do not input Tenor pembayaran pinjaman 
        And I click button lanjut 
        Then I sould see message error Nominal Limit kredit wajib di isi
        Then I sould see message error Tenor Limit kredit wajib di isi

    Scenario: verification tool tip appears when the user first wants to apply for a loan
        Given I am on the busines credit limit application form page
        When I should see tooltip appears 
        And I Click icon close tooltip

    Scenario: verification tool tip appears when the user clicks the command icon
        Given I am on the busines credit limit application form page
        When I click icon command in tenor  
        When I should see tooltip appears 
        And I Click icon close tooltip

    Scenario: input tenor below 30 days and a notification message will appear
        Given I am on the busines credit limit application form page
        When I input nominal limit kredit valid 
        And I input Tenor pembayaran pinjaman 28 days
        And I click button lanjut 
        Then I should see message error Minimal tenor 30 hari

    Scenario: input tenor above 180 days and a notification message will appear
        Given I am on the busines credit limit application form page
        When I input nominal limit kredit valid 
        And I input Tenor pembayaran pinjaman 188 days
        And I click button lanjut 
        Then I should see message error Maksimal tenor 180 hari

    Scenario: verify number 000 on the keyboard when inputting the nominal credit limit
        Given I am on the busines credit limit application form page
        When I click field nominal limit kredit 
        Then I should see number 000 on the keyboard
    
    Scenario: verify title on nominal limit kredit and tenor
        Given I am on the busines credit limit application form page
        Then I should see title on limit kredit and tenor



    


        