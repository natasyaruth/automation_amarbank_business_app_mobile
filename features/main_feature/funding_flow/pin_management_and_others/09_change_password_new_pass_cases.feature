@regressionTest
Feature: AUTOMATED Account Change Password
    In order to secure my data
    As a customer
    I want to change my password

    Background: User Login and Go to Main Dashboard
        Given I am a registered customer with following details:
            | userID      | ruth17a5 |
            | password    | Test1234 |
            | userIDstg   | gakp7d0e |
            | passwordStg | Test1234 |
        When I filling in form login with the following details:
            | userID      | ruth17a5 |
            | password    | Test1234 |
            | userIDstg   | gakp7d0e |
            | passwordStg | Test1234 |
        And I click login
        And I click later in pop up biometric
        Then I will see card account 'active'

    
    Scenario: AUTOMATED Input new password < 8 digit
        Given I choose other
        When I go to page other
        And I click menu change password
        Then I will direct to page input old password
        And I input my old password
        And I click next to input new password
        And I input field 'newPassword' with value '123Tes'
        Then I will notify by message error 'Min. 8 karakter dari huruf besar, kecil & angka' in field 'newPassword'

     
    # Scenario: AUTOMATED Input new password only lowercase
    #     And I choose other
    #     And I click menu change password
    #     And I input my old password
    #     And I click next to input new password
    #     And I input field 'newPassword' with value 'testingku'
    #     Then I will notify by message error 'Min. 8 karakter dari huruf besar, kecil & angka' in field 'newPassword'

     
    # Scenario: AUTOMATED Input new password only uppercase
    #     And I choose other
    #     And I click menu change password
    #     And I input my old password
    #     And I click next to input new password
    #     And I input field 'newPassword' with value 'TESTINGKU'
    #     Then I will notify by message error 'Min. 8 karakter dari huruf besar, kecil & angka' in field 'newPassword'

     
    # Scenario: AUTOMATED Input new password only number
    #     And I choose other
    #     And I click menu change password
    #     And I input my old password
    #     And I click next to input new password
    #     And I input field 'newPassword' with value '12309876'
    #     Then I will notify by message error 'Min. 8 karakter dari huruf besar, kecil & angka' in field 'newPassword'

     
    # Scenario: AUTOMATED Input new password combination lowercase and number only
    #     And I choose other
    #     And I click menu change password
    #     And I input my old password
    #     And I click next to input new password
    #     And I input field 'newPassword' with value 'test1234'
    #     Then I will notify by message error 'Min. 8 karakter dari huruf besar, kecil & angka' in field 'newPassword'

    
    # Scenario: AUTOMATED Input new password combination uppercase and number only
    #     And I choose other
    #     And I click menu change password
    #     And I input my old password
    #     And I click next to input new password
    #     And I input field 'newPassword' with value 'TEST1234'
    #     Then I will notify by message error 'Min. 8 karakter dari huruf besar, kecil & angka' in field 'newPassword'

    
    # Scenario: AUTOMATED Input new password combination lowercase and uppercase only
    #     And I choose other
    #     And I click menu change password
    #     And I input my old password
    #     And I click next to input new password
    #     And I input field 'newPassword' with value 'TestingKu'
    #     Then I will notify by message error 'Min. 8 karakter dari huruf besar, kecil & angka' in field 'newPassword'

    
    # Scenario: AUTOMATED Input new password and then delete
    #     And I choose other
    #     And I click menu change password
    #     And I input my old password
    #     And I click next to input new password
    #     And I input field 'newPassword' with value '1234Test'
    #     And I clear my new password
    #     Then I will notify by message error 'Password baru wajib diisi' in field 'newPassword'

   
    # Scenario: AUTOMATED Input confirm password and then delete
    #     And I choose other
    #     And I click menu change password
    #     And I input my old password
    #     And I click next to input new password
    #     And I input field 'newPassword' with value '1234Test'
    #     And I input field 'confirmPassword' with value '1234Test'
    #     And I clear confirm password
    #     Then I will notify by message error 'Konfirmasi password baru wajib diisi' in field 'confirmPassword'
    #     And I will not see message error 'Password baru wajib diisi' in field 'newPassword'

    
    # Scenario: AUTOMATED Mask New Password
    #     And I choose other
    #     And I click menu change password
    #     And I input my old password
    #     And I click next to input new password
    #     And I input field 'newPassword' with value '1234Test'
    #     And I unmask my new password
    #     And I mask my new password
    #     Then I will not see my new password

    
    # Scenario: AUTOMATED Unmask New Password
    #     And I choose other
    #     And I click menu change password
    #     And I input my old password
    #     And I click next to input new password
    #     And I input field 'newPassword' with value '1234Test'
    #     And I unmask my new password
    #     Then I will see my new password

    
    # Scenario: AUTOMATED Mask Confirm Password
    #     And I choose other
    #     And I click menu change password
    #     And I input my old password
    #     And I click next to input new password
    #     And I input field 'confirmPassword' with value '1234Test'
    #     And I unmask confirmation password
    #     And I mask confirmation password
    #     Then I will not see my confirmation password

    
    # Scenario: AUTOMATED Unmask Confirm Password
    #     And I choose other
    #     And I click menu change password
    #     And I input my old password
    #     And I click next to input new password
    #     And I input field 'confirmPassword' with value '1234Test'
    #     And I unmask confirmation password
    #     Then I will see my confirmation password

    
    # Scenario: AUTOMATED Input confirm password different with new password
    #     And I choose other
    #     And I click menu change password
    #     And I input my old password
    #     And I click next to input new password
    #     And I input field 'newPassword' with value '1234Test'
    #     And I input field 'confirmPassword' with value 'Test1234'
    #     And I confirm my new password
    #     Then I will notify by message error 'Password yang dimasukkan tidak sesuai' in field 'newPassword'
    #     And I will notify by message error 'Password yang dimasukkan tidak sesuai' in field 'confirmPassword'

    
    # Scenario: AUTOMATED Submit form change password with fields still empty
    #     And I choose other
    #     And I click menu change password
    #     And I input my old password
    #     And I click next to input new password
    #     And I confirm my new password
    #     Then I will notify by message error 'Password baru wajib diisi' in field 'newPassword'
    #     And I will notify by message error 'Konfirmasi password baru wajib diisi' in field 'confirmPassword'

    
    # Scenario: AUTOMATED Check attempt request OTP
    #     And I choose other
    #     And I click menu change password
    #     And I input my old password
    #     And I click next to input new password
    #     And I input field 'newPassword' with value '1234Test'
    #     And I input field 'confirmPassword' with value '1234Test'
    #     And I confirm my new password
    #     And I will direct to page input OTP change password
    #     And I wait for 1 minutes
    #     And I click link resend OTP change password
    #     And I will see snackbar OTP successfully sent
    #     And I wait for 1 minutes
    #     And I click link resend OTP change password
    #     And I will see snackbar OTP successfully sent
    #     And I wait for 1 minutes
    #     And I click link resend OTP change password
    #     And I will see snackbar OTP successfully sent
    #     And I wait for 1 minutes
    #     And I click link resend OTP change password
    #     And I will see snackbar OTP successfully sent
    #     And I wait for 1 minutes
    #     And I click link resend OTP change password
    #     And I will see snackbar OTP successfully sent
    #     And I wait for 1 minutes
    #     And I click link resend OTP change password
    #     Then I notified that I can verify the OTP tomorrow

    # Scenario: AUTOMATED Input wrong OTP
    #     And I choose other
    #     And I click menu change password
    #     And I input my old password
    #     And I click next to input new password
    #     And I input field 'newPassword' with value '1234Test'
    #     And I input field 'confirmPassword' with value '1234Test'
    #     And I confirm my new password
    #     And I will see snackbar OTP successfully sent
    #     And I input wrong OTP code
    #     Then I will notify by message error 'Kode OTP yang dimasukkan salah' in field 'otp'

    
    # Scenario: AUTOMATED Input wrong OTP five times
    #     And I choose other
    #     And I click menu change password
    #     And I input my old password
    #     And I click next to input new password
    #     And I input field 'newPassword' with value '1234Test'
    #     And I input field 'confirmPassword' with value '1234Test'
    #     And I confirm my new password
    #     And I will see snackbar OTP successfully sent
    #     And I input wrong OTP code
    #     And I will notify by message error 'Kode OTP yang dimasukkan salah' in field 'otp'
    #     And I input wrong OTP code
    #     And I will notify by message error 'Kode OTP yang dimasukkan salah' in field 'otp'
    #     And I input wrong OTP code
    #     And I will notify by message error 'Kode OTP yang dimasukkan salah' in field 'otp'
    #     And I input wrong OTP code
    #     And I will notify by message error 'Kode OTP yang dimasukkan salah' in field 'otp'
    #     And I input wrong OTP code
    #     Then I should be notified that I can verify the OTP tomorrow

    
    # Scenario: AUTOMATED Input expired OTP
    #     And I choose other
    #     And I click menu change password
    #     And I input my old password
    #     And I click next to input new password
    #     And I input field 'newPassword' with value '1234Test'
    #     And I input field 'confirmPassword' with value '1234Test'
    #     And I confirm my new password
    #     And I will see snackbar OTP successfully sent
    #     And I wait for 1 minutes
    #     And I input OTP change password
    #     Then I will notify by message error 'Kode OTP yang dimasukkan sudah kadaluarsa' in field 'otp'

    
    # Scenario: AUTOMATED Input wrong OTP then correct OTP
    #     And I choose other
    #     And I click menu change password
    #     And I input my old password
    #     And I click next to input new password
    #     And I input field 'newPassword' with value '1234Test'
    #     And I input field 'confirmPassword' with value '1234Test'
    #     And I confirm my new password
    #     And I will see snackbar OTP successfully sent
    #     And I input wrong OTP code
    #     And I will notify by message error 'Kode OTP yang dimasukkan salah' in field 'otp' 
    #     And I input OTP change password
    #     Then I will direct to page success change password

    # @C141203 
    # Scenario: AUTOMATED Change password till success login with account active initiator
    #     Given I am a registered customer with following details:
    #         | userID      | deveb4ef |
    #         | password    | 1234Test |
    #         | userIDstg   | ruth2d88 |
    #         | passwordStg | 1234Test | 
    #     When I filling in form login with the following details:
    #         | userID      | deveb4ef |
    #         | password    | 1234Test |
    #         | userIDstg   | ruth2d88 |
    #         | passwordStg | 1234Test |
    #     And I click login
    #     And I click later in pop up biometric
    #     And I will see card account 'active'
    #     And I choose other
    #     And I click menu change password
    #     And I input my old password
    #     And I click next to input new password
    #     And I input field 'newPassword' with value 'Test1234'
    #     And I input field 'confirmPassword' with value 'Test1234'
    #     And I confirm my new password
    #     And I will see snackbar OTP successfully sent
    #     And I input OTP change password
    #     And I will direct to page success change password
    #     And I click button direct to page login
    #     And I login again with my new password
    #     Then I will see card account 'active'
    #     And I reset back my password

    # @C141204
    # Scenario: AUTOMATED Change password till success login with account active invitee
    #     Given I am a registered customer with following details:
    #         | userID      | nataf76e |
    #         | password    | 1234Test |
    #         | userIDstg   | nata6bde |
    #         | passwordStg | 1234Test | 
    #     When I filling in form login with the following details:
    #         | userID      | nataf76e |
    #         | password    | 1234Test |
    #         | userIDstg   | nata6bde |
    #         | passwordStg | 1234Test |
    #     And I click login
    #     And I click later in pop up biometric
    #     And I will see card account 'active'
    #     And I choose other
    #     And I click menu change password
    #     And I input my old password
    #     And I click next to input new password
    #     And I input field 'newPassword' with value 'Test1234'
    #     And I input field 'confirmPassword' with value 'Test1234'
    #     And I confirm my new password
    #     And I will see snackbar OTP successfully sent
    #     And I input OTP change password
    #     And I will direct to page success change password
    #     And I click button direct to page login
    #     And I login again with my new password
    #     Then I will see card account 'active'
    #     And I reset back my password

    # @C141205
    # Scenario: AUTOMATED Change password till success login with account verification initiator
    #     Given I am a registered customer with following details:
    #         | userID      | revv8f08 |
    #         | password    | 1234Test |
    #         | userIDstg   | revv2257 |
    #         | passwordStg | 1234Test | 
    #     When I filling in form login with the following details:
    #         | userID      | revv8f08 |
    #         | password    | 1234Test |
    #         | userIDstg   | revv2257 |
    #         | passwordStg | 1234Test |
    #     And I click login
    #     And I click later in pop up biometric
    #     And I will see card account 'on verification'
    #     And I choose other
    #     And I click menu change password
    #     And I input my old password
    #     And I click next to input new password
    #     And I input field 'newPassword' with value 'Test1234'
    #     And I input field 'confirmPassword' with value 'Test1234'
    #     And I confirm my new password
    #     And I will see snackbar OTP successfully sent
    #     And I input OTP change password
    #     And I will direct to page success change password
    #     And I click button direct to page login
    #     And I login again with my new password
    #     Then I will see card account 'on verification'
    #     And I reset back my password

    # @C141206
    # Scenario: AUTOMATED Change password till success login with account verification invitee
    #     Given I am a registered customer with following details:
    #         | userID      | rudi71d5 |
    #         | password    | 1234Test |
    #         | userIDstg   | rudie4f1 |
    #         | passwordStg | 1234Test | 
    #     When I filling in form login with the following details:
    #         | userID      | rudi71d5 |
    #         | password    | 1234Test |
    #         | userIDstg   | rudie4f1 |
    #         | passwordStg | 1234Test |
    #     And I click login
    #     And I click later in pop up biometric
    #     And I will see card account 'on verification'
    #     And I choose other
    #     And I click menu change password
    #     And I input my old password
    #     And I click next to input new password
    #     And I input field 'newPassword' with value 'Test1234'
    #     And I input field 'confirmPassword' with value 'Test1234'
    #     And I confirm my new password
    #     And I will see snackbar OTP successfully sent
    #     And I input OTP change password
    #     And I will direct to page success change password
    #     And I click button direct to page login
    #     And I login again with my new password
    #     Then I will see card account 'on verification'
    #     And I reset back my password

    # @C141207
    # Scenario: AUTOMATED Change password till success login with account initiator on process 
    #     Given I am a registered customer with following details:
    #         | userID      | deve82e5 |
    #         | password    | 1234Test |
    #         | userIDstg   | stag48e9 |
    #         | passwordStg | 1234Test | 
    #     When I filling in form login with the following details:
    #         | userID      | deve82e5 |
    #         | password    | 1234Test |
    #         | userIDstg   | stag48e9 |
    #         | passwordStg | 1234Test |
    #     And I click login
    #     And I click later in pop up biometric
    #     And I will see card account 'on process'
    #     And I choose other
    #     And I click menu change password
    #     And I input my old password
    #     And I click next to input new password
    #     And I input field 'newPassword' with value 'Test1234'
    #     And I input field 'confirmPassword' with value 'Test1234'
    #     And I confirm my new password
    #     And I will see snackbar OTP successfully sent
    #     And I input OTP change password
    #     And I will direct to page success change password
    #     And I click button direct to page login
    #     And I login again with my new password
    #     Then I will see card account 'on process'
    #     And I reset back my password                

    # @C141208
    # Scenario: AUTOMATED Login again after change password with old password
    #     Given I am a registered customer with following details:
    #         | userID      | autod015 |
    #         | password    | 1234Test |
    #         | userIDstg   | ruthfdcb |
    #         | passwordStg | 1234Test | 
    #     When I filling in form login with the following details:
    #         | userID      | autod015 |
    #         | password    | 1234Test |
    #         | userIDstg   | ruthfdcb |
    #         | passwordStg | 1234Test |
    #     And I click login
    #     And I click later in pop up biometric
    #     And I will see card account 'active'
    #     And I choose other
    #     And I click menu change password
    #     And I input my old password
    #     And I click next to input new password
    #     And I input field 'newPassword' with value 'Test1234'
    #     And I input field 'confirmPassword' with value 'Test1234'
    #     And I confirm my new password
    #     And I will see snackbar OTP successfully sent
    #     And I input OTP change password
    #     And I will direct to page success change password
    #     And I click button direct to page login
    #     And I login again with my new password
    #     And I will see card account 'active'
    #     And I choose other
    #     And I click menu change password
    #     And I input my old password
    #     And I click next to input new password
    #     And I input field 'newPassword' with value '1234Test'
    #     And I input field 'confirmPassword' with value '1234Test'
    #     And I confirm my new password
    #     And I will see snackbar OTP successfully sent
    #     And I input OTP change password
    #     And I will direct to page success change password
    #     And I click button direct to page login
    #     And I login again with my new password
    #     And I will see card account 'active' 

    # @C141209
    # Scenario: AUTOMATED Change password with current password
    #     Given I am a registered customer with following details:
    #         | userID      | autod015 |
    #         | password    | 1234Test |
    #         | userIDstg   | ruthfdcb |
    #         | passwordStg | 1234Test | 
    #     When I filling in form login with the following details:
    #         | userID      | autod015 |
    #         | password    | 1234Test |
    #         | userIDstg   | ruthfdcb |
    #         | passwordStg | 1234Test |
    #     And I click login
    #     And I click later in pop up biometric
    #     And I will see card account 'active'
    #     And I choose other
    #     And I click menu change password
    #     And I input my old password
    #     And I click next to input new password
    #     And I input field 'newPassword' with value '1234Test'
    #     And I input field 'confirmPassword' with value '1234Test'
    #     And I confirm my new password
    #     And I will see snackbar OTP successfully sent
    #     And I input OTP change password
    #     And I will direct to page success change password
    #     And I click button direct to page login
    #     And I login again with my new password
    #     And I will see card account 'active'

    # @C141210
    # Scenario: AUTOMATED Checking attempt failed login after attempt failed input old password twice
    #     Given I am a registered customer with following details:
    #         | userID      | autod015 |
    #         | password    | 1234Test |
    #         | userIDstg   | ruthfdcb |
    #         | passwordStg | 1234Test | 
    #     When I filling in form login with the following details:
    #         | userID      | autod015 |
    #         | password    | 1234Test |
    #         | userIDstg   | ruthfdcb |
    #         | passwordStg | 1234Test |
    #     And I click login
    #     And I click later in pop up biometric
    #     And I will see card account 'active'
    #     And I choose other
    #     And I click menu change password
    #     And I input incorrect old password
    #     And I click next to input new password
    #     And I will see pop up data is incorrect
    #     And I try again to input password
    #     And I click next to input new password
    #     And I will see pop up data is incorrect
    #     And I try again to input password
    #     And I close page input old password
    #     And I will see pop up cancel change password
    #     And I click button cancel change password
    #     And I click logout
    #     And I fill form login with incorrect password
    #     And I click login
    #     Then I should see pop up with information three times input incorrect data and can be tried in the next 10 minutes
    #     And I reset attempt failed login

    # @C141211
    # Scenario: AUTOMATED Checking attempt failed input old password after attempt failed login twice
    #     Given I am a registered customer with following details:
    #         | userID      | autod015 |
    #         | password    | 1234Test |
    #         | userIDstg   | ruthfdcb |
    #         | passwordStg | 1234Test | 
    #     When I filling in form login with the following details:
    #         | userID      | autod015 |
    #         | password    | Test1234 |
    #         | userIDstg   | ruthfdcb |
    #         | passwordStg | Test1234 |
    #     And I click login
    #     And I should see log in pop up 'Jika 3 kali salah, Anda harus menunggu untuk mencoba kembali Masuk Akun' with button 'tryAgain'
    #     And I click try again to login
    #     And I click login
    #     And I should see log in pop up 'Jika 3 kali salah, Anda harus menunggu untuk mencoba kembali Masuk Akun' with button 'tryAgain'
    #     And I click try again to login
    #     And I filling in form login with the following details:
    #         | userID      | autod015 |
    #         | password    | 1234Test |
    #         | userIDstg   | ruthfdcb |
    #         | passwordStg | 1234Test |
    #     And I click login
    #     And I click later in pop up biometric
    #     And I will see card account 'active'
    #     And I choose other
    #     And I click menu change password
    #     And I input incorrect old password
    #     And I click next to input new password
    #     And I will see pop up data is incorrect
    #     And I try again to input password
    #     And I reset attempt failed login  
        
    # @C141315
    # Scenario: AUTOMATED Login with old password after change password
    #     Given I am a registered customer with following details:
    #         | userID      | autod015 |
    #         | password    | 1234Test |
    #         | userIDstg   | ruthfdcb |
    #         | passwordStg | 1234Test | 
    #     When I filling in form login with the following details:
    #         | userID      | autod015 |
    #         | password    | 1234Test |
    #         | userIDstg   | ruthfdcb |
    #         | passwordStg | 1234Test |
    #     And I click login
    #     And I click later in pop up biometric
    #     And I choose other
    #     And I click menu change password
    #     And I input my old password
    #     And I click next to input new password
    #     And I input field 'newPassword' with value 'Test1234'
    #     And I input field 'confirmPassword' with value 'Test1234'
    #     And I confirm my new password
    #     And I will see snackbar OTP successfully sent
    #     And I input OTP change password
    #     And I will direct to page success change password
    #     And I click button direct to page login
    #     And I login again with my old password
    #     And I click login
    #     Then I should see log in pop up 'Jika 3 kali salah, Anda harus menunggu untuk mencoba kembali Masuk Akun' with button 'tryAgain'
    #     And I click try again to login
    #     And I reset attempt failed login
    #     And I login again with my new password
    #     And I click login
    #     And I reset back my password