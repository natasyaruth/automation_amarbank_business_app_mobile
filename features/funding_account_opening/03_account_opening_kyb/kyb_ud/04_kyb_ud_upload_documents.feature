Feature: Account Opening KYB UD - Upload Document Business
    In order to opening my Giro account with legality business type UD in SMB
    As a customer
    I want to submit my business address as part of the KYB Process

    Background: User choose legality business type UD
        Given I am a registered customer with following details:
            | userID      | devecac3 |
            | password    | 1234Test |
            | userIDstg   | ruth1684 |
            | passwordStg | 1234Test |
        And I reset state upload document
        And I reset my state journey
        And complete onboarding document safe and survey      
        And I filling in form login with the following details:
            | userID      | devecac3 |
            | password    | 1234Test |
            | userIDstg   | ruth1684 |
            | passwordStg | 1234Test |
        And I click login
        And I click later in pop up biometric
        And I will directing to Hook 1 Onboarding Account Opening
        And I swipe to card Giro Account
        And I choose Giro Account
        And I choose Giro Account MSME
        And I submit my giro type
        And I choose legality business type 'ud'
        And I submit my legality type
        And I fill NPWP Business
        And I click continue to data personal
        And I click confirm NPWP Business
        And I see page 'Upload eKTP'
        And I update my last journey step to 'Data Employment'
        And I see page 'Data Business Profile'
        When I fill my business profile as followings:
            | businessName      | FITHUB          |
            | industry           | Jasa            |
            | businessField      | Operator tur    |
            | monthlyIncome     | 30 - 50 juta    |
            | averageTransaction| 2000000         |
            | nib               | 9129101111112   |
            | businessDateStart | 10/10/2010      |
        And I submit my business profile
        And I submit business owner list
        And I fill my business address as followings:
            | address  | Jl. Gambir Belok Kiri No. 10 |
            | rt       | 000                          |
            | rw       | 011                          |
            | province | DKI JAKARTA                  |
            | city     | JAKARTA SELATAN              |
            | district | PANCORAN                     |
            | village  | PANCORAN                     |
        And I agree to carry out the Rights and Obligations
        And I will directing to page Rights and Obligations
        And I click button agree with Rights and Obligations
        And I will see checkbox Rights and Obligations is checked
        And I submit my business address

    @C171486
    Scenario: Upload only document required business type UD   
        Given I am a customer who has submitted business address
        And I choose method upload document
        And I choose direct upload via app
        And I see files that need to be uploaded for type individual company
        And I upload all document business required for type individual company
        And I click button progress upload document
        Then I will see all document business individual company has been uploaded
        And I will see button request account opening is shown
        And I click button request account opening
        And I will direct to page thank you and need verification of my data
        And I click progress account opening
        And I will direct to page detail progress account opening
        And I close page detail progress account opening
        Then I will see card account 'on verification'
        And I click tab brankas
        And I click direct to input password document
        And I input password document
        And I click see my document
        And I will direct to page document brankas
        And I click document giro
        And I will see document business required for type individual company

    @C171487
    Scenario: Upload All document business type UD
        Given I am a customer who has uploaded my eKTP photo and selfie
        When I choose method upload document
        And I choose direct upload via app
        And I see files that need to be uploaded for type individual company
        And I upload all document business for type individual company
        And I click button progress upload document
        Then I will see all document business individual company has been uploaded
        And I will see button request account opening is shown
        And I click button request account opening
        And I will direct to page thank you and need verification of my data
        And I click progress account opening
        And I close page detail progress account opening
        Then I will see card account 'on verification'
        And I click tab brankas
        And I click direct to input password document
        And I input password document
        And I click see my document
        And I will direct to page document brankas
        And I click document giro
        And I will see document business for type individual company