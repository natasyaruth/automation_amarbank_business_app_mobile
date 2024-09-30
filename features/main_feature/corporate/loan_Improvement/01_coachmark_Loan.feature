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

@FunctTestLending
Scenario: Verify System will check if user first time access loan selection page
  Given User on Main Dashboard
  When user click button Ajukan Limit Kredit 
  And user on Choose Type Loan Page
  And user will show coach mark icon that will explain each loan type information
  Then user will see coachmark on AP after 1 second

@FunctTestLending
Scenario: Verify coachmark in Type Loan AP
  Given User on Main Dashboard
  When user click button Ajukan Limit Kredit 
  And user on Choose Type Loan Page
  Then user will see title coacmark "Contoh Kebutuhan"
  And user will see text loan AP "Bisnis Anda membutuhkan pembayaran rutin kepada supplier bahan baku agar produksi tidak berhenti."

@FunctTestLending
Scenario: Verify coachmark in Type Loan AR
  Given User on Main Dashboard
  When user click button Ajukan Limit Kredit 
  And user on Choose Type Loan Page
  And user will see title coacmark "Contoh Kebutuhan"
  And user will see text loan AP "Bisnis Anda membutuhkan pembayaran rutin kepada supplier bahan baku agar produksi tidak berhenti."
  And User click chevron to AR button
  Then user will see title coacmark "Contoh Kebutuhan"
  And user will see text loan AR "Pembeli Anda belum membayar tagihan faktur, sementara Anda perlu dana sekarang."

@FunctTestLending
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

@FunctTestLending
 Scenario: verify user back to icon coachmark
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
    And user click chevron to icon coachmark
    And user will back to icon coachmark "Lihat Panduan Lagi"
    And user will see text "Klik ikon ini jika Anda memerlukan panduan lagi untuk mempelajari skema pinjaman."
    Then user click close button to end the coachmark
    

@FunctTestLending
  Scenario: add entry point to reopen coach mark
    Given User on Loan Dashboard
    When user click button Ajukan Limit Baru
    And user on Choose Type Loan Page
    And user click coachmark icon  
    And user will see title coacmark "Contoh Kebutuhan"
    And user will see text loan AP "Bisnis Anda membutuhkan pembayaran rutin kepada supplier bahan baku agar produksi tidak berhenti."
    And User click chevron to AR button
    And user will see title coacmark loan "Contoh Kebutuhan"
    And user will see text loan AR "Pembeli Anda belum membayar tagihan faktur, sementara Anda perlu dana sekarang."
    And User click chevron to PO button
    And user will see title coacmark  "Contoh Kebutuhan"
    And user will see text loan PO "Misal Anda adalah kontraktor yang mendapat projek dari Bouwheer. Anda membutuhkan dana untuk membeli bahan baku dari berbagai macam supplier"
    And user click chevron to icon coachmark
    And user will back to icon coachmark "Lihat Panduan Lagi"
    And user will see text "Klik ikon ini jika Anda memerlukan panduan lagi untuk mempelajari skema pinjaman."
    Then user click close button to end the coachmark  
    













  




