@accountOpeningOnBoarding
Feature: Account Opening Onboarding
    In order to opening my Giro account in SMB
    As a customer
    I want to choose Giro Account and my legality business type

    Background: User has registered and login to dashboard
        Given I am a registered customer with following details:
            | userID   | ruth07f9 |
            | password | 1234Test |
        And I filling in form login with the following details:
            | userID   | ruth07f9 |
            | password | 1234Test |
        And I click login
        And I will directing to Hook 1 Onboarding Account Opening

    @C96591
    Scenario: User choose Giro Account
        Given I am a customer want to open Giro Account
        When I swipe to card Giro Account
        And I see information and benefit of Giro Account
        And I choose Giro Account
        Then I will see details info of giro account MSME
        And I will see details info of giro account Corporate

    @C96592
    Scenario: User choose later open Giro Account
        Given I am a customer want to open Giro Account later
        When I click later
        Then I will directing to main dashboard with card loan application and account opening
        And I can choose type account giro
        And I will see details info of giro account MSME
        And I will see details info of giro account Corporate

    @C96593
    Scenario: User choose legality business type PT Perusahaan
        Given I am a customer want to open Giro Account
        When I swipe to card Giro Account
        And I choose Giro Account
        And I choose Giro Account Corporate
        And I choose legality business type 'company'
        And I submit my legality type
        Then I will directing to page capture eKTP with information 'Pembentukan rekening memerlukan foto eKTP salah satu direktur'
        And product type same with I choose before

    @C96594
    Scenario: User choose legality business type CV
        Given I am a customer want to open Giro Account
        When I swipe to card Giro Account
        And I choose Giro Account
        And I choose Giro Account MSME
        And I choose legality business type 'cv'
        And I submit my legality type
        Then I will directing to page capture eKTP with information 'Pembentukan rekening memerlukan foto eKTP salah satu direktur'
        And product type same with I choose before

    @C96595
    Scenario: User choose legality business type PT Perorangan
        Given I am a customer want to open Giro Account
        When I swipe to card Giro Account
        And I choose Giro Account
        And I choose Giro Account Corporate
        And I choose legality business type 'individualBusiness'
        And I submit my legality type
        Then I will directing to page capture eKTP with information 'Pembentukan rekening memerlukan foto eKTP pemilik bisnis'
        And product type same with I choose before

    @C96596
    Scenario: User choose legality business type UD
        Given I am a customer want to open Giro Account
        When I swipe to card Giro Account
        And I choose Giro Account
        And I choose Giro Account Corporate
        And I choose legality business type 'ud'
        And I submit my legality type
        Then I will directing to page capture eKTP with information 'Pembentukan rekening memerlukan foto eKTP pemilik bisnis'
        And product type same with I choose before

    @C96597
    Scenario: User choose legality business type Individu
        Given I am a customer want to open Giro Account
        When I swipe to card Giro Account
        And I choose Giro Account
        And I choose Giro Account Corporate
        And I choose legality business type 'individual'
        And I submit my legality type
        Then I will directing to page capture eKTP with information 'Pembentukan rekening memerlukan foto eKTP pemilik bisnis'
        And product type same with I choose before

    @C96598
    Scenario: Back to page onboarding account opening
        Given I am a customer want to open Giro Account
        When I swipe to card Giro Account
        And I choose Giro Account
        And I click button back in the header page
        Then I will directing to Hook 1 Onboarding Account Opening
        And product type same with I choose before

    Scenario: Back to dashboard from page legality type entry point hook
        Given I am a customer want to open Giro Account
        When I swipe to card Giro Account
        And I choose Giro Account
        And I choose Giro Account Corporate
        And I click button back in the header page
        Then I will directing to page type giro account
        And product type same with I choose before

    Scenario: Back to dashboard from page legality type entry point dashboard
        Given I am a customer want to open Giro Account
        When I click later
        And I choose Giro Account from dashboard
        And I choose Giro Account Corporate
        And I click button back in the header page
        Then I will directing to page type giro account
        And product type same with I choose before