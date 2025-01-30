Feature: Apply Second Loan With Flagging MSME Using PO Direct
    As a customer lead
    I want to apply second loan using PO Direct with MSME has flag

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


    @C142886
    Scenario: User apply second loan PO Anchor and want to see PO loan schema
        Given User click button loan dashboard
        When user click button Ajukan Limit Baru   
        #section wants to see loan schema
        And User click button Pelajari Tipe Skema Kredit
        And User click button "Project Financing"
        Then System will display Schema of Project Financing

   
  @C142888
  Scenario: Validate error input tenor below min 30 hari 
     Given User click button loan dashboard
    When user click button Ajukan Limit Baru
    And User select loan type "PO"  
    And user input nominal for MSME "5000000000"
    And user click button Save
    And user input tenor "10"
    And user click button Lanjut Isi Data Supplier
    Then user user see error message "Minimal tenor 30 hari"

  @C142889
  Scenario: Validate error input tenor more than 180 hari 
    Given User click button loan dashboard
    When user click button Ajukan Limit Baru
    And User select loan type "AP"  
    And user input nominal for MSME "5000000000"
    And user click button Save
    And user input tenor "300"
    And user click button Lanjut Isi Data Supplier
    Then user user see error message "Maximal tenor 30 hari"


    Scenario: User verify new required document apply second loan for PO PT.Perusahaan
      Given User on drop off Upload Dokumen
      When User click Aktifitas Pinjaman
      And User click loan with status "Upload Dokumen"
      Then I should see the following document requirements:
        | KTP Komisioner & Pemegang Saham                                                                         |
        | NPWP Komisioner & Pemegang Saham                                                                        |
        | Surat Perintah Kerja (SPK) dari Buyer saat ini atau Buyer lainnya dengan produk yang sama"              |
        | Minimal 3 contoh invoice dengan supplier saat ini atau supplier lainnya dengan produk yang sama."       |
        | Rekening koran/mutasi rekening operasional 6 bulan terakhir."                                           |
        | Laporan keuangan dalam 1 tahun terakhir (jika ada). "                                                   |
      And I see buttton Pilih Metode Upload Dokumen
       

    Scenario: User verify new required document apply second loan PO PT.Perorangan
      Given User on drop off Upload Dokumen
      When User click Aktifitas Pinjaman
      And User click loan with status "Upload Dokumen"
      Then I should see the following document requirements "SecondPOPerorangan"
        | Surat Perintah Kerja (SPK) dari Buyer saat ini atau Buyer lainnya dengan produk yang sama"              |
        | Minimal 3 contoh invoice dengan supplier saat ini atau supplier lainnya dengan produk yang sama."       |
        | Rekening koran/mutasi rekening operasional 6 bulan terakhir."                                           |
        | Laporan keuangan dalam 1 tahun terakhir (jika ada). "                                                   |
      And I see buttton Pilih Metode Upload Dokumen           
        


    Scenario: User verify new required document apply second loan PO UD
      Given User on drop off Upload Dokumen
      When User click Aktifitas Pinjaman
      And User click loan with status "Upload Dokumen"
      Then I should see the following document requirements "SecondPOUD"
        | Surat Perintah Kerja (SPK) dari Buyer saat ini atau Buyer lainnya dengan produk yang sama"              |
        | Minimal 3 contoh invoice dengan supplier saat ini atau supplier lainnya dengan produk yang sama."       |
        | Rekening koran/mutasi rekening operasional 6 bulan terakhir."                                           |
        | Laporan keuangan dalam 1 tahun terakhir (jika ada). "                                                   |
      And I see buttton Pilih Metode Upload Dokumen           
        


    Scenario: User verify new required document apply second loan PO Individu
      Given User on drop off Upload Dokumen
      When User click Aktifitas Pinjaman
      And User click loan with status "Upload Dokumen"
      Then I should see the following document requirements "SecondPOUD"
        | Surat Perintah Kerja (SPK) dari Buyer saat ini atau Buyer lainnya dengan produk yang sama"              |
        | Minimal 3 contoh invoice dengan supplier saat ini atau supplier lainnya dengan produk yang sama."       |
        | Rekening koran/mutasi rekening operasional 6 bulan terakhir."                                           |
        | Laporan keuangan dalam 1 tahun terakhir (jika ada). "                                                   |
      And I see buttton Pilih Metode Upload Dokumen


    @C142890
    Scenario: User apply second loan PO direct type with business type PT. Perusahaan with flagging MSME
        Given User click button loan dashboard
        When user click button Ajukan Limit Baru
        And User select loan type "PO"
        And user input nominal for MSME "5000000000"
        And user click button Lanjut Isi Data Buyer
        #section select Anchor
        When user on buyer cooperating page
        And user fill a field "Buyer" with "Po Test Nurul"
        And user select industry type "Agrikultur atau Perikanan"
        And user select the date cooperating
        And user checklist checkbox Privy term and condition
        And user click button Lanjut Upload Dokumen      
        And user validate description prepare the following documents 'SecondMSMEPOPT.Perusahaan'
        And user click buttton Pilih Metode Upload Dokumen
        #Upload Dokumen from Aplikasi
        And user click button Langsung dari Aplikasi
        And user on Progress Upload Dokumen Page
        And user upload document "KTPcomm"
        And user upload document "npwpOfComp"
        And user upload document "SPK"
        And user upload document "3contohInvoicewithSupplier"
        And user upload document "paymentMutation"
        And user upload document "1YearfinancialReports"
        And user click button Perbaharui Progres
        And user click button Kirim Pengajuan Kredit Limit
        Then user direct to "Selamat, Pengajuan Kredit Anda Berhasil Dikirim"
        And user click button Lihat Progres Pengajuan
        And user on monitoring loan process page
        # section trigered status loan
        And user trigered api change status loan is approved
        
    

    @C142891
     Scenario: User apply second loan PO direct type with business type Individu with flagging MSME
        Given User click button loan dashboard
        When user click button Ajukan Limit Baru
        And User select loan type "PO"
        And user input nominal for MSME "5000000000"
        And user input loan tenor "30" 
        And user click button Lanjut Isi Data Buyer
        #section select Anchor
        When user on buyer cooperating page
        And user fill a field "Buyer" with "Po Test Nurul"
        And user select industry type "Agrikultur atau Perikanan"
        And user select the date cooperating
        And user checklist checkbox Privy term and condition
        And user click button Lanjut Upload Dokumen      
        And user validate content list of documents for PO PT.Perusahaan
        And user click buttton Pilih Metode Upload Dokumen
        #Upload Dokumen from Aplikasi
        And user click button Langsung dari Aplikasi
        And user on Progress Upload Dokumen Page
        And user upload document "SPK"
        And user upload docuemnt "3contohInvoicewithBuyer"
        And user upload document "paymentMutation"
        And user upload document "1YearfinancialReports"
        And user click button Perbaharui Progres
        And user click button Kirim Pengajuan Kredit Limit
        Then user direct to "Selamat, Pengajuan Kredit Anda Berhasil Dikirim"
        And user click button Lihat Progres Pengajuan
        And user on monitoring loan process page
        # section trigered status loan
        And user trigered api change status loan is approved

    
    
    @C142892
    Scenario: Validate bottom sheet for Metode Upload Dokumen
      Given user already apply loan but have no upload document
      When user click from Aktivitas pinjaman
      And user on Aktivitas Pinjaman Page
      And user click loan with status Pengajuan Limit & Upload Dokumen
      And user click button Pilih Metode Upload Dokumen
      Then user will see bottom sheet metode upload Dokumen

