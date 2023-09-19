@historyLoan
Feature: History Page
    In order to test history loan page
    As a customer
    I am able to view all history limit loan

    Background: Login with registered account
        Given I am a registered customer with following details:
            | userID   | rutha013 |
            | password | 1234Test |
        When I filling in form login with the following details:
            | userID   | rutha013 |
            | password | 1234Test |
        And I click login
        Then I will direct to dashboard

@C88614 @historyLoan
    Scenario: Access History Dashboard For Limit Bar
        Given I have been access history loan to see menu Limit
        When I access menu bar "Limit"
        Then I should see history "Limit"
@C88615 @historyLoan
    Scenario: Access History Dashboard For "Pencairan" Bar
        Given I have been access history loan to see menu "Pencairan"
        When I access menu bar "Pencairan"
        Then I should see history "Pencairan"
@C88617 @historyLoan
    Scenario: Access History Dashboard For "Tagihan" Bar
        Given I have been access history loan to see menu "Tagihan"
        When I access menu bar "Tagihan"
        Then I should see history "Tagihan"
@C88618 @historyLoan
    Scenario: Access History Limit Dashboard For Status On Process
        Given I have been access history loan limit to see status "Dalam Proses"
        When I access menu bar limit with status "Dalam Proses"
        Then I should see history limit on process
@C88619 @historyLoan
    Scenario: Access History Limit Dashboard For Status Active
        Given I have been access history loan limit to see status "Aktif"
        When I access menu bar limit with status "Aktif"
        Then I should see history limit active
@C88620 @historyLoan
    Scenario: Validate Limit Active With Multiple Active Loan
        Given I have been access history loan limit to see status user have more than one status active
        When I access menu bar limit with status active
        Then I should see more than one active limit loan
@C88621 @historyLoan
    Scenario: Access History Limit Dashboard For Status Done
        Given I have been access history loan limit to see status "Selesai"
        When I access menu bar limit with status "Selesai"
        Then I should see history limit done
@C88622 @historyLoan
    Scenario: Access History Loan Disbursement Dashboard For All Status
        Given I have been access history of loan disbursement to see status "Semua"
        When I access menu bar of loan disbursement with status "Semua"
        Then I should see all history of disbursement
@C88623 @historyLoan
    Scenario: Access History Loan Disbursement For Status Send PDC
        Given I have been access history of loan disbursement to see status "Kirim PDC"
        When I access menu bar of loan disbursement with status "Kirim PDC"
        Then I should see history of "Kirim PDC"
@C88624 @historyLoan
    Scenario: Access History Loan Disbursement For Status Waiting Confirmation
        Given I have been access history of loan disbursement to see status "Menunggu Konfirmasi"
        When I access menu bar of loan disbursement with status "Menunggu Konfirmasi"
        Then I should see history of "Menunggu Konfirmasi"