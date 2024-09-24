Feature: Manual Checking NPWP Business
    In order to opening my Giro account in SMB
    As a customer
    I want to choose Giro Account and my legality business type
    And along with checking NPWP Business

    @C156894 @FunctTestFunding
    Scenario: Submit NPWP business while error from wincore
        Given I am customer that has been choose the legality type
        And service wincore is in problem
        When I input my npwp business
        And I submit my NPWP
        Then I will see message error "Terjadi kendala server, coba beberapa saat lagi."

    @C156895 @FunctTestFunding
    Scenario: Confirm NPWP business while error from API
        Given I am customer that has been choose the legality type
        And service API account creation is error
        When I input my npwp business
        And I submit my NPWP
        And I confirm my NPWP
        Then I will see snackbar error red "Sedang terkendala server, mohon coba beberapa saat lagi."

    @C156896
    Scenario: Checking mapping NPWP Business in CRM
        Given I am customer that has been choose the legality type
        When I input my npwp business
        And I submit my NPWP
        And I confirm my NPWP
        And I complete the rest KYC and KYB
        And I go to CRM
        And I open menu verification
        And I open my request account opening
        Then I will see my NPWP business in section NPWP company

    @C156897 @FunctTestFunding
    Scenario: Checking if API get NPWP business error in business profile
        Given I am customer has check NPWP
        And recently in page continue to KYB
        And API get NPWP suddenly error
        When I continue to KYB
        Then I will see snackbar error red "Sedang terkendala server, mohon coba beberapa saat lagi."
        And I will see field NPWP business is blank and editable

    @C156898
    Scenario: Checking if NPWP Business has account number and CIF with branch other than SMB in wincore
        Given I am customer that has been choose the legality type
        When I input my npwp business that was registered in Tunaiku or ABADI
        And I submit my NPWP
        And I confirm my NPWP
        Then I will direct to upload eKTP