@C142893
Scenario: validate progress monitoring loan checking document
    Given user on monitoring loan process page
    And user can see X button to back to Main Dashboard
    And user validate title "Pengajuan Limit & Upload Dokumen" on field "titleDocumentField"
    And user validate status process "Proses selesai" on field "statusCheckingDocumentField"
    And user validate content "Dengan ini Anda mengizinkan Amar Bank untuk joint account dengan rekening bank yang Anda gunakan dalam bertransaksi dengan buyer." on field "textforPO"    
    And user click button Upload Ulang Dokumen
    Then user go back to page Progres Upload Dokumen


@C142894
Scenario: user click button Simpan Dokumen
    Given user on monitoring loan process page
    When user click Upload Ulang dokumen button
    And user go back to page Upload document
    And user upload multiple document "KTPComm"  
    Then user click button Simpan Dokumen
    And user will back to loan process page

@C142895
Scenario: Checking Credit Analyst Process
    Given user on monitoring loan process page
    And user can see X button to back to Main Dashboard
    And user validate title "Analisa Kredit" on field "titleAnalystCreditField"
    When user validate status process "Proses saat ini" on field "statusAnalystCreditField"
    And user validate content "Dengan ini Anda mengizinkan Amar Bank untuk joint account dengan rekening bank yang Anda gunakan dalam bertransaksi dengan buyer." on field "textforPO"
    And user validate wording information "Tim Amar Bank sedang verifkasi data & dokumen yang sudah Anda upload"


@C142896
Scenario: user can select and upload multiple document for PT.Perusahaan
  Given user already apply loan but have no upload document
  When user click from Aktivitas pinjaman
  And user on Aktivitas Pinjaman Page
  And user click loan with status Upload Dokumen
  And user click button Pilih Metode Upload Dokumen
  And user click button Langsung dari Aplikasi  
  And user upload multiple document "KTPComm"    
  And user upload multiple document "npwpOfComm"
  And user upload multiple document "SPKdok"  
  And user upload multiple document "3contohInvoicewithSupplier"
  And user upload multiple document "paymentMutation"
  And user upload multiple document "1YearfinancialReports"  
  Then I should see all documents uploaded successfully
 

