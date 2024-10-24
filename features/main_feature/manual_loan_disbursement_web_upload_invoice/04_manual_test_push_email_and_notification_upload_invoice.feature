Feature: Verification Push Notification and Email Notification
    In order to upload invoice for webview applications
    As a User
    I want to verify the push notification to the mobile applications and email notification after generate and upload invoice


Scenario: Validate the email content after user get the link for upload invoice from Web view
    Given I have received the email
    When I open the email
    And I see the title of email "Link Upload Invoice untuk Pencairan"
    And I see the body email with the generate link
    And I see the body email with name of Supplier


Scenario: Validate notification on mobile after click on “upload invoice selesai” button
    Given I have done Upload Invoice on web
    When I receive pop up notification on mobile
    And I see wording "Invoice baru telah tersedia untuk pencairan. Cek dan selesaikan pencairan melalui aplikasi."
    Then I click the notif to continue the disbursement process

Scenario: Validate the email content after click on “upload invoice selesai” button
    Given I have received the email
    When I open the email
    And I see the title of the email "Invoice Baru telah Tersedia untuk Pencairan"
    And I see the body email with the name of Supplier
    And I see the body email with button Lanjut Pencairan Invoice

    
Scenario: Continue Click button “Lanjut Pencairan Invoice” from email
    Given I have opened the email
    When I click button Lanjut Pencairan Invoice
    And I direct to mobile apps to continue disbursment
