Feature: Event Tracker Lending
    As a customer lead
    I want to see event tracker for each step in Lending


Scenario: Validate Event Name when User on Login Onboarding Product
    Given I am a registered customer 
    When I fill the form wtih the correct username and password  
    And I click button Login
    Then I will direct to Onboarding page
    And I go to Firebase
    And I select menu DebugView
    Then I will see event name abb_pg_onboardingProduct

Scenario: Validate Event Name when user click Ajukan Limit Kredit
    Given I am on Onboarding page
    When I click button Ajukan Limit Kredit
    And I will direct to Select Loan Type page for combine journey
    And I go to Firebase
    Then I see event name abb_btn_pinjaman_click

Scenario: Validate Event Name when user login on Main Dashboard
    Given I am a registered customer 
    When I fill the form wtih the correct username and password  
    And I click button Login
    Then I will direct to Maindashboard page
    And I go to Firebase
    And I select menu DebugView
    Then I will see event name abb_pg_mainDashboard

Scenario: Validate event name for Ajukan Limit Kredit Combine Journey
    Given I am on Main Dashboard page
    When I click button Ajukan Limit Kredit
    Then the system will check event parameters
    And I go to Firebase
    And I see event name abb_btn_ajukanPinjaman and the parameter is_combine_journey

Scenario: Validate event name on Drop off Account Active + In Process Loan
    Given I am on Main Dashboard page
    When I click button Ajukan Limit Baru
    And I will direct to Select Loan Type Page to apply loan
    And I go to Firebase
    Then I see event name abb_btn_MaindashboardAjukanBaru with parameter has_apply_loan


Scenario: Validate event name on Select Loan Type with status combine journey
    Given I am on Main Dashboard page
    When I click Ajukan Limit Kredit 
    And I click button Ajukan Limit Kredit for combine journey
    And I go to firebase
    Then I will see event name abb_pg_loanType with parameter is_combine_journey

Scenario: Validate event name on Select Loan type with status has loan
    Given I am on Main Dashboard page
    When I click Ajukan Limit Kredit 
    And I click button Ajukan Limit Kredit for combine journey
    And I go to firebase
    Then I will see event name abb_pg_loanType with parameter has_apply_loan


Scenario: Validate event name on Select loan AP
    Given I am on Select Loan Type page
    When I click card AP
    And I go to firebase
    Then I see event name abb_btn_SCFAP_click with parameter loan_type = AP 

Scenario: Validate event name on Select loan AR
    Given I am on Select Loan Type page
    When I click card AR
    And I go to firebase
    Then I see event name abb_btn_SCFAR_click with parameter loan_type = AR

Scenario: Validate event name on Select loan PO
    Given I am on Select Loan Type page
    When I click card AR
    And I go to firebase
    Then I see event name abb_btn_SCFPO_click  with parameter loan_type = PO

Scenario: Validate event name on Loan needs page
    Given I am on Select Loan type page
    When I click card AP
    And I will direct to Loan Needs page
    And I go to firebase
    Then I will see event name abb_pg_loanNeeds

Scenario: Validate event name on Select Anchor Page with type MSME
    Given I am on Loan Need Page
    When I select type MSME
    And I input 30 hari
    And I click button Lanjut Isi Data Supplier
    And I am on Select Anchor page
    And I go to firebase
    Then I will see event name abb_btn_loanNeeds_selanjutnya_click with parameter business_type = MSME 
    And I am on Select Anchor Page
    And I go to firebase
    Then I will see event name abb_pg_selectAnchor
    And I select the Anchor
    And I select the year
    And I click button Lanjut Upload Dokumen    
    And I will see event name abb_btn_selanjutnya_click
   
Scenario: Validate event name on Screen Success Apply Loan
    Given I am on Hook 4 Success Screen Apply Needs
    When I go to firebase
    And I will see event name abb_pg_hookEligibleApply


Scenario: Validate event name on KYC - Tipe Legalitas
    Given I am on Hook 4 Success Screen Apply Needs 
    When I click button Lanjut Proses KYC
    And I am on Select Business Type Page
    And I go to firebase
    And I will see event name abb_pg_legalityType 
    
Scenario: Validate event name on Legality PT.Perusahaan
    Given I am on Select Legality type page
    When I choose PT.Perusahaan
    And I go to firebase
    Then I will see event name abb_btn_perusahaan

Scenario: Validate event name on Legality PT.Perusahaan
    Given I am on Select Legality type page
    When I choose PT.Perusahaan
    And I go to firebase
    Then I will see event name abb_btn_perusahaan

Scenario: Validate event name on Legality PT.Perorangan
    Given I am on Select Legality type page
    When I choose PT.Perusahaan
    And I go to firebase
    Then I will see event name abb_btn_perorangan

