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

    @C174143
    Scenario: Checking email masking with char before @ is only one character
        Given I am a registered customer with following details:
            | userID      | rotacb82 |
            | password    | 1234Test |
            | userIDstg   | natace59 |
            | passwordStg | 1234Test |
        And I reset my device id to new device
        And I reset condition block change device
        And I filling in form login with the following details:
            | userID      | rotacb82 |
            | password    | 1234Test |
            | userIDstg   | natace59 |
            | passwordStg | 1234Test |
        When I click login
        And I click button register new device
        Then I will direct to page verification with email is masked

    @C174144
    Scenario: Checking email masking with char before @ is 5 character
        Given I am a registered customer with following details:
            | userID      | rotacb82 |
            | password    | 1234Test |
            | userIDstg   | natace59 |
            | passwordStg | 1234Test |
        And I reset my device id to new device
        And I reset condition block change device
        And I filling in form login with the following details:
            | userID      | rotacb82 |
            | password    | 1234Test |
            | userIDstg   | natace59 |
            | passwordStg | 1234Test |
        When I click login
        And I click button register new device
        Then I will direct to page verification with email is masked

    @C174145
    Scenario: Input wrong OTP code once for change device
        Given I am a registered customer with following details:
            | userID      | rotacb82 |
            | password    | 1234Test |
            | userIDstg   | natace59 |
            | passwordStg | 1234Test |
        And I reset my device id to new device
        And I reset condition block change device
        And I filling in form login with the following details:
            | userID      | rotacb82 |
            | password    | 1234Test |
            | userIDstg   | natace59 |
            | passwordStg | 1234Test |
        When I click login
        And I click button register new device
        And I will direct to page verification with email is masked
        And I input wrong OTP code
        Then I will notify by message error 'Kode OTP yang Anda masukkan salah (1/3)' in field 'otp'

    @C174146
    Scenario: Input expired OTP code for change device
        Given I am a registered customer with following details:
            | userID      | rotacb82 |
            | password    | 1234Test |
            | userIDstg   | natace59 |
            | passwordStg | 1234Test |
        And I reset my device id to new device
        And I reset condition block change device
        And I filling in form login with the following details:
            | userID      | rotacb82 |
            | password    | 1234Test |
            | userIDstg   | natace59 |
            | passwordStg | 1234Test |
        When I click login
        And I click button register new device
        And I will direct to page verification with email is masked
        And I input expired OTP
        Then I will notify by message error 'Kode verifikasi yang dimasukan sudah kedaluwarsa' in field 'otp'

    @C174147
    Scenario: Input wrong OTP code for change device three times
        Given I am a registered customer with following details:
            | userID      | rotacb82 |
            | password    | 1234Test |
            | userIDstg   | natace59 |
            | passwordStg | 1234Test |
        And I reset my device id to new device
        And I reset condition block change device
        And I filling in form login with the following details:
            | userID      | rotacb82 |
            | password    | 1234Test |
            | userIDstg   | natace59 |
            | passwordStg | 1234Test |
        When I click login
        And I click button register new device
        And I will direct to page verification with email is masked
        And I input wrong OTP code change device three times
        Then I will notify otp for change device can be sent after 24 hours
        And I click button back to page login
        And I filling in form login with the following details:
            | userID      | rotacb82 |
            | password    | 1234Test |
            | userIDstg   | natace59 |
            | passwordStg | 1234Test |
        And I click login
        And I will see information that my account can be opened tomorrow

    @C174148
    Scenario: Resend OTP more than five times
        Given I am a registered customer with following details:
            | userID      | rotacb82 |
            | password    | 1234Test |
            | userIDstg   | natace59 |
            | passwordStg | 1234Test |
        And I reset my device id to new device
        And I reset condition block change device
        And I filling in form login with the following details:
            | userID      | rotacb82 |
            | password    | 1234Test |
            | userIDstg   | natace59 |
            | passwordStg | 1234Test |
        When I click login
        And I click button register new device
        And I wait for 1 minutes
        And I click link resend OTP change device
        And I will see snackbar OTP successfully sent
        And I wait for 1 minutes
        And I click link resend OTP change device
        And I will see snackbar OTP successfully sent
        And I wait for 1 minutes
        And I click link resend OTP change device
        And I will see snackbar OTP successfully sent
        And I wait for 1 minutes
        And I click link resend OTP change device
        And I will see snackbar OTP successfully sent
        And I wait for 1 minutes
        And I click link resend OTP change device
        And I will see snackbar OTP successfully sent
        And I wait for 1 minutes
        And I click link resend OTP change device
        Then I will see message error OTP with information can be tried tomorrow

    @C174149
    Scenario: Input wrong OTP code once and then input the correct one
        Given I am a registered customer with following details:
            | userID      | rotacb82 |
            | password    | 1234Test |
            | userIDstg   | natace59 |
            | passwordStg | 1234Test |
        And I reset my device id to new device
        And I reset condition block change device
        And I filling in form login with the following details:
            | userID      | rotacb82 |
            | password    | 1234Test |
            | userIDstg   | natace59 |
            | passwordStg | 1234Test |
        When I click login
        And I click button register new device
        And I input wrong OTP code
        And I will notify by message error 'Kode OTP yang Anda masukkan salah (1/3)' in field 'otp'
        And I input OTP code change device that sent to me
        Then I will direct to page verification new device

    @C174150
    Scenario: Input expired OTP code and then input the new one
        Given I am a registered customer with following details:
            | userID      | rotacb82 |
            | password    | 1234Test |
            | userIDstg   | natace59 |
            | passwordStg | 1234Test |
        And I reset my device id to new device
        And I reset condition block change device
        And I filling in form login with the following details:
            | userID      | rotacb82 |
            | password    | 1234Test |
            | userIDstg   | natace59 |
            | passwordStg | 1234Test |
        When I click login
        And I click button register new device
        And I will direct to page verification with email is masked
        And I input expired OTP
        And I will notify by message error 'Kode verifikasi yang dimasukan sudah kedaluwarsa' in field 'otp'
        And I click link resend OTP change device
        And I will see snackbar OTP successfully sent
        And I input OTP code change device that sent to me
        Then I will direct to page verification new device

    @C174151
    Scenario: Input the old OTP code after resent new otp code
        Given I am a registered customer with following details:
            | userID      | rotacb82 |
            | password    | 1234Test |
            | userIDstg   | natace59 |
            | passwordStg | 1234Test |
        And I reset my device id to new device
        And I reset condition block change device
        And I filling in form login with the following details:
            | userID      | rotacb82 |
            | password    | 1234Test |
            | userIDstg   | natace59 |
            | passwordStg | 1234Test |
        When I click login
        And I click button register new device
        And I will see snackbar OTP successfully sent
        And I will direct to page verification with email is masked
        And I get the first otp code change device
        And I click link resend OTP change device
        And I will see snackbar OTP successfully sent
        And I will get new otp code different from the first one
        And I input field OTP with the first one
        Then I will notify by message error 'Kode OTP yang Anda masukkan salah (1/3)' in field 'otp'

    @C174152
    Scenario: Open call center in page OTP change device
        Given I am a registered customer with following details:
            | userID      | rotacb82 |
            | password    | 1234Test |
            | userIDstg   | natace59 |
            | passwordStg | 1234Test |
        And I reset my device id to new device
        And I reset condition block change device
        And I filling in form login with the following details:
            | userID      | rotacb82 |
            | password    | 1234Test |
            | userIDstg   | natace59 |
            | passwordStg | 1234Test |
        When I click login
        And I click button register new device
        And I click help center
        Then I will see helping center via email
     
    @C165969
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
        And I will direct to page verification with email is masked
        And I input OTP code change device that sent to me
        And I click button continue to take selfie
        And I take picture selfie with no face
        And I will direct to page verification is failed
        And I click button continue to take selfie
        And I take picture selfie with no face
        And I will direct to page verification is failed
        And I click button continue to take selfie
        And I take picture selfie with no face
        And I will direct to page can't continue with the new device
        And I click button back to page login
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

    @C165971
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

    @C165972
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

    @C165973
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
        And I will direct to page verification with email is masked
        And I input OTP code change device that sent to me
        And I will direct to page verification new device
        And I close page verification new device
        Then I will directing to page login

    @C165974
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
        And I will direct to page verification with email is masked
        And I input OTP code change device that sent to me
        And I click button to check selfie
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
    
    @C165977
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
        And I will direct to page verification with email is masked
        And I input OTP code change device that sent to me
        And I click button to check selfie
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
        And I will direct to page verification with email is masked
        And I input OTP code change device that sent to me
        And I click button to check selfie
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

    @C165978
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

    @C165979
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

    @C165980
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