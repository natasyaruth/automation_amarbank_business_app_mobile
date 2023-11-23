Feature: User Should See Main Dashboard Drop Off For Loan Process
    In main dashboard
    As a customer
    I need to see main dashbord status

    Background: User must login to home da
        Given I am a registered customer w
            | userID   | botse324   |
            | password | TestSmb123 |
        When I filling in form login with
            | userID   | botse324   |
            | password | TestSmb123 |
        And I click login
        And I click later

    Scenario: User validate drop off main dashboard loan process on waiting kyc
        Given user on main dashboard default
        When user should see text card "Aktivitas Pinjaman" on field "textCardActivityLoan"
        When user should see text card "1" on field "textCardValueProcess"
        When user should see text card "Proses" on field "textCardProcess"
        And user should see text button "Lanjut Lengkapi Data Personal" on field "btnTextDropOffAccOpeningOnlyKyc"
        And user should see text card "Lanjutkan Proses Pinjaman" on field "textCardContinueProcessLoan"
        Then user click button drop off
        And user should see personal data page

    Scenario: User validate drop off main dashboard loan process on waiting kyb
        Given user on main dashboard default
        When user should see text card "Aktivitas Pinjaman" on field "textCardActivityLoan"
        When user should see text card "1" on field "textCardValueProcess"
        When user should see text card "Proses" on field "textCardProcess"
        And user should see text button "Lanjut Lengkapi Data Bisnis" on field "btnTextDropOffAccOpeningOnlyKyb"
        And user should see text card "Lanjutkan Proses Pinjaman" on field "textCardContinueProcessLoan"
        Then user click button drop off
        And user should see business data page

    Scenario: User validate drop off main dashboard loan process on waiting upload document
        Given user on main dashboard default
        When user should see text card "Aktivitas Pinjaman" on field "textCardActivityLoan"
        And user should see text card "1" on field "textCardValueProcess"
        And user should see text card "Proses" on field "textCardProcess"
        Then user click button direct history loan
        And user should see text bottom sheet "Selamat, Pengajuan Berhasil Dikirim" in field "titleBottomSheet"
        And user close the bottom sheet
        And user close form upload doc
        And user should see text card "Mohon lengkapi Dokumen yang dibutuhkan" on field "textCardNextCompletedDoc"
        And user should see text button "Lihat Semua Dokumen" on field "btnTextDropOffAccOpeningOnlyUploadDoc"
        Then user click button open document
        And user should see upload doc account opening only page

    Scenario: User validate drop off main dashboard loan process on waiting upload document and invited user
        Given user on main dashboard default
        When user should see text card "Aktivitas Pinjaman" on field "textCardActivityLoan"
        And user should see text card "1" on field "textCardValueProcess"
        And user should see text card "Proses" on field "textCardProcess"
        Then user click button direct history loan
        And user should see text bottom sheet "Selamat, Pengajuan Berhasil Dikirim" in field "titleBottomSheet"
        And user close the bottom sheet
        And user close form upload doc
        And user should see text card "Mohon lengkapi Dokumen yang dibutuhkan" on field "textCardNextCompletedDoc"
        And user should see text button "Lihat Semua Dokumen" on field "btnTextDropOffAccOpeningOnlyUploadDoc"
        Then user click button open document
        And user should see upload doc account opening only page
        And user back to main dashboard
        And user should see text card "Menunggu proses registrasi Daftar Direksi lainnya" on field "textCardInvetedUserDireksi"
        And user should see text button "Lihat Daftar Direksi" on field "btnTextDropOffAccOpeningOnlyInvitedUser"
        And user click button invited user
        And user should see invited user account opening only page

    Scenario: User validate drop off main dashboard loan process on waiting invited user
        Given user on main dashboard default
        When user should see text card "Aktivitas Pinjaman" on field "textCardActivityLoan"
        And user should see text card "1" on field "textCardValueProcess"
        And user should see text card "Proses" on field "textCardProcess"
        Then user click button direct history loan
        And user should see text bottom sheet "Selamat, Pengajuan Berhasil Dikirim" in field "titleBottomSheet"
        And user close the bottom sheet
        And user close form upload doc
        And user should see text card "Menunggu proses registrasi Daftar Direksi lainnya" on field "textCardInvetedUserDireksi"
        And user should see text button "Lihat Daftar Direksi" on field "btnTextDropOffAccOpeningOnlyInvitedUser"
        And user click button invited user
        And user should see invited user account opening only page

    Scenario: User validate drop off main dashboard loan process on waiting invited user
        Given user on main dashboard default
        When user should see text card "Aktivitas Pinjaman" on field "textCardActivityLoan"
        And user should see text card "1" on field "textCardValueProcess"
        And user should see text card "Proses" on field "textCardProcess"
        Then user should see text card "Menunggu verifikasi data selesai" on field "textCardWaitVerifyData"