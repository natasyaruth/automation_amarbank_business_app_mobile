@change_password
Feature: Account Change Password
    In order to secure my data
    As a customer
    I want to change my password

    @C141172
    Scenario: Close Page in form input old password
        Given I am a registered customer with following details:
            | userID      | auto3a2f |
            | password    | 1234Test |
            | userIDstg   | stagcfb7 |
            | passwordStg | 1234Test | 
        When I filling in form login with the following details:
            | userID      | auto3a2f |
            | password    | 1234Test |
            | userIDstg   | stagcfb7 |
            | passwordStg | 1234Test |
        And I click login
        And I click later in pop up biometric
        And I will see card account 'active'
        And I choose other
        And I click menu change password
        And I will direct to page input old password
        And I close page input old password
        And I will see pop up cancel change password
        And I click button cancel change password
        Then I will direct to Tab Other

    @C141173
    Scenario: Close page in form input new password
        Given I am a registered customer with following details:
            | userID      | auto3a2f |
            | password    | 1234Test |
            | userIDstg   | stagcfb7 |
            | passwordStg | 1234Test | 
        When I filling in form login with the following details:
            | userID      | auto3a2f |
            | password    | 1234Test |
            | userIDstg   | stagcfb7 |
            | passwordStg | 1234Test |
        And I click login
        And I click later in pop up biometric
        And I will see card account 'active'
        And I choose other
        And I click menu change password
        And I input my old password
        And I click next to input new password
        And I will direct to page form input new password
        And I close page input new password
        And I will see pop up cancel change password
        And I click button cancel change password
        Then I will direct to Tab Other

    @C141174
    Scenario: Cancel close page in form input old password
        Given I am a registered customer with following details:
            | userID      | auto3a2f |
            | password    | 1234Test |
            | userIDstg   | stagcfb7 |
            | passwordStg | 1234Test | 
        When I filling in form login with the following details:
            | userID      | auto3a2f |
            | password    | 1234Test |
            | userIDstg   | stagcfb7 |
            | passwordStg | 1234Test |
        And I click login
        And I click later in pop up biometric
        And I will see card account 'active'
        And I choose other
        And I click menu change password
        And I will direct to page input old password
        And I close page input old password
        And I will see pop up cancel change password
        And I click button back to change password
        Then I will direct to page input old password

    @C141175
    Scenario: Cancel close page in form input new password
        Given I am a registered customer with following details:
            | userID      | auto3a2f |
            | password    | 1234Test |
            | userIDstg   | stagcfb7 |
            | passwordStg | 1234Test | 
        When I filling in form login with the following details:
            | userID      | auto3a2f |
            | password    | 1234Test |
            | userIDstg   | stagcfb7 |
            | passwordStg | 1234Test |
        And I click login
        And I click later in pop up biometric
        And I will see card account 'active'
        And I choose other
        And I click menu change password
        And I input my old password
        And I click next to input new password
        And I will direct to page form input new password
        And I close page input new password
        And I will see pop up cancel change password
        And I click button back to change password
        Then I will direct to page form input new password

    @C141176
    Scenario: Mask Old Password
        Given I am a registered customer with following details:
            | userID      | auto3a2f |
            | password    | 1234Test |
            | userIDstg   | stagcfb7 |
            | passwordStg | 1234Test | 
        When I filling in form login with the following details:
            | userID      | auto3a2f |
            | password    | 1234Test |
            | userIDstg   | stagcfb7 |
            | passwordStg | 1234Test |
        And I click login
        And I click later in pop up biometric
        And I will see card account 'active'
        And I choose other
        And I click menu change password
        And I input my old password
        And I unmask my old password
        And I mask my old password
        Then I will not see my password

    @C141177
    Scenario: Unmask Old Password
        Given I am a registered customer with following details:
            | userID      | auto3a2f |
            | password    | 1234Test |
            | userIDstg   | stagcfb7 |
            | passwordStg | 1234Test | 
        When I filling in form login with the following details:
            | userID      | auto3a2f |
            | password    | 1234Test |
            | userIDstg   | stagcfb7 |
            | passwordStg | 1234Test |
        And I click login
        And I click later in pop up biometric
        And I will see card account 'active'
        And I choose other
        And I click menu change password
        And I input my old password
        And I unmask my old password
        Then I will see my password

    @C141178
    Scenario: Input old password and then delete
        Given I am a registered customer with following details:
            | userID      | auto3a2f |
            | password    | 1234Test |
            | userIDstg   | stagcfb7 |
            | passwordStg | 1234Test | 
        When I filling in form login with the following details:
            | userID      | auto3a2f |
            | password    | 1234Test |
            | userIDstg   | stagcfb7 |
            | passwordStg | 1234Test |
        And I click login
        And I click later in pop up biometric
        And I will see card account 'active'
        And I choose other
        And I click menu change password
        And I input my old password
        And I clear my old password
        Then I will notify by message error 'Password wajib diisi' in field 'oldPassword'

    @C143085
    Scenario: Input old password with only whitespace
        Given I am a registered customer with following details:
            | userID      | auto3a2f |
            | password    | 1234Test |
            | userIDstg   | stagcfb7 |
            | passwordStg | 1234Test | 
        When I filling in form login with the following details:
            | userID      | auto3a2f |
            | password    | 1234Test |
            | userIDstg   | stagcfb7 |
            | passwordStg | 1234Test |
        And I click login
        And I click later in pop up biometric
        And I will see card account 'active'
        And I choose other
        And I click menu change password
        And I input my old password with whitespace
        Then I will notify by message error 'Password wajib diisi' in field 'oldPassword'    

    @C143081
    Scenario: Input old password with space in the front
        Given I am a registered customer with following details:
            | userID      | auto3a2f |
            | password    | 1234Test |
            | userIDstg   | stagcfb7 |
            | passwordStg | 1234Test | 
        When I filling in form login with the following details:
            | userID      | auto3a2f |
            | password    | 1234Test |
            | userIDstg   | stagcfb7 |
            | passwordStg | 1234Test |
        And I click login
        And I click later in pop up biometric
        And I will see card account 'active'
        And I choose other
        And I click menu change password
        And I input my old password with space in front
        And I unmask my old password
        Then I will see my password

    @C143082
    Scenario: Input old password with whitespace in the middle
        Given I am a registered customer with following details:
            | userID      | auto3a2f |
            | password    | 1234Test |
            | userIDstg   | stagcfb7 |
            | passwordStg | 1234Test | 
        When I filling in form login with the following details:
            | userID      | auto3a2f |
            | password    | 1234Test |
            | userIDstg   | stagcfb7 |
            | passwordStg | 1234Test |
        And I click login
        And I click later in pop up biometric
        And I will see card account 'active'
        And I choose other
        And I click menu change password
        And I input my old password with space in the middle
        And I unmask my old password
        Then I will not see my password
        And I will not see message error 'Password wajib diisi' in field 'oldPassword'

    @C143083
    Scenario: Input old password with whitespace in the back
        Given I am a registered customer with following details:
            | userID      | auto3a2f |
            | password    | 1234Test |
            | userIDstg   | stagcfb7 |
            | passwordStg | 1234Test | 
        When I filling in form login with the following details:
            | userID      | auto3a2f |
            | password    | 1234Test |
            | userIDstg   | stagcfb7 |
            | passwordStg | 1234Test |
        And I click login
        And I click later in pop up biometric
        And I will see card account 'active'
        And I choose other
        And I click menu change password
        And I input my old password with space in the back
        And I unmask my old password
        Then I will not see my password
        And I will not see message error 'Password wajib diisi' in field 'oldPassword'       

    @C141179
    Scenario: Submit password with field still empty
        Given I am a registered customer with following details:
            | userID      | auto3a2f |
            | password    | 1234Test |
            | userIDstg   | stagcfb7 |
            | passwordStg | 1234Test | 
        When I filling in form login with the following details:
            | userID      | auto3a2f |
            | password    | 1234Test |
            | userIDstg   | stagcfb7 |
            | passwordStg | 1234Test |
        And I click login
        And I click later in pop up biometric
        And I will see card account 'active'
        And I choose other
        And I click menu change password
        And I click next to input new password
        Then I will notify by message error 'Password wajib diisi' in field 'oldPassword'

    @C141180 
    Scenario: Input wrong old password once
        Given I am a registered customer with following details:
            | userID      | auto3a2f |
            | password    | 1234Test |
            | userIDstg   | stagcfb7 |
            | passwordStg | 1234Test |
        And never entered wrong password
        When I filling in form login with the following details:
            | userID      | auto3a2f |
            | password    | 1234Test |
            | userIDstg   | stagcfb7 |
            | passwordStg | 1234Test |
        And I click login
        And I click later in pop up biometric
        And I will see card account 'active'
        And I choose other
        And I click menu change password
        And I input incorrect old password
        And I click next to input new password
        Then I will see pop up data is incorrect
        And I can click try again to input password

    @C141181
    Scenario: Input wrong old password twice
        Given I am a registered customer with following details:
            | userID      | auto3a2f |
            | password    | 1234Test |
            | userIDstg   | stagcfb7 |
            | passwordStg | 1234Test |
        And never entered wrong password
        When I filling in form login with the following details:
            | userID      | auto3a2f |
            | password    | 1234Test |
            | userIDstg   | stagcfb7 |
            | passwordStg | 1234Test |
        And I click login
        And I click later in pop up biometric
        And I will see card account 'active'
        And I choose other
        And I click menu change password
        And I input incorrect old password
        And I click next to input new password
        And I will see pop up data is incorrect
        And I try again to input password
        And I click next to input new password
        Then I will see pop up data is incorrect
        And I can click try again to input password

    @C141182 
    Scenario: Input wrong old password three times
        Given I am a registered customer with following details:
            | userID      | auto3a2f |
            | password    | 1234Test |
            | userIDstg   | stagcfb7 |
            | passwordStg | 1234Test |
        And never entered wrong password
        When I filling in form login with the following details:
            | userID      | auto3a2f |
            | password    | 1234Test |
            | userIDstg   | stagcfb7 |
            | passwordStg | 1234Test |
        And I click login
        And I click later in pop up biometric
        And I will see card account 'active'
        And I choose other
        And I click menu change password
        And I input incorrect old password
        And I click next to input new password
        And I will see pop up data is incorrect
        And I try again to input password
        And I click next to input new password
        And I will see pop up data is incorrect
        And I try again to input password
        And I click next to input new password
        Then I will notify I will direct lo login page
        And I click button direct to login
        And I will directing to page login 

    @C141183
    Scenario: Input wrong old password first and then correct password
        Given I am a registered customer with following details:
            | userID      | auto3a2f |
            | password    | 1234Test |
            | userIDstg   | stagcfb7 |
            | passwordStg | 1234Test |
        And never entered wrong password
        When I filling in form login with the following details:
            | userID      | auto3a2f |
            | password    | 1234Test |
            | userIDstg   | stagcfb7 |
            | passwordStg | 1234Test |
        And I click login
        And I click later in pop up biometric
        And I will see card account 'active'
        And I choose other
        And I click menu change password
        And I input incorrect old password
        And I click next to input new password
        And I will see pop up data is incorrect
        And I can click try again to input password
        And I clear my old password
        And I input my old password
        And I click next to input new password
        Then I will direct to page form input new password

    @C141184 
    Scenario: Input new password < 8 digit
        Given I am a registered customer with following details:
            | userID      | auto3a2f |
            | password    | 1234Test |
            | userIDstg   | stagcfb7 |
            | passwordStg | 1234Test | 
        When I filling in form login with the following details:
            | userID      | auto3a2f |
            | password    | 1234Test |
            | userIDstg   | stagcfb7 |
            | passwordStg | 1234Test |
        And I click login
        And I click later in pop up biometric
        And I will see card account 'active'
        And I choose other
        And I click menu change password
        And I input my old password
        And I click next to input new password
        And I input field 'newPassword' with value '123Tes'
        Then I will notify by message error 'Min. 8 karakter dari huruf besar, kecil & angka' in field 'newPassword'

    @C141185 
    Scenario: Input new password only lowercase
        Given I am a registered customer with following details:
            | userID      | auto3a2f |
            | password    | 1234Test |
            | userIDstg   | stagcfb7 |
            | passwordStg | 1234Test | 
        When I filling in form login with the following details:
            | userID      | auto3a2f |
            | password    | 1234Test |
            | userIDstg   | stagcfb7 |
            | passwordStg | 1234Test |
        And I click login
        And I click later in pop up biometric
        And I will see card account 'active'
        And I choose other
        And I click menu change password
        And I input my old password
        And I click next to input new password
        And I input field 'newPassword' with value 'testingku'
        Then I will notify by message error 'Min. 8 karakter dari huruf besar, kecil & angka' in field 'newPassword'

    @C141186 
    Scenario: Input new password only uppercase
        Given I am a registered customer with following details:
            | userID      | auto3a2f |
            | password    | 1234Test |
            | userIDstg   | stagcfb7 |
            | passwordStg | 1234Test | 
        When I filling in form login with the following details:
            | userID      | auto3a2f |
            | password    | 1234Test |
            | userIDstg   | stagcfb7 |
            | passwordStg | 1234Test |
        And I click login
        And I click later in pop up biometric
        And I will see card account 'active'
        And I choose other
        And I click menu change password
        And I input my old password
        And I click next to input new password
        And I input field 'newPassword' with value 'TESTINGKU'
        Then I will notify by message error 'Min. 8 karakter dari huruf besar, kecil & angka' in field 'newPassword'

    @C141187 
    Scenario: Input new password only number
        Given I am a registered customer with following details:
            | userID      | auto3a2f |
            | password    | 1234Test |
            | userIDstg   | stagcfb7 |
            | passwordStg | 1234Test | 
        When I filling in form login with the following details:
            | userID      | auto3a2f |
            | password    | 1234Test |
            | userIDstg   | stagcfb7 |
            | passwordStg | 1234Test |
        And I click login
        And I click later in pop up biometric
        And I will see card account 'active'
        And I choose other
        And I click menu change password
        And I input my old password
        And I click next to input new password
        And I input field 'newPassword' with value '12309876'
        Then I will notify by message error 'Min. 8 karakter dari huruf besar, kecil & angka' in field 'newPassword'

    @C141188 
    Scenario: Input new password combination lowercase and number only
        Given I am a registered customer with following details:
            | userID      | auto3a2f |
            | password    | 1234Test |
            | userIDstg   | stagcfb7 |
            | passwordStg | 1234Test | 
        When I filling in form login with the following details:
            | userID      | auto3a2f |
            | password    | 1234Test |
            | userIDstg   | stagcfb7 |
            | passwordStg | 1234Test |
        And I click login
        And I click later in pop up biometric
        And I will see card account 'active'
        And I choose other
        And I click menu change password
        And I input my old password
        And I click next to input new password
        And I input field 'newPassword' with value 'test1234'
        Then I will notify by message error 'Min. 8 karakter dari huruf besar, kecil & angka' in field 'newPassword'

    @C141189 
    Scenario: Input new password combination uppercase and number only
        Given I am a registered customer with following details:
            | userID      | auto3a2f |
            | password    | 1234Test |
            | userIDstg   | stagcfb7 |
            | passwordStg | 1234Test | 
        When I filling in form login with the following details:
            | userID      | auto3a2f |
            | password    | 1234Test |
            | userIDstg   | stagcfb7 |
            | passwordStg | 1234Test |
        And I click login
        And I click later in pop up biometric
        And I will see card account 'active'
        And I choose other
        And I click menu change password
        And I input my old password
        And I click next to input new password
        And I input field 'newPassword' with value 'TEST1234'
        Then I will notify by message error 'Min. 8 karakter dari huruf besar, kecil & angka' in field 'newPassword'

    @C141190 
    Scenario: Input new password combination lowercase and uppercase only
        Given I am a registered customer with following details:
            | userID      | auto3a2f |
            | password    | 1234Test |
            | userIDstg   | stagcfb7 |
            | passwordStg | 1234Test | 
        When I filling in form login with the following details:
            | userID      | auto3a2f |
            | password    | 1234Test |
            | userIDstg   | stagcfb7 |
            | passwordStg | 1234Test |
        And I click login
        And I click later in pop up biometric
        And I will see card account 'active'
        And I choose other
        And I click menu change password
        And I input my old password
        And I click next to input new password
        And I input field 'newPassword' with value 'TestingKu'
        Then I will notify by message error 'Min. 8 karakter dari huruf besar, kecil & angka' in field 'newPassword'

    @C141191
    Scenario: Input new password and then delete
        Given I am a registered customer with following details:
            | userID      | auto3a2f |
            | password    | 1234Test |
            | userIDstg   | stagcfb7 |
            | passwordStg | 1234Test | 
        When I filling in form login with the following details:
            | userID      | auto3a2f |
            | password    | 1234Test |
            | userIDstg   | stagcfb7 |
            | passwordStg | 1234Test |
        And I click login
        And I click later in pop up biometric
        And I will see card account 'active'
        And I choose other
        And I click menu change password
        And I input my old password
        And I click next to input new password
        And I input field 'newPassword' with value '1234Test'
        And I clear my new password
        Then I will notify by message error 'Password baru wajib diisi' in field 'newPassword'

    @C141192
    Scenario: Input confirm password and then delete
        Given I am a registered customer with following details:
            | userID      | auto3a2f |
            | password    | 1234Test |
            | userIDstg   | stagcfb7 |
            | passwordStg | 1234Test | 
        When I filling in form login with the following details:
            | userID      | auto3a2f |
            | password    | 1234Test |
            | userIDstg   | stagcfb7 |
            | passwordStg | 1234Test |
        And I click login
        And I click later in pop up biometric
        And I will see card account 'active'
        And I choose other
        And I click menu change password
        And I input my old password
        And I click next to input new password
        And I input field 'newPassword' with value '1234Test'
        And I input field 'confirmPassword' with value '1234Test'
        And I clear confirm password
        Then I will notify by message error 'Konfirmasi password baru wajib diisi' in field 'confirmPassword'
        And I will not see message error 'Password baru wajib diisi' in field 'newPassword'

    @C141193
    Scenario: Mask New Password
        Given I am a registered customer with following details:
            | userID      | auto3a2f |
            | password    | 1234Test |
            | userIDstg   | stagcfb7 |
            | passwordStg | 1234Test | 
        When I filling in form login with the following details:
            | userID      | auto3a2f |
            | password    | 1234Test |
            | userIDstg   | stagcfb7 |
            | passwordStg | 1234Test |
        And I click login
        And I click later in pop up biometric
        And I will see card account 'active'
        And I choose other
        And I click menu change password
        And I input my old password
        And I click next to input new password
        And I input field 'newPassword' with value '1234Test'
        And I unmask my new password
        And I mask my new password
        Then I will not see my new password

    @C141194
    Scenario: Unmask New Password
        Given I am a registered customer with following details:
            | userID      | auto3a2f |
            | password    | 1234Test |
            | userIDstg   | stagcfb7 |
            | passwordStg | 1234Test | 
        When I filling in form login with the following details:
            | userID      | auto3a2f |
            | password    | 1234Test |
            | userIDstg   | stagcfb7 |
            | passwordStg | 1234Test |
        And I click login
        And I click later in pop up biometric
        And I will see card account 'active'
        And I choose other
        And I click menu change password
        And I input my old password
        And I click next to input new password
        And I input field 'newPassword' with value '1234Test'
        And I unmask my new password
        Then I will see my new password

    @C141195
    Scenario: Mask Confirm Password
        Given I am a registered customer with following details:
            | userID      | auto3a2f |
            | password    | 1234Test |
            | userIDstg   | stagcfb7 |
            | passwordStg | 1234Test | 
        When I filling in form login with the following details:
            | userID      | auto3a2f |
            | password    | 1234Test |
            | userIDstg   | stagcfb7 |
            | passwordStg | 1234Test |
        And I click login
        And I click later in pop up biometric
        And I will see card account 'active'
        And I choose other
        And I click menu change password
        And I input my old password
        And I click next to input new password
        And I input field 'confirmPassword' with value '1234Test'
        And I unmask confirmation password
        And I mask confirmation password
        Then I will not see my confirmation password

    @C141196
    Scenario: Unmask Confirm Password
        Given I am a registered customer with following details:
            | userID      | auto3a2f |
            | password    | 1234Test |
            | userIDstg   | stagcfb7 |
            | passwordStg | 1234Test | 
        When I filling in form login with the following details:
            | userID      | auto3a2f |
            | password    | 1234Test |
            | userIDstg   | stagcfb7 |
            | passwordStg | 1234Test |
        And I click login
        And I click later in pop up biometric
        And I will see card account 'active'
        And I choose other
        And I click menu change password
        And I input my old password
        And I click next to input new password
        And I input field 'confirmPassword' with value '1234Test'
        And I unmask confirmation password
        Then I will see my confirmation password

    @C141197 
    Scenario: Input confirm password different with new password
        Given I am a registered customer with following details:
            | userID      | auto3a2f |
            | password    | 1234Test |
            | userIDstg   | stagcfb7 |
            | passwordStg | 1234Test | 
        When I filling in form login with the following details:
            | userID      | auto3a2f |
            | password    | 1234Test |
            | userIDstg   | stagcfb7 |
            | passwordStg | 1234Test |
        And I click login
        And I click later in pop up biometric
        And I will see card account 'active'
        And I choose other
        And I click menu change password
        And I input my old password
        And I click next to input new password
        And I input field 'newPassword' with value '1234Test'
        And I input field 'confirmPassword' with value 'Test1234'
        And I confirm my new password
        Then I will notify by message error 'Password yang dimasukkan tidak sesuai' in field 'newPassword'
        And I will notify by message error 'Password yang dimasukkan tidak sesuai' in field 'confirmPassword'

    @C141198
    Scenario: Submit form change password with fields still empty
        Given I am a registered customer with following details:
            | userID      | auto3a2f |
            | password    | 1234Test |
            | userIDstg   | stagcfb7 |
            | passwordStg | 1234Test | 
        When I filling in form login with the following details:
            | userID      | auto3a2f |
            | password    | 1234Test |
            | userIDstg   | stagcfb7 |
            | passwordStg | 1234Test |
        And I click login
        And I click later in pop up biometric
        And I will see card account 'active'
        And I choose other
        And I click menu change password
        And I input my old password
        And I click next to input new password
        And I confirm my new password
        Then I will notify by message error 'Password baru wajib diisi' in field 'newPassword'
        And I will notify by message error 'Konfirmasi password baru wajib diisi' in field 'confirmPassword'

    @C141199 
    Scenario: Check attempt request OTP
        Given I am a registered customer with following details:
            | userID      | auto3a2f |
            | password    | 1234Test |
            | userIDstg   | stagcfb7 |
            | passwordStg | 1234Test | 
        And I reset attempt otp after login    
        When I filling in form login with the following details:
            | userID      | auto3a2f |
            | password    | 1234Test |
            | userIDstg   | stagcfb7 |
            | passwordStg | 1234Test |
        And I click login
        And I click later in pop up biometric
        And I will see card account 'active'
        And I choose other
        And I click menu change password
        And I input my old password
        And I click next to input new password
        And I input field 'newPassword' with value '1234Test'
        And I input field 'confirmPassword' with value '1234Test'
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
        Then I will see message error OTP with information can be tried tomorrow

    @C141200 
    Scenario: Input wrong OTP
        Given I am a registered customer with following details:
            | userID      | auto3a2f |
            | password    | 1234Test |
            | userIDstg   | stagcfb7 |
            | passwordStg | 1234Test | 
        And I reset attempt otp after login
        When I filling in form login with the following details:
            | userID      | auto3a2f |
            | password    | 1234Test |
            | userIDstg   | stagcfb7 |
            | passwordStg | 1234Test |
        And I click login
        And I click later in pop up biometric
        And I will see card account 'active'
        And I choose other
        And I click menu change password
        And I input my old password
        And I click next to input new password
        And I input field 'newPassword' with value '1234Test'
        And I input field 'confirmPassword' with value '1234Test'
        And I confirm my new password
        And I will see snackbar OTP successfully sent
        And I input wrong OTP code
        Then I will notify by message error 'Kode OTP yang dimasukkan salah' in field 'otp'

    @C141314 
    Scenario: Input wrong OTP five times
        Given I am a registered customer with following details:
            | userID      | auto3a2f |
            | password    | 1234Test |
            | userIDstg   | stagcfb7 |
            | passwordStg | 1234Test |
        And I reset attempt otp after login 
        When I filling in form login with the following details:
            | userID      | auto3a2f |
            | password    | 1234Test |
            | userIDstg   | stagcfb7 |
            | passwordStg | 1234Test |
        And I click login
        And I click later in pop up biometric
        And I will see card account 'active'
        And I choose other
        And I click menu change password
        And I input my old password
        And I click next to input new password
        And I input field 'newPassword' with value '1234Test'
        And I input field 'confirmPassword' with value '1234Test'
        And I confirm my new password
        And I will see snackbar OTP successfully sent
        And I input wrong OTP code
        And I will notify by message error 'Kode OTP yang dimasukkan salah' in field 'otp'
        And I input wrong OTP code
        And I will notify by message error 'Kode OTP yang dimasukkan salah' in field 'otp'
        And I input wrong OTP code
        And I will notify by message error 'Kode OTP yang dimasukkan salah' in field 'otp'
        And I input wrong OTP code
        And I will notify by message error 'Kode OTP yang dimasukkan salah' in field 'otp'
        And I input wrong OTP code
        Then I notified that I can verify the OTP tomorrow

    @C141201
    Scenario: Input expired OTP
        Given I am a registered customer with following details:
            | userID      | auto3a2f |
            | password    | 1234Test |
            | userIDstg   | stagcfb7 |
            | passwordStg | 1234Test | 
        And I reset attempt otp after login    
        When I filling in form login with the following details:
            | userID      | auto3a2f |
            | password    | 1234Test |
            | userIDstg   | stagcfb7 |
            | passwordStg | 1234Test |
        And I click login
        And I click later in pop up biometric
        And I will see card account 'active'
        And I choose other
        And I click menu change password
        And I input my old password
        And I click next to input new password
        And I input field 'newPassword' with value '1234Test'
        And I input field 'confirmPassword' with value '1234Test'
        And I confirm my new password
        And I will see snackbar OTP successfully sent
        And I wait for 1 minutes
        And I input OTP change password
        Then I will notify by message error 'Kode OTP yang dimasukkan sudah kadaluarsa' in field 'otp'

    @C141202
    Scenario: Input wrong OTP then correct OTP
        Given I am a registered customer with following details:
            | userID      | auto3a2f |
            | password    | 1234Test |
            | userIDstg   | stagcfb7 |
            | passwordStg | 1234Test | 
        When I filling in form login with the following details:
            | userID      | auto3a2f |
            | password    | 1234Test |
            | userIDstg   | stagcfb7 |
            | passwordStg | 1234Test |
        And I click login
        And I click later in pop up biometric
        And I will see card account 'active'
        And I choose other
        And I click menu change password
        And I input my old password
        And I click next to input new password
        And I input field 'newPassword' with value '1234Test'
        And I input field 'confirmPassword' with value '1234Test'
        And I confirm my new password
        And I will see snackbar OTP successfully sent
        And I input wrong OTP code
        And I will notify by message error 'Kode OTP yang dimasukkan salah' in field 'otp' 
        And I input OTP change password
        Then I will direct to page success change password

    @C141203 
    Scenario: Change password till success login with account active initiator
        Given I am a registered customer with following details:
            | userID      | deveb4ef |
            | password    | 1234Test |
            | userIDstg   | ruth2d88 |
            | passwordStg | 1234Test | 
        When I filling in form login with the following details:
            | userID      | deveb4ef |
            | password    | 1234Test |
            | userIDstg   | ruth2d88 |
            | passwordStg | 1234Test |
        And I click login
        And I click later in pop up biometric
        And I will see card account 'active'
        And I choose other
        And I click menu change password
        And I input my old password
        And I click next to input new password
        And I input field 'newPassword' with value 'Test1234'
        And I input field 'confirmPassword' with value 'Test1234'
        And I confirm my new password
        And I will see snackbar OTP successfully sent
        And I input OTP change password
        And I will direct to page success change password
        And I click button direct to page login
        And I login again with my new password
        Then I will see card account 'active'
        And I reset back my password

    @C141204
    Scenario: Change password till success login with account active invitee
        Given I am a registered customer with following details:
            | userID      | nataf76e |
            | password    | 1234Test |
            | userIDstg   | nata6bde |
            | passwordStg | 1234Test | 
        When I filling in form login with the following details:
            | userID      | nataf76e |
            | password    | 1234Test |
            | userIDstg   | nata6bde |
            | passwordStg | 1234Test |
        And I click login
        And I click later in pop up biometric
        And I will see card account 'active'
        And I choose other
        And I click menu change password
        And I input my old password
        And I click next to input new password
        And I input field 'newPassword' with value 'Test1234'
        And I input field 'confirmPassword' with value 'Test1234'
        And I confirm my new password
        And I will see snackbar OTP successfully sent
        And I input OTP change password
        And I will direct to page success change password
        And I click button direct to page login
        And I login again with my new password
        Then I will see card account 'active'
        And I reset back my password

    @C141205
    Scenario: Change password till success login with account verification initiator
        Given I am a registered customer with following details:
            | userID      | revv8f08 |
            | password    | 1234Test |
            | userIDstg   | revv2257 |
            | passwordStg | 1234Test | 
        When I filling in form login with the following details:
            | userID      | revv8f08 |
            | password    | 1234Test |
            | userIDstg   | revv2257 |
            | passwordStg | 1234Test |
        And I click login
        And I click later in pop up biometric
        And I will see card account 'on verification'
        And I choose other
        And I click menu change password
        And I input my old password
        And I click next to input new password
        And I input field 'newPassword' with value 'Test1234'
        And I input field 'confirmPassword' with value 'Test1234'
        And I confirm my new password
        And I will see snackbar OTP successfully sent
        And I input OTP change password
        And I will direct to page success change password
        And I click button direct to page login
        And I login again with my new password
        Then I will see card account 'on verification'
        And I reset back my password

    @C141206
    Scenario: Change password till success login with account verification invitee
        Given I am a registered customer with following details:
            | userID      | rudi71d5 |
            | password    | 1234Test |
            | userIDstg   | rudie4f1 |
            | passwordStg | 1234Test | 
        When I filling in form login with the following details:
            | userID      | rudi71d5 |
            | password    | 1234Test |
            | userIDstg   | rudie4f1 |
            | passwordStg | 1234Test |
        And I click login
        And I click later in pop up biometric
        And I will see card account 'on verification'
        And I choose other
        And I click menu change password
        And I input my old password
        And I click next to input new password
        And I input field 'newPassword' with value 'Test1234'
        And I input field 'confirmPassword' with value 'Test1234'
        And I confirm my new password
        And I will see snackbar OTP successfully sent
        And I input OTP change password
        And I will direct to page success change password
        And I click button direct to page login
        And I login again with my new password
        Then I will see card account 'on verification'
        And I reset back my password

    @C141207
    Scenario: Change password till success login with account initiator on process 
        Given I am a registered customer with following details:
            | userID      | deve82e5 |
            | password    | 1234Test |
            | userIDstg   | stag48e9 |
            | passwordStg | 1234Test | 
        When I filling in form login with the following details:
            | userID      | deve82e5 |
            | password    | 1234Test |
            | userIDstg   | stag48e9 |
            | passwordStg | 1234Test |
        And I click login
        And I click later in pop up biometric
        And I will see card account 'on process'
        And I choose other
        And I click menu change password
        And I input my old password
        And I click next to input new password
        And I input field 'newPassword' with value 'Test1234'
        And I input field 'confirmPassword' with value 'Test1234'
        And I confirm my new password
        And I will see snackbar OTP successfully sent
        And I input OTP change password
        And I will direct to page success change password
        And I click button direct to page login
        And I login again with my new password
        Then I will see card account 'on process'
        And I reset back my password                

    @C141208
    Scenario: Login again after change password with old password
        Given I am a registered customer with following details:
            | userID      | autod015 |
            | password    | 1234Test |
            | userIDstg   | ruthfdcb |
            | passwordStg | 1234Test | 
        When I filling in form login with the following details:
            | userID      | autod015 |
            | password    | 1234Test |
            | userIDstg   | ruthfdcb |
            | passwordStg | 1234Test |
        And I click login
        And I click later in pop up biometric
        And I will see card account 'active'
        And I choose other
        And I click menu change password
        And I input my old password
        And I click next to input new password
        And I input field 'newPassword' with value 'Test1234'
        And I input field 'confirmPassword' with value 'Test1234'
        And I confirm my new password
        And I will see snackbar OTP successfully sent
        And I input OTP change password
        And I will direct to page success change password
        And I click button direct to page login
        And I login again with my new password
        And I will see card account 'active'
        And I choose other
        And I click menu change password
        And I input my old password
        And I click next to input new password
        And I input field 'newPassword' with value '1234Test'
        And I input field 'confirmPassword' with value '1234Test'
        And I confirm my new password
        And I will see snackbar OTP successfully sent
        And I input OTP change password
        And I will direct to page success change password
        And I click button direct to page login
        And I login again with my new password
        And I will see card account 'active' 

    @C141209
    Scenario: Change password with current password
        Given I am a registered customer with following details:
            | userID      | autod015 |
            | password    | 1234Test |
            | userIDstg   | ruthfdcb |
            | passwordStg | 1234Test | 
        When I filling in form login with the following details:
            | userID      | autod015 |
            | password    | 1234Test |
            | userIDstg   | ruthfdcb |
            | passwordStg | 1234Test |
        And I click login
        And I click later in pop up biometric
        And I will see card account 'active'
        And I choose other
        And I click menu change password
        And I input my old password
        And I click next to input new password
        And I input field 'newPassword' with value '1234Test'
        And I input field 'confirmPassword' with value '1234Test'
        And I confirm my new password
        And I will see snackbar OTP successfully sent
        And I input OTP change password
        And I will direct to page success change password
        And I click button direct to page login
        And I login again with my new password
        And I will see card account 'active'

    @C141210
    Scenario: Checking attempt failed login after attempt failed input old password twice
        Given I am a registered customer with following details:
            | userID      | autod015 |
            | password    | 1234Test |
            | userIDstg   | ruthfdcb |
            | passwordStg | 1234Test | 
        And never entered wrong password
        When I filling in form login with the following details:
            | userID      | autod015 |
            | password    | 1234Test |
            | userIDstg   | ruthfdcb |
            | passwordStg | 1234Test |
        And I click login
        And I click later in pop up biometric
        And I will see card account 'active'
        And I choose other
        And I click menu change password
        And I input incorrect old password
        And I click next to input new password
        And I will see pop up data is incorrect
        And I try again to input password
        And I click next to input new password
        And I will see pop up data is incorrect
        And I try again to input password
        And I close page input old password
        And I will see pop up cancel change password
        And I click button cancel change password
        And I click logout
        And I fill form login with incorrect password
        And I click login
        Then I should see pop up with information three times input incorrect data and can be tried in the next 10 minutes

    @C141211
    Scenario: Checking attempt failed input old password after attempt failed login twice
        Given I am a registered customer with following details:
            | userID      | autod015 |
            | password    | 1234Test |
            | userIDstg   | ruthfdcb |
            | passwordStg | 1234Test |
        And never entered wrong password
        When I filling in form login with the following details:
            | userID      | autod015 |
            | password    | Test1234 |
            | userIDstg   | ruthfdcb |
            | passwordStg | Test1234 |
        And I click login
        And I should see log in pop up 'Jika 3 kali salah, Anda harus menunggu untuk mencoba kembali Masuk Akun' with button 'tryAgain'
        And I click try again to login
        And I click login
        And I should see log in pop up 'Jika 3 kali salah, Anda harus menunggu untuk mencoba kembali Masuk Akun' with button 'tryAgain'
        And I click try again to login
        And I filling in form login with the following details:
            | userID      | autod015 |
            | password    | 1234Test |
            | userIDstg   | ruthfdcb |
            | passwordStg | 1234Test |
        And I click login
        And I click later in pop up biometric
        And I will see card account 'active'
        And I choose other
        And I click menu change password
        And I input incorrect old password
        And I click next to input new password
        And I will see pop up data is incorrect
        And I try again to input password
        And I reset attempt failed login  
        
    @C141315
    Scenario: Login with old password after change password
        Given I am a registered customer with following details:
            | userID      | autod015 |
            | password    | 1234Test |
            | userIDstg   | ruthfdcb |
            | passwordStg | 1234Test | 
        When I filling in form login with the following details:
            | userID      | autod015 |
            | password    | 1234Test |
            | userIDstg   | ruthfdcb |
            | passwordStg | 1234Test |
        And I click login
        And I click later in pop up biometric
        And I choose other
        And I click menu change password
        And I input my old password
        And I click next to input new password
        And I input field 'newPassword' with value 'Test1234'
        And I input field 'confirmPassword' with value 'Test1234'
        And I confirm my new password
        And I will see snackbar OTP successfully sent
        And I input OTP change password
        And I will direct to page success change password
        And I click button direct to page login
        And I login again with my old password
        And I click login
        Then I should see log in pop up 'Jika 3 kali salah, Anda harus menunggu untuk mencoba kembali Masuk Akun' with button 'tryAgain'
        And I click try again to login
        And I reset attempt failed login
        And I login again with my new password
        And I click login
        And I reset back my password