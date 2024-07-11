@upload_document_business
Feature: Account Opening KYB CV - Upload Document Business
    In order to opening my Giro account with legality business type CV in SMB
    As a customer
    I want to upload document business as part of the KYB Process

    Background: User choose legality business type PT Perusahaan
        Given I am a registered customer with following details:
            | userID      | nata5ff1 |
            | password    | 1234Test |
            | userIDstg   | ruth7cb8 |
            | passwordStg | 1234Test |
        And I filling in form login with the following details:
            | userID      | nata5ff1 |
            | password    | 1234Test |
            | userIDstg   | ruth7cb8 |
            | passwordStg | 1234Test |
        And I click login
        And I click later in pop up biometric
        And I will directing to Hook 1 Onboarding Account Opening
        And I swipe to card Giro Account
        And I choose Giro Account
        And I choose Giro Account Corporate
        And I choose legality business type 'cv'
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

    @C131925
    Scenario: Upload some document business via direct app
        Given I am a customer who has submitted business address
        When I choose method upload document
        And I will see bottom sheet option upload document
        And I choose direct upload via app
        And I see files that need to be uploaded for type company
        And I upload document business 'NIB Berbasis Resiko'
        And I upload document business 'Akta Perusahaan'
        And I click button progress upload document
        Then I will see document 'NIB Berbasis Resiko' is uploaded
        And I will see document 'Akta Perusahaan' is uploaded
        And Other document still not uploaded yet
        And I will not see button request account opening

    @C131926
    Scenario: Upload document and user drop off via direct app
        Given I am a customer who has submitted business address
        When I choose method upload document
        And I choose direct upload via app
        And I see files that need to be uploaded for type company
        And I upload document business 'NIB Berbasis Resiko'
        And I back to dashboard
        And I will see card continue to complete upload document business
        And I can continue to page 'Upload Document Business'
        Then I will see document 'NIB Berbasis Resiko' is uploaded
        And I will not see button request account opening

    @C136863
    Scenario: Upload document with method copy link
        Given I am a customer who has submitted business address
        When I choose method upload document
        And I choose upload via link
        Then I will direct to page upload document via link
        And I copy link upload document
        And I will see snackbar success link is copied

    @C136864
    Scenario: Go to page progress upload document company from page upload via link
        Given I am a customer who has submitted business address
        When I choose method upload document
        And I choose upload via link
        And I will direct to page upload document via link
        And I click button direct to page progress upload document
        Then I see files that need to be uploaded for type company

    @C136865
    Scenario: Click link direct upload from other device
        Given I am a customer who has submitted business address
        When I choose method upload document
        And I will see bottom sheet option upload document
        And I choose direct upload via app
        And I see files that need to be uploaded for type company
        And I click link direct upload from other device

    @C136866
    Scenario: Delete one document
        Given I am a customer who has submitted business address
        When I choose method upload document
        And I choose direct upload via app
        And I see files that need to be uploaded for type company
        And I upload document business 'NIB Berbasis Resiko'
        And I click button progress upload document
        And I will see document 'NIB Berbasis Resiko' is uploaded
        And I delete document 'NIB Berbasis Resiko'
        And I will see pop up confirmation delete document
        And I click confirm delete document
        Then I will see document 'NIB Berbasis Resiko' is deleted
        And I will not see button request account opening

    @C136867
    Scenario: Delete some document
        Given I am a customer who has submitted business address
        When I choose method upload document
        And I choose direct upload via app
        And I see files that need to be uploaded for type company
        And I upload all document business for type company
        And I click button progress upload document
        And I will see all document company has been uploaded
        And I will see button request account opening is shown
        And I delete document 'NIB Berbasis Resiko'
        And I click confirm delete document
        And I will not see button request account opening
        Then I will see document 'NIB Berbasis Resiko' is deleted
        And I delete document 'Akta Perusahaan'
        And I click confirm delete document
        And I will not see button request account opening
        And I will see document 'Akta Perusahaan' is deleted
        And other document still exists

    @C136868
    Scenario: Delete all document
        Given I am a customer who has submitted business address
        When I choose method upload document
        And I choose direct upload via app
        And I see files that need to be uploaded for type company
        And I upload all document business for type company
        And I click button progress upload document
        And I will see all document company has been uploaded
        And I will see button request account opening is shown
        And I delete all document company
        Then I will not see all document company
        And I will not see button request account opening

    @C136869
    Scenario: Cancel Delete Document
        Given I am a customer who has submitted business address
        When I choose method upload document
        And I choose direct upload via app
        And I see files that need to be uploaded for type company
        And I upload all document business for type company
        And I click button progress upload document
        And I will see button request account opening is shown
        And I delete document 'Akta Perusahaan'
        And I cancel delete document
        Then I see files that need to be uploaded for type company

    @C136870
    Scenario: Re-upload document business
        Given I am a customer who has submitted business address
        When I choose method upload document
        And I choose direct upload via app
        And I see files that need to be uploaded for type company
        And I upload all document business for type company
        And I click button progress upload document
        And I will see all document business company is uploaded
        And I will see button request account opening is shown
        And I click button request account opening
        And I will direct to page thank you and need verification of my data
        And I click progress account opening
        And I will direct to page detail progress account opening
        And I re-upload my document
        And I will direct to page to re-upload document company
        And I delete document 'SK Kemenkumham'
        And I click confirm delete document
        And I will not see button request account opening
        And I will see document 'SK Kemenkumham' is deleted
        And I will not see button request account opening
        And I upload new document business 'SK Kemenkumham'
        And I click button progress upload document
        Then I will see document 'SK Kemenkumham' is uploaded
        And I will see button request account opening is shown

    @C136871
    Scenario: Go to main dashboard from page thank you and need verification
        Given I am a customer who has submitted business address
        When I choose method upload document
        And I choose direct upload via app
        And I see files that need to be uploaded for type company
        And I upload all document business for type company
        And I click button progress upload document
        And I will see all document business company is uploaded
        And I will see button request account opening is shown
        And I click button request account opening
        And I will direct to page thank you and need verification of my data
        And I click link go to main dashboard
        Then I will see card account 'on verification'
        And I can continue to page 'Detail Progress Account Opening'

    @C136872
    Scenario: Close bottom sheet choosing method upload document
        Given I am a customer who has submitted business address
        When I choose method upload document
        And I will see bottom sheet option upload document
        And I close bottom sheet option upload document
        Then I will directing to page upload require documents for business

    @C136873
    Scenario: Close page Progress upload Document (condition: no uploaded yet)
        Given I am a customer who has submitted business address
        When I choose method upload document
        And I choose direct upload via app
        And I see files that need to be uploaded for type company
        And I close page progress upload document
        And I will see card continue to complete upload document business
        And I can continue to page 'Upload Document Business'
        Then I see files that need to be uploaded for type company
        And I will not see button request account opening

    @C136874
    Scenario: Close page Progress upload Document (condition: some uploaded)
        Given I am a customer who has submitted business address
        When I choose method upload document
        And I choose direct upload via app
        And I see files that need to be uploaded for type company
        And I upload document business 'NIB Berbasis Resiko'
        And I click button progress upload document
        And I will see document 'NIB Berbasis Resiko' is uploaded
        And I upload document business 'NPWP Perusahaan'
        And I click button progress upload document
        And I will see document 'NPWP Perusahaan' is uploaded
        And I close page progress upload document
        Then I will see card continue to complete upload document business
        And I can continue to page 'Upload Document Business'
        And I will see document 'NIB Berbasis Resiko' is uploaded
        And I will see document 'NPWP Perusahaan' is uploaded
        And I will not see button request account opening
        And other document still not uploaded yet

    @C136875
    Scenario: Close in page information progress verification
        Given I am a customer who has submitted business address
        When I choose method upload document
        And I choose direct upload via app
        And I see files that need to be uploaded for type company
        And I upload all document business for type company
        And I click button progress upload document
        And I will see all document business company is uploaded
        And I will see button request account opening is shown
        And I click button request account opening
        And I will direct to page thank you and need verification of my data
        And I click progress account opening
        And I will direct to page detail progress account opening
        And I close page detail progress account opening
        Then I will see card account 'on verification'
        And I can continue to page 'Detail Progress Account Opening'

    @C136876
    Scenario: Close in page upload document via link
        Given I am a customer who has submitted business address
        When I choose method upload document
        And I choose upload via link
        And I will direct to page upload document via link
        And I close page upload document via link
        Then I will see card continue to complete upload document business
        And I can continue to page 'Upload Document Business'
        And I see files that need to be uploaded for type company

    @C136877
    Scenario: Access call center in page Request Account Opening
        Given I am a customer who has submitted business address
        When I choose method upload document
        And I choose direct upload via app
        And I see files that need to be uploaded for type company
        And I upload all document business for type company
        And I click button progress upload document
        And I will see all document business company is uploaded
        And I will see button request account opening is shown
        And I click button request account opening
        And I will direct to page thank you and need verification of my data
        And I click call center
        Then I should see bottom sheet call center with email

    @C136878
    Scenario: Access call centre in page information progress verification 
        Given I am a customer who has submitted business address
        When I choose method upload document
        And I choose direct upload via app
        And I see files that need to be uploaded for type company
        And I upload all document business for type company
        And I click button progress upload document
        And I will see all document business company is uploaded
        And I will see button request account opening is shown
        And I click button request account opening
        And I will direct to page thank you and need verification of my data
        And I click progress account opening
        And I click call center in page detail progress account opening
        Then I should see bottom sheet call center with email

    @C131930
    Scenario: Upload All document business type CV
        Given I am a customer who has submitted business address
        And I choose method upload document
        And I choose direct upload via app
        And I see files that need to be uploaded for type company
        And I upload all document business for type company
        And I click button progress upload document
        Then I will see all document business company is uploaded
        And I will see button request account opening is shown