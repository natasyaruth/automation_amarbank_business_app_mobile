Feature: Apply Either Loan and select the loan type
    As a customer lead
    I want to login Apply loan and select the loan type


    Background:
        Given I am a registered customer with following details:
            | userID   | trys5524  |
            | password | Eca12345 |
        When I filling in form login with the following details:
            | userID   | trys5524 |
            | password | Eca12345|
        And I click login
        
    Scenario: validate content on Onboarding 
        Given I am on Main Dashboard
        When I see update wording on Onboarding card lending
        And I see Benefit of Apply Loan
        Then I click button Ajukan Pinjaman 

    Scenario: User Update validation minimum Nominal Pinjaman
        Given I am on Onboarding Page
        When  I click Ajukan Pinjaman
        And I Input Nominal Pinjaman '45000000'
        And I click button Selanjutnya
        Then I see messege error for minimun input "Minimal Pinjaman Rp.50.000.000 (50juta)"

    Scenario: User Input Tenor <30 hari
        Given I am on Onboarding Page
        When I click Ajukan Pinjaman
        And I Input Nominal Pinjaman '2400000000'
        And I Input Tenor <30 hari '4'
        And I click button Selanjutnya
        Then I see message error for tenor "Min. tenor 30 hari. Max. tenor 180 hari"


    Scenario: User Input Amount <5 Million
        Given I am on Onboarding Page
        When I click Ajukan Pinjaman
        And I Input Nominal Pinjaman '2400000000'
        And I Input Tenor '90'
        And I click button Selanjutnya
        Then I continue to MSME Page

    Scenario: User Input Amount >5 Million
        Given I am on Onboarding Page
        When I click Ajukan Pinjaman
        And I Input Nominal Pinjaman '6500000000'
        And I Input Tenor '90'
        And I click on button Selanjutnya
        Then I continue to Corporate Page to select loan type
        
     Scenario: User validate and select loan type AP
        Given I am on Main dashboard
        When I click button Ajukan Pinjaman
        And I Input Nominal Pinjaman '6500000000'
        And I Input Tenor '90'
        And I click on button Selanjutnya
        And I am on loan type page
        And I validate wording loan type "AP"
        And I select loan type "AP"
        Then I click on Select the schema
       
    Scenario: User validate and select loan type AR
        Given I am on Main dashboard
        When I click button Ajukan Pinjaman
        And I Input Nominal Pinjaman '6500000000'
        And I Input Tenor '90'
        And I click on button Selanjutnya
        And I am on loan type page
        And I validate wording loan type "AR"
        And I select loan type "AR"
        Then I click on Select the schema
       



    

       
    
    
        

    

    





    