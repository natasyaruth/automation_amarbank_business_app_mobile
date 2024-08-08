Feature: Verification Push Notification and Email Notification
    In order to upload data documents for webview applications
    As a User
    I want to verify the push notification to the mobile applications and email notification after upload documents

    Background:
        Given Access to The Link Web View for Uploading Data Documents
        When I has been opened browser
        When I input the link web view for uploading data documents
        And I redirect to the upload data documents page
        Then I should able to see 'Progress Upload Dokumen' page

    Scenario:: Verify Email Notification After Success Submit Loan Application
        Given I has been input anchor name
        When I continue to upload document
        And  I open the registered email
        Then I see the title of email "Pengajuan Pinjaman Anda Berhasil Dikirim"
        And I see the body of title with button "Cek Proses Disini"
        And I direct to the history loan page after clicking button to check the process loan

    Scenario: Verify Email Notification After Uploading Partial Data Documents
        Given I has been uploaded some of the required documents
        When I open the email that sent to the user has registered email
        Then I see the title of email "Segera Lengkapi Dokumen Pengajuan Limit Kredit Anda"
        And I see the body of title with button "Lengkapi Dokumen"

    Scenario: Verify  Email Notification After Uploading Full Data Documents
        Given I has been uploaded all of the required documents
        When I open the email that sent to the user has registered has  email
        Then I see the title of email "Dokumen Pengajuan Limit Kredit Sudah Lengkap"
        And I see the body of title with button "Kirim Pengajuan Limit Kredit"

    Scenario: Verify Email Notification Partial Upload Document When User Login Using Another UserID
        Given I has been got a email notification related to partial upload document
        When I open the email that sent to the user has registered email
        And I see the title of email "Segera Lengkapi Dokumen Pengajuan Limit Kredit Anda"
        And I click the button "Lengkapi Dokumen"
        Then I see wording "Gagal menampilkan daftar dokumen yang diperlukan"
        And I see wording "Anda dapat mencoba lagi nanti atau pilih menu bantuan untuk melaporkan masalah."
        And I see link "Coba Lagi"

    Scenario: Verify Email Notification Fully Upload Document When User Login Using Another UserID
        Given I has been got a email notification related to fully upload document
        When I open the email that sent to the user has registered email
        And I see the title of email "Dokumen Pengajuan Limit Kredit Sudah Lengkap"
        And I click the button  "Kirim Pengajuan Limit Kredit"
        Then I see wording "Gagal menampilkan daftar dokumen yang diperlukan"
        And I see wording "Anda dapat mencoba lagi nanti atau pilih menu bantuan untuk melaporkan masalah."
        And I see link "Coba Lagi"

    Scenario:: Verify Mobile Push Notification After Success Submit Loan Application
        Given I has been input anchor name
        When I continue to upload document
        And  I got push notification after success submit loan application
        Then I see the title of push notification "Pengajuan pinjaman Anda berhasil dikirim.Cek disini"
        And I direct to the history loan on progress after click the push notification

    Scenario: Verify Mobile Push Notification After Uploading Partial Data Documents
        Given I has been uploaded some of the required documents
        When I open the mobile notification
        And I see the title of push notification "Segera lengkapi dokumen yang dibutuhkan untuk pengajuan limit kredit bisnis Anda"
        And I click the push notification of partial uploaded documents
        Then I direct to the amar bank digital application
        And I upload document has page

    Scenario: Verify Mobile Push Notification After Uploading Full Data Documents
        Given I has been uploaded all of the required documents
        When I open the mobile notification
        And I see the title of push notification "Dokumen pengajuan limit kredit Anda sudah lengkap. Segera kirimkan pengajuan Anda"
        And I click the push notification of full uploaded documents
        Then I direct to the amar bank digital application
        And I upload document has page

    Scenario: Verify Mobile Push Notification Partial Upload Document When User Login Using Another UserID
        Given I has been got a push notification related to partial upload document
        When I click the push notification of partial upload document
        Then I direct to the amar bank digital application with error message
        And I see wording "Gagal menampilkan daftar dokumen yang diperlukan"
        And I see wording "Anda dapat mencoba lagi nanti atau pilih menu bantuan untuk melaporkan masalah."
        And I see link "Coba Lagi"

    Scenario: Verify Mobile Push Notification Fully Upload Document When User Login Using Another UserID
        Given I has been got a push notification related to fully upload document
        When I click the push notification of partial upload document
        Then I direct to the amar bank digital application with error message
        And I see wording "Gagal menampilkan daftar dokumen yang diperlukan"
        And I see wording "Anda dapat mencoba lagi nanti atau pilih menu bantuan untuk melaporkan masalah."
        And I see link "Coba Lagi"













