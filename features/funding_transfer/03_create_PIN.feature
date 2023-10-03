Feature: User create PIN
    In order to transfer
    As a customer
    I want to be able to create transaction pin

    Background: User has registered and login to dashboard
        Given I am a registered customer with following details:
            | userID   | ruth17a5 |
            | password | Test1234 |
        When I filling in form login with the following details:
            | userID   | ruth17a5 |
            | password | Test1234 |
        And I click login
        Then I will direct to dashboard

    Scenario: User wants to Transfer but doesn't have PIN
        Given I am a customer who wants to create a PIN
        And I don't have a PIN
        When I choose menu Transfer from main dashboard
        Then I will directly to Create New PIN page

    Scenario: User input incorrect password once
        Given I am a customer who wants to create a PIN
        When I choose menu Transfer from main dashboard
        And I Input incorrect password
        And I click Next
        Then I should see pop up message "Data yang dimasukkan salah. Jika 3 kali salah akun Anda akan terblokir"
        And I click try again

    Scenario: User input incorrect password twice
        Given I am a customer who wants to create a PIN
        When I choose menu Transfer from main dashboard
        And I click Next
        Then I should see pop up message "Data yang dimasukkan salah. Jika 3 kali salah akun Anda akan terblokir"
        And I click try again

    Scenario: User input incorrect password three times
        Given I am a customer who wants to create a PIN
        When I choose menu Transfer from main dashboard
        And I click Next
        Then I should see pop up message "Akun Anda terblokir. Silahkan coba masukkan kembali setelah 30 menit"

    Scenario: User want to see their password
        Given I am a customer who wants to create a PIN
        When I choose menu Transfer from main dashboard
        And I input password
        And I click icon eye
        Then I will see my password

    Scenario: User don't want to see their password
        Given I am a customer who wants to create a PIN
        When I choose menu Transfer from main dashboard
        And I input password
        And I click icon eye twice
        Then I will not see my password

    Scenario: User input incorrect confirmation PIN
        Given I am a customer who wants to create PIN
        When I choose menu Transfer from main dashboard
        And I input password
        And I click next
        And I input new PIN
        And I input incorrect confirmation new PIN
        Then I will see message "PIN yang dimasukkan tidak sesuai"

    Scenario: User input incorrect OTP
        Given I am a customer who wants to create PIN
        When I choose menu Transfer from main dashboard
        And I input password
        And I click next
        And I input new PIN
        And I input confirmation new PIN
        And I input incorrect OTP
        And I will see message "Kode OTP yang Anda masukkan salah"

    Scenario: User Successfully Create New PIN
        Given I am a customer who wants to create a PIN
        When I choose menu Transfer from main dashboard
        And I input password
        And I click next
        And I input new pin
        And I input confirmation new pin
        And I input OTP
        Then I will see message "Selamat, PIN berhasil dibuat"
        And I will directly go to Friend list page
