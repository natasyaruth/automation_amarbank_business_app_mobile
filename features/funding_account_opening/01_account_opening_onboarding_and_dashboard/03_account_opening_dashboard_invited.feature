@accountOpeningUserInvited
Feature: Account Opening Main Dashboard User Invited
    In order to opening my Giro account in SMB
    As a customer
    I can see my latest information in main dashboard

    Background: User invited has registered and login to dashboard
        Given I am a registered customer with following details:
            | userID      | rudia194 |
            | password    | 1234Test |
            | userIDstg   | rudi3a17 |
            | passwordStg | 1234Test |
        And I reset my state journey invitee
        When I filling in form login with the following details:
            | userID      | rudia194 |
            | password    | 1234Test |
            | userIDstg   | rudi3a17 |
            | passwordStg | 1234Test |
        And I click login
        And I will direct to page continue to register KYC Invitee
        And I continue to register my KYC data

    @C131974
    Scenario: User invited can see cards continue to complete data personal after drop off from flow Upload eKTP
        Given I am a invited customer wants to complete my KYC data
        When I see page 'Upload eKTP'
        And I click close in header page
        And I click option exit survey 'Proses akan dilanjutkan nanti'
        And I submit my exit survey
        Then I will see snackbar thank you and reason feedback is successfully sent
        And after 3-4 seconds, snackbar thank you and reason feedback is disappear 
        And I will see card continue to complete registration user invited
        And I see page 'Upload eKTP'

    @C131975
    Scenario: User invited can see cards continue to complete data personal after drop off from flow Submit data KTP
        Given I am a invited customer wants to complete my KYC data
        When I click take photo eKTP
        And I take photo eKTP
        And I submit my eKTP photo
        And I see page 'Data KTP'
        And I click close in header page
        And I click option exit survey 'Proses akan dilanjutkan nanti'
        And I submit my exit survey
        Then I will see card continue to complete registration user invited
        And I see page 'Data KTP'

    @C131976
    Scenario: User invited can see cards continue to complete data personal after drop off from flow Upload Selfie
        Given I am a invited customer wants to complete my KYC data
        When I click take photo eKTP
        And I take photo eKTP
        And I submit my eKTP photo
        And I fill all information identity details as followings:
            | eKtpNumber    | 3173035601100007          |
        And I swipe to button save data eKTP    
        And I submit my information identity details
        And I see page 'Upload Selfie'
        And I click close in header page
        And I click option exit survey 'Proses akan dilanjutkan nanti'
        And I submit my exit survey
        Then I will see card continue to complete registration user invited
        And I see page 'Upload Selfie'

    @C141155
    Scenario: User invited can see cards continue to complete data personal after drop off from flow Upload Selfie with KTP
        Given I am a invited customer wants to complete my KYC data
        When I click take photo eKTP
        And I take photo eKTP
        And I submit my eKTP photo
        And I fill all information identity details as followings:
            | eKtpNumber    | 3173035601100007          |
        And I swipe to button save data eKTP
        And I submit my information identity details
        And I click take my photo selfie
        And I take selfie picture
        And I submit my selfie photo
        And I see page 'Upload Selfie with KTP'
        And I click close in header page
        And I click option exit survey 'Proses akan dilanjutkan nanti'
        And I submit my exit survey
        Then I will see card continue to complete registration user invited
        And I see page 'Upload Selfie with KTP'