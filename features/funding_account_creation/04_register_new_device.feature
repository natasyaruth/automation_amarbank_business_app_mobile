Feature: Registering New Device
    In order to login to the new device
    As a customer
    I want to register my new device
    So that SMB app recognize my new device

    Background: Enabled checking register new device id
        Given I enabled to checking device id

    @C133917
    Scenario: Recapture selfie picture
        Given I am a registered customer with following details:
            | userID      | mich875d |
            | password    | 1234Test |
            | userIDstg   | nata8119 |
            | passwordStg | 1234Test |
        And I filling in form login with the following details:
            | userID      | mich875d |
            | password    | 1234Test |
            | userIDstg   | nata8119 |
            | passwordStg | 1234Test |
        When I click login
        And I will see bottom sheet register new device
        And I click button register new device
        And I will direct to page verification new device
        And I click button continue to take selfie
        And I will direct to page take selfie
        And I take picture selfie for matching the face
        And I will direct to page preview selfie picture
        And I retake my picture selfie
        Then I will direct to page take selfie
        And I will disabled checking device id

    @C133918
    Scenario: Submit photo selfie with picture is blur
        Given I am a registered customer with following details:
            | userID      | mich875d |
            | password    | 1234Test |
            | userIDstg   | nata8119 |
            | passwordStg | 1234Test |
        And I filling in form login with the following details:
            | userID      | mich875d |
            | password    | 1234Test |
            | userIDstg   | nata8119 |
            | passwordStg | 1234Test |
        When I click login
        And I click button register new device
        And I click button continue to take selfie
        And I take picture selfie with face is blur
        And I submit my selfie photo
        Then I will see snackbar error upload photo 'Foto terlalu gelap atau blur. Silakan ulangi selfie kamu.'
        And I will disabled checking device id
        And I will reset my attempt failed face match

    @C133919
    Scenario: Submit photo selfie with picture is dark
        Given I am a registered customer with following details:
            | userID      | mich875d |
            | password    | 1234Test |
            | userIDstg   | nata8119 |
            | passwordStg | 1234Test |
        And I filling in form login with the following details:
            | userID      | mich875d |
            | password    | 1234Test |
            | userIDstg   | nata8119 |
            | passwordStg | 1234Test |
        When I click login
        And I click button register new device
        And I click button continue to take selfie
        And I take picture selfie with face is dark
        And I submit my selfie photo
        Then I will see snackbar error upload photo 'Foto terlalu gelap atau blur. Silakan ulangi selfie kamu.'    
        And I will disabled checking device id
        And I will reset my attempt failed face match

    @C133920
    Scenario: Submit photo selfie is blank or not selfie picture
        Given I am a registered customer with following details:
            | userID      | rotacb82 |
            | password    | 1234Test |
            | userIDstg   | nata30bc |
            | passwordStg | 1234Test |
        And I filling in form login with the following details:
            | userID      | rotacb82 |
            | password    | 1234Test |
            | userIDstg   | nata30bc |
            | passwordStg | 1234Test |
        When I click login
        And I click button register new device
        And I click button continue to take selfie
        And I take picture selfie with no face
        And I submit my selfie photo
        Then I will see snackbar error upload photo 'Pastikan kamu sudah mengambil foto selfie. Silakan ulangi selfie kamu'    
        And I will disabled checking device id
        And I will reset my attempt failed face match

    @C133921
    Scenario: Submit photo selfie with server is error
        Given I am a registered customer with following details:
            | userID      | rotacb82 |
            | password    | 1234Test |
            | userIDstg   | nata30bc |
            | passwordStg | 1234Test |
        And I filling in form login with the following details:
            | userID      | rotacb82 |
            | password    | 1234Test |
            | userIDstg   | nata30bc |
            | passwordStg | 1234Test |
        When I click login
        And I click button register new device
        And I click button continue to take selfie
        And I take picture selfie with server is error
        And I submit my selfie photo
        Then I will see snackbar error upload photo 'Terjadi kendala sistem. Silakan coba kembali'    
        And I will disabled checking device id
        
    @C133922
    Scenario: Submit failed photo till account is blocked
        Given I am a registered customer with following details:
            | userID      | rotacb82 |
            | password    | 1234Test |
            | userIDstg   | nata30bc |
            | passwordStg | 1234Test |
        And I filling in form login with the following details:
            | userID      | rotacb82 |
            | password    | 1234Test |
            | userIDstg   | nata30bc |
            | passwordStg | 1234Test |
        When I click login
        And I click button register new device
        And I click button continue to take selfie
        And I take picture selfie with no face
        And I submit my selfie photo
        Then I will see snackbar error upload photo 'Pastikan kamu sudah mengambil foto selfie. Silakan ulangi selfie kamu'    
        And I submit my selfie photo
        Then I will see snackbar error upload photo 'Pastikan kamu sudah mengambil foto selfie. Silakan ulangi selfie kamu'    
        And I submit my selfie photo
        And I will direct to page verification is failed
        And I understand about the information
        And I will directing to page login
        And I filling in form login with the following details:
            | userID      | mich875d |
            | password    | 1234Test |
            | userIDstg   | nata8119 |
            | passwordStg | 1234Test |
        And I click login
        Then I will see information that my account can be opened tomorrow 
        And I understand about the information
        And I will back to page login
        And I will disabled checking device id
        And I will reset my attempt failed face match

    @C133923
    Scenario: Submit failed photo three times got server error
        Given I am a registered customer with following details:
            | userID      | rota3159 |
            | password    | 1234Test |
            | userIDstg   | nata30bc |
            | passwordStg | 1234Test |
        And I filling in form login with the following details:
            | userID      | rota3159 |
            | password    | 1234Test |
            | userIDstg   | nata30bc |
            | passwordStg | 1234Test |
        When I click login
        And I click button register new device
        And I click button continue to take selfie
        And I take picture selfie with server is error
        And I submit my selfie photo
        Then I will see snackbar error upload photo 'Terjadi kendala sistem. Silakan coba kembali'       
        And I submit my selfie photo
        Then I will see snackbar error upload photo 'Terjadi kendala sistem. Silakan coba kembali'      
        And I submit my selfie photo
        Then I will see snackbar error upload photo 'Terjadi kendala sistem. Silakan coba kembali'      
        And I will disabled checking device id    

    @C133924
    Scenario: Back to page login from bottom sheet register new device
        Given I am a registered customer with following details:
            | userID      | rota3159 |
            | password    | 1234Test |
            | userIDstg   | stagfc98 |
            | passwordStg | 1234Test |
        And I filling in form login with the following details:
            | userID      | rota3159 |
            | password    | 1234Test |
            | userIDstg   | stagfc98 |
            | passwordStg | 1234Test |
        When I click login
        And I will see bottom sheet register new device
        And I click cancel register new device
        Then I will back to page login

    @C133925
    Scenario: Close page bottom sheet register new device
        Given I am a registered customer with following details:
            | userID      | rota3159 |
            | password    | 1234Test |
            | userIDstg   | stagfc98 |
            | passwordStg | 1234Test |
        And I filling in form login with the following details:
            | userID      | rota3159 |
            | password    | 1234Test |
            | userIDstg   | stagfc98 |
            | passwordStg | 1234Test |
        When I click login
        And I will see bottom sheet register new device
        And I click close bottom sheet register new device
        Then I will back to page login

    @C133926
    Scenario: Close page verification register new device
        Given I am a registered customer with following details:
            | userID      | rota3159 |
            | password    | 1234Test |
            | userIDstg   | stagfc98 |
            | passwordStg | 1234Test |
        And I filling in form login with the following details:
            | userID      | rota3159 |
            | password    | 1234Test |
            | userIDstg   | stagfc98 |
            | passwordStg | 1234Test |
        When I click login
        And I will see bottom sheet register new device
        And I click button register new device
        And I will direct to page verification new device
        And I close page verification new device
        Then I will directing to page login

    @C135615
    Scenario: Login to app using different user id - device id of other user id has been registered
        Given I am a registered customer with following details:
            | userID      | rota3159 |
            | password    | 1234Test |
            | userIDstg   | stagfc98 |
            | passwordStg | 1234Test |
        And I filling in form login with the following details:
            | userID      | rota3159 |
            | password    | 1234Test |
            | userIDstg   | stagfc98 |
            | passwordStg | 1234Test |
        When I click login
        Then I will direct to page cannot login because already login in other device   

    @C133927
    Scenario: Login to app using different user id - account active
        Given I am a registered customer with following details:
            | userID      | mich875d |
            | password    | 1234Test |
            | userIDstg   | stagfc98 |
            | passwordStg | 1234Test |
        And I filling in form login with the following details:
            | userID      | mich875d |
            | password    | 1234Test |
            | userIDstg   | stagfc98 |
            | passwordStg | 1234Test |
        When I click login
        And I click button register new device
        And I click button continue to take selfie
        And I take picture selfie for matching the face
        And I submit my selfie photo
        Then I will direct to page verification face is success
        And I click button continue to main dashboard
        And I click later in pop up biometric
        And I will see card account 'active'
        And I choose other
        And I click logout
        And I filling in form login with the following details:
            | userID      | mich875d |
            | password    | 1234Test |
            | userIDstg   | stagfc98 |
            | passwordStg | 1234Test |
        When I click login
        And I will see card account 'active'

    @C133928
    Scenario: Login to app using different user id - account on process
        Given I am a registered customer with following details:
            | userID      | deved6a1 |
            | password    | 1234Test |
            | userIDstg   | stag8fac |
            | passwordStg | 1234Test |
        And I filling in form login with the following details:
            | userID      | deved6a1 |
            | password    | 1234Test |
            | userIDstg   | stag8fac |
            | passwordStg | 1234Test |
        When I click login
        And I click later
        And I click later in pop up biometric
        Then I will see card account 'on process'

    @C133929
    Scenario: Login to app using different user id - account on verification
        Given I am a registered customer with following details:
            | userID      | indibec3 |
            | password    | 1234Test |
            | userIDstg   | stagb081 |
            | passwordStg | 1234Test |
        And I filling in form login with the following details:
            | userID      | indibec3 |
            | password    | 1234Test |
            | userIDstg   | stagb081 |
            | passwordStg | 1234Test |
        When I click login
        And I click later
        And I click later in pop up biometric
        Then I will see card account 'on verification'