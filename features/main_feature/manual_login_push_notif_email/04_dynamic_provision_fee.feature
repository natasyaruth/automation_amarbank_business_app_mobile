Feature: Dynamic Provision Fee Setup Based on LMS Program Configuration
    In order to test provision fee
    As a customer
    I am able to see provision fee on mobile app

    Scenario: validate display provision fee Information method is every disbursement when Offering loan AP Anchor Corp
        Given I have succesfully apply loan and set up provision fee in LMS
        When I go to page History
        And I see loan with status "tanda tangan sebelum"
        When I click on the card loan
        Then I see provision fee on detail information loan

    Scenario: validate display provision fee Information method is every disbursement when Apply loan AP Anchor Corp
        Given I have succesfully apply loan and set up provision fee in LMS
        When I go to page History
        And I see loan with status aktif
        When I click button Gunakan Limit
        And I see information limit tersedia and card disbursement
        When I click Info Selengkapnya
        Then I see provision fee on detail information loan

    Scenario: validate display provision fee information method is every disbursement when Disbursement AP Anchor Corp
        Given I have succesfully disbursement for loan AP Anchor Corp
        When I go to page History
        And I click tab Pencairan
        And I click menu Berhasil dicairkan
        And I click card AP Anchor Corp
        When I click Lihat perhitungan pencairan
        And I see provision fee percentage
        And I see provision fee amount

    Scenario: validate display provision fee information method is every disbursement when Repayment AP Anchor Corp
        Given I have succesfully disbursement for loan AP Anchor Corp
        When I go to page History
        And I click tab Tagihan
        And I click card AP Anchor Corp
        When I click lihat detail
        And I see provision fee percentage
        And I see provision fee amount

    Scenario: validate display provision fee Information method is every disbursement when Offering loan AR Direct MSME 
        Given I have succesfully apply loan and set up provision fee in LMS
        When I go to page History
        And I see loan with status "tanda tangan sebelum"
        When I click on the card loan
        Then I see provision fee on detail information loan

    Scenario: validate display provision fee Information method is every disbursement when Apply loan AR Direct MSME
        Given I have succesfully apply loan and set up provision fee in LMS
        When I go to page History
        And I see loan with status aktif
        When I click button Gunakan Limit
        And I see information limit tersedia and card disbursement
        When I click Info Selengkapnya
        Then I see provision fee on detail information loan

    Scenario: validate display provision fee information method is every disbursement when Disbursement AR Direct MSME
        Given I have succesfully disbursement for loan AR Direct MSME
        When I go to page History
        And I click tab Pencairan
        And I click menu Berhasil dicairkan
        And I click card AR Direct MSME
        When I click Lihat perhitungan pencairan
        And I see provision fee percentage
        And I see provision fee amount

    Scenario: validate display provision fee information method is every disbursement when Repayment AR Direct MSME
        Given I have succesfully disbursement for loan AR Direct MSME
        When I go to page History
        And I click tab Tagihan
        And I click card AR Direct MSME
        When I click lihat detail
        And I see provision fee percentage
        And I see provision fee amount

    Scenario: validate display provision fee Information method is every disbursement when Offering loan PO Direct MSME 
        Given I have succesfully apply loan and set up provision fee in LMS
        When I go to page History
        And I see loan with status "tanda tangan sebelum"
        When I click on the card loan
        Then I see provision fee on detail information loan

    Scenario: validate display provision fee Information method is every disbursement when Apply loan PO Direct MSME
        Given I have succesfully apply loan and set up provision fee in LMS
        When I go to page History
        And I see loan with status aktif
        When I click button Gunakan Limit
        And I see information limit tersedia and card disbursement
        When I click Info Selengkapnya
        Then I see provision fee on detail information loan

    Scenario: validate display provision fee information method is every disbursement when Disbursement PO Direct MSME
        Given I have succesfully disbursement for loan PO Direct MSME
        When I go to page History
        And I click tab Pencairan
        And I click menu Berhasil dicairkan
        And I click card PO Direct MSME
        When I click Lihat perhitungan pencairan
        And I see provision fee percentage
        And I see provision fee amount

    Scenario: validate display provision fee information method is every disbursement when Repayment AR Direct MSME
        Given I have succesfully disbursement for loan PO Direct MSME
        When I go to page History
        And I click tab Tagihan
        And I click card PO Direct MSME
        When I click lihat detail
        And I see provision fee percentage
        And I see provision fee amount

    Scenario: validate display provision fee Information method is facility approved when Offering loan AP Direct Corp 
        Given I have succesfully apply loan and set up provision fee in LMS
        When I go to page History
        And I see loan with status "tanda tangan sebelum"
        When I click on the card loan
        Then I see provision fee on detail information loan

    Scenario: validate display provision fee Information method is facility approved when Apply loan AP Direct Corp
        Given I have succesfully apply loan and set up provision fee in LMS
        When I go to page History
        And I see loan with status aktif
        When I click button Gunakan Limit
        And I see information limit tersedia and card disbursement
        When I click Info Selengkapnya
        Then I see provision fee on detail information loan

    Scenario: validate display provision fee information method is facility approved when Disbursement AP Direct Corp
        Given I have succesfully disbursement for loan AP Direct Corp
        When I go to page History
        And I click tab Pencairan
        And I click menu Berhasil dicairkan
        And I click card AP Direct Corp
        When I click Lihat perhitungan pencairan
        And I dont see provision fee percentage
        And I dont see provision fee amount

    Scenario: validate display provision fee information method is facility approved when Repayment AP Direct Corp
        Given I have succesfully disbursement for loan AP Direct Corp
        When I go to page History
        And I click tab Tagihan
        And I click card AP Direct Corp
        When I click lihat detail
        And I dont see provision fee percentage
        And I dont see provision fee amount

    Scenario: validate display provision fee is zero Information method is every disbursement when Offering loan AP Direct MSME
        Given I have succesfully apply loan and set up provision fee in LMS
        When I go to page History
        And I see loan with status "tanda tangan sebelum"
        When I click on the card loan
        Then I dont see provision fee on detail information loan

    Scenario: validate display provision fee is zero Information method is every disbursement when Apply loan AP Direct MSME
        Given I have succesfully apply loan and set up provision fee in LMS
        When I go to page History
        And I see loan with status aktif
        When I click button Gunakan Limit
        And I see information limit tersedia and card disbursement
        When I click Info Selengkapnya
        Then I dont see provision fee on detail information loan

    Scenario: validate display provision fee zero information method is every disbursement when Disbursement AP Direct MSME
        Given I have succesfully disbursement for loan AP Direct Corp
        When I go to page History
        And I click tab Pencairan
        And I click menu Berhasil dicairkan
        And I click card AP Direct Corp
        When I click Lihat perhitungan pencairan
        And I dont see provision fee percentage
        And I dont see provision fee amount

    Scenario: validate display provision fee is zero information method is every disbursement when Repayment AP Direct MSME
        Given I have succesfully disbursement for loan AP Direct Corp
        When I go to page History
        And I click tab Tagihan
        And I click card AP Direct Corp
        When I click lihat detail
        And I dont see provision fee percentage
        And I dont see provision fee amount
