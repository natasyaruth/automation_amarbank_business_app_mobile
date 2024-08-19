Feature: Coachmark display on Loan Type Page
 As a customer lead
 I want to apply first loan using AP Achor with flaging Corp

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


Scenario: Verify System will check if user first time access loan selection page
  Given User on Main Dashboard
  When user click button Ajukan Limit Kredit 
  And user on Choose Type Loan Page
  And user will show coach mark icon that will explain each loan type information
  Then user will see coachmark on AP after 1 second


Scenario: Verify coachmark in Type Loan AP
  Given User on Main Dashboard
  When user click button Ajukan Limit Kredit 
  And user on Choose Type Loan Page
  Then user will see title coacmark "Contoh Kebutuhan"
  And user will see text loan AP "Bisnis Anda membutuhkan pembayaran rutin kepada supplier bahan baku agar produksi tidak berhenti."


Scenario: Verify coachmark in Type Loan AR
  Given User on Main Dashboard
  When user click button Ajukan Limit Kredit 
  And user on Choose Type Loan Page
  And user will see title coacmark "Contoh Kebutuhan"
  And user will see text loan AP "Bisnis Anda membutuhkan pembayaran rutin kepada supplier bahan baku agar produksi tidak berhenti."
  And User click chevron to AR button
  Then user will see title coacmark "Contoh Kebutuhan"
  And user will see text loan AR "Pembeli Anda belum membayar tagihan faktur, sementara Anda perlu dana sekarang."


Scenario: Verify coachmark in type Loan PO
  Given User on Main Dashboard
  When user click button Ajukan Limit Kredit 
  And user on Choose Type Loan Page
  And user will see title coacmark "Contoh Kebutuhan"
  And user will see text loan AP "Bisnis Anda membutuhkan pembayaran rutin kepada supplier bahan baku agar produksi tidak berhenti."
  And User click chevron to AR button
  And user will see title coacmark loan "Contoh Kebutuhan"
  And user will see text loan AR "Pembeli Anda belum membayar tagihan faktur, sementara Anda perlu dana sekarang."
  And User click chevron to PO button
  And user will see title coacmark  "Contoh Kebutuhan"
  And user will see text loan PO "Misal Anda adalah kontraktor yang mendapat projek dari Bouwheer. Anda membutuhkan dana untuk membeli bahan baku dari berbagai macam supplier"


 Scenario: User Reopen Coach Mark after access select loan type for the second time
    Given User on Main Dashboard
    When user click button Ajukan Limit Kredit 
    And user on Choose Type Loan Page
    And user will see title coacmark again "Lihat Panduan Lagi"
    And user will see text after reopen "klik ikon ini jika Anda memerlukan panduan lagi untuk mempelajari skema pinjaman."
    Then user click close button to end the coachmark
    













  




