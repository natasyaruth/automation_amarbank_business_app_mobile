Feature: User Should See Main Dashboard Drop Off For Loan Process
    In main dashboard
    As a customer
    I need to see main dashbord status

    Background: User must login to home da
        Given I am a registered customer w
            | userID      | botse324   |
            | password    | TestSmb123 |
            | userIDstg   | stag76ee   |
            | passwordStg | Test1234   |
        When I filling in form login with
            | userID      | botse324   |
            | password    | TestSmb123 |
            | userIDstg   | stag76ee   |
            | passwordStg | Test1234   |
        And I click login
        And I click later

    @C109149
    Scenario: User validate drop off main dashboard loan process on waiting kyc
        Given user on main dashboard
        When user should see text card "Kredit Bisnis untuk berbagai kebutuhan usaha" on field "textViewBodyDesc"
        When user should see text card "Aktivitas Pinjaman" on field "textCardActivityLoan"
        When user should see text card "1" on field "textCardValueProcess"
        When user should see text card "Proses" on field "textCardProcess"
        And user should see text button "Lanjut Lengkapi Data Personal" on field "btnTextDropOffAccOpeningOnlyKyc"
        And user should see text card "Lanjutkan Proses Pinjaman" on field "textCardContinueProcessLoan"
        Then user click button drop off
        And user should see personal data page

    @C109150
    Scenario: User validate drop off main dashboard loan process on waiting kyb
        Given user on main dashboard
        When user should see text card "Kredit Bisnis untuk berbagai kebutuhan usaha" on field "textViewBodyDesc"
        When user should see text card "Aktivitas Pinjaman" on field "textCardActivityLoan"
        When user should see text card "1" on field "textCardValueProcess"
        When user should see text card "Proses" on field "textCardProcess"
        And user should see text button "Lanjut Lengkapi Data Bisnis" on field "btnTextDropOffAccOpeningOnlyKyb"
        And user should see text card "Lanjutkan Proses Pinjaman" on field "textCardContinueProcessLoan"
        Then user click button drop off
        And user should see business data page


    Scenario: User validate drop off upload document in Combine Journey
        Given user on main dashboard
        When user should see text card "Kredit Bisnis untuk berbagai kebutuhan usaha" on field "textViewBodyDesc"       
        When user should see text card "Aktivitas Pinjaman" on field "textCardActivityLoan"
        And user should see text card "1" on field "textCardValueProcess"
        And user should see text card "Proses" on field "textCardProcess"   
        And user click button Aktivitas Pinjaman
        And user on Aktvitas Pinjaman page

    
    Scenario: User validate drop off main dashboard upload document and waiting invited regis
        Given user on main dashboard
        When user should see text card "Kredit Bisnis untuk berbagai kebutuhan usaha" on field "textViewBodyDesc"       
        When user should see text card "Aktivitas Pinjaman" on field "textCardActivityLoan"
        And user should see text card "1" on field "textCardValueProcess"
        And user should see text card "Proses" on field "textCardProcess"                     
        And user should see text card "Menunggu proses registrasi Daftar Direksi lainnya" on field "textCardInvetedUserDireksi"
        And user should see text button "Lihat Daftar Direksi" on field "btnTextDropOffAccOpeningOnlyInvitedUser"
        And user should see text card "Menunggu verifikasi data selesai" on field "textCardWaitVerifyData"
        And user should see text button "Progres Pembukaan Rekening" on field "textbtnprogresopenrekening"

        And user click button invited user
        And user should see invited user account opening only page

    
    Scenario: User validate drop off main dashboard loan process on waiting invited regis
        Given user on main 
        When user should see text card "Kredit Bisnis untuk berbagai kebutuhan usaha" on field "textViewBodyDesc"
        When user should see text card "Aktivitas Pinjaman" on field "textCardActivityLoan"
        And user should see text card "1" on field "textCardValueProcess"   
        And user should see text card "Menunggu proses registrasi Daftar Direksi lainnya" on field "textCardInvetedUserDireksi"
        And user should see text button "Lihat Daftar Direksi" on field "btnTextDropOffAccOpeningOnlyInvitedUser"
        And user click button invited user
        And user should see invited user account opening only page

    Scenario: User validate drop off main dashboard upload document in process loan
        Given user on main dashboard
        When user should see text card "Kredit Bisnis untuk berbagai kebutuhan usaha" on field "textViewBodyDesc"
        When user should see text card "Aktivitas Pinjaman" on field "textCardActivityLoan"
        And user should see text card "1" on field "textCardValueProcess"
        And user should see text card "Proses" on field "textCardProcess"
        When user should see text button "Ajukan Limit Kredit" on field "btnLoan"
        And user should see text button "Lihat Semua Dokumen" on field "btnTextDropOffAccOpeningOnlyUploadDoc"
        And user should see text card "Mohon lengkapi Dokumen yang dibutuhkan" on field "textCardNextCompletedDoc"
        Then user click button open document
        And user should see upload doc account opening only page
        

    
    Scenario: User validate drop off waiting Data verification in Process Loan
        Given user on main dashboard
        When user should see text card "Kredit Bisnis untuk berbagai kebutuhan usaha" on field "textViewBodyDesc"
        When user should see text card "Aktivitas Pinjaman" on field "textCardActivityLoan"
        And user should see text card "1" on field "textCardValueProcess"
        And user should see text card "Proses" on field "textCardProcess"
        Then user should see text card "Menunggu verifikasi data selesai" on field "textCardWaitVerifyData"
        

    
