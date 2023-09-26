@account_opening
Feature: Account Opening Onboarding
    In order to opening my Giro account in SMB
    As a customer
    I want to choose Giro Account and my legality business type

    Background: User has registered and login to dashboard
        Given I am a registered customer with following details:
            | userID   | ruth5010 |
            | password | 1234Test |
        When I filling in form login with the following details:
            | userID   | ruth5010 |
            | password | 1234Test |
        And I click login
        Then I will direct to dashboard

    Scenario: User choose Giro Account
        Given I am a customer want to open Giro Account
        And I see information and benefit of Giro Account
        When I choose Giro Account
        Then I will directing to page legality business

    Scenario: User choose legality business type PT Perusahaan
        Given I am a customer want to open Giro Account
        When I choose Giro Account
        And I choose legality business type 'company'
        And I submit my legality type
        Then I will directing to page capture eKTP with information 'Pembentukan rekening memerlukan foto eKTP salah satu direktur'

    Scenario: User choose legality business type CV
        Given I am a customer want to open Giro Account
        When I choose Giro Account
        And I choose legality business type 'cv'
        And I submit my legality type
        Then I will directing to page capture eKTP with information 'Pembentukan rekening memerlukan foto eKTP salah satu direktur'

    Scenario: User choose legality business type PT Perorangan
        Given I am a customer want to open Giro Account
        When I choose Giro Account
        And I choose legality business type 'individualBusiness'
        And I submit my legality type
        Then I will directing to page capture eKTP with information 'Pembentukan rekening memerlukan foto eKTP pemilik bisnis'

    Scenario: User choose legality business type UD
        Given I am a customer want to open Giro Account
        When I choose Giro Account
        And I choose legality business type 'ud'
        And I submit my legality type
        Then I will directing to page capture eKTP with information 'Pembentukan rekening memerlukan foto eKTP pemilik bisnis'

    Scenario: User choose legality business type Individu
        Given I am a customer want to open Giro Account
        When I choose Giro Account
        And I choose legality business type 'individual'
        And I submit my legality type
        Then I will directing to page capture eKTP with information 'Pembentukan rekening memerlukan foto eKTP pemilik bisnis'

    Scenario: Back to page onboarding account opening
        Given I am a customer want to open Giro Account
        When I choose Giro Account
        And I click button back in the header page
        Then I will directing to page onboarding account opening
