Feature: Apply Loan then receive form FPK
    In Apply Loan Page
    As a customer
    I want to apply loan and debtor submit credit application from mobile apps, then system will auto generate credit application form



Scenario: User apply second loan AR
    Given User click button loan dashboard
    When user click button Ajukan Limit Baru 
    And User select loan type "AR"
    And User on Loan Needs Page
    And User choose nominal "Lebih dari 5 Milyar" 
    And user input nominal for Corp "15000000000"
    And user click button Save
    And user input tenor "90"
    And user click button Lanjut Isi Data Supplier 
    #section select Anchor    
    And user fill search anchor "PT Tirta Investama"
    And click button Pilih Buyer Ini   
    And user select year cooperating  "2020"   
    And user click Pilih       
    And user tick on Terms & condition
    And user click button Lanjut Upload Dokumen 
    Then system will auto generate credit application form (FPK) included apply loan T&C
    

Scenario: Validate generate FPK after submit AR loan application
    Given I recieve email after submit loan application
    When I see the title "Pengajuan Pinjaman Anda Berhasil Dikirim" and also attachment of FPK
    And I click the email  
    And I see "Skema"
    And I see "Nama Supplier"
    And I click button Cek Proses Disini    
    Then I direct to page apply progres loan

Scenario: Checking Template of FPK
    Given I have download the FPK
    When I open the PDF file
    And I see Nomor Pengajuan
    And I see Tanggal Pengajuan
    And I see Badan Usaha
    And I see Nama
    And I see Bidang Usaha
    And I see Alamat Utama Kantor/ Usaha
    And I see No.NPWP/ KTP
    And I see Nama Direktur
    And I see Alamat Tinggal saat Ini
    And I see No.Handphone
    And I see Fasilitas yang Dimohon
    And I see Pengajuan Limit
    And I see Pengajuan Tenor
    And I see Jangka Waktu
    And I see Tujuan Pengajuan
