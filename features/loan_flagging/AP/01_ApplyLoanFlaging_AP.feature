
Feature: Account Opening Onboarding
    In order to opening my Giro account in SMB
    As a customer
    I want to validate wording onboarding card lending

    Background: User has registered and login to dashboard
        Given I am a registered customer with following details:
            | userID   | nuruc014|
            | password | Test1234|
        And I filling in form login with the following details:
            | userID   | nuruc014|
            | password | Test1234 |
        And I click login
        And I will directing to Hook 1 Onboarding Account Opening

    
    Scenario: User validate wording on Onboarding card lending
        Given I am on Onboaring Loan   
        Then I validate update wording on Onboarding card lending
        And I see Benefit of Apply Loan

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
        Then I continue to Corporate Page

    Scenario: User validate error field on form Loan Needs
        Given I am on Onboarding Page
        When I click Ajukan Pinjaman        
        Then user click button next
        And I see error "Jumlah pinjaman wajib diisi" in the below of field "inputNominal"
        And I see error "Tenor pinjaman wajib diisi" in the below of field "tenor"
        
    





    


        