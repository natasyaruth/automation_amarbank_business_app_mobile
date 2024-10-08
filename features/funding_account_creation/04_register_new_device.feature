Feature: Registering New Device
    In order to login to the new device
    As a customer
    I want to register my new device
    So that SMB app recognize my new device

    # ATTENTION
    # Please input your device/emulator id

    Background: Enabled checking register new device id
        Given I delete device id 'a76eafb5ec4376ca'
        And I have new device id 'Test32'
        And I will mock liveness to success

    @C133917
    Scenario: Recapture selfie picture
        Given I am a registered customer with following details:
            | userID      | mich875d |
            | password    | 1234Test |
            | userIDstg   | nata8119 |
            | passwordStg | 1234Test |
        And I reset my device id to new device
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

    @C133918
    Scenario: Submit photo selfie with picture is blur
        Given I am a registered customer with following details:
            | userID      | mich875d |
            | password    | 1234Test |
            | userIDstg   | nata8119 |
            | passwordStg | 1234Test |
        And I reset my device id to new device
        And I will reset my attempt failed face match
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
        Then I will see snackbar error upload photo 'Foto terlalu gelap atau blur. Silakan ulangi selfie Anda.'

    @C133919
    Scenario: Submit photo selfie with picture is dark
        Given I am a registered customer with following details:
            | userID      | mich875d |
            | password    | 1234Test |
            | userIDstg   | stag4cce |
            | passwordStg | 1234Test |
        And I reset my device id to new device
        And I will reset my attempt failed face match
        And I filling in form login with the following details:
            | userID      | mich875d |
            | password    | 1234Test |
            | userIDstg   | stag4cce |
            | passwordStg | 1234Test |
        When I click login
        And I click button register new device
        And I click button continue to take selfie
        And I take picture selfie with face is dark
        And I submit my selfie photo
        Then I will see snackbar error upload photo 'Foto terlalu gelap atau blur. Silakan ulangi selfie Anda.'

    @C133920
    Scenario: Submit photo selfie is blank or not selfie picture
        Given I am a registered customer with following details:
            | userID      | rotacb82 |
            | password    | 1234Test |
            | userIDstg   | nata30bc |
            | passwordStg | 1234Test |
        And I reset my device id to new device
        And I will reset my attempt failed face match
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
        Then I will see snackbar error upload photo 'Pastikan Anda sudah mengambil foto selfie. Silakan ulangi selfie Anda'

    @C133921
    Scenario: Submit photo selfie with server is error
        Given I am a registered customer with following details:
            | userID      | rotacb82 |
            | password    | 1234Test |
            | userIDstg   | natace59 |
            | passwordStg | 1234Test |
        And I reset my device id to new device
        And I filling in form login with the following details:
            | userID      | rotacb82 |
            | password    | 1234Test |
            | userIDstg   | natace59 |
            | passwordStg | 1234Test |
        When I click login
        And I click button register new device
        And I click button continue to take selfie
        And I take picture selfie with server is error
        And I submit my selfie photo
        Then I will see snackbar error upload photo 'Terjadi kendala sistem. Silakan coba kembali'
        
    @C133922
    Scenario: Submit failed photo till account is blocked
        Given I am a registered customer with following details:
            | userID      | rotacb82 |
            | password    | 1234Test |
            | userIDstg   | natace59 |
            | passwordStg | 1234Test |
        And I reset my device id to new device
        And I will reset my attempt failed face match
        And I reset attempt failed login
        And I filling in form login with the following details:
            | userID      | rotacb82 |
            | password    | 1234Test |
            | userIDstg   | natace59 |
            | passwordStg | 1234Test |
        When I click login
        And I click button register new device
        And I click button continue to take selfie
        And I take picture selfie with no face
        And I submit my selfie photo
        Then I will see snackbar error upload photo 'Pastikan Anda sudah mengambil foto selfie. Silakan ulangi selfie Anda'    
        And I submit my selfie photo
        Then I will see snackbar error upload photo 'Pastikan Anda sudah mengambil foto selfie. Silakan ulangi selfie Anda'    
        And I submit my selfie photo
        And I will direct to page verification is failed
        And I understand about the information
        And I will directing to page login
        And I filling in form login with the following details:
            | userID      | rotacb82 |
            | password    | 1234Test |
            | userIDstg   | natace59 |
            | passwordStg | 1234Test |
        And I click login
        Then I will see information that my account can be opened tomorrow 
        And I understand about the information
        And I will back to page login

    @C133923
    Scenario: Submit failed photo three times got server error
        Given I am a registered customer with following details:
            | userID      | rota3159 |
            | password    | 1234Test |
            | userIDstg   | natace59 |
            | passwordStg | 1234Test |
        And I reset my device id to new device
        And I filling in form login with the following details:
            | userID      | rota3159 |
            | password    | 1234Test |
            | userIDstg   | natace59 |
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

    @C133924
    Scenario: Back to page login from bottom sheet register new device
        Given I am a registered customer with following details:
            | userID      | rota3159 |
            | password    | 1234Test |
            | userIDstg   | stagfc98 |
            | passwordStg | 1234Test |
        And I reset my device id to new device
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
        And I reset my device id to new device
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
        And I reset my device id to new device
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

    @C133927
    Scenario: Login to app using different user id - account active
        Given I am a registered customer with following details:
            | userID      | natace13 |
            | password    | Test1234 |
            | userIDstg   | stagfc98 |
            | passwordStg | 1234Test |
        And I reset my device id to new device
        And don't have any notification
        And I filling in form login with the following details:
            | userID      | natace13 |
            | password    | Test1234 |
            | userIDstg   | stagfc98 |
            | passwordStg | 1234Test |
        When I click login
        And I click button register new device
        And I click button continue to take selfie
        And I take picture selfie for matching the face
        And I submit my selfie photo
        Then I will direct to page verification face is success
        And I click button continue to page login
        And I will directing to page login
        And I filling in form login with the following details:
            | userID      | natace13 |
            | password    | Test1234 |
            | userIDstg   | stagfc98 |
            | passwordStg | 1234Test |
        And I click login
        And I click later in pop up biometric
        And I will see card account 'active'
        And I see red dot notification center
        And I click notification center
        And I see notification register new device successfully changes
        And I click bucketlist notification info
        And I will direct to detail register new device successfully changes

    @C162010
    Scenario: Checking notification after failed attempt register new device
        Given I am a registered customer with following details:
            | userID      | natace13 |
            | password    | Test1234 |
            | userIDstg   | stagfc98 |
            | passwordStg | 1234Test |
        And don't have any notification
        And I reset my device id to new device
        And I will reset my attempt failed face match 
        And I filling in form login with the following details:
            | userID      | natace13 |
            | password    | Test1234 |
            | userIDstg   | stagfc98 |
            | passwordStg | 1234Test |
        When I click login
        And I click button register new device
        And I click button continue to take selfie
        And I take picture selfie with no face
        And I submit my selfie photo
        And I will see snackbar error upload photo 'Pastikan Anda sudah mengambil foto selfie. Silakan ulangi selfie Anda'
        And I will mock liveness to success
        And I submit my selfie photo
        And I will direct to page verification face is success
        And I click button continue to page login
        And I will directing to page login
        And I filling in form login with the following details:
            | userID      | natace13 |
            | password    | Test1234 |
            | userIDstg   | stagfc98 |
            | passwordStg | 1234Test |
        And I click login
        And I click later in pop up biometric
        And I will see card account 'active'
        And I see red dot notification center
        And I click notification center
        And I see notification attempt of register new device
        And I click notification center attempt register new device
        And I will direct to detail attempt register new device

    @C162041
    Scenario: Checking notification after attempt failed till blocked
        Given I am a registered customer with following details:
            | userID      | rotacb82 |
            | password    | 1234Test |
            | userIDstg   | natace59 |
            | passwordStg | 1234Test |
        And don't have any notification
        And I reset my device id to new device
        And I will reset my attempt failed face match
        And I reset attempt failed login
        And I filling in form login with the following details:
            | userID      | rotacb82 |
            | password    | 1234Test |
            | userIDstg   | natace59 |
            | passwordStg | 1234Test |
        When I click login
        And I click button register new device
        And I click button continue to take selfie
        And I take picture selfie with no face
        And I submit my selfie photo
        And I will see snackbar error upload photo 'Pastikan Anda sudah mengambil foto selfie. Silakan ulangi selfie Anda'    
        And I submit my selfie photo
        And I will see snackbar error upload photo 'Pastikan Anda sudah mengambil foto selfie. Silakan ulangi selfie Anda'    
        And I submit my selfie photo
        And I will direct to page verification is failed
        And I understand about the information
        And I will directing to page login
        And I filling in form login with the following details:
            | userID      | rotacb82 |
            | password    | 1234Test |
            | userIDstg   | natace59 |
            | passwordStg | 1234Test |
        And I click login
        And I will see information my account has been blocked
        And I understand about the information
        And I reset attempt failed login
        And I click login
        And I see red dot notification center
        And I click notification center
        Then I see two notification attempt of register new device
        And I click bucketlist notification info
        And I will direct to detail attempt register new device
    
    @C135615
    Scenario: Login to app using different user id - device id of other user id has been registered
        Given I am a registered customer with following details:
            | userID      | ptpe5040 |
            | password    | 1234Test |
            | userIDstg   | stage87c |
            | passwordStg | 1234Test |
        And I reset my device id to new device
        And I filling in form login with the following details:
            | userID      | ptpe5040 |
            | password    | 1234Test |
            | userIDstg   | stage87c |
            | passwordStg | 1234Test |
        When I click login
        And I click button register new device
        And I click button continue to take selfie
        And I take picture selfie for matching the face
        And I submit my selfie photo
        And I will direct to page verification face is success
        And I click button continue to page login
        And I will directing to page login
        And I filling in form login with the following details:
            | userID      | ptpe5040 |
            | password    | 1234Test |
            | userIDstg   | stage87c |
            | passwordStg | 1234Test |
        And I click login
        And I click later in pop up biometric
        And I will see card account 'active'
        And I choose other
        And I click logout
        And I filling in form login with the following details:
            | userID      | rotacb82 |
            | password    | 1234Test |
            | userIDstg   | stagb0fe |
            | passwordStg | 1234Test |
        And I reset my device id to new device
        And I click login
        And I click button register new device
        And I click button continue to take selfie
        And I take picture selfie for matching the face
        And I submit my selfie photo
        And I will direct to page verification face is success
        And I click button continue to page login
        And I will directing to page login
        And I filling in form login with the following details:
            | userID      | rotacb82 |
            | password    | 1234Test |
            | userIDstg   | stage87c |
            | passwordStg | 1234Test |
        And I click login
        And I click later in pop up biometric
        And I will see card account 'active'
        And I choose other
        And I click logout
        And I filling in form login with the following details:
            | userID      | ptpe5040 |
            | password    | 1234Test |
            | userIDstg   | stage87c |
            | passwordStg | 1234Test |
        And I click login
        And I click later in pop up biometric
        And I will see card account 'active'

    @C133928
    Scenario: Login to app using different user id - account on process
        Given I am a registered customer with following details:
            | userID      | deved6a1 |
            | password    | 1234Test |
            | userIDstg   | stag8fac |
            | passwordStg | 1234Test |
        And I reset my device id to new device
        And I filling in form login with the following details:
            | userID      | deved6a1 |
            | password    | 1234Test |
            | userIDstg   | stag8fac |
            | passwordStg | 1234Test |
        When I click login
        And I click later in pop up biometric
        Then I will see card account 'on process'

    @C133929
    Scenario: Login to app using different user id - account on verification Individual
        Given I am a registered customer with following details:
            | userID      | indibec3 |
            | password    | 1234Test |
            | userIDstg   | stagb081 |
            | passwordStg | 1234Test |
        And I reset my device id to new device
        And I filling in form login with the following details:
            | userID      | indibec3 |
            | password    | 1234Test |
            | userIDstg   | stagb081 |
            | passwordStg | 1234Test |
        When I click login
        And I click later in pop up biometric
        Then I will see card account 'on verification'

    @C137266
    Scenario: Login to app using different user id - account on verification Invitee
        Given I am a registered customer with following details:
            | userID      | ruth4dcf |
            | password    | 1234Test |
            | userIDstg   | wilof09c |
            | passwordStg | 1234Test |
        And I reset my device id to new device
        And I filling in form login with the following details:
            | userID      | ruth4dcf |
            | password    | 1234Test |
            | userIDstg   | wilof09c |
            | passwordStg | 1234Test |
        When I click login
        And I click later in pop up biometric
        Then I will see card account 'on verification'    