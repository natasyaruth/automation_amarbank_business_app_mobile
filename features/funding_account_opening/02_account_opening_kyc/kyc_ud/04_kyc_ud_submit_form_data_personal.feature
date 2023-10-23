@kycSubmitFormDataPersonalUD
Feature: Account Opening KYC UD - Submit Data Personal
    In order to opening my Giro account with legality business type UD in SMB
    As a customer
    I want to submit my data personal as part of the KYC Process

    Background: User choose legality business type UD
        Given I am a registered customer with following details:
            | userID   | ruth0ba7 |
            | password | 1234Test |
        And I filling in form login with the following details:
            | userID   | ruth0ba7 |
            | password | 1234Test |
        And I click login
        Then I will direct to dashboard
        When I swipe to card Giro Account
        And I choose Giro Account
        And I choose legality business type 'ud'
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

    Scenario: Submit form Data Personal successfully business type UD
        Given I am a customer who has uploaded my selfie photo
        When I fill my personal data details as followings:
            | lastEducation | SMA             |
            | motherName    | NADYA LAMUSU    |
            | npwp          | 121785542123321 |
        And I submit my personal data details
        Then I will direct to page domicile address