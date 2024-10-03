@upload_document_business
Feature: Account Opening KYB CV - Upload Document Business
              In order to opening my Giro account with legality business type CV in SMB
              As a customer
              I want to upload document business as part of the KYB Process

        Background: User choose legality business type PT Perusahaan
            Given I am a registered customer with following details:
                  | userID      | deve875b |
                  | password    | 1234Test |
                  | userIDstg   | ruth7cb8 |
                  | passwordStg | 1234Test |   
              And I reset state upload document
              And I reset my state journey
              And complete onboarding document safe and survey
              And I filling in form login with the following details:
                  | userID      | deve875b |
                  | password    | 1234Test |
                  | userIDstg   | ruth7cb8 |
                  | passwordStg | 1234Test |
              And I click login
              And I click later in pop up biometric
              And I will directing to Hook 1 Onboarding Account Opening
              And I swipe to card Giro Account
              And I choose Giro Account
              And I choose Giro Account Corporate
        And I submit my giro type
              And I choose legality business type 'cv'
              And I submit my legality type
              And I fill NPWP Business
              And I click continue to data personal
              And I click confirm NPWP Business
              And I see page 'Upload eKTP'
              And I update my last journey step to 'Data Employment'
              And I see page 'Data Business Profile'
              And I fill my business profile as followings:
                  | businessName       | PT. BOTOL MINUM PERKASA RAYA DAN JAYA |
                  | industry           | Jasa                                  |
                  | businessField      | Restoran                              |
                  | monthlyIncome      | 30 - 50 juta                          |
                  | averageTransaction | 2000000                               |
                  | nib                | 9129106701234                         |
                  | businessDateStart  | 10/10/2010                            |
              And I submit my business profile
              And I submit business director list
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
             When I submit my business address

        @C131925
        Scenario: Upload some document business via direct app
            Given I am a customer who has submitted business address
             When I choose method upload document
              And I will see bottom sheet option upload document
              And I choose direct upload via app
              And I see files that need to be uploaded for type company
              And I upload document business 'NIB' with type 'pdf'
              And I upload document business 'Akta Pendirian' with type 'pdf'
              And I click button progress upload document
             Then I will see document 'NIB' is uploaded
              And I will see document 'Akta Pendirian' is uploaded
              And I will see 'SK Kemenkumham Pendirian' is empty
              And I will see 'NPWP Bisnis' is empty
              And I will not see button request account opening

        @C131926
        Scenario: Upload document and user drop off via direct app
            Given I am a customer who has submitted business address
             When I choose method upload document
              And I choose direct upload via app
              And I see files that need to be uploaded for type company
              And I upload document business 'NIB' with type 'pdf'
              And I close page progress upload document
              And I will see card continue to complete upload document business
              And I can continue to page 'Upload Document Business'
             Then I will see document 'NIB' is uploaded
              And I will not see button request account opening

        @C136863
        Scenario: Upload document with method copy link
            Given I am a customer who has submitted business address
             When I choose method upload document
              And I choose upload via link
             Then I will direct to page upload document via link
              And I copy link upload document
              And I will see snackbar success link is copied
              And will dissapear after 3-5 seconds

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
             Then I will direct to page upload document via link

        @C136866
        Scenario: Delete one document
            Given I am a customer who has submitted business address
             When I choose method upload document
              And I choose direct upload via app
              And I see files that need to be uploaded for type company
              And I upload document business 'NIB' with type 'pdf'
              And I click button progress upload document
              And I will see document 'NIB' is uploaded
              And I will not see button request account opening
              And I delete document 'NIB'
              And I will see pop up confirmation delete document
              And I click confirm delete document
             Then I will see 'NIB' is empty
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
              And I delete document 'NIB'
              And I click confirm delete document
              And I will not see button request account opening
             Then I will see 'NIB' is empty
              And I delete document 'Akta Pendirian'
              And I click confirm delete document
              And I will not see button request account opening
              And I will see 'Akta Pendirian' is empty
              And I will see 'SK Kemenkumham Pendirian' still exists
              And I will see 'NPWP Bisnis' still exists
              And I will see 'Akta Perubahan Terakhir' still exists
              And I will see 'SK Kemenkumham Perubahan Terakhir' still exists

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
              And I click button progress upload document
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
              And I delete document 'Akta Pendirian'
              And I cancel delete document
             Then I will see all document company has been uploaded

        @C136871
        Scenario: Go to main dashboard from page thank you and need verification
            Given I am a customer who has submitted business address
             When I choose method upload document
              And I choose direct upload via app
              And I see files that need to be uploaded for type company
              And I upload all document business for type company
              And I click button progress upload document
              And I will see all document company has been uploaded
              And I will see button request account opening is shown
              And I click button request account opening
              And I will direct to page thank you and need verification of my data
              And I click link go to main dashboard
             Then I will see card account 'on verification'
              And I will see card continue to see progress verification
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
             And complete onboarding document safe and survey
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
              And I upload document business 'NIB' with type 'pdf'
              And I click button progress upload document
              And I will see document 'NIB' is uploaded
              And I upload document business 'NPWP Bisnis' with type 'pdf'
              And I click button progress upload document
              And I will see document 'NPWP Bisnis' is uploaded
              And I close page progress upload document
             Then I will see card continue to complete upload document business
              And I can continue to page 'Upload Document Business'
              And I will see document 'NIB' is uploaded
              And I will see document 'NPWP Bisnis' is uploaded
              And I will not see button request account opening
              And I will see 'Akta Pendirian' is empty
              And I will see 'SK Kemenkumham Pendirian' is empty
              And I will see 'Akta Perubahan Terakhir' is empty
              And I will see 'SK Kemenkumham Perubahan Terakhir' is empty

        @C136875
        Scenario: Close in page information progress verification
            Given I am a customer who has submitted business address
             When I choose method upload document
              And I choose direct upload via app
              And I see files that need to be uploaded for type company
              And I upload all document business for type company
              And I click button progress upload document
              And I will see all document company has been uploaded
              And I will see button request account opening is shown
              And I click button request account opening
              And I will direct to page thank you and need verification of my data
              And I click progress account opening
              And I will direct to page detail progress account opening
              And I close page detail progress account opening
             Then I will see card account 'on verification'
              And I will see card continue to see progress verification
              And I can continue to page 'Detail Progress Account Opening'

        @C136876
        Scenario: Close in page upload document via link - Entry journey from page upload progress
            Given I am a customer who has submitted business address
             When I choose method upload document
              And I choose direct upload via app
              And I see files that need to be uploaded for type company
              And I click link direct upload from other device
              And I will direct to page upload document via link
              And I close page upload document via link
             Then I see files that need to be uploaded for type company
        
        @C140435
        Scenario: Close in page upload document via link - Entry journey from bottom sheet method upload
            Given I am a customer who has submitted business address
             When I choose method upload document
              And I choose upload via link
              And I will direct to page upload document via link
              And I close page upload document via link
             Then I will directing to page upload require documents for business      

        @C136877
        Scenario: Access call center in page Request Account Opening
            Given I am a customer who has submitted business address
             When I choose method upload document
              And I choose direct upload via app
              And I see files that need to be uploaded for type company
              And I upload all document business for type company
              And I click button progress upload document
              And I will see all document company has been uploaded
              And I will see button request account opening is shown
              And I click button request account opening
              And I will direct to page thank you and need verification of my data
              And I click call center
             Then I should see bottom sheet call center with email

        @C136878
        Scenario: Access call center in page information progress verification
            Given I am a customer who has submitted business address
             When I choose method upload document
              And I choose direct upload via app
              And I see files that need to be uploaded for type company
              And I upload all document business for type company
              And I click button progress upload document
              And I will see all document company has been uploaded
              And I will see button request account opening is shown
              And I click button request account opening
              And I will direct to page thank you and need verification of my data
              And I click progress account opening
              And I click call center in page detail progress account opening
             Then I should see bottom sheet call center with email

        @C156887 @FunctTestFunding
        Scenario: Upload document with type JPG
            Given I am a customer who has submitted business address
              And I choose method upload document
              And I choose direct upload via app
              And I see files that need to be uploaded for type company
              And I upload document business 'NIB' with type 'jpg'
              And I click button progress upload document
              Then I will see document 'NIB' is uploaded
              And I will not see button request account opening

        @C156888 @FunctTestFunding
        Scenario: Upload document with type PNG
            Given I am a customer who has submitted business address
              And I choose method upload document
              And I choose direct upload via app
              And I see files that need to be uploaded for type company
              And I upload document business 'NIB' with type 'png'
              And I click button progress upload document
              Then I will see document 'NIB' is uploaded
              And I will not see button request account opening

        @C156889 @FunctTestFunding
        Scenario: Upload document with type JPEG
            Given I am a customer who has submitted business address
              And I choose method upload document
              And I choose direct upload via app
              And I see files that need to be uploaded for type company
              And I upload document business 'NIB' with type 'jpeg'
              And I click button progress upload document
              Then I will see document 'NIB' is uploaded
              And I will not see button request account opening

        @C160188
        Scenario: Checking button account opening if user CV only upload un-required document business
            Given I am a customer who has submitted business address
              And I choose method upload document
              And I choose direct upload via app
              And I see files that need to be uploaded for type company
              And I upload document business 'Akta Perubahan Terakhir' with type 'pdf'
              And I upload document business 'SK Kemenkumham Perubahan Terakhir' with type 'pdf'
              And I click button progress upload document
              Then I will see document 'Akta Perubahan Terakhir' is uploaded
              And I will see document 'SK Kemenkumham Perubahan Terakhir' is uploaded
              And I will not see button request account opening

        @C160189
        Scenario: Upload only document required business type CV   
            Given I am a customer who has submitted business address
              And I choose method upload document
              And I choose direct upload via app
              And I see files that need to be uploaded for type company
              And I upload all document business required for type company
              And I click button progress upload document
            Then I will see all document required company has been uploaded
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
              And I will see document business required for type company

        @C131930
        Scenario: Upload All document business type CV
            Given I am a customer who has submitted business address
              And I choose method upload document
              And I choose direct upload via app
              And I see files that need to be uploaded for type company
              And I upload all document business for type company
              And I click button progress upload document
             Then I will see all document company has been uploaded
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
              And I will see document business for type company    