Feature: Apply Loan Only with new drop off management
 As a customer lead
 I want to apply second loan 

 Background:
    Given I am a registered customer with foll
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
    Then I click menu tab testing
    And I click button loan dashboard



Scenario: User apply loan only drop off before submit detail kredit
    Given User click button loan dashboard
    When user click button Ajukan Limit Baru 
    And User select loan type "AP"
    And User on Loan Needs Page
    And User choose nominal "Lebih dari 5 Milyar" 
    And user input nominal for Corp "7000000000"
    And user click button Save
    And user input tenor "30"
    And user click button Lanjut Isi Data Supplier
    And click back to Detail kredit page
    And back to select loan type page
    And back to Main dashboard


Scenario: User validate status Pengajuan Limit on apply loan only
    Given user on main dashboard
    When user should see text card "Kredit Bisnis untuk berbagai kebutuhan usaha" on field "textViewBodyDesc"       
    And user should see text card "Aktivitas Pinjaman" on field "textCardActivityLoan"
    And user should see text card "1" on field "textCardValueProcess"
    And user should see text card "Proses" on field "textCardProcess"   
    And user click button Aktivitas Pinjaman
    And user on Aktvitas Pinjaman page
    And user see text card Pengajuan Limit


Scenario: User continue journey apply loan only from status Pengajuan Limit
    Given user on Aktivitas Pinjaman
    When user click card with status Pengajuan Limit 
    And user on Detail Kredit Page
    And user click button Lanjut isi data supplier
    And user on buyer cooperating page
    And user select another buyer
    And user fill a field "anchorName" with "AP Direct Tes"
    And user select industry type
    And user select the date cooperating
    And user input business address
    #section supplier representatives has contact
    And user input supplier representatives name
    And user input contact name
    And user input email address supplier
    And user click button Lanjut Upload Dokumen
    And user validate description prepare the following documents 'SecondCorpAPPT.Perusahaan' 
    And user click X button


Scenario: User validate Drop Off Upload Document 
    Given user on main dashboard
    When user should see text card "Kredit Bisnis untuk berbagai kebutuhan usaha" on field "textViewBodyDesc"       
    And user should see text card "Aktivitas Pinjaman" on field "textCardActivityLoan"
    And user should see text card "1" on field "textCardValueProcess"
    And user should see text card "Proses" on field "textCardProcess"      
    And user click button Aktivitas Pinjaman
    And user on Aktvitas Pinjaman page
    And user see text card Upload Dokumen


Scenario: User continue journey from status Upload Dokumen
    Given user on Aktivitas Pinjaman
    When user click card with status Upload Dokumen  
    And user validate description prepare the following documents 'SecondCorpAPPT.Perusahaan'
    And user click buttton Pilih Metode Upload Dokumen        
    #section upload document
    And user click button Langsung dari Aplikasi
    And user on Progress Upload Dokumen Page    
    And user upload document "ktpofComm"    
    And user upload document "npwpOfComm"
    And user upload document "3contohInvoicewithSupplier"
    And user upload document "paymentMutation"
    And user upload document "2YearfinancialReports"
    And user click button Perbaharui Progres
    And user click button Kirim Pengajuan Kredit Limit
    Then user direct to "Selamat, Pengajuan Kredit Anda Berhasil Dikirim"
    And user click button Lihat Progres Pengajuan
    And user on monitoring loan process page
