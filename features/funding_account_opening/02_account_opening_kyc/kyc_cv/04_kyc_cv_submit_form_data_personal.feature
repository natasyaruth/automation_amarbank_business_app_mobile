@kycSubmitFormDataPersonalCV
Feature: Account Opening KYC CV - Submit Data Personal
    In order to opening my Giro account with legality business type CV in SMB
    As a customer
    I want to submit my data personal as part of the KYC Process

    Background: User choose legality business type CV
        Given I am a registered customer with following details:
            | userID      | ruth2a1e |
            | password    | 1234Test |
            | userIDstg   | ruthf5d5 |
            | passwordStg | 1234Test |
        And I filling in form login with the following details:
            | userID      | ruth2a1e |
            | password    | 1234Test |
            | userIDstg   | ruthf5d5 |
            | passwordStg | 1234Test |
        And I click login
        And I will directing to Hook 1 Onboarding Account Opening
        And I swipe to card Giro Account
        And I choose Giro Account
        And I choose Giro Account Corporate
        And I choose legality business type 'cv'
        And I submit my legality type
        And I update my last journey step to 'Upload Selfie'

    @C96519
    Scenario: Submit form Data Personal successfully business type CV
        Given I am a customer who has uploaded my selfie photo
        When I fill my personal data details as followings:
            | lastEducation        | SMA          |
            | motherName           | NADYA LAMUSU |
            | referenceName        | IBU SAYA     |
            | referencePhoneNumber | 812343455677 |
        And I submit my personal data details
        Then I will direct to page domicile address