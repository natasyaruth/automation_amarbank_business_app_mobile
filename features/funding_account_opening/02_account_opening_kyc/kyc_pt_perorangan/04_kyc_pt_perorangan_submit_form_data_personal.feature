@kycSubmitFormDataPersonalPTPerorangan
Feature: Account Opening KYC PT Perorangan - Submit Data Personal
    In order to opening my Giro account with legality business type PT Perorangan in SMB
    As a customer
    I want to submit my data personal as part of the KYC Process

    Background: User choose legality business type PT Perorangan
        Given I am a registered customer with following details:
            | userID   | ruth1ed7 |
            | password | 1234Test |
        And I filling in form login with the following details:
            | userID   | ruth1ed7 |
            | password | 1234Test |
        And I click login
        And I will directing to Hook 1 Onboarding Account Opening
        And I swipe to card Giro Account
        And I choose Giro Account
        And I choose legality business type 'individualBusiness'
        And I submit my legality type
        And I upload my eKTP photo
        And I fill all information identity details as followings:
            | eKtpNumber    | 3173062211771308          |
            | fullName      | NADYA LAROSA              |
            | placeOfBirth  | MEDAN                     |
            | dateOfBirth   | 11/11/1995                |
            | gender        | Laki-laki                 |
            | address       | Jl. Durian Runtuh No. 13  |
            | rt            | 01                        |
            | rw            | 05                        |
            | province      | DKI JAKARTA               |
            | city          | KOTA ADM. JAKARTA SELATAN |
            | district      | KEBAYORAN BARU            |
            | village       | SENAYAN                   |
            | religion      | Katolik                   |
            | maritalStatus | Belum Kawin               |
        And I submit my information identity details
        And I upload my selfie photo

    Scenario: Submit form Data Personal successfully business type PT Perorangan
        Given I am a customer who has uploaded my selfie photo
        When I fill my personal data details as followings:
            | lastEducation | SMA             |
            | motherName    | NADYA LAMUSU    |
            | npwp          | 121785542123321 |
        And I submit my personal data details
        Then I will direct to page domicile address