@forgotPassword
Feature: Account Forgot Password
    In order to going to SMB dashboard while forgot user password
    As a customer
    I want to reset password

    # @C133804
    # Scenario: Reset password with user ID is empty
    #     Given I am a customer want to reset password
    #     When I leave field User ID empty
    #     And I input email for reset password with value 'ruth.hutauruk@amarbank.co.id'
    #     And I click button Reset Password
    #     Then I should be notified 'User ID wajib diisi' in the below of field 'userID'

    # Scenario Outline: Verifying email for reset password with invalid value
    #     Given I am a customer want to reset password
    #     When I input email for reset password with value '<Value>'
    #     Then I should be notified '<Message>' in the below of field 'email' forgot password
    #     Examples:                                                                 ❸
    #         | testRailTag | Value                  | Message                    |
    #         | @C133805    | ruth.natasyagmail.com  | E-mail tidak sesuai format |
    #         | @C133806    | ruth natasya@gmail.com | E-mail tidak sesuai format |
    #         | @C133807    |                        | E-mail wajib diisi         |

    # @C133808
    # Scenario: Fill form reset password with user id and email is not match
    #     Given I am a registered customer with following details:
    #         | userID      | autocaea |
    #         | password    | 1234Test |
    #         | userIDstg   | stag76ee |
    #         | passwordStg | Test1234 |
    #     And I am a customer want to reset password
    #     When I am filling field User ID
    #     And I input wrong email for reset password
    #     And I click button Reset Password
    #     Then I will see pop up information reset password with text 'Jika 3 kali salah, Anda akan langsung diarahkan ke halaman Masuk Akun'
    #     And I click try again to reset password
    #     And I reset attempt failed login

    # @C133809
    # Scenario: Fill form reset password with user id and email is not match 3 times
    #     Given I am a registered customer with following details:
    #         | userID      | autocaea |
    #         | password    | 1234Test |
    #         | userIDstg   | stag76ee |
    #         | passwordStg | Test1234 |
    #     And I am a customer want to reset password
    #     When I am filling field User ID
    #     And I input wrong email for reset password
    #     And I click button Reset Password
    #     And I will see pop up information reset password with text 'Jika 3 kali salah, Anda akan langsung diarahkan ke halaman Masuk Akun'
    #     And I click try again to reset password
    #     And I click button Reset Password
    #     And I will see pop up information reset password with text 'Jika 3 kali salah, Anda akan langsung diarahkan ke halaman Masuk Akun'
    #     And I click try again to reset password
    #     And I click button Reset Password
    #     Then I will see pop up information reset password with text 'Anda akan langsung diarahkan ke halaman Masuk Akun'
    #     And I click button understand to direct to page login
    #     And I will directing to page login
    #     And I reset attempt failed login

    # @C133810
    # Scenario: Fill form reset password with user id and email is match after fill form with user id and email is not match 3 times
    #     Given I am a registered customer with following details:
    #         | userID      | autocaea |
    #         | password    | 1234Test |
    #         | userIDstg   | stag76ee |
    #         | passwordStg | Test1234 |
    #     And I am a customer want to reset password
    #     When I am filling field User ID
    #     And I input wrong email for reset password
    #     And I click button Reset Password
    #     And I will see pop up information reset password with text 'Jika 3 kali salah, Anda akan langsung diarahkan ke halaman Masuk Akun'
    #     And I click try again to reset password
    #     And I click button Reset Password
    #     And I will see pop up information reset password with text 'Jika 3 kali salah, Anda akan langsung diarahkan ke halaman Masuk Akun'
    #     And I click try again to reset password
    #     And I click button Reset Password
    #     And I will see pop up information reset password with text 'Anda akan langsung diarahkan ke halaman Masuk Akun'
    #     And I click button understand to direct to page login
    #     And I click link forgot password
    #     When I am filling field User ID
    #     And I input email for reset password
    #     And I click button Reset Password
    #     Then I will see information about the reset password can be done in the next 10 minutes

    # @C133811
    # Scenario: Reset password with user ID has been registered
    #     Given I am a registered customer with following details:
    #         | userID      | ruthf200 |
    #         | password    | 1234Test |
    #         | userIDstg   | stag76ee |
    #         | passwordStg | Test1234 |
    #     And I am a customer want to reset password
    #     When I am filling field User ID
    #     And I input email for reset password
    #     And I click button Reset Password
    #     Then I should be notified that email Reset Password successfully sent

    @C133812
    Scenario: Resend email reset password
        Given I am a customer with User ID and email has already requested a password reset
            | userID      | ruth5010 |
            | password    | 1234Test |
            | userIDstg   | stag76ee |
            | passwordStg | Test1234 |
        And who has not received the reset password email
        When I resend email reset password
        Then I should be notified that email reset password has been successfully sent

    # @C133813
    # Scenario: Reset password with user ID from invitation business
    #     Given I am a registered customer with following details:
    #         | userID      | autoeb6a |
    #         | password    | 1234Test |
    #         | userIDstg   | nata6bde |
    #         | passwordStg | 1234Test |
    #     And I am a customer want to reset password
    #     When I am filling field User ID
    #     And I input email for reset password
    #     And I click button Reset Password
    #     And I click button confirmation reset password
    #     Then I should be notified that email Reset Password successfully sent

    # @C133814
    # Scenario: Back to page reset password from pop up confirmation
    #     Given I am a registered customer with following details:
    #         | userID      | autoeb6a |
    #         | password    | 1234Test |
    #         | userIDstg   | ruth2d88 |
    #         | passwordStg | 1234Test |
    #     And I am a customer want to reset password
    #     When I am filling field User ID
    #     And I input email for reset password
    #     And I click button Reset Password
    #     And I click button back from pop up reset password
    #     Then I should back to page reset password with field User ID still filled

    # @C133815
    # Scenario: Back to page login from page reset password
    #     Given I am a customer want to reset password
    #     When I click button back in the header page
    #     Then I will directing to page login
