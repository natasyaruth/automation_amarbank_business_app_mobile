Feature: Apply Loan With Flagging Corporate Using AR Anchor After Registration Giro Account
 As a customer lead
 I want to apply loan using AR Anchor with Corporate has flag after registration Giro Account

 Background:
  Given I am a registered customer with foll
   | userID   | bots2912   |
   | password | TestSmb123 |
  When I filling in form login with the foll
   | userID   | bots2912   |
   | password | TestSmb123 |
  And I click login
  Then I successed go to dashbord

 Scenario: User apply loan AR anchor type with flagging Corporate after registration giro account
  Given I click button loan dashboard
  #section input nominal
  When user click button "Ajukan Peminjaman"
  And user Input Nominal Pinjaman more than 5 billion
  And user input loan tenor
  And user click button "Selanjutnya"
  And user on loan type page
  #section select schema loan type
  When user select loan type "AP"
  And user click button lihat skema pinjaman AP
  And user click button select the schema
  #section select Anchor
  When user on buyer cooperating page
  And user select one of supplier list
  And user select the date cooperating
  And user checklist checbox term and condition
  When user click button "Kirim Pengajuan Pinjaman"
  Then direct to "Selamat, Pengajuan Berhasil Dikirim"
  And user click OK
  #section upload document
  Given user on upload document page
  And user upload document "paymentMutation"
  And user upload document "2YearsfinancialReports"
  And user click button refresh
  And user click back button to loan processing
  #section trigered status loan
  And user trigered api change status loan is approved