Feature: Smartlook
  In order record all activity when register
  As a agent
  I want to check video recorder on Smartlook

    Scenario: Register account type PT Perusahaan with positive flow
        Given I am a user want to register account with positive flow
        When I do process register 
        And I do process KYC on Mobile
        And I submit all KYC process
        And I do process KYB on Mobile
        And I submit all KYB process
        And I upload document business
        And I check recorded step on Smartlook
        Then I see recorded step on Smartlook
        And I play the recorded step
        And All step recorded
        
    Scenario: Register account type CV with positive flow
        Given I am a user want to register account with positive flow
        When I do process register 
        And I do process KYC on Mobile
        And I submit all KYC process
        And I do process KYB on Mobile
        And I submit all KYB process
        And I upload document business
        And I check recorded step on Smartlook
        Then I see recorded step on Smartlook
        And I play the recorded step 
        And All step recorded
    
    Scenario: Register account type UD with positive flow
        Given I am a user want to register account with positive flow
        When I do process register 
        And I do process KYC on Mobile
        And I submit all KYC process
        And I do process KYB on Mobile
        And I submit all KYB process
        And I upload document business
        And I check recorded step on Smartlook
        Then I see recorded step on Smartlook
        And I play the recorded step 
        And All step recorded

    Scenario: Register account type PT Perorangan with positive flow
        Given I am a user want to register account with positive flow
        When I do process register 
        And I do process KYC on Mobile
        And I submit all KYC process
        And I do process KYB on Mobile
        And I submit all KYB process
        And I upload document business
        And I check recorded step on Smartlook
        Then I see recorded step on Smartlook
        And I play the recorded step 
        And All step recorded

    Scenario: Register account Invited with positive flow
        Given I am a user want to register account with positive flow
        When I do process register 
        And I do process KYC on Mobile
        And I submit all KYC process
        And I check recorded step on Smartlook
        Then I see recorded step on Smartlook
        And I play the recorded step 
        And All step recorded

    Scenario: Register account type Individual with positive flow
        Given I am a user want to register account with positive flow
        When I do process register 
        And I do process KYC on Mobile
        And I submit all KYC process
        And I check recorded step on Smartlook
        Then I see recorded step on Smartlook
        And I play the recorded step 
        And All step recorded
    
    Scenario: Register account type PT Perusahaan with drop off when on page take foto e-ktp and continue process until the end
        Given I am a user want to register account with drop off
        When I do process register 
        And I do process KYC on Mobile
        And I am on page take foto e-ktp
        And I force close the application
        And I open again the application
        And I continue register process until finish
        And I check recorded step on Smartlook
        Then I see 2 recorded step on Smartlook
        And I play all video recorded
        And I see recorded step from first register until page take foto e-ktp
        And I see recorded step from take foto e-ktp until the end step of register 
        
    Scenario: Register account type PT Perusahaan with drop off when on page take foto selfie & e-ktp and continue process until the end
        Given I am a user want to register account with drop off
        When I do process register 
        And I do process KYC on Mobile
        And I am on page take selfie & foto e-ktp
        And I force close the application
        And I open again the application
        And I continue register process until finish
        And I check recorded step on Smartlook
        Then I see 2 recorded step on Smartlook
        And I play all video recorded
        And I see recorded step from first register until page take foto selfie & e-ktp
        And I see recorded step from take foto selfie & e-ktp until the end step of register 
    
    Scenario: Register account type PT Perusahaan with drop off when on page data diri and continue process until the end
        Given I am a user want to register account with drop off
        When I do process register 
        And I do process KYC on Mobile
        And I am on page data diri
        And I force close the application
        And I open again the application
        And I continue register process until finish
        And I check recorded step on Smartlook
        Then I see 2 recorded step on Smartlook
        And I play all video recorded
        And I see recorded step from first register until page data diri
        And I see recorded step from data diri until the end step of register 
    
    Scenario: Register account type PT Perusahaan with drop off when on page data pekerjaan and continue process until the end
        Given I am a user want to register account with drop off
        When I do process register 
        And I do process KYC on Mobile
        And I am on page data pekerjaan
        And I force close the application
        And I open again the application
        And I continue register process until finish
        And I check recorded step on Smartlook
        Then I see 2 recorded step on Smartlook
        And I play all video recorded
        And I see recorded step from first register until page data pekerjaan
        And I see recorded step from data pekerjaan until the end step of register
    
    Scenario: Register account type PT Perusahaan with drop off when on page data bisnis and continue process until the end
        Given I am a user want to register account with drop off
        When I do process register 
        And I do process KYC on Mobile
        And I submit all KYC process
        And I do process KYB on Mobile
        And I am on page data bisnis
        And I force close the application
        And I open again the application
        And I continue register process until finish
        And I check recorded step on Smartlook
        Then I see 2 recorded step on Smartlook
        And I play all video recorded
        And I see recorded step from first register until page data bisnis
        And I see recorded step from data bisnis until the end step of register
    
    Scenario: Register account type PT Perusahaan with drop off when on page upload document and continue process until the end
        Given I am a user want to register account with drop off
        When I do process register 
        And I do process KYC on Mobile
        And I submit all KYC process
        And I do process KYB on Mobile
        And I am on page upload document
        And I force close the application
        And I open again the application
        And I continue register process until finish
        And I check recorded step on Smartlook
        Then I see 2 recorded step on Smartlook
        And I play all video recorded
        And I see recorded step from first register until page upload document
        And I see recorded step from upload document until the end step of register

    Scenario: Register account type PT Perusahaan with some error on field and take photo
        Given I am a user want to register account with some error message on field and take photo
        When I do process register 
        And I do process KYC on Mobile
        And I turn on the foto e-ktp error mocking
        And I take foto e-ktp
        And I turn off the foto e-ktp error mocking
        And I take foto e-ktp
        And I make some field empty on every page on KYC Process like in field e-ktp, data diri, data pekerjaan, and data bisnis
        And I click button continue in every page to make sure error message appear
        And I fill all field that empty in every page
        And I check recorded step on Smartlook
        Then I see recorded step on Smartlook
        And I play video recorded
        And I see recorded step from first register until page upload document
        And All step recorded
    

    Scenario: Register account Invited with drop off when on page take foto e-ktp and continue process until the end
        Given I am a user want to register account with drop off
        When I do process register 
        And I do process KYC on Mobile
        And I am on page take foto e-ktp
        And I force close the application
        And I open again the application
        And I continue register process until finish
        And I check recorded step on Smartlook
        Then I see 2 recorded step on Smartlook
        And I play all video recorded
        And I see recorded step from first step until page take foto e-ktp
        And I see recorded step from take foto e-ktp until the end step of register
    
    Scenario: Register account Invited with drop off when on page take selfie and continue process until the end
        Given I am a user want to register account with drop off
        When I do process register 
        And I do process KYC on Mobile
        And I am on page take selfie
        And I force close the application
        And I open again the application
        And I continue register process until finish
        And I check recorded step on Smartlook
        Then I see 2 recorded step on Smartlook
        And I play all video recorded
        And I see recorded step from first step until page take selfie
        And I see recorded step from take selfie until the end step of register

    Scenario: Register account Invited with drop off when on page take selfie & e-ktp and continue process until the end
        Given I am a user want to register account with drop off
        When I do process register 
        And I do process KYC on Mobile
        And I am on page take selfie & e-ktp
        And I force close the application
        And I open again the application
        And I continue register process until finish
        And I check recorded step on Smartlook
        Then I see 2 recorded step on Smartlook
        And I play all video recorded
        And I see recorded step from first step until page take selfie & e-ktp
        And I see recorded step from take selfie & e-ktp until the end step of register
    

    Scenario: Register account type Individual with drop off when on page take foto e-ktp and continue process until the end
        Given I am a user want to register account with drop off
        When I do process register 
        And I do process KYC on Mobile
        And I am on page take foto e-ktp
        And I force close the application
        And I open again the application
        And I continue register process until finish
        And I check recorded step on Smartlook
        Then I see 2 recorded step on Smartlook
        And I play all video recorded
        And I see recorded step from first register until page take foto e-ktp
        And I see recorded step from take foto e-ktp until the end step of register 

    Scenario: Register account type Individual with drop off when on page take foto selfie & e-ktp and continue process until the end
        Given I am a user want to register account with drop off
        When I do process register 
        And I do process KYC on Mobile
        And I am on page take selfie & foto e-ktp
        And I force close the application
        And I open again the application
        And I continue register process until finish
        And I check recorded step on Smartlook
        Then I see 2 recorded step on Smartlook
        And I play all video recorded
        And I see recorded step from first register until page take foto selfie & e-ktp
        And I see recorded step from take foto selfie & e-ktp until the end step of register 
    
    Scenario: Register account type Individual with drop off when on page data diri and continue process until the end
        Given I am a user want to register account with drop off
        When I do process register 
        And I do process KYC on Mobile
        And I am on page data diri
        And I force close the application
        And I open again the application
        And I continue register process until finish
        And I check recorded step on Smartlook
        Then I see 2 recorded step on Smartlook
        And I play all video recorded
        And I see recorded step from first register until page data diri
        And I see recorded step from data diri until the end step of register 
    
    Scenario: Register account type Individual with drop off when on page data pekerjaan and continue process until the end
        Given I am a user want to register account with drop off
        When I do process register 
        And I do process KYC on Mobile
        And I am on page data pekerjaan
        And I force close the application
        And I open again the application
        And I continue register process until finish
        And I check recorded step on Smartlook
        Then I see 2 recorded step on Smartlook
        And I play all video recorded
        And I see recorded step from first register until page data pekerjaan
        And I see recorded step from data pekerjaan until the end step of register
    

    Scenario: Register account type Individual with some error on field and take photo
        Given I am a user want to register account with some error message on field and take photo
        When I do process register 
        And I do process KYC on Mobile
        And I turn on the foto e-ktp error mocking
        And I take foto e-ktp
        And I turn off the foto e-ktp error mocking
        And I take foto e-ktp
        And I make some field empty on every page on KYC Process like in field e-ktp, data diri and data pekerjaan
        And I click button continue in every page to make sure error message appear
        And I fill all field that empty in every page
        And I check recorded step on Smartlook
        Then I see recorded step on Smartlook
        And I play video recorded
        And I see recorded step from first register until finish
        And All step recorded