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
            | userIDstg   | stagb081 |
            | passwordStg | 1234Test |
        And I filling in form login with the following details:
            | userID      | ruth07f9 |
            | password    | 1234Test |
            | userIDstg   | stagb081 |
            | passwordStg | 1234Test |
        And I click login
        And I will directing to Hook 1 Onboarding Account Opening
        And I click later in pop up biometric

    @C131952
    Scenario: User choose Giro Account
        Given I am a customer want to open Giro Account
        When I swipe to card Giro Account
        And I see information and benefit of Giro Account
        And I choose Giro Account
        Then I will see details info of giro account MSME
        And I will see details info of giro account Corporate

    @C131953
    Scenario: User choose later open Giro Account
        Given I am a customer want to open Giro Account later
        When I click later
        Then I will directing to main dashboard with card loan application and account opening
        And I can choose type account giro
        And I will see details info of giro account MSME
        And I will see details info of giro account Corporate

    @C131954
    Scenario: User choose legality business type PT Perusahaan
        Given I am a customer want to open Giro Account
        When I swipe to card Giro Account
        And I choose Giro Account
        And I choose Giro Account Corporate
        And I will directing to page legality business
        And I choose legality business type 'company'
        And I submit my legality type
        Then I will see bottom sheet NPWP Business

    @C131955
    Scenario: User choose legality business type CV
        Given I am a customer want to open Giro Account
        When I swipe to card Giro Account
        And I choose Giro Account
        And I choose Giro Account MSME
        And I will directing to page legality business
        And I choose legality business type 'cv'
        And I submit my legality type
        Then I will see bottom sheet NPWP Business

    @C131956
    Scenario: User choose legality business type PT Perorangan
        Given I am a customer want to open Giro Account
        When I swipe to card Giro Account
        And I choose Giro Account
        And I choose Giro Account Corporate
        And I will directing to page legality business
        And I choose legality business type 'individualBusiness'
        And I submit my legality type
        Then I will see bottom sheet NPWP Business

    @C131957
    Scenario: User choose legality business type UD
        Given I am a customer want to open Giro Account
        When I swipe to card Giro Account
        And I choose Giro Account
        And I choose Giro Account Corporate
        And I will directing to page legality business
        And I choose legality business type 'ud'
        And I submit my legality type
        Then I will see bottom sheet NPWP Business

    @C131958
    Scenario: User choose legality business type Individu
        Given I am a customer want to open Giro Account
        When I swipe to card Giro Account
        And I choose Giro Account
        And I choose Giro Account Corporate
        And I will directing to page legality business
        And I choose legality business type 'individual'
        And I submit my legality type
        Then I will directing to page capture eKTP with information 'Pembentukan rekening memerlukan foto eKTP pemilik bisnis'
        And product type same with I choose before

    @C131959
    Scenario: Back to page onboarding account opening
        Given I am a customer want to open Giro Account
        When I swipe to card Giro Account
        And I choose Giro Account
        And I click button back in the header page
        Then I will directing to Hook 1 Onboarding Account Opening
        And product type same with I choose before

    @C131960
    Scenario: Back to dashboard from page legality type entry point hook
        Given I am a customer want to open Giro Account
        When I swipe to card Giro Account
        And I choose Giro Account
        And I choose Giro Account Corporate
        And I will directing to page legality business
        And I click button back in the header page
        Then I will directing to page type giro account
        And product type same with I choose before

    @C131961
    Scenario: Back to dashboard from page legality type entry point dashboard
        Given I am a customer want to open Giro Account
        When I click later
        And I choose Giro Account from dashboard
        And I choose Giro Account Corporate
        And I will directing to page legality business
        And I click button back in the header page
        Then I will directing to page type giro account
        And product type same with I choose before

    Scenario: Close bottom sheet checking NPWP Business
        Given I am a customer want to open Giro Account
        When I swipe to card Giro Account
        And I choose Giro Account
        And I choose Giro Account Corporate
        And I choose legality business type 'individualBusiness'
        And I submit my legality type
        And I will see bottom sheet NPWP Business
        And I close bottom sheet NPWP Business
        Then I will directing to page legality business

    Scenario: Fill field NPWP business and then delete
        Given I am a customer want to open Giro Account
        When I swipe to card Giro Account
        And I choose Giro Account
        And I choose Giro Account Corporate
        And I choose legality business type 'individualBusiness'
        And I submit my legality type
        And I fill NPWP business
        And I see button submit NPWP is enabled
        And I clear NPWP Business
        Then I see button submit NPWP is disabled

    Scenario: Fill field NPWP business other than number
        Given I am a customer want to open Giro Account
        When I swipe to card Giro Account
        And I choose Giro Account
        And I choose Giro Account Corporate
        And I choose legality business type 'individualBusiness'
        And I submit my legality type
        And I fill NPWP business with '1268470398as@#w'
        And I dont see the NPWP business
        And I see button submit NPWP is disabled

    Scenario: Fill field NPWP business with length less than 15 digit
        Given I am a customer want to open Giro Account
        When I swipe to card Giro Account
        And I choose Giro Account
        And I choose Giro Account Corporate
        And I choose legality business type 'individualBusiness'
        And I submit my legality type
        And I fill NPWP business with '906283213036'
        Then I see button submit NPWP is disabled

    Scenario: Fill field NPWP business with length more than 15 digit
        Given I am a customer want to open Giro Account
        When I swipe to card Giro Account
        And I choose Giro Account
        And I choose Giro Account Corporate
        And I choose legality business type 'individualBusiness'
        And I submit my legality type
        And I fill NPWP business with '90628321303600012434'
        Then I see my NPWP business 15 digit and auto format
        And I see button submit NPWP is enabled

    Scenario: Click back from pop up confirm NPWP Business
        Given I am a customer want to open Giro Account
        When I swipe to card Giro Account
        And I choose Giro Account
        And I choose Giro Account Corporate
        And I choose legality business type 'individualBusiness'
        And I submit my legality type
        And I fill NPWP Business
        And I see my NPWP business 15 digit and auto format
        And I click continue to data personal
        And I will see pop up confirm NPWP Business
        And I click back from confirm NPWP Business
        Then I will see bottom sheet NPWP Business with NPWP still there
        And I see button submit NPWP is enabled

    Scenario: Check NPWP business that has been registered with type MSME
        Given I am a customer want to open Giro Account
        When I swipe to card Giro Account
        And I choose Giro Account
        And I choose Giro Account MSME
        And I choose legality business type 'individualBusiness'
        And I submit my legality type
        And I fill NPWP Business with NPWP has been registered
        And I click continue to data personal
        And I will see pop up confirm NPWP Business
        And I click confirm NPWP Business
        Then I will see error NPWP business has been registered

    Scenario: Check NPWP business that has been registered with type CORP
        Given I am a customer want to open Giro Account
        When I swipe to card Giro Account
        And I choose Giro Account
        And I choose Giro Account Corporate
        And I choose legality business type 'individualBusiness'
        And I submit my legality type
        And I fill NPWP Business with NPWP has been registered
        And I click continue to data personal
        And I will see pop up confirm NPWP Business
        And I click confirm NPWP Business
        Then I will see error NPWP business has been registered

    Scenario: Check NPWP Business Success with type MSME
        Given I am a customer want to open Giro Account
        When I swipe to card Giro Account
        And I choose Giro Account
        And I choose Giro Account MSME
        And I choose legality business type 'individualBusiness'
        And I submit my legality type
        And I fill NPWP Business
        And I click continue to data personal
        And I will see pop up confirm NPWP Business
        And I click confirm NPWP Business
        Then I will directing to page capture eKTP with information 'Pembentukan rekening memerlukan foto eKTP pemilik bisnis'
        And product type same with I choose before 

    Scenario: Check NPWP Business Success with type CORP
        Given I am a customer want to open Giro Account
        When I swipe to card Giro Account
        And I choose Giro Account
        And I choose Giro Account Corporate
        And I choose legality business type 'cv'
        And I submit my legality type
        And I fill NPWP Business
        And I click continue to data personal
        And I will see pop up confirm NPWP Business
        And I click confirm NPWP Business
        Then I will directing to page capture eKTP with information 'Pembentukan rekening memerlukan foto eKTP salah satu direktur'
        And product type same with I choose before