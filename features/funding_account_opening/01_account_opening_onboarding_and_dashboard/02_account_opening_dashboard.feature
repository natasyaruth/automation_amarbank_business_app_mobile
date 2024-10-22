@accountOpeningDashboard
Feature: Account Opening Main Dashboard
    In order to opening my Giro account in SMB
    As a customer
    I can see my latest information in main dashboard        

    @C160408
    Scenario: User back again to process account opening
        Given I am a registered customer with following details:
            | userID      | devece34 |
            | password    | 1234Test |
            | userIDstg   | stagda20 |
            | passwordStg | 1234Test |
        And I reset my state journey 
        When I filling in form login with the following details:
            | userID      | devece34 |
            | password    | 1234Test |
            | userIDstg   | stagda20 |
            | passwordStg | 1234Test |
        And I click login
        And I click later in pop up biometric
        And I will directing to Hook 1 Onboarding Account Opening
        And I swipe to card Giro Account
        And I choose Giro Account
        And I choose Giro Account MSME
        And I submit my giro type
        And I choose legality business type 'company'
        And I submit my legality type
        And I fill NPWP Business
        And I click continue to data personal
        And I click confirm NPWP Business
        And I see page 'Upload eKTP'
        When I click close in header page
        And I click option exit survey 'Proses akan dilanjutkan nanti'
        And I back to continue process account opening
        Then I see page 'Upload eKTP'    

    @C131962 @FunctTestFundingSprint4
    Scenario: User can see cards continue to complete data personal after drop off from flow Upload eKTP
        Given I am a registered customer with following details:
            | userID      | devece34 |
            | password    | 1234Test |
            | userIDstg   | stagda20 |
            | passwordStg | 1234Test |
        And I reset my state journey 
        When I filling in form login with the following details:
            | userID      | devece34 |
            | password    | 1234Test |
            | userIDstg   | stagda20 |
            | passwordStg | 1234Test |
        And I click login
        And I click later in pop up biometric
        And I will directing to Hook 1 Onboarding Account Opening
        And I swipe to card Giro Account
        And I choose Giro Account
        And I choose Giro Account MSME
        And I submit my giro type
        And I choose legality business type 'company'
        And I submit my legality type
        And I fill NPWP Business
        And I click continue to data personal
        And I click confirm NPWP Business
        And I see page 'Upload eKTP'
        When I click close in header page
        And I click option exit survey 'Proses akan dilanjutkan nanti'
        And I submit my exit survey
        Then I will see card continue to data personal
        And I can continue to page 'Upload eKTP'

    @C131963 @FunctTestFundingSprint4
    Scenario: User can see cards continue to complete data personal after drop off from flow Submit data KTP
        Given I am a registered customer with following details:
            | userID      | devece34 |
            | password    | 1234Test |
            | userIDstg   | stagda20 |
            | passwordStg | 1234Test |
        And I reset my state journey 
        When I filling in form login with the following details:
            | userID      | devece34 |
            | password    | 1234Test |
            | userIDstg   | stagda20 |
            | passwordStg | 1234Test |
        And I click login
        And I click later in pop up biometric
        And I will directing to Hook 1 Onboarding Account Opening
        And I swipe to card Giro Account
        And I choose Giro Account
        And I choose Giro Account MSME
        And I submit my giro type
        And I choose legality business type 'company'
        And I submit my legality type
        And I fill NPWP Business
        And I click continue to data personal
        And I click confirm NPWP Business
        And I see page 'Upload eKTP'
        And I click take photo eKTP
        And I will directing to page take photo eKTP
        And I take photo eKTP
        And I submit my eKTP photo
        And I see page 'Data KTP'
        When I click close in header page
        And I click option exit survey 'Proses akan dilanjutkan nanti'
        And I submit my exit survey
        Then I will see card continue to data personal
        And I can continue to page 'Data KTP'

    @C131964 @FunctTestFundingSprint4
    Scenario: User can see cards continue to complete data personal after drop off from flow Upload Selfie
        Given I am a registered customer with following details:
            | userID      | devece34 |
            | password    | 1234Test |
            | userIDstg   | stagda20 |
            | passwordStg | 1234Test |
        And I reset my state journey 
        When I filling in form login with the following details:
            | userID      | devece34 |
            | password    | 1234Test |
            | userIDstg   | stagda20 |
            | passwordStg | 1234Test |
        And I click login
        And I click later in pop up biometric
        And I will directing to Hook 1 Onboarding Account Opening
        And I swipe to card Giro Account
        And I choose Giro Account
        And I choose Giro Account MSME
        And I submit my giro type
        And I choose legality business type 'company'
        And I submit my legality type
        And I fill NPWP Business
        And I click continue to data personal
        And I click confirm NPWP Business
        And I see page 'Upload eKTP'
        And I update my last journey step to 'Data KTP'
        And I see page 'Upload Selfie'
        When I click close in header page
        And I click option exit survey 'Proses akan dilanjutkan nanti'
        And I submit my exit survey
        Then I will see card continue to data personal
        And I can continue to page 'Upload Selfie'

    @C141154 @FunctTestFundingSprint4
    Scenario: User can see cards continue to complete data personal after drop off from flow Upload Selfie with KTP
        Given I am a registered customer with following details:
            | userID      | devece34 |
            | password    | 1234Test |
            | userIDstg   | stagda20 |
            | passwordStg | 1234Test |
        And I reset my state journey 
        When I filling in form login with the following details:
            | userID      | devece34 |
            | password    | 1234Test |
            | userIDstg   | stagda20 |
            | passwordStg | 1234Test |
        And I click login
        And I click later in pop up biometric
        And I will directing to Hook 1 Onboarding Account Opening
        And I swipe to card Giro Account
        And I choose Giro Account
        And I choose Giro Account MSME
        And I submit my giro type
        And I choose legality business type 'company'
        And I submit my legality type
        And I fill NPWP Business
        And I click continue to data personal
        And I click confirm NPWP Business
        And I see page 'Upload eKTP'
        And I update my last journey step to 'Upload Selfie'
        And I see page 'Upload Selfie with KTP'
        When I click close in header page
        And I click option exit survey 'Proses akan dilanjutkan nanti'
        And I submit my exit survey
        Then I will see card continue to data personal
        And I can continue to page 'Upload Selfie with KTP'      

    @C131965 @FunctTestFundingSprint4
    Scenario: User can see cards continue to complete data personal after drop off from flow Submit data Personal
        Given I am a registered customer with following details:
            | userID      | devece34 |
            | password    | 1234Test |
            | userIDstg   | stagda20 |
            | passwordStg | 1234Test |
        And I reset my state journey 
        When I filling in form login with the following details:
            | userID      | devece34 |
            | password    | 1234Test |
            | userIDstg   | stagda20 |
            | passwordStg | 1234Test |
        And I click login
        And I click later in pop up biometric
        And I will directing to Hook 1 Onboarding Account Opening
        And I swipe to card Giro Account
        And I choose Giro Account
        And I choose Giro Account MSME
        And I submit my giro type
        And I choose legality business type 'company'
        And I submit my legality type
        And I fill NPWP Business
        And I click continue to data personal
        And I click confirm NPWP Business
        And I see page 'Upload eKTP'
        And I update my last journey step to 'Upload Selfie with KTP'
        And I see page 'Data Personal'
        When I click close in header page
        And I click option exit survey 'Proses akan dilanjutkan nanti'
        And I submit my exit survey
        Then I will see card continue to data personal
        And I can continue to page 'Data Personal'  

    @C131966 @FunctTestFundingSprint4
    Scenario: User can see cards continue to complete data personal after drop off from flow Submit data Domicile Address
        Given I am a registered customer with following details:
            | userID      | devece34 |
            | password    | 1234Test |
            | userIDstg   | stagda20 |
            | passwordStg | 1234Test |
        And I reset my state journey 
        When I filling in form login with the following details:
            | userID      | devece34 |
            | password    | 1234Test |
            | userIDstg   | stagda20 |
            | passwordStg | 1234Test |
        And I click login
        And I click later in pop up biometric
        And I will directing to Hook 1 Onboarding Account Opening
        And I swipe to card Giro Account
        And I choose Giro Account
        And I choose Giro Account MSME
        And I submit my giro type
        And I choose legality business type 'company'
        And I submit my legality type
        And I fill NPWP Business
        And I click continue to data personal
        And I click confirm NPWP Business
        And I see page 'Upload eKTP'
        And I update my last journey step to 'Data Personal'
        And I see page 'Data Domicile Address'
        When I click back in header page
        And I click close in header page
        And I click option exit survey 'Proses akan dilanjutkan nanti'
        And I submit my exit survey
        Then I will see card continue to data personal
        And I can continue to page 'Data Domicile Address'

    @C131967 @FunctTestFundingSprint4
    Scenario: User can see cards continue to complete data personal after drop off from flow Submit data Employment
        Given I am a registered customer with following details:
            | userID      | devece34 |
            | password    | 1234Test |
            | userIDstg   | stagda20 |
            | passwordStg | 1234Test |
        And I reset my state journey 
        When I filling in form login with the following details:
            | userID      | devece34 |
            | password    | 1234Test |
            | userIDstg   | stagda20 |
            | passwordStg | 1234Test |
        And I click login
        And I click later in pop up biometric
        And I will directing to Hook 1 Onboarding Account Opening
        And I swipe to card Giro Account
        And I choose Giro Account
        And I choose Giro Account MSME
        And I submit my giro type
        And I choose legality business type 'company'
        And I submit my legality type
        And I fill NPWP Business
        And I click continue to data personal
        And I click confirm NPWP Business
        And I see page 'Upload eKTP'
        And I update my last journey step to 'Data Domicile Address'
        And I see page 'Data Employment'
        When I click back in header page
        And I click back in header page
        And I click close in header page
        And I click option exit survey 'Proses akan dilanjutkan nanti'
        And I submit my exit survey
        Then I will see card continue to data personal
        And I can continue to page 'Data Employment'

    @C131968 @FunctTestFundingSprint4
    Scenario: User can see cards continue to complete data business after drop off from flow Submit data Business Profile
        Given I am a registered customer with following details:
            | userID      | devece34 |
            | password    | 1234Test |
            | userIDstg   | stagda20 |
            | passwordStg | 1234Test |
        And I reset my state journey 
        When I filling in form login with the following details:
            | userID      | devece34 |
            | password    | 1234Test |
            | userIDstg   | stagda20 |
            | passwordStg | 1234Test |
        And I click login
        And I click later in pop up biometric
        And I will directing to Hook 1 Onboarding Account Opening
        And I swipe to card Giro Account
        And I choose Giro Account
        And I choose Giro Account MSME
        And I submit my giro type
        And I choose legality business type 'company'
        And I submit my legality type
        And I fill NPWP Business
        And I click continue to data personal
        And I click confirm NPWP Business
        And I see page 'Upload eKTP'
        And I update my last journey step to 'Data Employment'
        And I see page 'Data Business Profile'
        When I click close in header page
        And I click option exit survey 'Proses akan dilanjutkan nanti'
        And I submit my exit survey
        Then I will see card continue to data business
        And I can continue to page 'Data Business Profile'

    @C131969 @FunctTestFundingSprint4
    Scenario: User can see cards continue to complete data business after drop off from flow Submit data Business Owner
        Given I am a registered customer with following details:
            | userID      | devece34 |
            | password    | 1234Test |
            | userIDstg   | stagda20 |
            | passwordStg | 1234Test |
        And I reset my state journey 
        When I filling in form login with the following details:
            | userID      | devece34 |
            | password    | 1234Test |
            | userIDstg   | stagda20 |
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
        And I fill my business profile as followings:
            | businessName      | PT. ABCD        |
            | industry          | Jasa            |
            | businessField     | Restoran        |
            | monthlyIncome     | 30 - 50 juta    |
            | averageTransaction| 2000000         |
            | nib               | 9129106701234   |
            | businessDateStart | 10/10/2010      |
        And I submit my business profile
        And I see page 'Data Business Owner'
        When I click back in header page
        And I will see form 'Data Business Profile' is filled
        When I click close in header page
        And I click option exit survey 'Proses akan dilanjutkan nanti'
        And I submit my exit survey
        Then I will see card continue to data business
        And I can continue to page 'Data Business Owner'

    @C131970
    Scenario: User can see cards continue to complete data business after drop off from flow Submit data Director List
        Given I am a registered customer with following details:
            | userID      | devece34 |
            | password    | 1234Test |
            | userIDstg   | stagda20 |
            | passwordStg | 1234Test |
        And I reset my state journey 
        When I filling in form login with the following details:
            | userID      | devece34 |
            | password    | 1234Test |
            | userIDstg   | stagda20 |
            | passwordStg | 1234Test |
        And I click login
        And I click later in pop up biometric
        And I will directing to Hook 1 Onboarding Account Opening
        And I swipe to card Giro Account
        And I choose Giro Account
        And I choose Giro Account MSME
        And I submit my giro type
        And I choose legality business type 'company'
        And I submit my legality type
        And I fill NPWP Business
        And I click continue to data personal
        And I click confirm NPWP Business
        And I see page 'Upload eKTP'
        And I update my last journey step to 'Data Employment'
        And I see page 'Data Business Profile'
        And I fill my business profile as followings:
            | businessName      | PT. ABCD        |
            | industry          | Jasa            |
            | businessField     | Restoran        |
            | monthlyIncome     | 30 - 50 juta    |
            | averageTransaction| 2000000         |
            | nib               | 9129106701234   |
            | businessDateStart | 10/10/2010      |
        And I submit my business profile
        And I see page 'Data Director List'
        When I click back in header page
        And I will see form 'Data Business Profile' is filled
        And I click close in header page
        And I click option exit survey 'Proses akan dilanjutkan nanti'
        And I submit my exit survey
        Then I will see card continue to data business
        And I can continue to page 'Data Director List'

    @C131971 @FunctTestFundingSprint4
    Scenario: User can see cards continue to complete data business after drop off from flow Submit data Business Address
        Given I am a registered customer with following details:
            | userID      | devece34 |
            | password    | 1234Test |
            | userIDstg   | stagda20 |
            | passwordStg | 1234Test |
        And I reset my state journey 
        When I filling in form login with the following details:
            | userID      | devece34 |
            | password    | 1234Test |
            | userIDstg   | stagda20 |
            | passwordStg | 1234Test |
        And I click login
        And I click later in pop up biometric
        And I will directing to Hook 1 Onboarding Account Opening
        And I swipe to card Giro Account
        And I choose Giro Account
        And I choose Giro Account MSME
        And I submit my giro type
        And I choose legality business type 'company'
        And I submit my legality type
        And I fill NPWP Business
        And I click continue to data personal
        And I click confirm NPWP Business
        And I see page 'Upload eKTP'
        And I update my last journey step to 'Data Employment'
        And I see page 'Data Business Profile'
        And I fill my business profile as followings:
            | businessName      | PT. ABCD        |
            | industry          | Jasa            |
            | businessField     | Restoran        |
            | monthlyIncome     | 30 - 50 juta    |
            | averageTransaction| 2000000         |
            | nib               | 9129106701234   |
            | businessDateStart | 10/10/2010      |
        And I submit my business profile
        And I submit business director
        And I see page 'Data Business Address'
        When I click back in header page
        And I click back in header page
        And I will see form 'Data Business Profile' is filled
        And I click close in header page
        And I click option exit survey 'Proses akan dilanjutkan nanti'
        And I submit my exit survey
        Then I will see card continue to data business
        And I can continue to page 'Data Director List'

    @C131972 @FunctTestFundingSprint4
    Scenario: User can see cards continue to complete upload document after complete flow KYC and KYB
        Given I am a registered customer with following details:
            | userID      | devece34 |
            | password    | 1234Test |
            | userIDstg   | stagda20 |
            | passwordStg | 1234Test |
        And I reset my state journey 
        When I filling in form login with the following details:
            | userID      | devece34 |
            | password    | 1234Test |
            | userIDstg   | stagda20 |
            | passwordStg | 1234Test |
        And I click login
        And I click later in pop up biometric
        And I will directing to Hook 1 Onboarding Account Opening
        And I swipe to card Giro Account
        And I choose Giro Account
        And I choose Giro Account MSME
        And I submit my giro type
        And I choose legality business type 'company'
        And I submit my legality type
        And I fill NPWP Business
        And I click continue to data personal
        And I click confirm NPWP Business
        And I see page 'Upload eKTP'
        And I update my last journey step to 'Data Employment'
        And I see page 'Data Business Profile'
        And I fill my business profile as followings:
            | businessName      | PT. ABCD        |
            | industry          | Jasa            |
            | businessField     | Restoran        |
            | monthlyIncome     | 30 - 50 juta    |
            | averageTransaction| 2000000         |
            | nib               | 9129106701234   |
            | businessDateStart | 10/10/2010      |
        And I submit my business profile
        And I submit business director
        And I fill my business address as followings:
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
        And I see page 'Method Upload Document'
        And I close page upload document
        Then I will see card continue to complete upload document business
        And I can continue to page 'Upload Document Business'

    @C131973
    Scenario: User can see cards continue to complete upload document and register director list
        Given I am a registered customer with following details:
            | userID      | devece34 |
            | password    | 1234Test |
            | userIDstg   | stagda20 |
            | passwordStg | 1234Test |
        And I reset my state journey 
        When I filling in form login with the following details:
            | userID      | devece34 |
            | password    | 1234Test |
            | userIDstg   | stagda20 |
            | passwordStg | 1234Test |
        And I click login
        And I click later in pop up biometric
        And I will directing to Hook 1 Onboarding Account Opening
        And I swipe to card Giro Account
        And I choose Giro Account
        And I choose Giro Account MSME
        And I submit my giro type
        And I choose legality business type 'company'
        And I submit my legality type
        And I fill NPWP Business
        And I click continue to data personal
        And I click confirm NPWP Business
        And I see page 'Upload eKTP'
        And I update my last journey step to 'Data Employment'
        And I see page 'Data Business Profile'
        And I fill my business profile as followings:
            | businessName      | PT. ABCD        |
            | industry          | Jasa            |
            | businessField     | Restoran        |
            | monthlyIncome     | 30 - 50 juta    |
            | averageTransaction| 2000000         |
            | nib               | 9129106701234   |
            | businessDateStart | 10/10/2010      |
        And I submit my business profile
        And I click add business director
        And I fill business director data as followings:
            | fullName | BIMO PURWOKO        |
            | email    | bimo@trash-mail.com |
            | nik      | 3166021710820021    |
        And I save data director
        And I submit business director list
        And I confirm my director lists
        And I fill my business address as followings:
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
        And I see page 'Method Upload Document'
        And I close page upload document
        Then I will see card continue to complete upload document business and registration director list
        And I can continue to page 'Registration Director'
        And I can see details registration director

    @C159198 @FunctTestFundingSprint4
    Scenario: Check last step after back to previous page and submit data again
        Given I am a registered customer with following details:
            | userID      | devece34 |
            | password    | 1234Test |
            | userIDstg   | stagda20 |
            | passwordStg | 1234Test |
        And I reset my state journey 
        When I filling in form login with the following details:
            | userID      | devece34 |
            | password    | 1234Test |
            | userIDstg   | stagda20 |
            | passwordStg | 1234Test |
        And I click login
        And I click later in pop up biometric
        And I will directing to Hook 1 Onboarding Account Opening
        And I swipe to card Giro Account
        And I choose Giro Account
        And I choose Giro Account MSME
        And I submit my giro type
        And I choose legality business type 'company'
        And I submit my legality type
        And I fill NPWP Business
        And I click continue to data personal
        And I click confirm NPWP Business
        And I see page 'Upload eKTP'
        And I update my last journey step to 'Data Domicile Address'
        And I see page 'Data Employment'
        When I click back in header page
        And I click back in header page
        And I see page 'Data Personal'
        And I submit my personal data details individual and upload my npwp as followings:
            | lastEducation        | SMA           |
            | motherName           | NADYA LAMUSU  |
            | referenceName        | IBU SAYA      |
            | referencePhoneNumber | 812343455677  |
            | purposeAccount       | Rekening Gaji |
        And I can continue to page 'Data Domicile Address'

    @C163375
    Scenario: User can see detail card list director with status on progress KYC
        Given I am a customer that recently registered to amarbank business with data as below
            | fullName        | Testing                 |
            | email           | testing_41@gmail.com    |
            | phoneNumber     | 899967754041            |
            | password        | 1234Test                |
        And I login using my user id that I recently receive through email
        And I click later in pop up biometric
        And I will directing to Hook 1 Onboarding Account Opening
        And I click later
        When I register initiator with partner as below
            | fullName        | RUDI                   |
            | email           | testing_51@gmail.com   |
            | phoneNumber     | 899960054041           |
            | password        | 1234Test               |
        And I choose other
        And I click logout
        And I login using my user id that I recently receive through email
        And I will see card continue to complete registration director list
        And I can continue to page 'Registration Director'
        And I can see details registration director
        And I click back in header page
        And I choose other
        And I click logout
        And I register invitee with business code
        And I register invitee until 'Upload eKTP'
        And I login using account initiator
        And I will see card continue to complete registration director list
        And I can continue to page 'Registration Director'
        And I can see details registration director with status still on process KYC with last step 'Upload eKTP'

    @C163376
    Scenario: User can see detail card list director with status complete
        Given I am a customer that recently registered to amarbank business with data as below
            | fullName        | Testing                 |
            | email           | testing_42@gmail.com    |
            | phoneNumber     | 899967754041            |
            | password        | 1234Test                |
        And I login using my user id that I recently receive through email
        And I click later in pop up biometric
        And I will directing to Hook 1 Onboarding Account Opening
        And I click later
        When I register initiator with partner as below
            | fullName        | RUDI                   |
            | email           | testing_51@gmail.com   |
            | phoneNumber     | 899960054041           |
            | password        | 1234Test               |
        And I choose other
        And I click logout
        And I login using my user id that I recently receive through email
        And I will see card continue to complete registration director list
        And I can continue to page 'Registration Director'
        And I can see details registration director
        And I click back in header page
        And I choose other
        And I click logout
        And I register invitee with business code
        And I register invitee until 'Upload Selfie with KTP'
        And I login using account initiator
        And I will not see card continue to complete registration director list

    @C163377
    Scenario: Cancel resend business code
        Given I am a customer that recently registered to amarbank business with data as below
            | fullName        | Testing                 |
            | email           | testing_43@gmail.com    |
            | phoneNumber     | 899967754041            |
            | password        | 1234Test                |
        And I login using my user id that I recently receive through email
        And I click later in pop up biometric
        And I will directing to Hook 1 Onboarding Account Opening
        And I click later
        When I register initiator with partner as below
            | fullName        | RUDI                   |
            | email           | testing_53@gmail.com   |
            | phoneNumber     | 899960054041           |
            | password        | 1234Test               |
        And I choose other
        And I click logout
        And I login using my user id that I recently receive through email
        And I will see card continue to complete registration director list
        And I can continue to page 'Registration Director'
        And I can see details registration director
        And I click button resend business code
        And I will see pop up confirm resend business code contain with email invitee
        And I click back to list directors
        Then I back to list director

    @C163378
    Scenario: Resend business code
        Given I am a customer that recently registered to amarbank business with data as below
            | fullName        | Testing                 |
            | email           | testing_44@gmail.com    |
            | phoneNumber     | 899967754041            |
            | password        | 1234Test                |
        And I login using my user id that I recently receive through email
        And I click later in pop up biometric
        And I will directing to Hook 1 Onboarding Account Opening
        And I click later
        When I register initiator with partner as below
            | fullName        | RUDI                   |
            | email           | testing_54@gmail.com   |
            | phoneNumber     | 899960054041           |
            | password        | 1234Test               |
        And I choose other
        And I click logout
        And I login using my user id that I recently receive through email
        And I will see card continue to complete registration director list
        And I can continue to page 'Registration Director'
        And I can see details registration director
        And I click button resend business code
        And I will see pop up confirm resend business code contain with email invitee
        And I confirm resend business code
        Then I will see snackbar success resend business code
        And I will not see button resend business code
        And I get same business code with the first one    

    @C163379
    Scenario: Close bottom sheet change email invitee
        Given I am a customer that recently registered to amarbank business with data as below
            | fullName        | Testing                 |
            | email           | testing_45@gmail.com    |
            | phoneNumber     | 899967754041            |
            | password        | 1234Test                |
        And I login using my user id that I recently receive through email
        And I click later in pop up biometric
        And I will directing to Hook 1 Onboarding Account Opening
        And I click later
        When I register initiator with partner as below
            | fullName        | RUDI                   |
            | email           | testing_55@gmail.com   |
            | phoneNumber     | 899960054041           |
            | password        | 1234Test               |
        And I choose other
        And I click logout
        And I login using my user id that I recently receive through email
        And I will see card continue to complete registration director list
        And I can continue to page 'Registration Director'
        And I can see details registration director
        And I click button change email partner
        And I will see bottom sheet change email invitee with default email
        And I close bottom sheet change email invitee
        Then I back to list director

    @C163380
    Scenario: Clear email invitee by keyboard
        Given I am a customer that recently registered to amarbank business with data as below
            | fullName        | Testing                 |
            | email           | testing_46@gmail.com    |
            | phoneNumber     | 899967754041            |
            | password        | 1234Test                |
        And I login using my user id that I recently receive through email
        And I click later in pop up biometric
        And I will directing to Hook 1 Onboarding Account Opening
        And I click later
        When I register initiator with partner as below
            | fullName        | RUDI                   |
            | email           | testing_56@gmail.com   |
            | phoneNumber     | 899960054041           |
            | password        | 1234Test               |
        And I choose other
        And I click logout
        And I login using my user id that I recently receive through email
        And I will see card continue to complete registration director list
        And I can continue to page 'Registration Director'
        And I can see details registration director
        And I click button change email partner
        And I will see bottom sheet change email invitee with default email
        And I clear email via keyboard
        Then I will see button save and resend business code is disabled

    @C163381
    Scenario: Clear email invitee by icon clear
        Given I am a customer that recently registered to amarbank business with data as below
            | fullName        | Testing                 |
            | email           | testing_47@gmail.com    |
            | phoneNumber     | 899967754041            |
            | password        | 1234Test                |
        And I login using my user id that I recently receive through email
        And I click later in pop up biometric
        And I will directing to Hook 1 Onboarding Account Opening
        And I click later
        When I register initiator with partner as below
            | fullName        | RUDI                   |
            | email           | testing_58@gmail.com   |
            | phoneNumber     | 899960054041           |
            | password        | 1234Test               |
        And I choose other
        And I click logout
        And I login using my user id that I recently receive through email
        And I will see card continue to complete registration director list
        And I can continue to page 'Registration Director'
        And I can see details registration director
        And I click button change email partner
        And I will see bottom sheet change email invitee with default email
        And I clear email via icon clear
        Then I will see button save and resend business code is disabled

    @C163382
    Scenario: Input incorrect email invitee format
        Given I am a customer that recently registered to amarbank business with data as below
            | fullName        | Testing                 |
            | email           | testing_48@gmail.com    |
            | phoneNumber     | 899967754041            |
            | password        | 1234Test                |
        And I login using my user id that I recently receive through email
        And I click later in pop up biometric
        And I will directing to Hook 1 Onboarding Account Opening
        And I click later
        When I register initiator with partner as below
            | fullName        | RUDI                   |
            | email           | testing_58@gmail.com   |
            | phoneNumber     | 899960054041           |
            | password        | 1234Test               |
        And I choose other
        And I click logout
        And I login using my user id that I recently receive through email
        And I will see card continue to complete registration director list
        And I can continue to page 'Registration Director'
        And I can see details registration director
        And I click button change email partner
        And I input incorrect format email
        Then I will see message error email not in true format

    @C163383
    Scenario: Back to bottom sheet change email
        Given I am a customer that recently registered to amarbank business with data as below
            | fullName        | Testing                 |
            | email           | testing_49@gmail.com    |
            | phoneNumber     | 899967754041            |
            | password        | 1234Test                |
        And I login using my user id that I recently receive through email
        And I click later in pop up biometric
        And I will directing to Hook 1 Onboarding Account Opening
        And I click later
        When I register initiator with partner as below
            | fullName        | RUDI                   |
            | email           | testing_59@gmail.com   |
            | phoneNumber     | 899960054041           |
            | password        | 1234Test               |
        And I choose other
        And I click logout
        And I login using my user id that I recently receive through email
        And I will see card continue to complete registration director list
        And I can continue to page 'Registration Director'
        And I can see details registration director
        And I click button change email partner
        And I will see bottom sheet change email invitee with default email
        And I save and resend business code
        And I click back to bottom sheet change email invitee
        Then I will see bottom sheet change email invitee with default email

    @C163384
    Scenario: Change email invitee with same email as before
        Given I am a customer that recently registered to amarbank business with data as below
            | fullName        | Testing                 |
            | email           | testing_401@gmail.com   |
            | phoneNumber     | 899967754041            |
            | password        | 1234Test                |
        And I login using my user id that I recently receive through email
        And I click later in pop up biometric
        And I will directing to Hook 1 Onboarding Account Opening
        And I click later
        When I register initiator with partner as below
            | fullName        | RUDI                   |
            | email           | testing_301@gmail.com  |
            | phoneNumber     | 899960054041           |
            | password        | 1234Test               |
        And I choose other
        And I click logout
        And I login using my user id that I recently receive through email
        And I will see card continue to complete registration director list
        And I can continue to page 'Registration Director'
        And I can see details registration director
        And I click button change email partner
        And I will see bottom sheet change email invitee with default email
        And I save and resend business code
        And I will see pop up contain with old email and new email invitee
        And I change the email invitee
        Then I will see snackbar success change new email invitee and resend business code
        And I will not see button resend business code and change email invitee
        And I will see email invitee is not change

    @C163385
    Scenario: Change email invitee with different email with the first one
        Given I am a customer that recently registered to amarbank business with data as below
            | fullName        | Testing                 |
            | email           | testing_402@gmail.com   |
            | phoneNumber     | 899967754041            |
            | password        | 1234Test                |
        And I login using my user id that I recently receive through email
        And I click later in pop up biometric
        And I will directing to Hook 1 Onboarding Account Opening
        And I click later
        When I register initiator with partner as below
            | fullName        | RUDI                   |
            | email           | testing_302@gmail.com  |
            | phoneNumber     | 899960054041           |
            | password        | 1234Test               |
        And I choose other
        And I click logout
        And I login using my user id that I recently receive through email
        And I will see card continue to complete registration director list
        And I can continue to page 'Registration Director'
        And I can see details registration director
        And I click button change email partner
        And I input new email invitee with 'testing_77@gmail.com'
        And I save and resend business code
        And I will see pop up contain with old email and new email invitee
        And I change the email invitee
        Then I will see snackbar success change new email invitee and resend business code
        And I will not see button resend business code and change email invitee
        And I will see email invitee is update with new email