@C142897
Scenario: User successfully uploads multiple documents
  Given user already apply loan but have no upload document
  When user click from Aktivitas pinjaman
  And user on Aktivitas Pinjaman Page
  And user click loan with status Pengajuan Limit & Upload Dokumen
  And user click button Pilih Metode Upload Dokumen
  And user click button Langsung dari Aplikasi  
  And user upload multiple document "KTPComm"     
  And user upload multiple document "npwpOfComm"
  And user upload multiple document "SPKdok"
  And user upload multiple document "3contohInvoicewithSupplier"
  And user upload multiple document "paymentMutation"
  And user upload multiple document "1YearfinancialReports"
  And user verify upload all document Finance Report
  Then user see button Kirim Pengajuan Limit Kredit
 

  
@C142899
Scenario: User successfully uploads multiple documents Individu
  Given user already apply loan but have no upload document
  When user click from Aktivitas pinjaman
  And user on Aktivitas Pinjaman Page
  And user click loan with status Pengajuan Limit & Upload Dokumen
  And user click button Pilih Metode Upload Dokumen
  And user click button Langsung dari Aplikasi   
  And user upload multiple document "SPKdok"  
  And user upload multiple document "3contohInvoicewithBuyer"  
  And user upload multiple document "paymentMutation"  
  And user upload multiple document "1YearfinancialReports" 
  Then user see button Kirim Pengajuan Limit Kredit
 


@C142902
Scenario: user verify pop up confirmation to delete uploaded file
  Given user already apply loan but have no upload document
  When user click from Aktivitas pinjaman
  And user on Aktivitas Pinjaman Page
  And user click loan with status Pengajuan Limit & Upload Dokumen
  And user click button Pilih Metode Upload Dokumen
  And user click button Langsung dari Aplikasi  
  And user upload multiple document "SPKdok"  
  And user upload multiple document "paymentMutation"  
  And user upload multiple document "1YearfinancialReports"  
  And user click button delete file uploaded
  Then user should see pop up message to delete file "Apakah kamu yakin akan menghapus dokumen ini?" 


@C142903
Scenario: user delete uploaded file
  Given user already apply loan but have no upload document
  When user click from Aktivitas pinjaman
  And user on Aktivitas Pinjaman Page
  And user click loan with status Upload Dokumen
  And user click button Pilih Metode Upload Dokumen
  And user click button Langsung dari Aplikasi  
  And user upload multiple document "SPKdok"  
  And user upload multiple document "3contohInvoicewithBuyer"
  And user click button delete file uploaded
  And user should see pop up message to delete file "Apakah kamu yakin akan menghapus dokumen ini?" 
  And user click button Hapus
  Then user back to Progres Upload Dokumen page


@C142904
Scenario: user cancel to delete uploaded file
  Given user already apply loan but have no upload document
  When user click from Aktivitas pinjaman
  And user on Aktivitas Pinjaman Page
  And user click loan with status Pengajuan Limit & Upload Dokumen
  And user click button Pilih Metode Upload Dokumen
  And user click button Langsung dari Aplikasi  
  And user upload multiple document "SPKdok"  
  And user click button delete file uploaded
  And user should see pop up message to delete file "Apakah kamu yakin akan menghapus dokumen ini?" 
  And user click button Kembali
  Then pop up confirmation will disappear

@C142905
Scenario: user upload file more than 15MB
  Given user already apply loan but have no upload document
  When user click from Aktivitas pinjaman
  And user on Aktivitas Pinjaman Page
  And user click loan with status Pengajuan Limit & Upload Dokumen
  And user click button Pilih Metode Upload Dokumen
  And user click button Langsung dari Aplikasi
  And user upload multiple document more than 15 MB "SPKdok"  
  Then user see message for upload more than 15Mb "File melebihi maksimal ukuran 15MB."


  Scenario: User uploads one invalid document
    Given user already apply loan but have no upload document
    When user click from Aktivitas pinjaman
    And user on Aktivitas Pinjaman Page
    And user click loan with status Pengajuan Limit & Upload Dokumen
    And user click button Pilih Metode Upload Dokumen
    And user click button Langsung dari Aplikasi
    And user upload invalid multiple document "SPKdok" 
    Then I should see an error message "Format file: PDF"
  

@C142907
Scenario: user have not upload mandatory document
  Given user already apply loan but have not upload mandatory document
  When user click from Aktivitas pinjaman
  And user on Aktivitas Pinjaman Page
  And user click loan with status Upload Dokumen
  And user click button Pilih Metode Upload Dokumen
  And user click button Langsung dari Aplikasi
  And user on Progres Upload Dokumen
  Then user will not see button Kirim Pengajuan Limit Kredit

@C142908
Scenario: user back to main dashboard from progress loan page
  Given user on monitoring loan process page
  And user can see X button to back to Main Dashboard
  And user click X button
  Then user back to Main Dashboard page

