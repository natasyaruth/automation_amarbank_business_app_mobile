Feature: AP or AR upload multiple invoice web view
    As a customer,
    I want to upload multiple invoice via web view
    So that I can see notification from result upload invoice 

    Background: Login with registered account
        Given I am a registered customer with following details:
            | userID      | ecap2158 |
            | password    | Eca12345 |
            | userIDstg   | perob6d5 |
            | passwordStg | Eca12345 |
        When I filling in form login with the following details:
            | userID      | ecap2158 |
            | password    | Eca12345 |
            | userIDstg   | perob6d5 |
            | passwordStg | Eca12345 |
        And I click login
        When I click button Gunakan Limit
        And I click button list Gunakan Limit
        And I upload invoice
        And I upload invoice via other device 
        And I copy url upload invoice 

    Scenario: upload multiple invoices for one disbursement on web link
        Given I was on the Pengajuan Pencairan page 
        When I click button Ajukan Pencairan
        And I select the invoice to upload
        And I input nominal invoice 
        And I input nomor invoice
        When I click button simpan dan tambah invoice
        And I select the invoice to upload
        And I input nominal invoice 
        And I input nomor invoice
        And I click Lanjut Konfirmasi
        Then I should see list invoice that have been uploaded
        When I click button Upload Invoice Selesai
        And I should see one card pengajuan pencairan from several invoices
        When I click button Lanjutkan Proses Pencairan 
        And I click button mengerti 
        Then I should see notification by email and push notification on mobile 

    Scenario: send invoice to mobile app when user click “send invoice” button and user can see invoices on mobile app
        Given I am on the submission details page or the list of invoices that have been uploaded via web view
        When I click button upload invoice selesai on web view
        And I should see one card pengajuan pencairan from several invoices
        Then I redirected to the mobile app and saw the invoice card that I had uploaded
        When I click button Lanjutkan Proses Pencairan 
        And I click button mengerti 
        Then I should see notification by email and push notification on mobile 
    
    Scenario: see invoice in draft disbursement menu when user has not sent invoice to mobile app
        Given I was on the Pengajuan Pencairan page 
        When I click button Ajukan Pencairan
        And I select the invoice to upload
        And I input nominal invoice 
        And I input nomor invoice
        When I click button simpan dan tambah invoice
        And I select the invoice to upload
        And I input nominal invoice 
        And I input nomor invoice
        And I click Lanjut Konfirmasi
        Then I should see list invoice that have been uploaded

    Scenario: add invoice if disbursement status is draft disbursement
        Given I was on the Pengajuan Pencairan page 
        When I click button Ajukan Pencairan
        And I select the invoice to upload
        And I input nominal invoice 
        And I input nomor invoice
        And I click button lanjut konfirmasi
        And I was on the draft disbursement and should see invoice that have been uploaded
        When I click Tambah invoice 
        And I input nominal invoice 
        And I input nomor invoice
        And I click Lanjut Konfirmasi
        Then I shoul see list invoice that have been uploaded
    
    Scenario: edit invoice if disbursement status is draft disbursement
        Given I was on the Pengajuan Pencairan page 
        When I click button Ajukan Pencairan
        And I select the invoice to upload
        And I input nominal invoice 
        And I input nomor invoice
        And I click button lanjut konfirmasi
        And I was on the draft disbursement and should see invoice that have been uploaded
        And I click lihat invoice
        Then I should see Data invoice 
        When I edit nominal invoice
        When I edit nomor invoice 
        When I click button simpan
        Then I should see list invoice that have been uploaded

    Scenario: delete invoice if disbursement status is draft disbursement
        Given I was on the Pengajuan Pencairan page 
        When I click button Ajukan Pencairan
        And I select the invoice to upload
        And I input nominal invoice 
        And I input nomor invoice
        And I click button lanjut konfirmasi
        And I was on the draft disbursement and should see invoice that have been uploaded
        When I click icon delete 
        And I click button hapus
        Then I should see list invoice that have been uploaded

    Scenario: delete all invoice if disbursement status is “draft disbursement” then it will automatically delete each disbursement card
        Given I was on the Pengajuan Pencairan page 
        When I click button Ajukan Pencairan
        And I select the invoice to upload
        And I input nominal invoice 
        And I input nomor invoice
        And I click button lanjut konfirmasi
        And I was on the draft disbursement and should see invoice that have been uploaded
        And I delete all invoice that have been uploaded
        Then I not can see card disbursement because all invoice have been deleted

    Scenario: see card combined from several invoices which become one disbursement transaction after submission
        Given I was on the Pengajuan Pencairan page 
        When I click button Ajukan Pencairan
        And I select the invoice to upload
        And I input nominal invoice 
        And I input nomor invoice
        When I click button simpan dan tambah invoice
        And I select the invoice to upload
        And I input nominal invoice 
        And I input nomor invoice
        And I click Lanjut Konfirmasi
        Then I should see list invoice that have been uploaded
        When I click button Upload Invoice Selesai
        And I should see one card pengajuan pencairan from several invoices

    Scenario: view the status of each uploaded invoice to see if it has been successfully submitted
        Given I was on the Pengajuan Pencairan page 
        When I click button Ajukan Pencairan
        And I select the invoice to upload
        And I input nominal invoice 
        And I input nomor invoice
        When I click button simpan dan tambah invoice
        And I select the invoice to upload
        And I input nominal invoice 
        And I input nomor invoice
        And I click Lanjut Konfirmasi
        Then I should see list invoice that have been uploaded
        When I click button Upload Invoice Selesai
        And I should see one card pengajuan pencairan from several invoices
        Then I should see status of each uploaded invoice
    
    Scenario: try to upload invoice via web view with expired url
        Given I get url to upload invoice via web view
        When I open url via web view
        And I should see message Link telah kadaluwarsa

    Scenario: can view detail disbursement when user click card disbursement application
        Given I was on the Pengajuan Pencairan page 
        When I click button Ajukan Pencairan
        And I select the invoice to upload
        And I input nominal invoice 
        And I input nomor invoice
        When I click button simpan dan tambah invoice
        And I select the invoice to upload
        And I input nominal invoice 
        And I input nomor invoice
        And I click Lanjut Konfirmasi
        Then I should see list invoice that have been uploaded
        When I click button Upload Invoice Selesai
        And I should see one card pengajuan pencairan from several invoices
        And I click card disbursement 
        And I should see detail pengajuan

    Scenario: can add invoice on disbursement application detail pengajuan
        Given I was on the Pengajuan Pencairan page 
        When I click button Ajukan Pencairan
        And I select the invoice to upload
        And I input nominal invoice 
        And I input nomor invoice
        When I click button simpan dan tambah invoice
        And I select the invoice to upload
        And I input nominal invoice 
        And I input nomor invoice
        And I click Lanjut Konfirmasi
        Then I should see list invoice that have been uploaded
        When I click button Upload Invoice Selesai
        And I should see one card pengajuan pencairan from several invoices
        And I click card disbursement 
        And I should see detail pengajuan
        And I click button tambah invoice
        And I select the invoice to upload
        And I input nominal invoice 
        And I input nomor invoice
        And I click button simpan dan tambah invoice


