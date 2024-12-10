@accountOpeningOnBoarding
Feature: Account Opening Onboarding
    In order to opening my Giro account in SMB
    As a customer
    I want to choose Giro Account and my legality business type
    And along with checking NPWP Business

    Background: User has registered and login to dashboard
        Given I am a registered customer with following details:
            | userID      | ruth07f9 |
            | password    | 1234Test |
            | userIDstg   | rudid743 |
            | passwordStg | 1234Test |
        And I reset my state journey    
        And I filling in form login with the following details:
            | userID      | ruth07f9 |
            | password    | 1234Test |
            | userIDstg   | rudid743 |
            | passwordStg | 1234Test |
        And I click login
        And I click later in pop up biometric
        And I will directing to Hook 1 Onboarding Account Opening
        
    @C170707
    Scenario: User choose Giro Account
        Given I am a customer want to open Giro Account
        When I swipe to card Giro Account
        And I see information and benefit of Giro Account
        And I choose Giro Account
        Then I will see details info of giro account Corporate and MSME

    @C170708
    Scenario: User choose later open Giro Account
        Given I am a customer want to open Giro Account later
        Then I will directing to main dashboard with card loan application and account opening
        And I click later
        And I can choose type account giro
        And I will see details info of giro account Corporate and MSME

    @C170709
    Scenario: User choose legality business type PT Perusahaan
        Given I am a customer want to open Giro Account
        When I swipe to card Giro Account
        And I choose Giro Account
        And I choose Giro Account Corporate
        And I submit my giro type
        And I will directing to page legality business
        And I choose legality business type 'company'
        And I submit my legality type
        Then I will see bottom sheet NPWP Business

    @C170710
    Scenario: User choose legality business type CV
        Given I am a customer want to open Giro Account
        When I swipe to card Giro Account
        And I choose Giro Account
        And I choose Giro Account MSME
        And I submit my giro type
        And I will directing to page legality business
        And I choose legality business type 'cv'
        And I submit my legality type
        Then I will see bottom sheet NPWP Business

    @C170711
    Scenario: User choose legality business type PT Perorangan
        Given I am a customer want to open Giro Account
        When I swipe to card Giro Account
        And I choose Giro Account
        And I choose Giro Account Corporate
        And I submit my giro type
        And I will directing to page legality business
        And I choose legality business type 'individualBusiness'
        And I submit my legality type
        Then I will see bottom sheet NPWP Business

    @C170712
    Scenario: User choose legality business type UD
        Given I am a customer want to open Giro Account
        When I swipe to card Giro Account
        And I choose Giro Account
        And I choose Giro Account Corporate
        And I submit my giro type
        And I will directing to page legality business
        And I choose legality business type 'ud'
        And I submit my legality type
        Then I will see bottom sheet NPWP Business

    @C170713
    Scenario: User choose legality business type Individu
        Given I am a customer want to open Giro Account
        When I swipe to card Giro Account
        And I choose Giro Account
        And I choose Giro Account Corporate
        And I submit my giro type
        And I will directing to page legality business
        And I choose legality business type 'individual'
        And I submit my legality type
        Then I will directing to page capture eKTP with information 'Pembentukan rekening memerlukan foto eKTP pemilik bisnis'
        And I reset my state journey

    @C170714
    Scenario: Close page choose product entry point hook onboarding
        Given I am a customer want to open Giro Account
        When I swipe to card Giro Account
        And I choose Giro Account
        And I click close in header page
        And I click option exit survey 'Proses akan dilanjutkan nanti'
        And I submit my exit survey
        Then I will directing to Hook 1 Onboarding Account Opening

    @C170715
    Scenario: Close page choose product entry point main dashboard
        Given I am a customer want to open Giro Account
        When I click later
        And I choose Giro Account from dashboard
        And I click close in header page
        And I click option exit survey 'Proses akan dilanjutkan nanti'
        And I submit my exit survey
        Then I will see card account 'account opening' 

    @C170716
    Scenario: Back to page choose product from page choose legality type
        Given I am a customer want to open Giro Account
        When I swipe to card Giro Account
        And I choose Giro Account
        And I choose Giro Account Corporate
        And I submit my giro type
        And I will directing to page legality business
        And I click back in header page
        Then I will directing to page type giro account
        And product type same with I choose before

    @C170717
    Scenario: Close bottom sheet checking NPWP Business
        Given I am a customer want to open Giro Account
        When I swipe to card Giro Account
        And I choose Giro Account
        And I choose Giro Account Corporate
        And I submit my giro type
        And I choose legality business type 'individualBusiness'
        And I submit my legality type
        And I will see bottom sheet NPWP Business
        And I close bottom sheet NPWP Business
        Then I will directing to page legality business

    @C170718
    Scenario: Fill field NPWP business and then delete
        Given I am a customer want to open Giro Account
        When I swipe to card Giro Account
        And I choose Giro Account
        And I choose Giro Account Corporate
        And I submit my giro type
        And I choose legality business type 'individualBusiness'
        And I submit my legality type
        And I fill NPWP Business
        And I see button submit NPWP is enabled
        And I clear NPWP Business
        Then I see button submit NPWP is disabled

    @C170719
    Scenario: Fill field NPWP business other than number
        Given I am a customer want to open Giro Account
        When I swipe to card Giro Account
        And I choose Giro Account
        And I choose Giro Account Corporate
        And I submit my giro type
        And I choose legality business type 'individualBusiness'
        And I submit my legality type
        And I fill NPWP business with '1268470tt3981@!'
        And I see NPWP business only number and formatted
        And I see button submit NPWP is disabled

    @C170720
    Scenario: Fill field NPWP business with length less than 15 digit
        Given I am a customer want to open Giro Account
        When I swipe to card Giro Account
        And I choose Giro Account
        And I choose Giro Account Corporate
        And I submit my giro type
        And I choose legality business type 'individualBusiness'
        And I submit my legality type
        And I fill NPWP business with '906283213036'
        And I see NPWP business only number and formatted
        Then I see button submit NPWP is disabled
        And I see message error NPWP should 15 digits

    @C170721
    Scenario: Fill field NPWP business with length more than 15 digit
        Given I am a customer want to open Giro Account
        When I swipe to card Giro Account
        And I choose Giro Account
        And I choose Giro Account Corporate
        And I submit my giro type
        And I choose legality business type 'individualBusiness'
        And I submit my legality type
        And I fill NPWP business with '90628321303600012434'
        Then I see field NPWP business is empty
        And I see button submit NPWP is enabled

    @C170722
    Scenario: Click back from pop up confirm NPWP Business
        Given I am a customer want to open Giro Account
        When I swipe to card Giro Account
        And I choose Giro Account
        And I choose Giro Account Corporate
        And I submit my giro type
        And I choose legality business type 'individualBusiness'
        And I submit my legality type
        And I fill NPWP Business
        And I see my NPWP business 15 digit and auto format
        And I click continue to data personal
        And I will see pop up confirm NPWP Business
        And I click back from confirm NPWP Business
        Then I will see bottom sheet NPWP Business with NPWP still there
        And I see button submit NPWP is enabled

    @C170723
    Scenario: Check NPWP business that has been registered with type MSME
        Given I am a customer want to open Giro Account
        When I swipe to card Giro Account
        And I choose Giro Account
        And I choose Giro Account MSME
        And I submit my giro type
        And I choose legality business type 'individualBusiness'
        And I submit my legality type
        And I fill NPWP Business with NPWP has been registered
        And I click continue to data personal
        Then I will see error NPWP business has been registered

    @C170724
    Scenario: Check NPWP business that has been registered with type CORP
        Given I am a customer want to open Giro Account
        When I swipe to card Giro Account
        And I choose Giro Account
        And I choose Giro Account Corporate
        And I submit my giro type
        And I choose legality business type 'individualBusiness'
        And I submit my legality type
        And I fill NPWP Business with NPWP has been registered
        And I click continue to data personal
        Then I will see error NPWP business has been registered

    @C170725
    Scenario: Check NPWP Business Success with type MSME
        Given I am a customer want to open Giro Account
        When I swipe to card Giro Account
        And I choose Giro Account
        And I choose Giro Account MSME
        And I submit my giro type
        And I choose legality business type 'individualBusiness'
        And I submit my legality type
        And I fill NPWP Business
        And I see my NPWP business 15 digit and auto format
        And I click continue to data personal
        And I will see pop up confirm NPWP Business
        And I click confirm NPWP Business
        Then I will directing to page capture eKTP with information 'Pembentukan rekening memerlukan foto eKTP pemilik bisnis'
        And product type same with I choose before

    @C170726
    Scenario: Check NPWP Business Success with type CORP
        Given I am a customer want to open Giro Account
        When I swipe to card Giro Account
        And I choose Giro Account
        And I choose Giro Account Corporate
        And I submit my giro type
        And I choose legality business type 'cv'
        And I submit my legality type
        And I fill NPWP Business
        And I see my NPWP business 15 digit and auto format
        And I click continue to data personal
        And I will see pop up confirm NPWP Business
        And I click confirm NPWP Business
        Then I will directing to page capture eKTP with information 'Pembentukan rekening memerlukan foto eKTP salah satu direktur'
        And product type same with I choose before

    @C170727
    Scenario: Exit Survey with option will continue later
        Given I am a customer want to open Giro Account
        And I click later
        And I choose Giro Account from dashboard
        And I choose Giro Account MSME
        And I submit my giro type
        And I choose legality business type 'company'
        And I submit my legality type
        And I fill NPWP Business
        And I click continue to data personal
        And I click confirm NPWP Business
        And I see page 'Upload eKTP'
        When I click close in header page
        And I will see pop up exit survey
        And I click option exit survey 'Proses akan dilanjutkan nanti'
        And I will see button sent feedback and back is enabled
        And I submit my exit survey
        Then I will see snackbar thank you and reason feedback is successfully sent
        And after 3-4 seconds, snackbar thank you and reason feedback is disappear
        And I will see card account 'on process' 

    @C170728
    Scenario: Exit Survey with option need time to compare with other apps
        Given I am a customer want to open Giro Account
        And I click later
        And I choose Giro Account from dashboard
        And I choose Giro Account MSME
        And I submit my giro type
        And I choose legality business type 'company'
        And I submit my legality type
        And I fill NPWP Business
        And I click continue to data personal
        And I click confirm NPWP Business
        When I click close in header page
        And I will see pop up exit survey
        And I click option exit survey 'Sedang membandingkan dengan aplikasi lain'
        And I will see button sent feedback and back is enabled
        And I submit my exit survey
        Then I will see snackbar thank you and reason feedback is successfully sent
        And after 3-4 seconds, snackbar thank you and reason feedback is disappear
        And I will see card account 'on process'

    @C170729
    Scenario: Exit Survey with option not sure with the benefit
        Given I am a customer want to open Giro Account
        And I click later
        And I choose Giro Account from dashboard
        And I choose Giro Account MSME
        And I submit my giro type
        And I choose legality business type 'company'
        And I submit my legality type
        And I fill NPWP Business
        And I click continue to data personal
        And I click confirm NPWP Business
        When I click close in header page
        And I will see pop up exit survey
        And I click option exit survey 'Tidak paham dengan keuntungan yang ditawarkan'
        And I will see button sent feedback and back is enabled
        And I submit my exit survey
        Then I will see snackbar thank you and reason feedback is successfully sent
        And after 3-4 seconds, snackbar thank you and reason feedback is disappear
        And I will see card account 'on process'

    @C170730
    Scenario: Exit Survey with option already have app with benefit same with Amarbank Business
        Given I am a customer want to open Giro Account
        And I click later
        And I choose Giro Account from dashboard
        And I choose Giro Account MSME
        And I submit my giro type
        And I choose legality business type 'company'
        And I submit my legality type
        And I fill NPWP Business
        And I click continue to data personal
        And I click confirm NPWP Business
        When I click close in header page
        And I will see pop up exit survey
        And I click option exit survey 'Sudah memiliki aplikasi menawarkan keuntungan yang serupa'
        And I will see button sent feedback and back is enabled
        And I submit my exit survey
        Then I will see snackbar thank you and reason feedback is successfully sent
        And after 3-4 seconds, snackbar thank you and reason feedback is disappear
        And I will see card account 'on process'

    @C170731
    Scenario: Exit Survey with fill feedback
        Given I am a customer want to open Giro Account
        And I click later
        And I choose Giro Account from dashboard
        And I choose Giro Account MSME
        And I submit my giro type
        And I choose legality business type 'company'
        And I submit my legality type
        And I fill NPWP Business
        And I click continue to data personal
        And I click confirm NPWP Business
        When I click close in header page
        And I will see pop up exit survey
        And I click option exit survey 'Lainnya'
        And I will see button sent feedback is disabled
        And I will see button back is enabled
        And I will see field feedback exit survey
        And I fill feedback exit survey with 'Kurang berminat'
        And I will see button sent feedback and back is enabled
        And I submit my exit survey
        Then I will see snackbar thank you and reason feedback is successfully sent
        And after 3-4 seconds, snackbar thank you and reason feedback is disappear
        And I will see card account 'on process'

    @C170732
    Scenario: Fill feedback exit survey and then choose other option
        Given I am a customer want to open Giro Account
        And I click later
        And I choose Giro Account from dashboard
        And I choose Giro Account MSME
        And I submit my giro type
        And I choose legality business type 'company'
        And I submit my legality type
        And I fill NPWP Business
        And I click continue to data personal
        And I click confirm NPWP Business
        When I click close in header page
        And I will see pop up exit survey
        And I click option exit survey 'Lainnya'
        And I will see button sent feedback is disabled
        And I will see button back is enabled
        And I will see field feedback exit survey
        And I fill feedback exit survey with 'Kurang berminat'
        And I will see button sent feedback and back is enabled
        And I click option exit survey 'Proses akan dilanjutkan nanti'
        Then I will not see field feedback exit survey
        And I will see button sent feedback and back is enabled
        And I click option exit survey 'Lainnya'
        And I will see button sent feedback is disabled
        And I will see button back is enabled
        And I will see field feedback exit survey
        And I will not see the feedback anymore

    @C170733
    Scenario: Fill feedback exit survey and then delete
        Given I am a customer want to open Giro Account
        And I click later
        And I choose Giro Account from dashboard
        And I choose Giro Account MSME
        And I submit my giro type
        And I choose legality business type 'company'
        And I submit my legality type
        And I fill NPWP Business
        And I click continue to data personal
        And I click confirm NPWP Business
        When I click close in header page
        And I will see pop up exit survey
        And I click option exit survey 'Lainnya'
        And I will see button sent feedback is disabled
        And I will see button back is enabled
        And I will see field feedback exit survey
        And I fill feedback exit survey with 'Kurang berminat'
        And I clear field feedback exit survey
        Then I will not see the feedback anymore
        And I will see button sent feedback is disabled
        And I will see button back is enabled

    @C170734
    Scenario: Fill feedback exit survey with length char more than 60
        Given I am a customer want to open Giro Account
        And I click later
        And I choose Giro Account from dashboard
        And I choose Giro Account MSME
        And I submit my giro type
        And I choose legality business type 'company'
        And I submit my legality type
        And I fill NPWP Business
        And I click continue to data personal
        And I click confirm NPWP Business
        When I click close in header page
        And I will see pop up exit survey
        And I click option exit survey 'Lainnya'
        And I will see button sent feedback is disabled
        And I will see button back is enabled
        And I will see field feedback exit survey
        And I fill feedback exit survey with 'Lorem ipsum odor amet, consectetuer adipiscing elit. Lorem ip'
        Then I will see feedback filled with character only 60 char