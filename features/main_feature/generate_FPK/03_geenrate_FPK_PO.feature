
Feature: Apply Loan then receive form FPK
    In Apply Loan Page
    As a customer
    I want to apply loan and debtor submit credit application from mobile apps, then system will auto generate credit application form


Scenario: User apply second loan PO direct 
        Given User click button loan dashboard
        When user click button Ajukan Limit Baru
        And User select loan type "PO"
        And User on Loan Needs Page
        And User on nominal "Rp50 juta - 5 Miliar"
        And user input loan tenor "30" 
        And user click button Lanjut Isi Data Bouwheer
        #section select Anchor
        When user on buyer cooperating page
        And user fill a field "BowheerName" with "Po Test Nurul"
        And user select industry type "Agrikultur atau Perikanan"
        And user select the date cooperating
        And user checklist checkbox Privy term and condition
        And user click button Lanjut Upload Dokumen 


Scenario: Validate generate FPK after submit PO loan application
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