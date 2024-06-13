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


    Scenario: User apply second loan AR Anchor and want to see AP loan schema
        Given I click button loan dashboard  
        #section select loan type
        When user click button ajukan pinjaman    
        #section wants to see loan schema
        And User click button Pelajari Tipe Skema Kredit
        And User click button "Supplier Financing"
        Then System will display Schema of Supplier Financing

    Scenario: User apply first loan PO and want to see PO loan schema
       Given I click button loan dashboard  
        #section select loan type
        When user click button ajukan pinjaman    
        #section wants to see loan schema
        And User click button Pelajari Tipe Skema Kredit
        And User click button Supplier Financing
        Then System will display Schema of Supplier Financing


    Scenario: Validate error input tenor below min 30 hari 
        Given I click button loan dashboard
        When user click button ajukan pinjaman
        And User select loan type "AP"
        And user on select loan Needs Page 
        And User choose nominal "Rp50 juta - 5 Miliar"       
        And user input tenor "1"
        And user click button Lanjut Isi Data Bouwheer    
        Then user user see error message "Min.tenor 30 hari, Max tenor 180 hari"

    Scenario: Validate error input tenor more than 180 hari 
        Given I click button loan dashboard
        When user click button ajukan pinjaman
        And User select loan type "AP"
        And user on select loan Needs Page 
        And User choose nominal "Rp50 juta - 5 Miliar"       
        And user input tenor "1"
        And user click button Lanjut Isi Data Bouwheer
        Then user user see error message "Min.tenor 30 hari, Max tenor 180 hari"

    Scenario: User apply second loan PO direct type with business type PT. Perusahaan with flagging MSME
        Given I click button loan dashboard
        When user click button "ajukan limit baru"
        And User select loan type "AP"
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
        And user validate content list of documents for PT.Perusahaan
        And user click buttton Pilih Metode Upload Dokumen
        #Upload Dokumen from Aplikasi
        And user click button Langsung dari Aplikasi
        And user on Progress Upload Dokumen Page
        And user upload document "KTPandnpwpOfComp"
        And user upload document "3contohInvoicewithSupplier"
        And user upload document "paymentMutation"
        And user upload document "1YearfinancialReports"
        And user click button Perbaharui Progres
        And user click button Kirim Pengajuan Kredit Limit
        Then direct to "Selamat, Pengajuan Kredit Anda Berhasil Dikirim"
        And user click button Lihat Progres Pengajuan
        And user on monitoring loan process page
        # section trigered status loan
        And user trigered api change status loan is approved
        

     Scenario: User apply second loan PO direct type with business type Individu with flagging MSME
        Given I click button loan dashboard
        When user click button "ajukan limit baru"
        And User select loan type "AP"
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
        And user validate content list of documents for PT.Perusahaan
        And user click buttton Pilih Metode Upload Dokumen
        #Upload Dokumen from Aplikasi
        And user click button Langsung dari Aplikasi
        And user on Progress Upload Dokumen Page
        And user upload document "3contohInvoicewithSupplier"
        And user upload document "paymentMutation"
        And user upload document "1YearfinancialReports"
        And user click button Perbaharui Progres
        And user click button Kirim Pengajuan Kredit Limit
        Then direct to "Selamat, Pengajuan Kredit Anda Berhasil Dikirim"
        And user click button Lihat Progres Pengajuan
        And user on monitoring loan process page
        # section trigered status loan
        And user trigered api change status loan is approved

    Scenario: Validate Card Limit For Type Loan PO
        Given I have been on Loan Dashboard to see the loan type of Loan AP
        When I validate the card of "Loan AP"
        Then I should see the wording dan card design of "Loan AP"
        And user click button back
        And user should see text view "Selamat, Limit Pinjaman Telah Aktif" on bottom sheet "titleLimitPinjaman"
        And user should see text bottom sheet "Limit Tersedia" in field "titleLimitTersedia"
        And user should see text bottom sheet "Bouwheer" in field "titleSupplier"
        And user should see text bottom sheet "No. Pinjaman" in field "titleNoPinjaman"
        And user click button copy
        And user should see text bottom sheet "Informasi Tambahan" in field "titleInformasiTambahan"
        And user click button lihat pinjaman

    