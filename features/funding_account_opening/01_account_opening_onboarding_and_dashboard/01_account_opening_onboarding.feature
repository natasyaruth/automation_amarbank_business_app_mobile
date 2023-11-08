@accountOpeningOnBoarding
Feature: Account Opening Onboarding
    In order to opening my Giro account in SMB
    As a customer
    I want to choose Giro Account and my legality business type

    Background: User has registered and login to dashboard
        Given I am a customer lead wanting to open a new account
        When I choose menu registration
        And I filling in my account information with the following details:
            | fullName        | Ruth Natasya        |
            | email           | test@trash-mail.com |
            | mobileNumber    | 89566662249         |
            | password        | 1234Test            |
            | confirmPassword | 1234Test            |
        And I registering the account
        And I verifying my phone number by entering the code sent to me
        And I verifying my email by login by user id

    @C96591
    Scenario: User choose Giro Account
        Given I am a customer want to open Giro Account
        When I swipe to card Giro Account
        And I see information and benefit of Giro Account
        And I choose Giro Account
        Then I will directing to page legality business

    @C96592
    Scenario: User choose later open Giro Account
        Given I am a customer want to open Giro Account later
        When I click later
        Then I will directing to main dashboard with card loan application and account opening

    @C96593
    Scenario: User choose legality business type PT Perusahaan
        Given I am a customer want to open Giro Account
        When I swipe to card Giro Account
        And I choose Giro Account
        And I choose legality business type 'company'
        And I submit my legality type
        Then I will directing to page capture eKTP with information 'Pembentukan rekening memerlukan foto eKTP salah satu direktur'

    @C96594
    Scenario: User choose legality business type CV
        Given I am a customer want to open Giro Account
        When I swipe to card Giro Account
        And I choose Giro Account
        And I choose legality business type 'cv'
        And I submit my legality type
        Then I will directing to page capture eKTP with information 'Pembentukan rekening memerlukan foto eKTP salah satu direktur'

    @C96595
    Scenario: User choose legality business type PT Perorangan
        Given I am a customer want to open Giro Account
        When I swipe to card Giro Account
        And I choose Giro Account
        And I choose legality business type 'individualBusiness'
        And I submit my legality type
        Then I will directing to page capture eKTP with information 'Pembentukan rekening memerlukan foto eKTP pemilik bisnis'

    @C96596
    Scenario: User choose legality business type UD
        Given I am a customer want to open Giro Account
        When I swipe to card Giro Account
        And I choose Giro Account
        And I choose legality business type 'ud'
        And I submit my legality type
        Then I will directing to page capture eKTP with information 'Pembentukan rekening memerlukan foto eKTP pemilik bisnis'

    @C96597
    Scenario: User choose legality business type Individu
        Given I am a customer want to open Giro Account
        When I swipe to card Giro Account
        And I choose Giro Account
        And I choose legality business type 'individual'
        And I submit my legality type
        Then I will directing to page capture eKTP with information 'Pembentukan rekening memerlukan foto eKTP pemilik bisnis'

    @C96598
    Scenario: Back to page onboarding account opening
        Given I am a customer want to open Giro Account
        When I swipe to card Giro Account
        And I choose Giro Account
        And I click button back in the header page
        Then I will directing to Hook 1 Onboarding Account Opening
