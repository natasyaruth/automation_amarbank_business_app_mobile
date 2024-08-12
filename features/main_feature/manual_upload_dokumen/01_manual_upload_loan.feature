Feature: Upload Dokumen with unsupported file
In DSMB
As a customer
I want to validate for unsupported file


Scenario: User validate unsupported file format will be restricted 
  Given user already apply loan but have no upload document
  When user click from Aktivitas pinjaman
  And user on Aktivitas Pinjaman Page
  And user click loan with status Pengajuan Limit & Upload Dokumen
  And user click button Pilih Metode Upload Dokumen
  And user click button Langsung dari Aplikasi
  And user upload multiple document "KTPComp" with format MP4 
  Then user will see unsupported file selected 


Scenario: user check upload progress bar for type PT.Perusahaan or CV
  Given user already apply loan but have no upload document
  When user click from Aktivitas pinjaman
  And user on Aktivitas Pinjaman Page
  And user click loan with status Pengajuan Limit & Upload Dokumen
  And user click button Pilih Metode Upload Dokumen
  And user click button Langsung dari Aplikasi
  And user upload multiple document "KTPComp"        
  And user upload multiple document "npwpOfComp"
  And user upload multiple document "3contohInvoicewithSupplier"
  And user upload multiple document "paymentMutation"
  And user upload multiple document "2YearfinancialReports"
  Then user can see upload progress bar "File sedang di upload"


Scenario: user verify The files can be previewed after uploaded
  Given user already apply loan but have no upload document
  When user click from Aktivitas pinjaman
  And user on Aktivitas Pinjaman Page
  And user click loan with status Pengajuan Limit & Upload Dokumen
  And user click button Pilih Metode Upload Dokumen
  And user click button Langsung dari Aplikasi
  And user upload multiple document "KTPComp"          
  And user upload multiple document "npwpOfComp"
  And user upload multiple document "3contohInvoicewithSupplier"
  And user upload multiple document "paymentMutation"
  And user upload multiple document "2YearfinancialReports"
  And user click name of file
  Then user can view the documents


Scenario: user click X button to stop uploading file in progress bar
  Given user already apply loan but have no upload document
  When user click from Aktivitas pinjaman
  And user on Aktivitas Pinjaman Page
  And user click loan with status Pengajuan Limit & Upload Dokumen
  And user click button Pilih Metode Upload Dokumen
  And user click button Langsung dari Aplikasi
  And user upload multiple document "KTPComp"     
  And user upload 3 file with different
  And user see frist document successfully uploaded
  And user see second document successfully uploaded
  And user see third document still running with status File sedang diupload
  And user click X button to stop uploading
  Then user will see the third documentes is not appear

Scenario: document is failed uploading because internet lost connection
  Given user already apply loan but have no upload document
  When user click from Aktivitas pinjaman
  And user on Aktivitas Pinjaman Page
  And user click loan with status Pengajuan Limit & Upload Dokumen
  And user click button Pilih Metode Upload Dokumen
  And user click button Langsung dari Aplikasi
  And user upload multiple document "KTPComp"    
  And user see first document successfully uploaded
  And user see second document failed and error messsage "Koneksi bermasalah. Periksa jaringan Anda dan coba lagi."

Scenario: Delete document in every list uploaded document when process deleting is failed
  Given user already apply loan but have no upload document
  When user click from Aktivitas pinjaman
  And user on Aktivitas Pinjaman Page
  And user click loan with status Pengajuan Limit & Upload Dokumen
  And user click button Pilih Metode Upload Dokumen
  And user click button Langsung dari Aplikasi
  And user upload multiple document "KTPComp"    
  And user click delete button in one of document uploaded
  And user will see confirmation Hapus Dokumen
  And user click Hapus button
  Then user see error message "Sedang terkendala server, mohon coba beberapa saat lagi."
  And user stil can see button Kirim Pengajuan Limit Kredit


Scenario: Upload multiple document and one of document is failed uploading because internet lost connection
    Given user already apply loan but have no upload document
    When user click from Aktivitas pinjaman
    And user on Aktivitas Pinjaman Page
    And user click loan with status Pengajuan Limit & Upload Dokumen
    And user click button Pilih Metode Upload Dokumen
    And user click button Langsung dari Aplikasi
    And user upload multiple document "KTPComm"     
    And user failed to upload dokumen
    Then user show a retry icon when the document fails to upload
    And user show an error message "Koneksi bermasalah. Periksa jaringan Anda dan coba lagi"
    And user still can see button Kirim Pengajuan Limit Kredit


Scenario: User validate button Kirim Pengajuan Limit Kredit disable after reupload failed dokumen
    Given user already apply loan but have no upload document
    When user click from Aktivitas pinjaman
    And user on Aktivitas Pinjaman Page
    And user click loan with status Pengajuan Limit & Upload Dokumen
    And user click button Pilih Metode Upload Dokumen
    And user click button Langsung dari Aplikasi
    And user upload multiple document "NPWPComm"    
    And user upload multiple document "KTPComm" 
    And user failed to upload file NPWP
    
    

Scenario: User validate button Kirim Pengajuan Limit Kredit disable after reupload failed dokumen
    Given user already apply loan but have no upload document
    When user click from Aktivitas pinjaman
    And user on Aktivitas Pinjaman Page
    And user click loan with status Pengajuan Limit & Upload Dokumen
    And user click button Pilih Metode Upload Dokumen
    And user click button Langsung dari Aplikasi
    And user upload multiple document "3contohInvoicewithSupplier"
    And user see the file queued for upload
    Then user see progress bar File sedang diupload
    And user see progress bar File menunggu diupload
