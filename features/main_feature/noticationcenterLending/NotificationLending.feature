Feature: Home - Notification Center Lending
    In order user to get notified
    As a Customer
    I want to see all notification from SMB App in Main dashboard



Scenario: Close page notification center  
        Given I am a registered customer with following details:
            | userID      | autocaea |
            | password    | 1234Test |
            | userIDstg   | staga29c |
            | passwordStg | 1234Test |    
        And I filling in form login with the following details:
            | userID      | autocaea |
            | password    | 1234Test |
            | userIDstg   | staga29c |
            | passwordStg | 1234Test |
        And I click login       
        When I click notification center
        And I will direct to page notification center
        And I close page notification center
        And I will back to Main Dashboard page

Scenario: Back to page notification center from back in header page
        Given I am a registered customer with following details:
            | userID      | autocaea |
            | password    | 1234Test |
            | userIDstg   | staga29c |
            | passwordStg | 1234Test |
        And don't have any notification    
        And I filling in form login with the following details:
            | userID      | autocaea |
            | password    | 1234Test |
            | userIDstg   | staga29c |
            | passwordStg | 1234Test |
        And I click login      
        When I click notification center
        And I click tab Pinjaman
        And I click back in header page
        Then I will direct to page notification center

Scenario: Validate page notification center with notification still empty
    Given I am a registered customer with following details:
            | userID      | autocaea |
            | password    | 1234Test |
            | userIDstg   | staga29c |
            | passwordStg | 1234Test |     
    And I filling in form login with the following details:
            | userID      | autocaea |
            | password    | 1234Test |
            | userIDstg   | staga29c |
            | passwordStg | 1234Test |
    And I click login       
    And I don't see red dot notification center
    When I click button notification center           
    And I click tab Pinjaman
    And I will see notification is empty


Scenario: Checking Detail Notification Success Submit Loan
    Given I am a registered customer with following details:
            | userID      | autocaea |
            | password    | 1234Test |
            | userIDstg   | staga29c |
            | passwordStg | 1234Test |   
    And I filling in form login with the following details:
            | userID      | autocaea |
            | password    | 1234Test |
            | userIDstg   | staga29c |
            | passwordStg | 1234Test |
    And I click login   
    And I will see card account 'active'
    And I see red dot notification center
    When I click notification center    
    And I see notification Success Submmit Loan
    And I click bucketlist notification Success Submit Loan
    Then I will direct to page progress Loan


Scenario: Checking detail Notification Loan Approved VP
    Given I am a registered customer with following details:
            | userID      | autocaea |
            | password    | 1234Test |
            | userIDstg   | staga29c |
            | passwordStg | 1234Test |   
    And I filling in form login with the following details:
            | userID      | autocaea |
            | password    | 1234Test |
            | userIDstg   | staga29c |
            | passwordStg | 1234Test |
    And I click login   
    And I will see card account 'active'
    And I see red dot notification center
    When I click notification center
    And I click tab Pinjaman
    And I see notification Loan Approved VP
    And I click bucketlist notification Loan Approved VP   
    Then I will direct to page Approve Limit


Scenario: Checking detail reminder offering limit
    Given I am a registered customer with following details:
            | userID      | autocaea |
            | password    | 1234Test |
            | userIDstg   | staga29c |
            | passwordStg | 1234Test |   
    And I filling in form login with the following details:
            | userID      | autocaea |
            | password    | 1234Test |
            | userIDstg   | staga29c |
            | passwordStg | 1234Test |
    And I click login   
    And I will see card account 'active'
    And I see red dot notification center
    When I click notification center
    And I click tab Pinjaman
    And I see notification reminder offering limit    
    And I click bucketlist notification reminder offering limit
    Then I will direct to page Approve Limit

