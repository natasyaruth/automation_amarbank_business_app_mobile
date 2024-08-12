Feature: Disburse for recording in smartlook                                                              
In DSMB
As a customer
I need to validate recording from smartlook


Scenario: Validate Loan Program Information for Type AP - Direct Loan
  Given I have been in anchor detail page for type AP - Direct Loan
  When I upload invoice document
  And I take the picture
  And Document invoice will be showed in "Konfirmasi Invoice"
  And user input nominal invoice
  And user input nomor invoice
  And user select tanggal invoice
  And user select tanggal jatuh tempo invoice
  And user click button Lanjut Pembayaran
  And user should be see "Perhitungan Pencairan" page
  And user  click Lanjut Cairkan pinjaman
  Then smartlook will stop record


  Scenario: user validate smartlook will record after user click Lanjut Cairkan Pinjaman
    Given user already successfully disburse
    When user go to smartlook
    And user play the record
    Then user will see smartlook record disburse until user click Lanjut Cairkan Pinjaman