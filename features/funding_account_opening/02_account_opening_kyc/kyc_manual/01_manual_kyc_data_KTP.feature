Feature: Account Opening Manual - Submit Data KTP
    In order to opening my Giro account in SMB
    As a customer
    I want to submit my data KTP as part of the KYC Process

    Scenario: Submit again form KTP after period time DHN is over
        Given I am a customer want to register again after my period time DHN is over
        And my past journey is in submit form KTP
        When I login to app using my user id that has been indicated as DHN before
        And I will direct to dashboard with widget continue to complete data personal
        And I click continue fill my data 
        And I will direct to page form KTP with all fields are blank
        And I fill my identity number with KTP that has indicated as DHN before
        And I fill all field as well
        And I submit my identity form
        Then I will direct to page data personal
        And I will see snackbar green success

    Scenario: Submit again form Business Profile after period time is over
        Given I am a customer want to register again after my period time DHN is over
        And my past journey is in submit form business profile
        When I login to app using my user id that has been indicated as DHN before
        And I will direct to dashboard with widget continue to complete data business
        And I click continue fill my data 
        And I will direct to page form Business Profile with all fields are blank
        And I fill my NPWP business number with npwp that has indicated as DHN before
        And I fill all field as well
        And I submit my business profile form
        Then I will direct to page business partner/director
        And I will see snackbar green success