Scenario: Checking detail Notification Offering expired
    Given I am a registered customer with following details:
            | userID      | autocaea |
            | password    | 1234Test |
            | userIDstg   | staga29c |
            | passwordStg | 1234Test |   
    And I filling in form login with the following details:
            | userID      | autocaea |
            | password    | 1234Test |
            | userIDstg   | staga29c |
            | passwordStg | 1234Test |
    And I click login   
    And I will see card account 'active'
    And I see red dot notification center
    When I click notification center
    And I click tab Pinjaman 
    And I see notification offering expired
    And I click bucketlist notification offering expired
    Then I will direct to page expired offering 

Scenario: Checking detail Notification Loan Rejected VP
    Given I am a registered customer with following details:
            | userID      | autocaea |
            | password    | 1234Test |
            | userIDstg   | staga29c |
            | passwordStg | 1234Test |   
    And I filling in form login with the following details:
            | userID      | autocaea |
            | password    | 1234Test |
            | userIDstg   | staga29c |
            | passwordStg | 1234Test |
    And I click login   
    And I will see card account 'active'
    And I see red dot notification center
    When I click notification center
    And I click tab pinjaman
    And I see notification Reject VP
    And I click bucketlist notification Reject VP
    Then I will direct to page Reject Limit

Scenario: Checking detail reminder loan signing
    Given I am a registered customer with following details:
            | userID      | autocaea |
            | password    | 1234Test |
            | userIDstg   | staga29c |
            | passwordStg | 1234Test |   
    And I filling in form login with the following details:
            | userID      | autocaea |
            | password    | 1234Test |
            | userIDstg   | staga29c |
            | passwordStg | 1234Test |
    And I click login   
    And I will see card account 'active'
    And I see red dot notification center
    When I click notification center
    And I click tab pinjaman
    And I see notification reminder loan signing
    And I click bucketlist notification reminder signing
    Then I will direct to page signing privy


Scenario: Checking detail Loan Signing Expired
    Given I am a registered customer with following details:
            | userID      | autocaea |
            | password    | 1234Test |
            | userIDstg   | staga29c |
            | passwordStg | 1234Test |   
    And I filling in form login with the following details:
            | userID      | autocaea |
            | password    | 1234Test |
            | userIDstg   | staga29c |
            | passwordStg | 1234Test |
    And I click login   
    And I will see card account 'active'
    And I see red dot notification center
    When I click notification center
    And I click tab pinjaman
    And I see notification signing expired
    And I click bucketlist notification signing expired
    Then I will direct to page expired signing 

Scenario: Checking detail Facility activated
    Given I am a registered customer with following details:
            | userID      | autocaea |
            | password    | 1234Test |
            | userIDstg   | staga29c |
            | passwordStg | 1234Test |   
    And I filling in form login with the following details:
            | userID      | autocaea |
            | password    | 1234Test |
            | userIDstg   | staga29c |
            | passwordStg | 1234Test |
    And I click login   
    And I will see card account 'active'
    And I see red dot notification center
    When I click notification center
    And I click tab pinjaman
    And I see notification Limit Successfully Active
    And I click bucketlist notification Limit active
    Then I will direct to page Active Limit


Scenario: Checking detail Disburse verification invoice
    Given I am a registered customer with following details:
            | userID      | autocaea |
            | password    | 1234Test |
            | userIDstg   | staga29c |
            | passwordStg | 1234Test |   
    And I filling in form login with the following details:
            | userID      | autocaea |
            | password    | 1234Test |
            | userIDstg   | staga29c |
            | passwordStg | 1234Test |
    And I click login   
    And I will see card account 'active'
    And I see red dot notification center
    When I click notification center
    And I click tab pinjaman
    And I see notification Disburse confirm invoice
    And I click menu Disburse confirm invoice    
    And I will direct to page Perhitungan Pencairan 
    And I click button Terima Pencairan
    And I click menu Disburse confirm invoice
    Then system will direct to Pengiriman PDC (Cek Mundur) page

