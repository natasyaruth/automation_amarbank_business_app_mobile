Feature: Home - User Management
    In order user to approve process add new user as staff
    As a Director
    I want to approve the permission adding user in notification center

    Scenario: Close page detail approval adding user
        Given I am a registered customer with following details:
            | userID      |  |
            | password    | 1234Test |
            | userIDstg   |  |
            | passwordStg | 1234Test |
        And I have company with reference id in CRM as following:
            | refDev ||
            | refStg ||
        And I recently add new user from CRM
        When I filling in form login with the following details:
            | userID      |  |
            | password    | 1234Test |
            | userIDstg   |  |
            | passwordStg | 1234Test |
        And I click login
        And I click later in pop up biometric
        And I will see card account 'active'
        And I see red dot notification center
        And I click notification center
        And I will see list approval adding user in notification center
        And I click detail list approval adding user
        And I will direct to page need approval add user from other director
        And I click close in header page
        Then I will direct to page notification center

    Scenario: Reject approval adding user
        Given I am a registered customer with following details:
            | userID      |  |
            | password    | 1234Test |
            | userIDstg   |  |
            | passwordStg | 1234Test |
        And I have company with reference id in CRM as following:
            | refDev ||
            | refStg ||
        And I recently add new user from CRM
        When I filling in form login with the following details:
            | userID      |  |
            | password    | 1234Test |
            | userIDstg   |  |
            | passwordStg | 1234Test |
        And I click login
        And I click later in pop up biometric
        And I will see card account 'active'
        And I see red dot notification center
        And I click notification center
        And I click detail list approval adding user
        And I will direct to page need approval add user from other director
        And I click button reject adding user
        Then I will direct to page notification center
        And I will see status approval add user is change into rejected
        And I click detail approval add user that has been rejected
        And I will direct to page need approval add user has been rejected

    Scenario: Approve adding user and register the new user till completed
        Given I am a registered customer with following details:
            | userID      |  |
            | password    | 1234Test |
            | userIDstg   |  |
            | passwordStg | 1234Test |
        And I have company with reference id in CRM as following:
            | refDev ||
            | refStg ||
        And I recently add new user from CRM
        When I filling in form login with the following details:
            | userID      |  |
            | password    | 1234Test |
            | userIDstg   |  |
            | passwordStg | 1234Test |
        And I click login
        And I click later in pop up biometric
        And I will see card account 'active'
        And I see red dot notification center
        And I click notification center
        And I click detail list approval adding user
        And I will direct to page need approval add user from other director
        And I click button approve adding user
        And I will direct to page notification center
        And new user will receive business code to register
        And I will see status approval add user is change into waiting for registration
        And I click detail approval add user that has been approved
        And I will direct to page new user waiting for register
        And I click close in header page
        And I will direct to page notification center
        And I click close in header page
        And I choose other
        And I click logout
        And I click back in header page
        And I choose menu registration
        And I filling in new user account business information
        And I submit form registration
        And I will see pop up confirmation registration new user
        And I registering the account
        And I will directing to page terms and condition
        And I click button agree with terms and condition
        And I will directing to page privacy and policy 
        And I click button agree with privacy and policy
        And I will directing to page PDP
        And I click button agree to PDP
        And I will see pop up option PDP registration
        And I check option already and read the condition PDP
        And I check option I agree Amarbank send me new information and innovation from the bank
        And I submit the PDP registration
        And I verifying phone number new user by entering the code
        And I verifying email new user through login with user id
        And account new user should be created
        And I continue to register the KYC data
        And I click take photo eKTP
        And I take photo eKTP
        And I submit my eKTP photo
        And I fill all information identity details as followings:
            | eKtpNumber    | 3174034313750003          |
        And I swipe to button save data eKTP    
        And I submit my information identity details
        And I will direct to page capture selfie
        And I click take my photo selfie
        And I take selfie picture
        And I submit my selfie photo
        And I will direct to page take a selfie with KTP
        And I click take photo selfie with KTP
        And I click take photo
        And I submit my selfie with KTP 
        Then I will notify that my personal data details needs to be verified first
        And I will notify that my personal data details needs to be verified in main dashboard  

    Scenario: Approve adding user with approval more than one and register the new user till completed
        Given I am a registered customer with following details:
            | userID      |  |
            | password    | 1234Test |
            | userIDstg   |  |
            | passwordStg | 1234Test |
        And has partner more than one, with partner one details as following:
            | userID      |  |
            | password    | 1234Test |
            | userIDstg   |  |
            | passwordStg | 1234Test |
        And other partner is:
            | userID      |  |
            | password    | 1234Test |
            | userIDstg   |  |
            | passwordStg | 1234Test |
        And I have company with reference id in CRM as following:
            | refDev ||
            | refStg ||
        And we recently add new user from CRM
        And I filling in form login with the following details:
            | userID      |  |
            | password    | 1234Test |
            | userIDstg   |  |
            | passwordStg | 1234Test |
        And I click login
        And I click later in pop up biometric
        And I will see card account 'active'
        And I see red dot notification center
        And I click notification center
        And I click detail list approval adding user
        And I will direct to page need approval add user from other director
        And I click button approve adding user
        And I will direct to page notification center
        And new user will receive business code to register
        And I will see status approval add user is change into waiting other director
        And I click detail approval add user that has been approved
        And I will direct to page new user waiting for register
        And I click close in header page
        And I will direct to page notification center
        And I click close in header page
        And I choose other
        And I click logout
        And I filling in form login with the following details:
            | userID      |  |
            | password    | 1234Test |
            | userIDstg   |  |
            | passwordStg | 1234Test |
        And I click login
        And I click later in pop up biometric
        And I will see card account 'active'
        And I see red dot notification center
        And I click notification center
        And I click detail list approval adding user
        And I will direct to page need approval add user from other director
        And I click button approve adding user
        And I will direct to page notification center
        And new user will receive business code to register
        And I will see status approval add user is change into waiting other director
        And I click detail approval add user that has been approved
        And I will direct to page new user waiting for register
        And I click close in header page
        And I will direct to page notification center
        And I click close in header page
        And I choose other
        And I click logout
        And I filling in form login with the following details:
            | userID      |  |
            | password    | 1234Test |
            | userIDstg   |  |
            | passwordStg | 1234Test |
        And I click login
        And I click later in pop up biometric
        And I will see card account 'active'
        And I see red dot notification center
        And I click notification center
        And I click detail list approval adding user
        And I will direct to page need approval add user from other director
        And I click button approve adding user
        And I will direct to page notification center
        And new user will receive business code to register
        And I will see status approval add user is change into waiting for registration
        And I click detail approval add user that has been approved
        And I will direct to page new user waiting for register
        And I click close in header page
        And I will direct to page notification center
        And I click close in header page
        And I choose other
        And I click logout
        And I click back in header page
        And I choose menu registration
        And I filling in new user account business information
        And I submit form registration
        And I will see pop up confirmation registration new user
        And I registering the account
        And I will directing to page terms and condition
        And I click button agree with terms and condition
        And I will directing to page privacy and policy 
        And I click button agree with privacy and policy
        And I will directing to page PDP
        And I click button agree to PDP
        And I will see pop up option PDP registration
        And I check option already and read the condition PDP
        And I check option I agree Amarbank send me new information and innovation from the bank
        And I submit the PDP registration
        And I verifying phone number new user by entering the code
        And I verifying email new user through login with user id
        And account new user should be created
        And I continue to register the KYC data
        And I click take photo eKTP
        And I take photo eKTP
        And I submit my eKTP photo
        And I fill all information identity details as followings:
            | eKtpNumber    | 3174034313750003          |
        And I swipe to button save data eKTP    
        And I submit my information identity details
        And I will direct to page capture selfie
        And I click take my photo selfie
        And I take selfie picture
        And I submit my selfie photo
        And I will direct to page take a selfie with KTP
        And I click take photo selfie with KTP
        And I click take photo
        And I submit my selfie with KTP 
        Then I will notify that my personal data details needs to be verified first
        And I will notify that my personal data details needs to be verified in main dashboard

    Scenario: Reject approval new user while other director already accept the approval
        Given I am a registered customer with following details:
            | userID      |  |
            | password    | 1234Test |
            | userIDstg   |  |
            | passwordStg | 1234Test |
        And has partner more than one, with partner one details as following:
            | userID      |  |
            | password    | 1234Test |
            | userIDstg   |  |
            | passwordStg | 1234Test |
        And other partner is:
            | userID      |  |
            | password    | 1234Test |
            | userIDstg   |  |
            | passwordStg | 1234Test |
        And I have company with reference id in CRM as following:
            | refDev ||
            | refStg ||
        And we recently add new user from CRM
        And I filling in form login with the following details:
            | userID      |  |
            | password    | 1234Test |
            | userIDstg   |  |
            | passwordStg | 1234Test |
        And I click login
        And I click later in pop up biometric
        And I will see card account 'active'
        And I see red dot notification center
        And I click notification center
        And I click detail list approval adding user
        And I will direct to page need approval add user from other director
        And I click button approve adding user
        And I will direct to page notification center
        And new user will receive business code to register
        And I will see status approval add user is change into waiting other director
        And I click detail approval add user that has been approved
        And I will direct to page new user waiting for register
        And I click close in header page
        And I will direct to page notification center
        And I click close in header page
        And I choose other
        And I click logout
        And I filling in form login with the following details:
            | userID      |  |
            | password    | 1234Test |
            | userIDstg   |  |
            | passwordStg | 1234Test |
        And I click login
        And I click later in pop up biometric
        And I will see card account 'active'
        And I see red dot notification center
        And I click notification center
        And I click detail list approval adding user
        And I will direct to page need approval add user from other director
        And I click button approve adding user
        And I will direct to page notification center
        And new user will receive business code to register
        And I will see status approval add user is change into waiting other director
        And I click detail approval add user that has been approved
        And I will direct to page new user waiting for register
        And I click close in header page
        And I will direct to page notification center
        And I click close in header page
        And I choose other
        And I click logout
        And I filling in form login with the following details:
            | userID      |  |
            | password    | 1234Test |
            | userIDstg   |  |
            | passwordStg | 1234Test |
        And I click login
        And I click later in pop up biometric
        And I will see card account 'active'
        And I see red dot notification center
        And I click notification center
        And I click detail list approval adding user
        And I will direct to page need approval add user from other director
        And I click button reject adding user
        And I will direct to page notification center
        And I will see status approval add user is change into rejected
        And I click detail approval add user that has been rejected
        And I will direct to page need approval add user has been rejected
        And I click close in header page
        And I will direct to page notification center
        And I click close in header page
        And I choose other
        And I click logout
        And I filling in form login with the following details:
            | userID      |  |
            | password    | 1234Test |
            | userIDstg   |  |
            | passwordStg | 1234Test |
        And I click login
        And I click later in pop up biometric
        And I will see card account 'active'
        And I see red dot notification center
        And I click notification center
        And I will see status approval add user is change into rejected
        And I click detail approval add user that has been rejected
        And I will direct to page need approval add user has been rejected
        And I click close in header page
        And I will direct to page notification center
        And I click close in header page
        And I choose other
        And I click logout
        And I filling in form login with the following details:
            | userID      |  |
            | password    | 1234Test |
            | userIDstg   |  |
            | passwordStg | 1234Test |
        And I click login
        And I click later in pop up biometric
        And I will see card account 'active'
        And I see red dot notification center
        And I click notification center
        And I will see status approval add user is change into rejected
        And I click detail approval add user that has been rejected
        Then I will direct to page need approval add user has been rejected