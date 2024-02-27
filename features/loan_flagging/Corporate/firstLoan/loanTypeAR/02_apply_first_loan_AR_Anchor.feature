Feature: Apply First Loan With Flagging Corporate Using AR Anchor
 As a customer lead
 I want to apply first loan using AR Anchor with Corporate has flag

 Background:
  Given I am a registered customer with foll
   | userID   | bots2912   |
   | password | TestSmb123 |
  When I filling in form login with the foll
   | userID   | bots2912   |
   | password | TestSmb123 |
  And I click login
  Then I successed go to dashbord

 Scenario: User apply first loan AR Anchor type with flagging Corporate
  Given I click button loan dashboard
  #section input nominal
  When user click button ajukan pinjaman
  And user Input Nominal Pinjaman more than 5 billion
  And user input loan tenor
  And user click button "Selanjutnya"
  And user on loan type page
  #section select schema loan type
  When user select loan type "AR"
  And user click button lihat skema pinjaman AR
  And user click button select the schema
  #section select Anchor
  When user on buyer cooperating page
  And user select one of supplier list
  And user select the date cooperating
  When user click button next
  Then system show success screen
  And direct to success screen contiuesly fill the data
  #section KYC Process
  Given user choose Business Type "PT Perusahaan"
  And user click Selanjutnya
  And user take photo eKTP
  And user click "Saya Mengerti"
  And user click "Ambil Foto eKTP"
  And user click "Kirim Foto"
  And user input and save eKTP data
  And user click take "Foto Diri"
  And user click "Kirim Foto"
  And user input and save personal individual data
  And user select domicile address
  When user input "Data Pekerjaan"
  And click "Simpan Data Pekerjaan"
  And system direct to Success screen
  Then user click button "Lanjut Lengkapi Data Bisnis"
  #section KYB Process
  Given user in "Data Pekerjaan" filled
  When user input and save "Profil Bisnis"
  And user input and click "Simpan Daftar Direktur"
  And user input and save "Alamat Bisnis"
  Then direct to "Selamat, Pengajuan Berhasil Dikirim"
  And user click OK
  #section upload document
  Given user on upload document page
  When user upload document "KTPandnpwpOfComp"
  And user upload document "3contohInvoicewithSupplier"
  And user upload document "paymentMutation"
  And user upload document "2YearsfinancialReports"
  And user click button refresh
  And user click back button to loan processing
  #section trigered status loan
  And user trigered api change status loan is approved