Scenario: Checking  detail Disburse reject invoice
     Given I am a registered customer with following details:
            | userID      | autocaea |
            | password    | 1234Test |
            | userIDstg   | staga29c |
            | passwordStg | 1234Test |   
    And I filling in form login with the following details:
            | userID      | autocaea |
            | password    | 1234Test |
            | userIDstg   | staga29c |
            | passwordStg | 1234Test |
    And I click login   
    And I will see card account 'active'
    And I see red dot notification center
    When I click notification center
    And I click tab pinjaman
    And I see notification Disburse reject invoice
    And I click menu Disburse reject invoice    
    And I will direct to page Aktivitas Pinjaman 
    And I click card with status Invoice Tidak Disetujui
    Then system will direct to Reject Invoice page



Scenario: Checking detail Disbursement success
   Given I am a registered customer with following details:
            | userID      | autocaea |
            | password    | 1234Test |
            | userIDstg   | staga29c |
            | passwordStg | 1234Test |   
    And I filling in form login with the following details:
            | userID      | autocaea |
            | password    | 1234Test |
            | userIDstg   | staga29c |
            | passwordStg | 1234Test |
    And I click login   
    And I will see card account 'active'
    And I see red dot notification center
    When I click notification center
    And I click tab pinjaman
    And I see notification Disburse success
    And I click menu Disburse success  
    And I will direct to page Aktivitas Pinjaman 
    And I click card with status Berhasil dicairkan
    Then system will direct to disburse succcess page

Scenario: Chekcing detail BILL_TEMPO_WITHIN_3_DAY
    Given I am a registered customer with following details:
            | userID      | autocaea |
            | password    | 1234Test |
            | userIDstg   | staga29c |
            | passwordStg | 1234Test |   
    And I filling in form login with the following details:
            | userID      | autocaea |
            | password    | 1234Test |
            | userIDstg   | staga29c |
            | passwordStg | 1234Test |
    And I click login   
    And I will see card account 'active'
    And I see red dot notification center
    When I click notification center
    And I click tab Pinjaman notification
    And I click menu autodebt h-3
    Then I will direct to page Detail Tagihan with status 3 hari lagi


Scenario: Checking detail BILL_AUTODEBIT_TODAY
    Given I am a registered customer with following details:
            | userID      | autocaea |
            | password    | 1234Test |
            | userIDstg   | staga29c |
            | passwordStg | 1234Test |   
    And I filling in form login with the following details:
            | userID      | autocaea |
            | password    | 1234Test |
            | userIDstg   | staga29c |
            | passwordStg | 1234Test |
    And I click login   
    And I will see card account 'active'
    And I see red dot notification center
    When I click notification center
    And I click tab Pinjaman notification
    And I click menu autodebt today
    Then I will direct to page Detail Tagihan with status 0 hari lagi


Scenario: Checking detail AUTODEBET_SUCCESS
    Given I am a registered customer with following details:
            | userID      | autocaea |
            | password    | 1234Test |
            | userIDstg   | staga29c |
            | passwordStg | 1234Test |   
    And I filling in form login with the following details:
            | userID      | autocaea |
            | password    | 1234Test |
            | userIDstg   | staga29c |
            | passwordStg | 1234Test |
    And I click login   
    And I will see card account 'active'
    And I see red dot notification center
    When I click notification center
    And I click tab Pinjaman notification
    And I click menu autodebt success
    Then I will direct to page Detail Tagihan with status Tagihan berhasil dibayar


Scenario: Checking detail AUTODEBET_REJECT
    Given I am a registered customer with following details:
            | userID      | autocaea |
            | password    | 1234Test |
            | userIDstg   | staga29c |
            | passwordStg | 1234Test |   
    And I filling in form login with the following details:
            | userID      | autocaea |
            | password    | 1234Test |
            | userIDstg   | staga29c |
            | passwordStg | 1234Test |
    And I click login   
    And I will see card account 'active'
    And I see red dot notification center
    When I click notification center
    And I click tab Pinjaman notification
    And I click menu autodebt reject
    Then I will direct to page Detail Tagihan with status Autodebet gagal, Pastikan saldo mencukupi.




    