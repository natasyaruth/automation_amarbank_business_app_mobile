@accountOpeningDashboard
Feature: Account Opening Main Dashboard
    In order to opening my Giro account in SMB
    As a customer
    I can see my latest information in main dashboard

    Background: User has registered and login to dashboard
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

    @C160408
    Scenario: User back again to process account opening
        Given I choose legality business type 'company'
        And I submit my legality type
        And I fill NPWP Business
        And I click continue to data personal
        And I click confirm NPWP Business
        And I see page 'Upload eKTP'
        When I click close in header page
        And I click option exit survey 'Proses akan dilanjutkan nanti'
        And I back to continue process account opening
        Then I see page 'Upload eKTP'    

    @C131962
    Scenario: User can see cards continue to complete data personal after drop off from flow Upload eKTP
        Given I choose legality business type 'company'
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

    @C131963
    Scenario: User can see cards continue to complete data personal after drop off from flow Submit data KTP
        Given I choose legality business type 'company'
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

    @C131964
    Scenario: User can see cards continue to complete data personal after drop off from flow Upload Selfie
        Given I choose legality business type 'company'
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

    @C141154
    Scenario: User can see cards continue to complete data personal after drop off from flow Upload Selfie with KTP
        Given I choose legality business type 'company'
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

    @C131965
    Scenario: User can see cards continue to complete data personal after drop off from flow Submit data Personal
        Given I choose legality business type 'company'
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

    @C131966
    Scenario: User can see cards continue to complete data personal after drop off from flow Submit data Domicile Address
        Given I choose legality business type 'company'
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

    @C131967
    Scenario: User can see cards continue to complete data personal after drop off from flow Submit data Employment
        Given I choose legality business type 'company'
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

    @C131968
    Scenario: User can see cards continue to complete data business after drop off from flow Submit data Business Profile
        Given I choose legality business type 'company'
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

    @C131969
    Scenario: User can see cards continue to complete data business after drop off from flow Submit data Business Owner
        Given I choose legality business type 'ud'
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
        Given I choose legality business type 'company'
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

    @C131971
    Scenario: User can see cards continue to complete data business after drop off from flow Submit data Business Address
        Given I choose legality business type 'company'
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

    @C131972
    Scenario: User can see cards continue to complete upload document after complete flow KYC and KYB
        Given I choose legality business type 'company'
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
        Given I choose legality business type 'company'
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

    @C159198
    Scenario: Check last step after back to previous page and submit data again
        Given I choose legality business type 'company'
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