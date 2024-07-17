Feature: Account Opening KYB PT Perusahaan - Upload Document Business
    In order to opening my Giro account with legality business type PT Perusahaan in SMB
    As a customer
    I want to upload document business as part of the KYB Process

    Background: User choose legality business type PT Perusahaan
        Given I am a registered customer with following details:
            | userID      | ptpeff9b |
            | password    | 1234Test |
            | userIDstg   | ruthbd98 |
            | passwordStg | 1234Test |
        And I filling in form login with the following details:
            | userID      | ptpeff9b |
            | password    | 1234Test |
            | userIDstg   | ruthbd98 |
            | passwordStg | 1234Test |
        And I click login
        And I click later in pop up biometric
        And I will directing to Hook 1 Onboarding Account Opening
        And I swipe to card Giro Account
        And I choose Giro Account
        And I choose Giro Account Corporate
        And I choose legality business type 'company'
        And I submit my legality type
        And I update my last journey step to 'Data Employment'
        And I continue to process KYB
        And I fill my business profile as followings:
            | businessName      | PT. BOTOL MINUM PERKASA RAYA DAN JAYA |
            | industry          | Jasa                                  |
            | businessField     | Restoran                              |
            | monthlyIncome     | 30 - 50 juta                          |
            | averageTransaction| 2000000                               |
            | npwp              | 906283213036000                       |
            | nib               | 9129106701234                         |
            | businessDateStart | 10/10/2010                            |
        And I submit my business profile
        And I submit business director list
        And I fill my business address as followings:
            | address  | Jl. Gambir Belok Kiri No. 10 |
            | rt       | 000                          |
            | rw       | 011                          |
            | province | ACEH                         |
            | city     | KAB. ACEH TIMUR              |
            | district | DARUL AMAN                   |
            | village  |                              |
        And I agree to carry out the Rights and Obligations
        And I will directing to page Rights and Obligations
        And I click button agree with Rights and Obligations
        And I will see checkbox Rights and Obligations is checked
        When I submit my business address

    @C131939
    Scenario: Upload All document business type PT Perusahaan
        Given I am a customer who has uploaded my eKTP photo and selfie
        When I choose method upload document
        And I choose direct upload via app
        And I see files that need to be uploaded for type company
        And I upload all document business for type company
        And I click button progress upload document
        Then I will see all document business company is uploaded
        And I will see button send request account opening