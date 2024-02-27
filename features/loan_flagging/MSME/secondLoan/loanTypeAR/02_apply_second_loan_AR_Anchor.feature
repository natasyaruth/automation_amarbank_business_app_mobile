Feature: Apply Second Loan With Flagging MSME Using AR Anchor
 As a customer lead
 I want to apply second loan using AR Anchor with MSME has flag

 Background:
  Given I am a registered customer with foll
   | userID   | bots2912   |
   | password | TestSmb123 |
  When I filling in form login with the foll
   | userID   | bots2912   |
   | password | TestSmb123 |
  And I click login
  Then I successed go to dashbord

 Scenario: User apply second loan AR anchor type with flagging MSME
  Given I click button loan dashboard
  #section input nominal
  When user click button "ajukan limit baru"
  And user Input Nominal Pinjaman more than 5 billion
  And user input loan tenor
  And user click button "Selanjutnya"
  #section domicile office
  And user select domicile office
  And user click button "Selanjutnya" in page domicile office
  And user on loan type page
  #section select schema loan type
  When user select loan type "AR"
  And user click button lihat skema pinjaman AP
  And user click button select the schema
  #section select Anchor
  When user on buyer cooperating page
  And user select one of supplier list
  And user select the date cooperating
  And user checklist checbox term and condition
  And user checklist checbox privy
  When user click button next
  #section domicile office
  And user select domicile office
  And user click button "Selanjutnya" in page domicile office
  Then direct to "Selamat, Pengajuan Berhasil Dikirim"
  And user click OK
  #section upload document
  Given user on upload document page
  When user upload document "3contohInvoicewithSupplier"
  And user upload document "paymentMutation"
  And user upload document "1YearsfinancialReports"
  And user click button refresh
  And user click back button to loan processing
  #section trigered status loan
  And user trigered api change status loan is approved