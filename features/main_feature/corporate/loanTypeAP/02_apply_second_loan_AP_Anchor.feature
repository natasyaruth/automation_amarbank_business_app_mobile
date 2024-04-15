Feature: Apply Second Loan With Flagging Corporate Using AP Anchor
 As a customer lead
 I want to apply second loan using AP Anchor with Corporate has flag

 Background:
  Given I am a registered customer with following details:
   | userID   | cokr3b4e |
   | password | Test1234 |
  When I filling in form login with the following details:
   | userID   | cokr3b4e |
   | password | Test1234 |
  And I click login
  Then I successed go to dashbord
  Then I click menu tab testing

 @debt2
 Scenario: User apply second loan AP anchor type with flagging Corporate
  Given I click button loan dashboard
  #section input nominal
  When user click button apply new limit
  And user Input Nominal Pinjaman "4000000000"
  And user input loan tenor "30"
  And user click on button Selanjutnya
  And user on loan type page
  #section select schema loan type
  When user select loan type "AP"
  And user click button lihat skema pinjaman AP
  And user click button select the schema
  #section select Anchor
  Given user on the anchor page
  And user fill search anchor "Admin Kumar"
  When user select result of search
  And user on anchor cooperating page
  Then user on anchor cooperating page AP
  And user agree with the terms and condition
  And user allow to agree to use my digital signature through Privy.id
  When user click button Kirim Pengajuan Pinjaman
  #section supplier representatives has contact
  And user should see text bottom sheet "Selamat, Pengajuan Berhasil Dikirim" in field "titleBottomSheet"
  When user should see text bottom sheet "Pengajuanmu akan segera diproses oleh tim Amar Bank" in field "subTitleBottomSheet"
  And user want to click button ok
  #section upload document
  Given user click button Upload Dokumen
  And user on upload document page
  When user upload document "ktpNpwpOfComp"
  Then user upload document "proofOfPurchase"
  And user upload document "paymentMutation"
  And user upload document "financialReports"
  And user click button refresh
  And user click back button to loan processing
  #section trigered status loan
  And user trigered api change status loan is approved