@kybSubmitFormBusinessAddressPTPerorangan
Feature: Account Opening KYB PT Perorangan - Submit Business Address
    In order to opening my Giro account with legality business type PT Perorangan in SMB
    As a customer
    I want to submit my business address as part of the KYB Process

    Background: User choose legality business type PT Perorangan
        Given I am a registered customer with following details:
            | userID      | ptpe2eef |
            | password    | 1234Test |
            | userIDstg   | rutheeab |
            | passwordStg | 1234Test |
        And I reset state upload document
        And I reset my state journey 
        And I filling in form login with the following details:
            | userID      | ptpe2eef |
            | password    | 1234Test |
            | userIDstg   | rutheeab |
            | passwordStg | 1234Test |
        And I click login
        And I click later in pop up biometric
        And I will directing to Hook 1 Onboarding Account Opening
        And I swipe to card Giro Account
        And I choose Giro Account
        And I choose Giro Account MSME
        And I submit my giro type
        And I choose legality business type 'individualBusiness'
        And I submit my legality type
        And I fill NPWP Business
        And I click continue to data personal
        And I click confirm NPWP Business
        And I see page 'Upload eKTP'
        And I update my last journey step to 'Data Employment'
        And I see page 'Data Business Profile'
        When I fill my business profile as followings:
            | businessName       | PT PERORANGAN TERBARU KYC TIGA |
            | industry           | Jasa                           |
            | businessField      | Restoran                       |
            | monthlyIncome      | 30 - 50 juta                   |
            | averageTransaction | 2000000                        |
            | nib                | 9129106701234                  |
            | businessDateStart  | 10/10/2010                     |
        And I submit my business profile
        And I submit business owner list

    @C171479
    Scenario: Submit form Business Address successfully business type PT Perorangan
        Given I am a customer who has submitted business owner list
        When I fill my business address as followings:
            | address  | Jl. Gambir Belok kanan No. 23 |
            | rt       | 010                           |
            | rw       | 027                           |
            | province | DKI JAKARTA                   |
            | city     | JAKARTA SELATAN               |
            | district | PANCORAN                      |
            | village  | PANCORAN                      |
        And I agree to carry out the Rights and Obligations
        And I will directing to page Rights and Obligations
        And I click button agree with Rights and Obligations
        And I will see checkbox Rights and Obligations is checked
        And I submit my business address
        Then I will directing to page upload require documents for business individual
        And I can close the page so that I can back to main dashboard