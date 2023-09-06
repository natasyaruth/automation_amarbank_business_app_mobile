Feature: Checking Monitoring Process
    As a customer lead
    I want to validation for processing apply loan

    @C83876
    Scenario: validate progress monitoring loan checking document
        Given user on monitoring loan process page
        And user validate title 'Pengecekan Dokumen' on field 'titleDocumentField'
        And user validate status process 'Proses saat ini' on field 'statusCheckingDocumentField'
        When user validate wording information 'Dokumen sudah berhasil dikirim, Tim kami akan memprosesnya.' on field 'wordingDocumentField'
        Then user validate button view document is enable

    @C83876
    Scenario: Change status checking document process
        Given user change status checking document process
        When user validate status process 'Proses selesai' on field 'statusCheckingDocumentField'

    @C83877
    Scenario: Checking Credit Analyst Process
        Given user on monitoring loan process page
        And user validate title 'Analisa Kredit' on field 'titleAnalystCreditField'
        When user validate status process 'Proses saat ini' on field 'statusAnalystCreditField'
        Then user validate wording information 'Hasil analisa kredit akan menentukan limit pinjaman yang Anda gunakan untuk transaksi dengan supplier.' on field 'wordingAnalystCreditField'

    @C83877
    Scenario: Change status Analyst Credit
        Given user change status checking credit analyst process
        When user validate status process 'Proses selesai' on field 'statusAnalystCreditField'

    @C83878
    Scenario: Checking Status the last step
        Given user on monitoring loan process page
        And user validate title 'Langkah Terakhir' on field 'titleLastStepField'
        When user validate status process 'Proses saat ini' on field 'statusLastStepField'
        Then user validate wording information 'Tim Amar Bank akan merangkum hasilnya.' on field 'wordingLastStepField'