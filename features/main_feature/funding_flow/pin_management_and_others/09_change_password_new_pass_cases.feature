@regressionTest
Feature: AUTOMATED Account Change Password for New Password Field
    In order to secure my data
    As a customer
    I want to change my password

    Background: User Login and Go to Main Dashboard
        Given I am a registered customer with following details:
            | userID      | ruth17a5 |
            | password    | Test1234 |
            # | userIDstg   | gakp7d0e |
            | userIDstg   | annae951 |
            | passwordStg | Test1234 |
        When I filling in form login with the following details:
            | userID      | ruth17a5 |
            | password    | Test1234 |
            # | userIDstg   | gakp7d0e |
            | userIDstg   | annae951 |
            | passwordStg | Test1234 |
        And I click login
        Then I will see card account 'active'


    # @C164186
    # Scenario: AUTOMATED Input new password < 8 digit
    #     Given I choose other
    #     When I go to page other
    #     And I click menu change password
    #     Then I will direct to page input old password
    #     And I input my old password
    #     And I click next to input new password
    #     And I input field 'newPassword' with value '123Tes'
    #     Then I will notify by message error 'Min. 8 karakter dari huruf besar, kecil & angka' in field 'newPassword'


    # @C164187
    # Scenario: AUTOMATED Input new password only lowercase
    #     Given I choose other
    #     When I go to page other
    #     And I click menu change password
    #     Then I will direct to page input old password
    #     And I input my old password
    #     And I click next to input new password
    #     And I input field 'newPassword' with value 'testingku'
    #     Then I will notify by message error 'Min. 8 karakter dari huruf besar, kecil & angka' in field 'newPassword'


    # @C164188
    # Scenario: AUTOMATED Input new password only uppercase
    #     Given I choose other
    #     When I go to page other
    #     And I click menu change password
    #     Then I will direct to page input old password
    #     And I input my old password
    #     And I click next to input new password
    #     And I input field 'newPassword' with value 'TESTINGKU'
    #     Then I will notify by message error 'Min. 8 karakter dari huruf besar, kecil & angka' in field 'newPassword'


    # @C164189
    # Scenario: AUTOMATED Input new password only number
    #     Given I choose other
    #     When I go to page other
    #     And I click menu change password
    #     Then I will direct to page input old password
    #     And I input my old password
    #     And I click next to input new password
    #     And I input field 'newPassword' with value '12309876'
    #     Then I will notify by message error 'Min. 8 karakter dari huruf besar, kecil & angka' in field 'newPassword'


    # @C164190
    # Scenario: AUTOMATED Input new password combination lowercase and number only
    #     Given I choose other
    #     When I go to page other
    #     And I click menu change password
    #     Then I will direct to page input old password
    #     And I input my old password
    #     And I click next to input new password
    #     And I input field 'newPassword' with value 'test1234'
    #     Then I will notify by message error 'Min. 8 karakter dari huruf besar, kecil & angka' in field 'newPassword'


    # @C164191
    # Scenario: AUTOMATED Input new password combination uppercase and number only
    #     Given I choose other
    #     When I go to page other
    #     And I click menu change password
    #     Then I will direct to page input old password
    #     And I input my old password
    #     And I click next to input new password
    #     And I input field 'newPassword' with value 'TEST1234'
    #     Then I will notify by message error 'Min. 8 karakter dari huruf besar, kecil & angka' in field 'newPassword'


    # @C164192
    # Scenario: AUTOMATED Input new password combination lowercase and uppercase only
    #     Given I choose other
    #     When I go to page other
    #     And I click menu change password
    #     Then I will direct to page input old password
    #     And I input my old password
    #     And I click next to input new password
    #     And I input field 'newPassword' with value 'TestingKu'
    #     Then I will notify by message error 'Min. 8 karakter dari huruf besar, kecil & angka' in field 'newPassword'


    # @C164193
    # Scenario: AUTOMATED Input new password and then delete
    #     Given I choose other
    #     When I go to page other
    #     And I click menu change password
    #     Then I will direct to page input old password
    #     And I input my old password
    #     And I click next to input new password
    #     And I input field 'newPassword' with value '1234Test'
    #     And I clear my new password
    #     Then I will notify by message error 'Password baru wajib diisi' in field 'newPassword'


    # @C164194
    # Scenario: AUTOMATED Input confirm password and then delete
    #     Given I choose other
    #     When I go to page other
    #     And I click menu change password
    #     Then I will direct to page input old password
    #     And I input my old password
    #     And I click next to input new password
    #     And I input field 'newPassword' with value 'Test1234'
    #     And I input field 'confirmPassword' with value 'Test1234'
    #     And I clear confirm password
    #     Then I will notify by message error 'Konfirmasi password baru wajib diisi' in field 'confirmPassword'
    #     And I will not see message error 'Password baru wajib diisi' in field 'newPassword'


    # @C164195
    # Scenario: AUTOMATED Mask New Password
    #     Given I choose other
    #     When I go to page other
    #     And I click menu change password
    #     Then I will direct to page input old password
    #     And I input my old password
    #     And I click next to input new password
    #     And I input field 'newPassword' with value 'Test1234'
    #     And I unmask my new password
    #     And I mask my new password
    #     Then I will not see my new password


    # @C164196
    # Scenario: AUTOMATED Unmask New Password
    #     Given I choose other
    #     When I go to page other
    #     And I click menu change password
    #     Then I will direct to page input old password
    #     And I input my old password
    #     And I click next to input new password
    #     And I input field 'newPassword' with value 'Test1234'
    #     And I unmask my new password
    #     Then I will see my new password


    # @C164197
    # Scenario: AUTOMATED Mask Confirm Password
    #     Given I choose other
    #     When I go to page other
    #     And I click menu change password
    #     Then I will direct to page input old password
    #     And I input my old password
    #     And I click next to input new password
    #     And I input field 'confirmPassword' with value 'Test1234'
    #     And I unmask confirmation password
    #     And I mask confirmation password
    #     Then I will not see my confirmation password


    # @C164198
    # Scenario: AUTOMATED Unmask Confirm Password
    #     Given I choose other
    #     When I go to page other
    #     And I click menu change password
    #     Then I will direct to page input old password
    #     And I input my old password
    #     And I click next to input new password
    #     And I input field 'confirmPassword' with value 'Test1234'
    #     And I unmask confirmation password
    #     Then I will see my confirmation password


    # @C164199
    # Scenario: AUTOMATED Input confirm password different with new password
    #     Given I choose other
    #     When I go to page other
    #     And I click menu change password
    #     Then I will direct to page input old password
    #     And I input my old password
    #     And I click next to input new password
    #     And I input field 'newPassword' with value 'Test1234'
    #     And I input field 'confirmPassword' with value '1234Test'
    #     And I confirm my new password
    #     Then I will notify by message error 'Password yang dimasukkan tidak sesuai' in field 'newPassword'
    #     And I will notify by message error 'Password yang dimasukkan tidak sesuai' in field 'confirmPassword'


    # @C164200
    # Scenario: AUTOMATED Submit form change password with fields still empty
    #     Given I choose other
    #     When I go to page other
    #     And I click menu change password
    #     Then I will direct to page input old password
    #     And I input my old password
    #     And I click next to input new password
    #     And I confirm my new password
    #     Then I will notify by message error 'Password baru wajib diisi' in field 'newPassword'
    #     And I will notify by message error 'Konfirmasi password baru wajib diisi' in field 'confirmPassword'

    # @C164201
    # Scenario: AUTOMATED Input wrong OTP
    #     Given I choose other
    #     When I go to page other
    #     And I click menu change password
    #     Then I will direct to page input old password
    #     And I input my old password
    #     And I click next to input new password
    #     And I input field 'newPassword' with value '1234Test'
    #     And I input field 'confirmPassword' with value '1234Test'
    #     And I confirm my new password
    #     And I will see snackbar OTP successfully sent
    #     And I input wrong OTP code
    #     Then I will notify by message error 'Kode OTP yang dimasukkan salah' in field 'otp'

    # @C164202
    # Scenario: AUTOMATED Input expired OTP
    #     Given I choose other
    #     When I go to page other
    #     And I click menu change password
    #     Then I will direct to page input old password
    #     And I input my old password
    #     And I click next to input new password
    #     And I input field 'newPassword' with value '1234Test'
    #     And I input field 'confirmPassword' with value '1234Test'
    #     And I confirm my new password
    #     And I will see snackbar OTP successfully sent
    #     And I wait for 1 minutes
    #     And I input OTP change password
    #     Then I will notify by message error 'Kode OTP yang dimasukkan sudah kadaluarsa' in field 'otp'


    # @C164203
    # Scenario: AUTOMATED Input wrong OTP then correct OTP
    #     Given I choose other
    #     When I go to page other
    #     And I click menu change password
    #     Then I will direct to page input old password
    #     And I input my old password
    #     And I click next to input new password
    #     And I input field 'newPassword' with value 'Test1234'
    #     And I input field 'confirmPassword' with value 'Test1234'
    #     And I confirm my new password
    #     And I will see snackbar OTP successfully sent
    #     And I input wrong OTP code
    #     And I will notify by message error 'Kode OTP yang dimasukkan salah' in field 'otp'
    #     And I input OTP change password
    #     Then I will direct to page success change password

    @C164204
    Scenario: AUTOMATED Check attempt request OTP
        Given I choose other
        When I go to page other
        And I click menu change password
        Then I will direct to page input old password
        And I input my old password
        And I click next to input new password
        And I input field 'newPassword' with value 'Test1234'
        And I input field 'confirmPassword' with value 'Test1234'
        And I confirm my new password
        And I will direct to page input OTP change password
        And I wait for 1 minutes
        And I click link resend OTP change password
        And I will see snackbar OTP successfully sent
        And I wait for 1 minutes
        And I click link resend OTP change password
        And I will see snackbar OTP successfully sent
        And I wait for 1 minutes
        And I click link resend OTP change password
        And I will see snackbar OTP successfully sent
        And I wait for 1 minutes
        And I click link resend OTP change password
        And I will see snackbar OTP successfully sent
        And I wait for 1 minutes
        And I click link resend OTP change password
        And I will see snackbar OTP successfully sent
        And I wait for 1 minutes
        And I click link resend OTP change password
        Then I notified that I can verify the OTP tomorrow

    # @C164205
    # Scenario: AUTOMATED Input wrong OTP five times
    #     Given I choose other
    #     When I go to page other
    #     And I click menu change password
    #     Then I will direct to page input old password
    #     And I input my old password
    #     And I click next to input new password
    #     And I input field 'newPassword' with value 'Test1234'
    #     And I input field 'confirmPassword' with value 'Test1234'
    #     And I confirm my new password
    #     And I will see snackbar OTP successfully sent
    #     And I input wrong OTP code
    #     And I will notify by message error 'Kode OTP yang dimasukkan salah' in field 'otp'
    #     And I input wrong OTP code
    #     And I will notify by message error 'Kode OTP yang dimasukkan salah' in field 'otp'
    #     And I input wrong OTP code
    #     And I will notify by message error 'Kode OTP yang dimasukkan salah' in field 'otp'
    #     And I input wrong OTP code
    #     # And I will notify by message error 'Kode OTP yang dimasukkan salah' in field 'otp'
    #     # And I input wrong OTP code
    #     Then I notified that I can verify the OTP tomorrow