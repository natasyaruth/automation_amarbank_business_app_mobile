Feature: Disbursement Confirmation Reminder Card on main dashboard
    In order to test disbursement confirmation reminder card on main dashboard
    As a customer 
    I am able to see reminder card on main dashboard to confirmation disbursement

    Scenario: The user checks the push notification, email, and notification center for the disbursement status "waiting for confirmation from the debtor"
        Given I have successfully completed the disbursement, and the current status is waiting for confirmation from the debtor
        When I check email 
        And I should see an email containing a notification about your disbursement confirmation
        When I check push notification 
        And I should see an push notification containing a notification about your disbursement confirmation
        When I check notification center 
        And I should see an notification center containing a notification about your disbursement confirmation

    Scenario: The user checks disbursement confirmation reminder card when the disbursement status is "waiting for confirmation from the debtor"
        Given I have successfully completed the disbursement, and the current status is waiting for confirmation from the debtor
        When I am on the main dashboard
        And I should see reminder card to confirmation disbursement

    Scenario: The user can not checks disbursement confirmation reminder card when the disbursement status is "pending disbursement."
        Given I have successfully completed the disbursement, and the current status is pending disbursement
        When I am on the main dashboard
        And I should not see reminder card to confirmation disbursement

    Scenario: User cannot check the disbursement confirmation reminder card on the main dashboard when the disbursement status is "CA offer disburse."
        Given I have successfully completed the disbursement, and the current status is CA offer disburse
        When I am on the main dashboard
        And I should not see reminder card to confirmation disbursement

    Scenario: User cannot check the disbursement confirmation reminder card on the main dashboard when the disbursement status is "disbursed"
        Given I have successfully completed the disbursement, and the current status is disbursed
        When I am on the main dashboard
        And I should not see reminder card to confirmation disbursement
        
    Scenario: User checks the disbursement confirmation reminder card on the main dashboard when there is only one disbursement with the status "waiting for confirmation from the debtor
        Given I have successfully completed the disbursement, and the current status is waiting for confirmation from the debtor
        When I am on the main dashboard
        And I should see reminder card to confirmation disbursement
        When I click button cek disini
        Then I should see calculation disbursement
        When I click button Terima Pencairan
        Then I should see page send document PDC

    Scenario: User checks the disbursement confirmation reminder card on the main dashboard when there are multiple disbursements with the status "waiting for confirmation from the debtor."
        Given I have successfully completed the disbursement, and the current status is waiting for confirmation from the debtor
        When I am on the main dashboard
        And I should see reminder card to confirmation disbursement
        When I click button cek disini
        Then I redirect to page history disbursement
        Then I should see list disbursement with status Selesaikan pencairan
        And I click on one card disbursement
        Then I redirect to page calculation disbursement
        Then I should see calculation disbursement
        When I click button Terima Pencairan
        Then I should see page send document PDC

    Scenario: User checks the disbursement confirmation reminder card on the main dashboard when there is only one disbursement with the status "send document PDC"
        Given I have successfully completed the disbursement, and the current status is send document PDC
        When I am on the main dashboard
        And I should see reminder card to send document PDC disburse
        When I click button cek disini
        Then I redirect to the page send document PDC
        When I click Lihat Detail Pengajuan 
        And I should see the invoice document that has been approved or rejected

    Scenario: User checks the disbursement confirmation reminder card on the main dashboard when there are multiple disbursements with the status "send document PDC"
        Given I have successfully completed the disbursement, and the current status is send document PDC
        When I am on the main dashboard
        And I should see reminder card to send document PDC disburse
        When I click button cek disini
         Then I redirect to page history disbursement
        Then I should see list disbursement with status Selesaikan pencairan
        And I click on one card disbursement
        Then I redirect to the page send document PDC
        When I click Lihat Detail Pengajuan 
        And I should see the invoice document that has been approved or rejected

    
    



    
    

