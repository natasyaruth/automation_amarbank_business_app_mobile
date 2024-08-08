Feature: Upload Data Documents For Manual Testing
    In order to upload data documents for cases manually test example error validate

    Background:
        Given Access to The Link Web View for Uploading Data Documents
        When I has been opened browser
        When I input the link web view for uploading data documents
        And I redirect to the upload data documents page
        Then I should able to see 'Progress Upload Dokumen' page


    Scenario: Validate error internet lost connection when uploading data documents for type Loan Journey AP Corporate
        Given I has been access to the link web view for upload multiple data documents for type Loan Journey AP Corporate
        When I upload multiple documents all field upload document
        And the internet is lost connection
        Then I see error message "Koneksi bermasalah. Periksa jaringan Anda dan coba lagi."
        And I see button retry
        And I see button delete

    Scenario: Validate error internet lost connection when uploading data documents for type Loan Journey AR Corporate
        Given I has been access to the link web view for upload multiple data documents for type Loan Journey AR Corporate
        When I upload multiple documents all field upload document
        And the internet is lost connection
        Then I see error message "Koneksi bermasalah. Periksa jaringan Anda dan coba lagi."
        And I see button retry
        And I see button delete

    Scenario: Validate error internet lost connection when uploading data documents AP MSME
        Given I has been access to the link web view for upload multiple data documents for type Loan Journey AP MSME
        When I upload multiple documents all field upload document
        And the internet is lost connection
        Then I see error message "Koneksi bermasalah. Periksa jaringan Anda dan coba lagi."
        And I see button retry
        And I see button delete

    Scenario: Validate error internet lost connection when uploading data documents AR  MSME
        Given I has been access to the link web view for upload multiple data documents for type Loan Journey AR MSME
        When I upload multiple documents all field upload document
        And the internet is lost connection
        Then I see error message "Koneksi bermasalah. Periksa jaringan Anda dan coba lagi."
        And I see button retry
        And I see button delete

    Scenario: Validate error internet lost connection when uploading data documents PO  MSME
        Given I has been access to the link web view for upload multiple data documents for type Loan Journey PO MSME
        When I upload multiple documents all field upload document
        And the internet is lost connection
        Then I see error message "Koneksi bermasalah. Periksa jaringan Anda dan coba lagi."
        And I see button retry
        And I see button delete

    Scenario: Retry Upload Document After Failed Upload
        Given I has been access to the link web view for upload multiple data documents
        When I upload multiple documents all field upload document
        And the internet is lost connection
        And I see error message "Koneksi bermasalah. Periksa jaringan Anda dan coba lagi."
        And I see button retry
        And I click button retry
        Then system will reupload file again

    Scenario: Delete Upload Document After Failed Upload Because of Internal Server Error
        Given I has been access to the link web view for upload multiple data documents
        When I upload multiple documents all field upload document
        And the internet is lost connection
        And I see error message "Koneksi bermasalah. Periksa jaringan Anda dan coba lagi."
        And I see button delete
        And I click button delete
        Then system will delete the document


