Feature: User Should See Main Dashboard Drop Off For Account Opening
    In main dashboard
    As a customer
    I need to see main dashbord status

    Background: User must login to home da
        Given I am a registered customer w
            | userID      | bots937a |
            | password    | Test1234 |
            | userIDstg   | stag76ee |
            | passwordStg | Test1234 |
        When I filling in form login with
            | userID      | bots937a |
            | password    | Test1234 |
            | userIDstg   | stag76ee |
            | passwordStg | Test1234 |
        And I click login
        And I click later

    @C109155
    Scenario: User validate drop off main dashboard opening account only on kyc
        Given user on main dashboard
        When user should see text button "Ajukan Limit Kredit" on field "btnLoan"
        And user should see text button "Lanjut Lengkapi Data Personal" on field "btnTextDropOffAccOpeningOnlyKyc"
        And user should see text card "Lanjutkan Pembuatan Rekening Giro" on field "textCardNextOpeningAccount"
        Then user click button drop off
        And user should see personal data page

    @C109156
    Scenario: User validate drop off main dashboard opening account only on kyb
        Given user on main dashboard
        When user should see text button "Ajukan Limit Kredit" on field "btnLoan"
        And user should see text button "Lanjut Lengkapi Data Bisnis" on field "btnTextDropOffAccOpeningOnlyKyb"
        And user should see text card "Lanjutkan Pembuatan Rekening Giro" on field "textCardNextOpeningAccount"
        Then user click button drop off
        And user should see business data page

    @C109157
    Scenario: User validate drop off main dashboard upload document in account opening only
        Given user on main dashboard
        When user should see text button "Ajukan Limit Kredit" on field "btnLoan"
        And user should see text button "Lihat Semua Dokumen" on field "btnTextDropOffAccOpeningOnlyUploadDoc"
        And user should see text card "Mohon lengkapi Dokumen yang dibutuhkan" on field "textCardNextCompletedDoc"
        Then user click button open document
        And user should see upload doc account opening only page

    @C109158
    Scenario: User validate drop off main dashboard upload document in account opening only and waiting invited user
        Given user on main dashboard
        When user should see text button "Ajukan Limit Kredit" on field "btnLoan"
        And user should see text button "Lihat Semua Dokumen" on field "btnTextDropOffAccOpeningOnlyUploadDoc"
        And user should see text card "Mohon lengkapi Dokumen yang dibutuhkan" on field "textCardNextCompletedDoc"
        And user should see text card "Menunggu proses registrasi Daftar Direksi lainnya" on field "textCardInvetedUserDireksi"
        And user should see text button "Lihat Daftar Direksi" on field "btnTextDropOffAccOpeningOnlyInvitedUser"
        Then user click button open document
        And user should see upload doc account opening only page
        And user back to main dashboard
        And user click button invited user
        And user should see invited user account opening only page

    @C109159
    Scenario: User validate drop off main dashboard waiting invited user in account opening only
        Given user on main dashboard
        When user should see text button "Ajukan Pinjaman" on field "btnLoan"
        And user should see text card "Menunggu proses registrasi Daftar Direksi lainnya" on field "textCardInvetedUserDireksi"
        And user should see text button "Lihat Daftar Direksi" on field "btnTextDropOffAccOpeningOnlyInvitedUser"
        And user click button invited user
        And user should see invited user account opening only page

    @C109160
    Scenario: User validate drop off main dashboard waiting data verification in account opening only
        Given user on main dashboard
        When user should see text button "Ajukan Pinjaman" on field "btnLoan"
        Then user should see text card "Menunggu verifikasi data selesai" on field "textCardWaitVerifyData"