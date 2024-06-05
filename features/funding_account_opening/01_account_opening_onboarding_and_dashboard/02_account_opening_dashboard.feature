@accountOpeningDashboard
Feature: Account Opening Main Dashboard
    In order to opening my Giro account in SMB
    As a customer
    I can see my latest information in main dashboard

    Background: User has registered and login to dashboard
        Given I am a registered customer with following details:
            | userID      | johnbf89 |
            | password    | 1234Test |
            | userIDstg   | stag9a38 |
            | passwordStg | 1234Test |
        When I filling in form login with the following details:
            | userID      | johnbf89 |
            | password    | 1234Test |
            | userIDstg   | stag9a38 |
            | passwordStg | 1234Test |
        And I click login
        And I will directing to Hook 1 Onboarding Account Opening
        And I swipe to card Giro Account
        And I choose Giro Account
        And I choose Giro Account MSME

    @C96599
    Scenario: User can see cards continue to complete data personal after drop off from flow Upload eKTP
        Given I am a customer want to open Giro Account
        And I choose legality business type 'company'
        And I submit my legality type
        And I see page 'Upload eKTP'
        And I back to dashboard
        And I click later in pop up biometric
        Then I will see card continue to data personal
        And I can continue to page 'Upload eKTP'

    @C96600
    Scenario: User can see cards continue to complete data personal after drop off from flow Submit data KTP
        Given I am a customer want to open Giro Account
        And I choose legality business type 'company'
        And I submit my legality type
        And I upload my eKTP photo
        And I see page 'Data KTP'
        And I back to dashboard
        And I click later in pop up biometric
        Then I will see card continue to data personal
        And I can continue to page 'Data KTP'

    @C96601
    Scenario: User can see cards continue to complete data personal after drop off from flow Upload Selfie
        Given I am a customer want to open Giro Account
        And I choose legality business type 'company'
        And I submit my legality type
        And I update my last journey step to 'Data KTP'
        And I see page 'Upload Selfie'
        And I back to dashboard
        And I click later in pop up biometric
        Then I will see card continue to data personal
        And I can continue to page 'Upload Selfie'

    @C96602
    Scenario: User can see cards continue to complete data personal after drop off from flow Submit data Personal
        Given I am a customer want to open Giro Account
        And I choose legality business type 'company'
        And I submit my legality type
        And I update my last journey step to 'Upload Selfie'
        And I see page 'Data Personal'
        And I back to dashboard
        And I click later in pop up biometric
        Then I will see card continue to data personal
        And I can continue to page 'Data Personal'

    @C96603
    Scenario: User can see cards continue to complete data personal after drop off from flow Submit data Domicile Address
        Given I am a customer want to open Giro Account
        And I choose legality business type 'company'
        And I submit my legality type
        And I update my last journey step to 'Data Personal'
        And I see page 'Data Domicile Address'
        And I back to dashboard
        And I click later in pop up biometric
        Then I will see card continue to data personal
        And I can continue to page 'Data Domicile Address'

    @C96604
    Scenario: User can see cards continue to complete data personal after drop off from flow Submit data Employment
        Given I am a customer want to open Giro Account
        And I choose legality business type 'company'
        And I submit my legality type
        And I update my last journey step to 'Data Domicile Address'
        And I see page 'Data Employment'
        And I back to dashboard
        And I click later in pop up biometric
        Then I will see card continue to data personal
        And I can continue to page 'Data Employment'

    @C96605
    Scenario: User can see cards continue to complete data business after drop off from flow Submit data Business Profile
        Given I am a customer want to open Giro Account
        And I choose legality business type 'company'
        And I submit my legality type
        And I update my last journey step to 'Data Employment'
        And I continue to process KYB
        And I see page 'Data Business Profile'
        And I back to dashboard
        And I click later in pop up biometric
        Then I will see card continue to data business
        And I can continue to page 'Continue Process KYB'

    @C96606
    Scenario: User can see cards continue to complete data business after drop off from flow Submit data Business Owner
        Given I am a customer want to open Giro Account
        And I choose legality business type 'ud'
        And I submit my legality type
        And I update my last journey step to 'Data Employment'
        And I continue to process KYB
        And I fill my business profile as followings:
            | businessName      | PT. ABCD        |
            | industry          | Jasa            |
            | businessField     | Restoran        |
            | monthlyIncome     | 30 - 50 juta    |
            | npwp              | 906283213036000 |
            | nib               | 9129106701234   |
            | businessDateStart | 10/10/2010      |
        And I submit my business profile
        And I see page 'Data Business Owner'
        And I back to dashboard
        And I click later in pop up biometric
        Then I will see card continue to data business
        And I can continue to page 'Data Business Owner'

    @C96607
    Scenario: User can see cards continue to complete data business after drop off from flow Submit data Director List
        Given I am a customer want to open Giro Account
        And I choose legality business type 'company'
        And I submit my legality type
        And I update my last journey step to 'Data Employment'
        And I continue to process KYB
        And I fill my business profile as followings:
            | businessName      | PT. ABCD        |
            | industry          | Jasa            |
            | businessField     | Restoran        |
            | monthlyIncome     | 30 - 50 juta    |
            | npwp              | 906283213036000 |
            | nib               | 9129106701234   |
            | businessDateStart | 10/10/2010      |
        And I submit my business profile
        And I see page 'Data Director List'
        And I back to dashboard
        And I click later in pop up biometric
        Then I will see card continue to data business
        And I can continue to page 'Data Director List'

    @C96608
    Scenario: User can see cards continue to complete data business after drop off from flow Submit data Business Address
        Given I am a customer want to open Giro Account
        And I choose legality business type 'company'
        And I submit my legality type
        And I update my last journey step to 'Data Employment'
        And I continue to process KYB
        And I fill my business profile as followings:
            | businessName      | PT. ABCD        |
            | industry          | Jasa            |
            | businessField     | Restoran        |
            | monthlyIncome     | 30 - 50 juta    |
            | npwp              | 906283213036000 |
            | nib               | 9129106701234   |
            | businessDateStart | 10/10/2010      |
        And I submit my business profile
        And I submit business director
        And I see page 'Data Business Address'
        And I back to dashboard
        And I click later in pop up biometric
        Then I will see card continue to data business
        And I can continue to page 'Data Business Address'

    @C96609
    Scenario: User can see cards continue to complete upload document after complete flow KYC and KYB
        Given I am a customer want to open Giro Account
        And I choose legality business type 'company'
        And I submit my legality type
        And I update my last journey step to 'Data Employment'
        And I continue to process KYB
        And I fill my business profile as followings:
            | businessName      | PT. ABCD        |
            | industry          | Jasa            |
            | businessField     | Restoran        |
            | monthlyIncome     | 30 - 50 juta    |
            | npwp              | 906283213036000 |
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
        And I agree with the terms and condition
        And I allow company to store my data
        And I submit my business address
        And I see page 'Upload Document Business'
        And I close page upload document
        Then I will see card continue to complete upload document business
        And I can continue to page 'Upload Document Business'

    @C96610
    Scenario: User can see cards continue to complete upload document and register director list
        Given I am a customer want to open Giro Account
        And I choose legality business type 'company'
        And I submit my legality type
        And I update my last journey step to 'Data Employment'
        And I continue to process KYB
        And I fill my business profile as followings:
            | businessName      | PT. ABCD        |
            | industry          | Jasa            |
            | businessField     | Restoran        |
            | monthlyIncome     | 30 - 50 juta    |
            | npwp              | 906283213036000 |
            | nib               | 9129106701234   |
            | businessDateStart | 10/10/2010      |
        And I submit my business profile
        And I click add business director
        And I fill business director data as followings:
            | fullName | BIMO PURWOKO        |
            | email    | bimo@trash-mail.com |
            | nik      | 3166021710820021    |
        And I save data director
        And I submit business director
        And I confirm my director lists
        And I fill my business address as followings:
            | address  | Jl. Gambir Belok kanan No. 23 |
            | rt       | 010                           |
            | rw       | 027                           |
            | province | DKI JAKARTA                   |
            | city     | JAKARTA SELATAN               |
            | district | PANCORAN                      |
            | village  | PANCORAN                      |
        And I agree with the terms and condition
        And I allow company to store my data
        And I submit my business address
        And I see page 'Upload Document Business'
        And I close page upload document
        Then I will see card continue to complete upload document business and registration director list
        And I can continue to page 'Registration Director'
        And I can see details registration director