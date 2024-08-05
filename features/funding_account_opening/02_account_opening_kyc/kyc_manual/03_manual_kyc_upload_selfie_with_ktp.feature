Feature: Account Opening Manual - Upload Selfie with KTP
    In order to opening my Giro account in SMB
    As a customer
    I want to upload my selfie photo with KTP as part of the KYC Process

    @C141161
    Scenario: Checking picture take selfie with KTP in CRM
        Given I take selfie with KTP from mobile app SMB
        When I complete the account opening registration
        And I go to CRM
        And I open my request data in verification
        Then I will see my picture in section selfie with KTP

    @C141162
    Scenario: Take manual photo take a selfie with real device
        Given I recently submit my selfie photo
        When I take picture selfie with real device
        Then I will direct to page data personal
        And notify that my selfie with KTP is successfully submitted

    @C141163
    Scenario: Upload selfie with KTP with something went wrong in service
        Given I recently submit my selfie photo
        And service to take selfie with KTP is went wrong
        When I take picture selfie with real device
        Then I will notify that my selfie with KTP is failed to submitted