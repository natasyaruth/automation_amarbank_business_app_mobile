@accountOpeningDashboardUserInvited
Feature: Account Opening Main Dashboard User Invited
    In order to opening my Giro account in SMB
    As a customer
    I can see my latest information in main dashboard

    Background: User invited has registered and login to dashboard
        Given I am a registered customer with following details:
            | userID   | ruth17a5 |
            | password | Test1234 |
        When I filling in form login with the following details:
            | userID   | ruth17a5 |
            | password | Test1234 |
        And I click login
        And I continue to register my KYC data

    Scenario: User invited can see cards continue to complete data personal after drop off from flow Upload eKTP
        Given I am a invited customer wants to complete my KYC data
        When I see page 'Upload eKTP'
        And I back to dashboard
        Then I will see card continue to data personal
        And I can continue to page 'Upload eKTP'

    Scenario: User invited can see cards continue to complete data personal after drop off from flow Submit data KTP
        Given I am a invited customer wants to complete my KYC data
        When I upload my eKTP photo
        And I see page 'Data KTP'
        And I back to dashboard
        Then I will see card continue to data personal
        And I can continue to page 'Data KTP'

    Scenario: User invited can see cards continue to complete data personal after drop off from flow Upload Selfie
        Given I am a invited customer wants to complete my KYC data
        When I upload my eKTP photo
        And I fill all information identity details as followings:
            | eKtpNumber    | 3173035601100007          |
            | fullName      | NADYA CANTIK              |
            | placeOfBirth  | MEDAN                     |
            | dateOfBirth   | 11/11/1995                |
            | gender        | Perempuan                 |
            | address       | Jl. Durian Runtuh No. 13  |
            | rt            | 01                        |
            | rw            | 05                        |
            | province      | DKI JAKARTA               |
            | city          | KOTA ADM. JAKARTA SELATAN |
            | district      | KEBAYORAN BARU            |
            | village       | SENAYAN                   |
            | religion      | Hindu                     |
            | maritalStatus | Kawin                     |
        And I submit my information identity details
        And I see page 'Upload Selfie'
        And I back to dashboard
        Then I will see card continue to data personal
        And I can continue to page 'Upload Selfie'