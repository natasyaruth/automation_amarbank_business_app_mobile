Feature: Apply First Loan With Flagging MSME Using PO Direct
  As a customer lead
  I want to apply first loan using PO Direct with MSME has flag
  As a customer lead
  I want to apply first loan using PO Direct with MSME has flag

  Background:
  Background:
    Given I am a registered customer with followng details:
      | userID      | yahyde6f |
      | password    | Akuntes1 |
      | userIDstg   | bots2643 |
      | passwordStg | Test1234 |    
    When I filling in form login with the following details:
      | userID      | yahyde6f |
      | password    | Akuntes1 |
      | userIDstg   | bots2643 |
      | passwordStg | Test1234 |
    And I click login
    Then I successed go to dashbord

 
  @C142725
  Scenario: Verify bottom sheet Loan Schema
    Given User on Main Dashboard
    When user click button Ajukan Limit Kredit
    And User click button Pelajari Tipe Skema Kredit
    Then user will see bottom sheet page of Pelajari Tipe Skema Kredit
    And user click back button to back to type loan page

  
  @C142726
  Scenario: User apply first loan PO direct and want to see PO loan schema
    Given User on Main Dashboard
    When user click button Ajukan Limit Kredit    
    #section wants to see loan schema
    And User click button Pelajari Tipe Skema Kredit
    And User click button "Project  Financing"
    Then System will display Schema of Project Financing

  
  @C142727
  Scenario: Validate error input tenor below min 30 hari
    Scenario: Validate error input tenor below min 30 hari
    Given User on Main Dashboard
    When user click button Ajukan Limit Kredit
    And User select loan type "PO"  
    And user input nominal for MSME "5000000000"
    And user click button Save
    And user input tenor "10"
    And user click button Lanjut Isi Data Supplier
    Then user user see error message "Minimal tenor 30 hari"

 
  @C142728
  Scenario: Validate error input tenor more than 180 hari   
    Given User on Main Dashboard
    When user click button Ajukan Limit Kredit
    And User select loan type "PO"  
    And user input nominal for MSME "5000000000"
    And user click button Save
    And user input tenor "10"
    And user click button Lanjut Isi Data Supplier
    Then user user see error message "Minimal tenor 30 hari"


  Scenario: User verify new required document apply loan for PO PT.Perusahaan
    Given User on drop off Upload Dokumen
    When User click Aktifitas Pinjaman
    And User click loan with status "Upload Dokumen"
    Then I should see the following document requirements:
      |NIB                                                                                                      |
      |Akta Pendirian                                                                                           |
      |SK Kemenkumham Pendirian                                                                                 |
      |NPWP Bisnis                                                                                              |
      |Akta Perubahan Terakhir (jika ada)                                                                       |
      |SK Kemenkumham Perubahan Terakhir (jika ada)                                                          |
      | KTP Komisioner & Pemegang Saham                                                                       |
      | NPWP Komisioner & Pemegang Saham                                                                      |
      | Surat Perintah Kerja (SPK) dari Buyer saat ini atau Buyer lainnya dengan produk yang sama              |
      | Minimal 3 contoh invoice dengan supplier saat ini atau supplier lainnya dengan produk yang sama.     |
      | Rekening koran/mutasi rekening operasional 6 bulan terakhir.                                 |
      | Laporan keuangan dalam 1 tahun terakhir (jika ada). "                                                   |
    And I see buttton Pilih Metode Upload Dokumen

  
  @Sprint6Lending @C142729
  Scenario: User apply combine journey PO direct type combine journey CV with flagging MSME
    Given User on Main Dashboard   
    When user click button Ajukan Limit Kredit
    And User select loan type "PO"
    And user input nominal for MSME "5000000000"
    And user input loan tenor "30"
    And user click button Lanjut Isi Data Buyer
    #section select Anchor
    When user on buyer cooperating page
    And user fill a field "BuyerName" with "PO test"
    And user select industry type
    And user select the year cooperating    
    And user click Pilih
    And user click button Lanjut Melengkapi Data    
    And user click button Lanjut Proses KYC
    #section KYC Process
    Given user choose Business Type "CV"    
    And user click Selanjutnya
    And user take photo eKTP
    And user click "Saya Mengerti"
    And user click "Ambil Foto eKTP"
    And user click "Kirim Foto"
    And user input and save eKTP data
    And user click take "Foto Diri"
    And user click "Kirim Foto"
    And user input and save personal individual data
    And user select Pendidikan Terakhir "S1 (Sarjana)"
    And user input Nama Ibu Kandung "Tuti"
    And user input nama kerabat "Aji"
    And user input nomor kerabat "08572888999200"
    And user upload npwp individu
    And user click button Simpan Data Diri
    And user click button Simpan Alamat Tempat Tinggal
    And user select pekerjaan "Wiraswasta/Pengusaha"
    And user select sumber pendapatan "Pemasukan dari Usaha"
    And user click button Simpan Data Pekerjaan
    And system direct to Success screen of KYC process
    Then user click button Lanjut Lengkapi Data Bisnis
    #section KYB Process
    Given user in Profil Bisnis page
    When user input and save "Simpan Profil Bisnis"
    And user input and click "Simpan Daftar Direktur"
    And user input "Alamat Bisnis"
    And user checklist checkbox term and condition
    And user input "Alamat Bisnis"
    And user checklist checkbox term and condition
    And user checklist checkbox right and obligations
    And user checklist checkbox privy
    And user click button Lanjut Upload Dokumen
    And user validate description prepare the following documents 'MSMEPOCV'    
    And user click buttton Pilih Metode Upload Dokumen
    #Upload Dokumen from Aplikasi
    And user click button Langsung dari Aplikasi
    And user on Progress Upload Dokumen Page
    And user upload docuemnt "nib"
    And user upload document "aktapendirian"
    And user upload document "skkemenkumhanpendirian"
    And user upload document "npwpbisnis"
    And user upload document "aktaperubahanterakhir"
    And user upload document "skkemenkumhanperubahanakhir"
    And user upload document "ktpcomm"
    And user upload document "npwpcomm"        
    And user upload document "SPKdok"
    And user upload document "3contohInvoicewithSupplier"
    And user upload document "paymentMutation"
    And user upload document "1YearfinancialReports"
    And user click button Perbaharui Progres
    And user click button Kirim Pengajuan Kredit Limit
    Then user direct to "Selamat, Pengajuan Kredit Anda Berhasil Dikirim"
    And user click button Lihat Progres Pengajuan
    And user on monitoring loan process page


  Scenario: User verify new required document apply loan for combine journey PO PT.Perorangan
    Given User on drop off Upload Dokumen
    When User click Aktifitas Pinjaman
    And User click loan with status "Upload Dokumen"
    Then I should see the following document requirements:
      |NIB                                                                                                      |
      |Sertifikat Pendaftaran                                                                                   |
      |NPWP Bisnis                                                                                              |
      |Surat Pernyataan Pendirian                                                                               |
      |Sertifikat Perubahan Terakhir (jika ada)                                                                 |
      | Surat Pernyataan Perubahan Terakhir (jika ada)                                                          |
      | Surat Perintah Kerja (SPK) dari Buyer saat ini atau Buyer lainnya dengan produk yang sama"              |
      | Minimal 3 contoh invoice dengan supplier saat ini atau supplier lainnya dengan produk yang sama."       |
      | Rekening koran/mutasi rekening operasional 6 bulan terakhir."                                           |
      | Laporan keuangan dalam 1 tahun terakhir (jika ada). "                                                   |
    And I see buttton Pilih Metode Upload Dokumen

  


  @Sprint6Lending @C161669
  Scenario: User combine journey PO direct type PT.Perorangan with flagging MSME
    Given User on Main Dashboard   
    When user click button Ajukan Limit Kredit
    And User select loan type "PO"
    And user input nominal for MSME "5000000000"
    And user input loan tenor "30"
    And user click button Lanjut Isi Data Buyer
    #section select Anchor
    When user on buyer cooperating page
    And user fill a field "Buyer" with "PO test"
    And user select industry type
    And user select the year cooperating
    And user click Pilih
    And user click button Lanjut Melengkapi Data
    And user click button Lanjut Proses KYC
    #section KYC Process
    Given user choose Business Type "PT.Perorangan"
    And user click Selanjutnya
    And user take photo eKTP
    And user click "Saya Mengerti"
    And user click "Ambil Foto eKTP"
    And user click "Kirim Foto"
    And user input and save eKTP data
    And user click take "Foto Diri"
    And user click "Kirim Foto"
    And user input and save personal individual data
    And user select Pendidikan Terakhir "S1 (Sarjana)"
    And user input Nama Ibu Kandung "Tuti"
    And user input nama kerabat "Aji"
    And user input nomor kerabat "08572888999200"
    And user upload npwp individu
    And user click button Simpan Data Diri
    And user click button Simpan Alamat Tempat Tinggal
    And user select pekerjaan "Wiraswasta/Pengusaha"
    And user select sumber pendapatan "Pemasukan dari Usaha"
    And user click button Simpan Data Pekerjaan
    And system direct to Success screen of KYC process
    Then user click button Lanjut Lengkapi Data Bisnis
    #section KYB Process
    Given user in Profil Bisnis page
    When user input and save "Simpan Profil Bisnis"
    And user input and click "Simpan Daftar Direktur"
    And user input "Alamat Bisnis"
    And user checklist checkbox term and condition
    And user checklist checkbox right and obligations
    And user checklist checkbox privy
    And user click button Lanjut Upload Dokumen
    And user validate description prepare the following documents 'MSMEPOPT.Perorangan'
    And user click buttton Pilih Metode Upload Dokumen
    #Upload Dokumen from Aplikasi
    And user click button Langsung dari Aplikasi
    And user on Progress Upload Dokumen Page
    And user upload docuemnt "nib"
    And user upload document "sertifikatpendaftaran"
    And user upload document "npwpbisnis"
    And user upload document "suratpernyataanpendirian"
    And user upload document "sertifikatperubahanterakhir"
    And user upload document "suratpernyataanperubahanakhir"
    And user upload document "SPKdok"
    And user upload document "3contohInvoicewithBuyer"
    And user upload document "paymentMutation"
    And user upload document "1YearfinancialReports"
    And user click button Perbaharui Progres
    And user click button Kirim Pengajuan Kredit Limit
    Then user direct to "Selamat, Pengajuan Kredit Anda Berhasil Dikirim"
    And user click button Lihat Progres Pengajuan
    And user on monitoring loan process page


  Scenario: User verify new required document apply loan for combine journey PO UD
    Given User on drop off Upload Dokumen
    When User click Aktifitas Pinjaman
    And User click loan with status "Upload Dokumen"
    Then User should see the list of required documents
    And User see "NIB"    
    And User see "NPWP Bisnis"        
    And User see "Surat Perintah Kerja (SPK) dari Buyer saat ini atau Buyer lainnya dengan produk yang sama"
    And User see "Minimal 3 contoh invoice dengan supplier saat ini atau supplier lainnya dengan produk yang sama."
    And User see "Rekening koran/mutasi rekening operasional 6 bulan terakhir."
    And User see "Laporan keuangan dalam 1 tahun terakhir (jika ada). "
    

  Scenario: User verify new required document apply loan for combine journey PO Individu
    Given User on drop off Upload Dokumen
    When User click Aktifitas Pinjaman
    And User click loan with status "Upload Dokumen"
    Then User should see the list of required documents 
    And User see "Surat Pernyataan Perubahan Terakhir (jika ada)"    
    And User see "Surat Perintah Kerja (SPK) dari Buyer saat ini atau Buyer lainnya dengan produk yang sama"
    And User see "Minimal 3 contoh invoice dengan supplier saat ini atau supplier lainnya dengan produk yang sama."
    And User see "Rekening koran/mutasi rekening operasional 6 bulan terakhir."
    And User see "Laporan keuangan dalam 1 tahun terakhir (jika ada)."

  @Sprint6Lending @C161670
  Scenario: User combine journey PO direct type UD with flagging MSME
    Given User on Main Dashboard   
    When user click button Ajukan Limit Kredit
    And User select loan type "PO"
    And user input nominal for MSME "5000000000"
    And user input loan tenor "30"
    And user click button Lanjut Isi Data Buyer
    #section select Anchor
    When user on buyer cooperating page
    And user fill a field "Buyer" with "PO test"
    And user select industry type
    And user select the year cooperating
    And user click Pilih    
    And user click button Lanjut Melengkapi Data
    And user click button Lanjut Proses KYC
    #section KYC Process
    Given user choose Business Type "UD"    
    And user click Selanjutnya
    And user take photo eKTP
    And user click "Saya Mengerti"
    And user click "Ambil Foto eKTP"
    And user click "Kirim Foto"
    And user input and save eKTP data
    And user click take "Foto Diri"
    And user click "Kirim Foto"
    And user input and save personal individual data
    And user select Pendidikan Terakhir "S1 (Sarjana)"
    And user input Nama Ibu Kandung "Tuti"
    And user input nama kerabat "Aji"
    And user input nomor kerabat "08572888999200"
    And user upload npwp individu
    And user click button Simpan Data Diri
    And user click button Simpan Alamat Tempat Tinggal
    And user select pekerjaan "Wiraswasta/Pengusaha"
    And user select sumber pendapatan "Pemasukan dari Usaha"
    And user click button Simpan Data Pekerjaan
    And system direct to Success screen of KYC process
    Then user click button Lanjut Lengkapi Data Bisnis
    #section KYB Process
    Given user in Profil Bisnis page
    When user input and save "Simpan Profil Bisnis"
    And user input and click "Simpan Daftar Direktur"
    And user input "Alamat Bisnis"
    And user checklist checkbox term and condition
    And user input "Alamat Bisnis"
    And user checklist checkbox term and condition
    And user checklist checkbox right and obligations
    And user checklist checkbox privy
    And user click button Lanjut Upload Dokumen
    And user validate description prepare the following documents 'MSMEPOUD'    
    And user click buttton Pilih Metode Upload Dokumen
    #Upload Dokumen from Aplikasi
    And user click button Langsung dari Aplikasi
    And user on Progress Upload Dokumen Page
    And user upload docuemnt "nib"
    And user upload document "npwpbisnis"
    And user upload document "SPKdok"
    And user upload document ""3contohInvoicewithBuyer"
    And user upload document "paymentMutation"
    And user upload document "1YearfinancialReports"
    And user click button Perbaharui Progres
    And user click button Kirim Pengajuan Kredit Limit
    Then user direct to "Selamat, Pengajuan Kredit Anda Berhasil Dikirim"
    And user click button Lihat Progres Pengajuan
    And user on monitoring loan process page


  @Sprint6Lending @C142730
  Scenario: validate progress monitoring loan checking document
    Given user on monitoring loan process page
    And user can see X button to back to Main Dashboard
    And user validate title "Pengajuan Limit & Upload Dokumen" on field "titleDocumentField"
    And user validate status process "Proses selesai" on field "statusCheckingDocumentField"
    And user validate content "Dengan ini Anda mengizinkan Amar Bank untuk joint account dengan rekening bank yang Anda gunakan dalam bertransaksi dengan buyer." on field "textforPO"
    And user click button Upload Ulang Dokumen
    Then user go back to page Progres Upload Dokumen

 
  @Sprint6Lending @C142732
  Scenario: user click button Simpan Dokumen
    Given user on monitoring loan process page
    When user click Upload Ulang dokumen button
    And user go back to page Upload document
    And user upload multiple document "3contohInvoicewithBuyer"
    Then user click button Simpan Dokumen
    And user will back to loan process page

  @Sprint6Lending @C142733
  Scenario: Checking Credit Analyst Process
    Given user on monitoring loan process page
    And user can see X button to back to Main Dashboard
    And user validate title "Analisa Kredit" on field "titleAnalystCreditField"
    When user validate status process "Proses saat ini" on field "statusAnalystCreditField"
    And user validate content "Dengan ini Anda mengizinkan Amar Bank untuk joint account dengan rekening bank yang Anda gunakan dalam bertransaksi dengan buyer." on field "textforPO"
    And user validate wording information "Tim Amar Bank sedang verifkasi data & dokumen yang sudah Anda upload"


  @Sprint6Lending @C142734
  Scenario: Validate bottom sheet for Metode Upload Dokumen
    Given user already apply loan but have no upload document
    When user click from Aktivitas pinjaman
    And user on Aktivitas Pinjaman Page
    And user click loan with status Pengajuan Limit & Upload Dokumen
    And user click button Pilih Metode Upload Dokumen
    Then user will see bottom sheet metode upload Dokumen

  @Sprint6Lending @C142735
  Scenario: user can select and upload multiple document for PT.Perusahaan
    Given user already apply loan but have no upload document
    When user click from Aktivitas pinjaman
    And user on Aktivitas Pinjaman Page
    And user click loan with status Pengajuan Limit & Upload Dokumen
    And user click button Pilih Metode Upload Dokumen
    And user click button Langsung dari Aplikasi
    And user upload docuemnt "nib"
    And user upload document "aktapendirian"
    And user upload document "skkemenkumhanpendirian"
    And user upload document "npwpbisnis"
    And user upload document "aktaperubahanterakhir"
    And user upload document "skkemenkumhanperubahanakhir"
    And user upload multiple document "KTPComm"
    And user upload multiple document "npwpOfComm"
    And user upload multiple document "SPKdok"
    And user upload multiple document "3contohInvoicewithBuyer"
    And user upload multiple document "paymentMutation"
    And user upload multiple document "1YearfinancialReports"

  @Sprint6Lending @C142736
  Scenario: user validate field after success upload document
    Given user already apply loan but have no upload document
    When user click from Aktivitas pinjaman
    And user on Aktivitas Pinjaman Page
    And user click loan with status Pengajuan Limit & Upload Dokumen
    And user click button Pilih Metode Upload Dokumen
    And user click button Langsung dari Aplikasi
    And user upload docuemnt "nib"
    And user upload document "aktapendirian"
    And user upload document "skkemenkumhanpendirian"
    And user upload document "npwpbisnis"
    And user upload document "aktaperubahanterakhir"
    And user upload document "skkemenkumhanperubahanakhir"
    And user upload multiple document "KTPComm"
    And user verify upload all document KTP
    And user upload multiple document "npwpOfComm"
    And user verify upload all document NPWP
    And user upload multiple document "SPKdok"
    And user verify upload all document SPK Buyer
    And user upload multiple document "3contohInvoicewithBuyer"
    And user verify upload all document Invoice Buyer
    And user upload multiple document "paymentMutation"
    And user verify upload all document Mutasi
    And user upload multiple document "1YearfinancialReports"
    And user verify upload all document Finance Report
    Then user see button Kirim Pengajuan Limit Kredit

  @Sprint6Lending @C142737
  Scenario: User add another document after the user success to uploads the previous document
    Given user already apply loan but have no upload document
    When user click from Aktivitas pinjaman
    And user on Aktivitas Pinjaman Page
    And user click loan with status Pengajuan Limit & Upload Dokumen
    And user click button Pilih Metode Upload Dokumen
    And user click button Langsung dari Aplikasi
    And user upload multiple document "ktpComm"
    And user verify upload all document KTP
    And user upload multiple document "ktpComm"
    Then user will see the document will be uploaded and show in one row below uploaded document list

  @C142738
  Scenario: user verify pop up confirmation to delete uploaded file
    Given user already apply loan but have no upload document
    When user click from Aktivitas pinjaman
    And user on Aktivitas Pinjaman Page
    And user click loan with status Pengajuan Limit & Upload Dokumen
    And user click button Pilih Metode Upload Dokumen
    And user click button Langsung dari Aplikasi
    And user upload multiple document "ktpcomm"
    And user verify upload all document KTP
    And user upload multiple document "npwpcomm"
    And user verify upload all document NPWP   
    And user click button delete file uploaded
    Then user should see pop up message to delete file "Apakah kamu yakin akan menghapus dokumen ini?"
  

  @Sprint6Lending @C142739
  Scenario: user delete uploaded file
    Given user already apply loan but have no upload document
    When user click from Aktivitas pinjaman
    And user on Aktivitas Pinjaman Page
    And user click loan with status Pengajuan Limit & Upload Dokumen
    And user click button Pilih Metode Upload Dokumen
    And user click button Langsung dari Aplikasi
    And user upload multiple document "ktpcomm"
    And user verify upload all document KTP
    And user upload multiple document "npwpcomm"
    And user verify upload all document NPWP
    And user upload multiple document "SPKdok"
    And user verify upload all document SPK Buyer
    And user click button delete file uploaded
    And user should see pop up message to delete file "Apakah kamu yakin akan menghapus dokumen ini?"
    And user click button Hapus
    Then user back to Progres Upload Dokumen page

  @C142740
  Scenario: user cancel to delete uploaded file
    Given user already apply loan but have no upload document
    When user click from Aktivitas pinjaman
    And user on Aktivitas Pinjaman Page
    And user click loan with status Pengajuan Limit & Upload Dokumen
    And user click button Pilih Metode Upload Dokumen
    And user click button Langsung dari Aplikasi
    And user upload multiple document "ktpcomm"
    And user verify upload all document KTP
    And user upload multiple document "npwpcomm"
    And user verify upload all document NPWP    
    And user click button delete file uploaded
    And user should see pop up message to delete file "Apakah kamu yakin akan menghapus dokumen ini?"
    And user click button Kembali
    Then pop up confirmation will disappear
 

  @C142741
  Scenario: user upload file more than 15MB
    Given user already apply loan but have no upload document
    When user click from Aktivitas pinjaman
    And user on Aktivitas Pinjaman Page
    And user click loan with status Pengajuan Limit & Upload Dokumen
    And user click button Pilih Metode Upload Dokumen
    And user click button Langsung dari Aplikasi
    And user upload multiple document more than 15 MB "ktpcomm"
    Then user see message for upload more than 15Mb "File melebihi maksimal ukuran 15MB."

  @Sprint6Lending @C142742
  Scenario: user validate button Kirim Pengajuan Kredit Limit after all documen uploaded
    Given user already apply loan but have no upload document
    When user click from Aktivitas pinjaman
    And user on Aktivitas Pinjaman Page
    And user click loan with status Pengajuan Limit & Upload Dokumen
    And user click button Pilih Metode Upload Dokumen
    And user click button Langsung dari Aplikasi
    And user upload docuemnt "nib"
    And user upload document "aktapendirian"
    And user upload document "skkemenkumhanpendirian"
    And user upload document "npwpbisnis"
    And user upload document "aktaperubahanterakhir"
    And user upload document "skkemenkumhanperubahanakhir"
    And user upload document "ktpcomm"
    And user upload document "npwpcomm"
    And user upload multiple document "ktpcomm"
    And user verify upload all document KTP
    And user upload multiple document "npwpcomm"
    And user verify upload all document NPWP
    And user upload multiple document "SPKdok"
    And user verify upload all document SPK Buyer
    And user upload multiple document "3contohInvoicewithBuyer"
    And user verify upload all document Invoice Buyer
    And user upload multiple document "paymentMutation"
    And user verify upload all document Mutasi
    And user upload multiple document "1YearfinancialReports"
    And user verify upload all document Finance Report
    And user see button Kirim Pengajuan Limit Kredit

  @Sprint6Lending @C142743
  Scenario: user have not upload mandatory document
    Given user already apply loan but have not upload mandatory document
    When user click from Aktivitas pinjaman
    And user on Aktivitas Pinjaman Page
    And user click loan with status Upload Dokumen
    And user click button Pilih Metode Upload Dokumen
    And user click button Langsung dari Aplikasi
    And user on Progres Upload Dokumen
    Then user will not see button Kirim Pengajuan Limit Kredit

  @Sprint6Lending @C142744
  Scenario: user back to main dashboard from progress loan page
    Given user on monitoring loan process page
    And user can see X button to back to Main Dashboard
    And user click X button
    Then user back to Main Dashboard page
