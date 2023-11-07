@LoanTenor
Feature: Checking Monitoring Process
    As a customer lead
    I want to validation for processing apply loan

    Background:
        Given I am a registered customer with following details:
            | userID   | bots2912  |
            | password | TestSmb123 |
        When I filling in form login with the following details:
            | userID   | bots2912  |
            | password | TestSmb123 |
        And I click login
        And I click later
        Then I will direct to dashboard
        And I click menu tab testing
        Then I successed go to dashbord
        And I click button loan dashboard
        And user click button ajukan pinjaman
        And user on loan type page
        And user select loan type "AP"
        And user click button lihat skema pinjaman
        And user on loan schema "AP"
        And user click button select the schema
        And user on the anchor page
        And user click icon other anchor
        And user on anchor cooperating page
        And user filling field "anchorName" with "UD Dagangan"
        And user select industry type
        And user select the date cooperating
        And user click button next
        And user on select loan amount
        Given user fill a field "amountLoanField" with "200000000"
        And user select the tenor "1Month"
        And user click button next on select loan amount page
        When user on legality business page
        And user select legality business type
        And user select business establishment date
        And user select the day date "Previous"
        And user select the month date "Previous"
        And user select the year date "Previous"
        And user choose the date
        Then user click button next on legality business page
        And user on head office location page
        And user select location jabodetabek
        And user click button next on head office location page
        And user on success apply loan page
        And user click button continue complete the data
        And user on success complete the data page

    @C83876 @LoanTenor
    Scenario: validate success complete the data page
        Given user validate title "Terima kasih telah melengkapi Data Diri" on field "titleFieldSuccessCompleteData"
        And user validate subtitle "Mohon melengkapi Data Bisnis Anda untuk melanjutkan proses pengajuan pinjaman" on field "subTitleFieldSuccessCompleteData"
        When user validate header content perbankan premium bisnis
        Then user validate body content perbankan premium bisnis

    @C83876 @LoanTenor
    Scenario: validate bottom sheet showing and loan processing page
        Given user click button next completed data
        And user should see text bottom sheet "Selamat, Pengajuan Berhasil Dikirim" in field "titleBottomSheet"
        When user should see text bottom sheet "Pengajuanmu akan segera diproses oleh tim Amar Bank" in field "subTitleBottomSheet"
        And user should see text bottom sheet "Proses verifikasi pinjaman juga mencakup pembuatan rekening giro secara otomatis." in field "descriptionBottomSheet"
        And user close the bottom sheet
        Then user on monitoring loan process page
        And user validate section checking document "Pengecekan Dokumen" on field "titleDocumentField"
        And user validate section checking document "Analisa Kredit" on field "titleAnalystCreditField"
        And user validate section checking document "Langkah Terakhir" on field "titleLastStepField"
        # And user validate section checking document "Proses saat ini" on field "statusCheckingDocumentField"
        # And user validate section checking document "Dokumen sudah berhasil dikirim, Tim kami akan memprosesnya." on field "wordingDocumentField"

# @C83876
# Scenario: validate progress monitoring loan checking document
#     Given user on monitoring loan process page
#     And user validate title "Pengecekan Dokumen" on field "titleDocumentField"
#     And user validate status process "Proses saat ini" on field "statusCheckingDocumentField"
#     When user validate wording information "Dokumen sudah berhasil dikirim, Tim kami akan memprosesnya." on field "wordingDocumentField"
#     Then user validate button view document is enable

# @C83876
# Scenario: Change status checking document process
#     Given user change status checking document process
#     When user validate status process "Proses selesai" on field "statusCheckingDocumentField"

# @C83877
# Scenario: Checking Credit Analyst Process
#     Given user on monitoring loan process page
#     And user validate title "Analisa Kredit" on field "titleAnalystCreditField"
#     When user validate status process "Proses saat ini" on field "statusAnalystCreditField"
#     Then user validate wording information "Hasil analisa kredit akan menentukan limit pinjaman yang Anda gunakan untuk transaksi dengan supplier." on field "wordingAnalystCreditField"

# @C83877
# Scenario: Change status Analyst Credit
#     Given user change status checking credit analyst process
#     When user validate status process "Proses selesai" on field "statusAnalystCreditField"

# @C83878
# Scenario: Checking Status the last step
#     Given user on monitoring loan process page
#     And user validate title "Langkah Terakhir" on field "titleLastStepField"
#     When user validate status process "Proses saat ini" on field "statusLastStepField"
#     Then user validate wording information "Tim Amar Bank akan merangkum hasilnya." on field "wordingLastStepField"