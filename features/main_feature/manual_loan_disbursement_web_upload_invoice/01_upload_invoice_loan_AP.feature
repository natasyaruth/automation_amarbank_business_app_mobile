Feature: Loan Disbursement for AP Invoice Upload via Web Link 
    In Disbursement Page
    As a customer
    I want to disbursement by allowing users (debtors) to upload invoices via a web link


@C163612
Scenario: Validate new option upload invoice
    Given I already have active limit and ready to disburse
    When I click button Gunakan Limit    
    And I upload invoice document
    And I see bottom sheet Pilih Metode Upload Invoice
    And I see new option to select Upload dari Perangkat Lain/ Delegasi

@C163613
Scenario: validate generate unique and bind weblink
    Given I have been on anchor detail to upload invoice from gallery
    When I upload invoice document
    And I click upload dari Perangkat Lain/ Delegasi
    And the System will generate unique and bind weblink to invoice for disbursement (for specific loan id) 
    And I have notification on email 

@C163614
Scenario: Access Email notification for receive unique web link
    Given I have receive email for link upload invoice through web
    When I open the email
    And I will see a generate link to upload invoice "https://www.bisnis.amarbank.co.id/upload_doc/123"
    Then I click the link to continue to upload invoice through web

@C163615
Scenario: Validate upload invoice page when the dashboard invoice still empty
    Given I have the accesses the unique web link
    When I am on Progress Upload Invoice Page
    And I see Supplier name
    And I see No. Pinjaman
    And I see "Anda bisa mengunggah beberapa invoice. Setiap invoice berlaku untuk satu pencairan"
    And I will see button for upload invoice
    And I will see disable button for add invoice
    
   
@C163616
Scenario: Validate error message when upload invoice  > 10 MB
    Given I have the accesses the unique web link
    When I am on Progress Upload Invoice Page 
    And I see Supplier name
    And I see No. Pinjaman
    And I see "Anda bisa mengunggah beberapa invoice. Setiap invoice berlaku untuk satu pencairan"
    And I upload a valid invoice file in PDF, JPG, JPEG, or PNG format
    And I select from the gallery      
    Then I see status "File melebihi maksimal ukuran 10MB."

@C163617
Scenario: Validate error message when upload invalid invoice
    Given I have the accesses the unique web link
    When I am on Progress Upload Invoice Page   
    And I see Supplier name
    And I see No. Pinjaman
    And I see "Anda bisa mengunggah beberapa invoice. Setiap invoice berlaku untuk satu pencairan"
    And I upload a invalid invoice with format mp3
    And I select from the gallery   
    Then I see status "File harus dalam format PDF / JPG / JPEG / PNG."

@C163618
Scenario: Successful invoice upload via web link through upload invoice for Loan AP Direct
    Given I have the accesses the unique web link
    When I am on Progress Upload Invoice Page 
    And I see Supplier name
    And I see No. Pinjaman
    And I see "Anda bisa mengunggah beberapa invoice. Setiap invoice berlaku untuk satu pencairan"
    And I upload a valid invoice file in PDF, JPG, JPEG, or PNG format
    And I select from the gallery   
    And I see bottomsheet detail invoice
    And I see status 'File sedang diupload'   
    Then I will see detail invoice will appear and I will continue fill the field.
    

@C163619
Scenario: Trimming spaces from the invoice number
    Given I have successful uploaded invoice    
    When I input an invoice number with leading, trailing, or in-between spaces
    And I click to the next field
    Then the system should automatically trim the spaces

@C163620
Scenario: Validation of disallowed special characters in invoice number
    Given I have successful uploaded invoice 
    When I input invoice number with "123@@@"    
    Then the system should display an error message "Spesial karakter yang diperbolehkan hanya /, -, dan \ "
    And the user should be prompted to correct the input

@C163621
Scenario: Validate Error Message when having bad internet connection
    Given I have successful uploaded invoice
    When I input nominal invoice
    And I input nomor invoice
    And I click button Simpan Invoice
    Then I see error message when having bad internet connection "Koneksi internet terputus"

@C163622
Scenario: Validate error message when failed to fetch the data 
    Given I have successful uploaded invoice
    When I input nominal invoice
    And I input nomor invoice
    And I click button Simpan Invoice
    Then I see status for failed fetch data "Gagal menampilkan data, silahkan coba lagi"

@C163624
Scenario: Continue to payment when details with allowed characters
    Scenario: Continue to payment when details are empty with allowed characters
    Given I have successful uploaded invoice
    When I input nominal invoice
    And I input nomor invoice "INV/16102024/AP-001"
    And I click button Simpan Invoice
    Then I success upload invoice through web link and the status is "Invoice Berhasil Tersimpan"
    And I will see appear on mobile apps and the status is "Segera Cairkan Invoice"

@C163625
Scenario: Edit invoice that already submitted
    Given I have succesfully submitted the invoice
    When I click the card loan AP
    And I edit nominal invoice
    And I click Simpan Invoice
    Then I see status "Invoice berhasil di simpan"

@C163626
Scenario: Delete invoice that already submitted
    Given I have succesfully submitted the invoice
    When I click the card loan AP
    And I see Detail Invoice
    And I click button Hapus Invoice
    Then I see status "Invoice berhasil di hapus"

@C163627
Scenario: Validate upload invoice page when the dashboard invoice if has at least one invoice number 
    Given I have suceesfully upload invoice
    When I am on dashboard invoice upload
    And I see Supplier Name
    And I see Nomor Pinjaman       
    And I see enable button for Tambbah invoice
    And I see button Upload Invoice Selesai

@C163628
Scenario: Uploading multiple invoices in one submission 
    Given I have the accesses the unique web link     
    When I am on Progress Upload Invoice Page 
    And I see Supplier name
    And I see No. Pinjaman
    And I see "Anda bisa mengunggah beberapa invoice. Setiap invoice berlaku untuk satu pencairan"
    And I click button Tambah Invoice
    And I upload a valid invoice file in PDF, JPG, JPEG, or PNG format
    And I select from the gallery   
    And I see status 'File sedang diupload'   
    And I input nominal invoice "Rp. 1.500.000"
    And I input valid invoice number "INVAP-16102024/001"
    And I click button Simpan Invoice
    Then the invoice status should be "Segera Cairkan Invoice" in the mobile application
    Then I success upload invoice through web link and the status is "Invoice Berhasil Tersimpan"
    And a notification should be sent to the user's mobile app and email

@C163629
Scenario: Validate New Screen confirmation after finished uploading single invoice through web 
    Given I have the accesses the unique web link     
    When I am on Progress Upload Invoice Page 
    And I see invoices with status "Invoice Berhasil Tersimpan"
    And I click button Upload Invoice Selesai
    Then I will direct to new screen "Pengajuan Berhasil Disimpan"
    And I see "Kembali ke aplikasi Amar Bank Bisnis untuk melanjutkan proses pencairan Limit."
    And I see "Langkah selanjutnya"
    And I see "Buka aplikasi Amar Bank Bisnis."
    And I see "Pergi halaman pencairan pinjaman."
    And I see "Pilih pengajuan dengan status “Segera Ciarkan Pinjaman."
    And I see "Lanjutkan proses pencairan sesuai petunjuk."

@C163630
Scenario: Expired web link for upload invoice
    Given I have success generate web link
    When I access the unique web link
    Then I see message "The link has expired"
    And I should be able to regenerate a new link from the mobile app