Scenario: Validate event name on Legality CV
    Given I am on Select Legality type page
    When I choose PT.Perusahaan
    And I go to firebase
    Then I will see event name abb_btn_cv

Scenario: Validate event name on Legality UD
    Given I am on Select Legality type page
    When I choose PT.Perusahaan
    And I go to firebase
    Then I will see event name abb_btn_ud

Scenario: Validate event name on Legality Individu
    Given I am on Select Legality type page
    When I choose PT.Perusahaan
    And I go to firebase
    Then I will see event name abb_btn_individu

Scenario: Validate event name Hook 5 KYC Success
    Given I have input all KYC data
    When I am on KYC success page
    And I go to firebase
    Then I will see event name abb_pg_hookKYCSuccess


Scenario: Validate event name Onboarding Document Upload
    Given I am on last input data KYB
    When I click button Lanjut Upload Dokumen
    And I am on Document Upload page
    And I go to firebase
    Then I will see event name abb_pg_onboardingDocument

Scenario: Validate event name Metode Upload Document
    Given I am on Document Upload page
    When I click button Pilih Metode upload Dokumen
    And I see bottom sheet Metode Upload Dokumen
    Then I will see event name abb_pop_uploadDocumentMethod

Scenario: validate event name method Upload dari Aplikasi
    Given I am on bottom sheet Metode Upload Dokumen
    When I click Langsung dari Aplikasi
    And I go to firebase
    Then I will see event name abb_btn_mobileUpload


Scenario: validate event name on method Dari Perangkat Lain
    Given I am on bottom sheet Metode Upload Dokumen
    When I click  Langsung dari Perangkat lain
    And I go to firebase
    Then I will see event name abb_btn_delegationUpload


Scenario: validate event name on Upload Document Page
    Given I click Langsung dari Aplikasi
    And I am on Upload Document Page
    And I go to firebase
    Then I will see event name abb_pg_uploadDocument
    And I upload all documents
    And I click button Kirim Pengajuan Limit Kredit
    And I go to firebase
    And I will see event name abb_btn_applyLoanSubmit


Scenario: Valdate event name on Page Submit Loan Success
    Given I am on Page Submit Loan Success
    When I go to firebase
    Then I will see event name abb_pg_submitLoanSuccess

    
#MSME
Scenario: Validate event name on Offering Page MSME
    Given I have loan that already approved by VP
    When I click the push notification
    And I am on offering page
    And I go to firebase
    Then I will se event name abb_pg_offeringLoan
    And I will see parameter business_type: MSME
    And I will see parameter loan type: AP


Scenario: Validate button event name on Offering Page
    Given I am on offering Page
    When I click button Setujui Syarat & Ketentuan
    And I go to firebase
    Then I will see event name abb_btn_acceptOffering


Scenario: Validate event name on Onboarding Signing Privy
    Given I have submitted the terms and condition
    When I click the card to continue privy Signing
    And I am on Onboarding Signing Privy
    And I go to firebase
    Then I see event name abb_pg_onBoardingPrivy


Scenario: Validate event name on Loading Open Privy Page
    Given I am on Onboarding Signing Privy Page
    When I tick the terms and condition
    And I click button Baca & Tanda Tangan
    And I will see loading open privy page
    And I go to firebase
    Then I will see event name abb_pop_loadingOpenPrivy


Scenario: Validate event name on Privy Page
    Given I have login to Privy 
    When I am on Privy Page
    And I go to firebase
    Then I will see event name abb_pg_signPrivy


Scenario: Validate event name on Loan Activation Process
    Given I have successfully signing on privy
    When I click the card loan AP with status Tanda Tangan Selesai
    And I am on Page Loan Activation Process
    And I go to firebase
    Then I will see event name abb_pg_loanActivationProcess


Scenario: Validate event name on Limit Created Success
    Given I have limit created success
    When I receive push notification
    And I go to firebase
    Then I will see event name abb_send_limitCreated_success

#Corp
Scenario: Validate event name on Offering Page Corp
    Given I have loan that already approved by VP
    When I click the push notification
    And I am on offering page
    And I go to firebase
    Then I will se event name abb_pg_offeringLoan
    And I will see parameter business_type: Corp
    And I will see parameter loan type: AP


Scenario: Validate event name OnBoarding Signing Notary
    Given I have a schedule for signing notary
    When I click the loan
    And I am on OnBoarding Signing Notary
    And I go to firebase
    Then I will see event name abb_pg_onBoardingNotary

Scenario: Validate event name on Limit Created Success
    Given I have limit created success
    When I receive push notification
    And I go to firebase
    Then I will see event name abb_send_limitCreated_success






   