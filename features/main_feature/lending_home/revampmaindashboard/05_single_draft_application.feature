Feature: Single Draft Application Management
  As a user of the loan application system,
  I want to manage only one draft application at a time,
  So that I can streamline my application process and avoid confusion.



Scenario: User tries to create a new loan when user have a single draft
    Given I am a registered customer with following details:
        | userID      | corp3e7c |
        | password    | Test1234 |
        | userIDstg   | stag76ee |
        | passwordStg | Test1234 |
    When I filling in form login with the following details:
        | userID      | corp3e7c |
        | password    | Test1234 |
        | userIDstg   | stag76ee |
        | passwordStg | Test1234 | 
    And I click login
    And I click button tambah limit baru
    Then I will see pop up notification to complete or edit the existing draft
    And the user is not allowed to create a new draft
    
    
Scenario: Automatic cleanup of multiple drafts for users without active limits
    Given I am a registered customer with following details:
        | userID      | tesa4995 |
        | password    | Test1234 |
        | userIDstg   | stag76ee |
        | passwordStg | Test1234 |
    When I filling in form login with the following details:
        | userID      | tesa4995 |
        | password    | Test1234 |
        | userIDstg   | stag76ee |
        | passwordStg | Test1234 | 
    And I click login
    And I should see text card "Kredit Bisnis untuk berbagai kebutuhan usaha" on field "textViewBodyDesc"
    And I should see text card "Aktivitas Pinjaman" on field "textCardActivityLoan"
    Then I should see text card "2" on field "textCardValueProcess"
    And I should see text card "Proses" on field "textCardProcess"
    And I should see text card "Menunggu verifikasi data selesai" on field "textCardWaitVerifyData"
    And I click Aktivitas Pinjaman   
    And I will see application loan with status "Pengajuan Limit"
        
    

Scenario: Automatic cleanup for users with active facility
    Given I am a registered customer with following details:
        | userID      | ecap2158 |
        | password    | Eca12345 |
        | userIDstg   | stag76ee |
        | passwordStg | Test1234 |
    When I filling in form login with the following details:
        | userID      | ecap2158 |
        | password    | Eca12345 |
        | userIDstg   | stag76ee |
        | passwordStg | Test1234 | 
    And I click login
    And I click Aktivitas pinjaman
    And I will see application loan with status "Pengajuan Limit"
    
    




    
