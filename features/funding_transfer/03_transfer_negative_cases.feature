@transfer_negative_cases
Feature: User Want to Transfer with Negative Cases
    In home
    As a customer
    I need to transfer with negative cases

    @C133900
    Scenario: User transfer input notes with emoji
        Given I am a registered customer with following details:
            | userID      | natace13 |
            | password    | 1234Test |
            | userIDstg   | ruth1600 |
            | passwordStg | 1234Test |
        And I filling in form login with the following details:
            | userID      | natace13 |
            | password    | 1234Test |
            | userIDstg   | ruth1600 |
            | passwordStg | 1234Test |
        And I click login
        And I click later in pop up biometric
        And I will direct to dashboard
        When I choose menu Transfer from main dashboard
        And I am on receiver list page
        And I input name 'Surya Edwin' from the search box
        And I choose the friendlist
        And I input amount '900000'
        And I choose category "Pembayaran"
        And I input notes with 'Pembayaran Okt 😆'
        Then I should see error message "Catatan tidak menggunakan emoji & symbol" in field "notes"

    @C133901
    Scenario: User transfer input notes with symbol
        Given I am a registered customer with following details:
            | userID      | natace13 |
            | password    | 1234Test |
            | userIDstg   | ruth1600 |
            | passwordStg | 1234Test |
        And I filling in form login with the following details:
            | userID      | natace13 |
            | password    | 1234Test |
            | userIDstg   | ruth1600 |
            | passwordStg | 1234Test |
        And I click login
        And I click later in pop up biometric
        And I will direct to dashboard
        When I choose menu Transfer from main dashboard
        And I am on receiver list page
        And I input name 'Surya Edwin' from the search box
        And I choose the friendlist
        And I input amount '900000'
        And I choose category "Pembayaran"
        And I input notes with 'Pembayaran #Oktober!@#'
        Then I should see error message "Catatan tidak menggunakan emoji & symbol" in field "notes"

    @C133902
    Scenario: User Transfer with under minimum transfer amount
        Given I am a registered customer with following details:
            | userID      | natace13 |
            | password    | 1234Test |
            | userIDstg   | ruth1600 |
            | passwordStg | 1234Test |
        And I filling in form login with the following details:
            | userID      | natace13 |
            | password    | 1234Test |
            | userIDstg   | ruth1600 |
            | passwordStg | 1234Test |
        And I click login
        And I click later in pop up biometric
        And I will direct to dashboard
        When I choose menu Transfer from main dashboard
        And I am on receiver list page
        And I input name 'Surya Edwin' from the search box
        And I choose the friendlist
        And I input amount '9000'
        Then I should see error message "Minimal transfer Rp 10.000" in field "amount"

    @C133903
    Scenario: User Transfer with saldo aktif tidak mencukupi
        Given I am a registered customer with following details:
            | userID      | natace13 |
            | password    | 1234Test |
            | userIDstg   | ruth1600 |
            | passwordStg | 1234Test |
        And I filling in form login with the following details:
            | userID      | natace13 |
            | password    | 1234Test |
            | userIDstg   | ruth1600 |
            | passwordStg | 1234Test |
        And I click login
        And I click later in pop up biometric
        And I will direct to dashboard
        When I choose menu Transfer from main dashboard
        And I am on receiver list page
        And I input name 'Surya Edwin' from the search box
        And I choose the friendlist
        And I input amount more than active amount
        Then I should see error message "Saldo aktif tidak mencukupi" in field "amount"

    @C133904
    Scenario: User Transfer with category not selected
        Given I am a registered customer with following details:
            | userID      | natace13 |
            | password    | 1234Test |
            | userIDstg   | ruth1600 |
            | passwordStg | 1234Test |
        And I filling in form login with the following details:
            | userID      | natace13 |
            | password    | 1234Test |
            | userIDstg   | ruth1600 |
            | passwordStg | 1234Test |
        And I click login
        And I click later in pop up biometric
        And I will direct to dashboard
        When I choose menu Transfer from main dashboard
        And I am on receiver list page
        And I input name 'Surya Edwin' from the search box
        And I choose the friendlist
        And I input amount '900000'
        And I click choose bank transfer service
        Then I should see error message "Kategori wajib diisi" in field "dropDownErrorField"

    @C133895
    Scenario: User transfer and input wrong PIN
        Given I am a registered customer with following details:
            | userID      | natace13 |
            | password    | 1234Test |
            | userIDstg   | ruth1600 |
            | passwordStg | 1234Test |
        And I filling in form login with the following details:
            | userID      | natace13 |
            | password    | 1234Test |
            | userIDstg   | ruth1600 |
            | passwordStg | 1234Test |
        And I click login
        And I click later in pop up biometric
        And I will direct to dashboard
        When I choose menu Transfer from main dashboard
        And I am on receiver list page
        And I input name 'Surya Edwin' from the search box
        And I choose the friendlist
        And I input amount '50000'
        And I choose category 'Pembayaran'
        And I input notes with 'Test RTOL'
        And I click choose bank transfer service
        And I choose transfer service RTOL
        And I click transfer
        And I am on page transfer confirmation
        And I input wrong PIN
        Then I see PIN message error 'Jika 3 kali salah, Anda akan langsung diarahkan ke halaman Masuk Akun'
        And I reset attempt failed PIN

    @C135520
    Scenario: User transfer and input wrong PIN twice
        Given I am a registered customer with following details:
            | userID      | natace13 |
            | password    | 1234Test |
            | userIDstg   | ruth1600 |
            | passwordStg | 1234Test |
        And I filling in form login with the following details:
            | userID      | natace13 |
            | password    | 1234Test |
            | userIDstg   | ruth1600 |
            | passwordStg | 1234Test |
        And I click login
        And I click later in pop up biometric
        And I will direct to dashboard
        When I choose menu Transfer from main dashboard
        And I am on receiver list page
        And I input name 'Surya Edwin' from the search box
        And I choose the friendlist
        And I input amount '50000'
        And I choose category 'Pembayaran'
        And I input notes with 'Test RTOL'
        And I click choose bank transfer service
        And I choose transfer service RTOL
        And I click transfer
        And I am on page transfer confirmation
        And I input wrong PIN
        And I see PIN message error 'Jika 3 kali salah, Anda akan langsung diarahkan ke halaman Masuk Akun'
        And I try again to input PIN
        And I input wrong PIN
        Then I see PIN message error 'Jika 3 kali salah, Anda akan langsung diarahkan ke halaman Masuk Akun'
        And I reset attempt failed PIN

    @C135521
    Scenario: User transfer and input wrong PIN three times
        Given I am a registered customer with following details:
            | userID      | natace13 |
            | password    | 1234Test |
            | userIDstg   | ruth1600 |
            | passwordStg | 1234Test |
        And I filling in form login with the following details:
            | userID      | natace13 |
            | password    | 1234Test |
            | userIDstg   | ruth1600 |
            | passwordStg | 1234Test |
        And I click login
        And I click later in pop up biometric
        And I will direct to dashboard
        When I choose menu Transfer from main dashboard
        And I am on receiver list page
        And I input name 'Surya Edwin' from the search box
        And I choose the friendlist
        And I input amount '5000000'
        And I choose category 'Pembayaran'
        And I input notes with 'Test RTOL'
        And I click choose bank transfer service
        And I choose transfer service RTOL
        And I click transfer
        And I am on page transfer confirmation
        And I input wrong PIN
        And I see PIN message error 'Jika 3 kali salah, Anda akan langsung diarahkan ke halaman Masuk Akun'
        And I try again to input PIN
        And I input wrong PIN
        And I see PIN message error 'Jika 3 kali salah, Anda akan langsung diarahkan ke halaman Masuk Akun'
        And I try again to input PIN
        And I input wrong PIN
        Then I see PIN message error 'Anda akan langsung diarahkan ke halaman Masuk Akun'
        And I click understand to page login
        And I will directing to page login
        And I reset attempt failed PIN        

    @C135522
    Scenario: Transfer with amount more than admin fee RTOL
        Given I am a registered customer with following details:
            | userID      | natace13 |
            | password    | 1234Test |
            | userIDstg   | ruth1600 |
            | passwordStg | 1234Test |
        And I filling in form login with the following details:
            | userID      | natace13 |
            | password    | 1234Test |
            | userIDstg   | ruth1600 |
            | passwordStg | 1234Test |
        And I click login
        And I click later in pop up biometric
        And I will direct to dashboard
        When I choose menu Transfer from main dashboard
        And I am on receiver list page
        And I input name 'Surya Edwin' from the search box
        And I choose the friendlist
        And I input amount more than active amount
        And I choose category 'Pembayaran'
        And I click choose bank transfer service
        And I can see BIFAST, RTOL and SKN
        And I choose transfer service RTOL
        Then I see message error total amount shouldn't more than active amount
        And I choose transfer service BIFAST
        Then I see message error total amount shouldn't more than active amount
        And I choose transfer service SKN
        Then I see message error total amount shouldn't more than active amount

    @C135523
    Scenario: Transfer with amount more than admin fee BIFAST
        Given I am a registered customer with following details:
            | userID      | natace13 |
            | password    | 1234Test |
            | userIDstg   | ruth1600 |
            | passwordStg | 1234Test |
        And I filling in form login with the following details:
            | userID      | natace13 |
            | password    | 1234Test |
            | userIDstg   | ruth1600 |
            | passwordStg | 1234Test |
        And I click login
        And I click later in pop up biometric
        And I will direct to dashboard
        When I choose menu Transfer from main dashboard
        And I am on receiver list page
        And I input name 'Surya Edwin' from the search box
        And I choose the friendlist
        And I input amount more than active amount
        And I choose category 'Pembayaran'
        And I click choose bank transfer service
        And I can see BIFAST, RTOL and SKN
        And I choose transfer service RTOL
        Then I shouldn't see message error total amount more than active amount
        And I choose transfer service BIFAST
        Then I see message error total amount shouldn't more than active amount
        And I choose transfer service SKN
        Then I see message error total amount shouldn't more than active amount

    @C135524
    Scenario: Transfer with amount more than admin fee SKN
        Given I am a registered customer with following details:
            | userID      | natace13 |
            | password    | 1234Test |
            | userIDstg   | ruth1600 |
            | passwordStg | 1234Test |
        And I filling in form login with the following details:
            | userID      | natace13 |
            | password    | 1234Test |
            | userIDstg   | ruth1600 |
            | passwordStg | 1234Test |
        And I click login
        And I click later in pop up biometric
        And I will direct to dashboard
        When I choose menu Transfer from main dashboard
        And I am on receiver list page
        And I input name 'Surya Edwin' from the search box
        And I choose the friendlist
        And I input amount more than active amount
        And I choose category 'Pembayaran'
        And I click choose bank transfer service
        And I can see BIFAST, RTOL and SKN
        And I choose transfer service RTOL
        Then I shouldn't see message error total amount more than active amount
        And I choose transfer service BIFAST
        Then I shouldn't see message error total amount more than active amount
        And I choose transfer service SKN
        Then I see message error total amount shouldn't more than active amount    

    @C135525
    Scenario: Transfer with amount more than admin fee RTGS
        Given I am a registered customer with following details:
            | userID      | natace13 |
            | password    | 1234Test |
            | userIDstg   | ruth1600 |
            | passwordStg | 1234Test |
        And I filling in form login with the following details:
            | userID      | natace13 |
            | password    | 1234Test |
            | userIDstg   | ruth1600 |
            | passwordStg | 1234Test |
        And I click login
        And I click later in pop up biometric
        And I will direct to dashboard
        When I choose menu Transfer from main dashboard
        And I am on receiver list page
        And I input name 'Surya Edwin' from the search box
        And I choose the friendlist
        And I input amount more than active amount
        And I choose category 'Pembayaran'
        And I click choose bank transfer service
        And I can see BIFAST, SKN and RTGS
        And I choose transfer service SKN
        Then I shouldn't see message error total amount more than active amount
        And I choose transfer service BIFAST
        Then I shouldn't see message error total amount more than active amount
        And I choose transfer service RTGS
        Then I see message error total amount shouldn't more than active amount   