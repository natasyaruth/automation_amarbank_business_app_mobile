Feature: Manual Document Management
    As a customer
    I want to view business document that I previously uploaded
        
    @C137170
    Scenario: Open document using biometric active
        Given I am a customer active with biometric is active
        When I login to app using biometric
        And I directing to main dashboard
        And I click tab document
        And I will see pop up information to touch the sensor area on my device
        And I put my finger in the sensor area on my device
        And I will see pop up biometric is success authenticated
        And I will see loading icon
        And I will directing to page document 

    @C137171
    Scenario: Open document with failed biometric once
        Given I am a customer active with biometric is active
        When I login to app using biometric
        And I directing to main dashboard
        And I click tab document
        And I will see pop up information to touch the sensor area on my device
        And I put my wrong finger in the sensor area on my device
        Then I will see pop up biometric is failed with information biometric is not recognize

    @C137172
    Scenario: Open document with failed biometric twice
        Given I am a customer active with biometric is active
        When I login to app using biometric
        And I directing to main dashboard
        And I click tab document
        And I will see pop up information to touch the sensor area on my device
        And I put my wrong finger in the sensor area on my device
        And I will see pop up biometric is failed with information biometric is not recognize
        And I try again with wrong finger
        And I will see pop up biometric is failed with information biometric is not recognize

    @C137173
    Scenario: Open document with too many attempts failed biometric
        Given I am a customer active with biometric is active
        When I login to app using biometric
        And I directing to main dashboard
        And I click tab document
        And I will see pop up information to touch the sensor area on my device
        And I put my wrong finger in the sensor area on my device
        And I will see pop up biometric is failed with information biometric is not recognize
        And I try again with wrong finger
        And I will see pop up biometric is failed with information biometric is not recognize
        And I try again with wrong finger till 5 times
        And I will see information too many attempts
        And  I will see pop up biometric is failed with information need to authenticated using password
        And I click understand
        Then I will see bottom sheet input password

    @C137174
    Scenario: Open document with password after too many attempts failed biometric
        Given I am a customer active with biometric is active
        And has too many attempts failed biometric to open document
        When I click tab document
        Then I will see pop up biometric is failed with information need to authenticated using password
        And I click understand
        Then I will see bottom sheet input password

    @C137175
    Scenario: Preview document
        Given I am a customer active with biometric is active
        And has document giro and loan
        When I click tab document
        And I put my finger in the sensor area on my device
        And I will see pop up biometric is success authenticated
        And I will see loading icon
        And I preview document giro
        Then I will see preview document giro
        And I preview document loan
        Then I will see preview document loan

    @C137176
    Scenario: Access document when device still not activated biometric
        Given I am a customer active with biometric is inactive in device
        When I login to app
        And I click tab document
        Then I will see bottom sheet input password
        And I input password
        Then I will see document page

    @C137177
    Scenario: Activated biometric via document management
        Given I am a customer active with biometric still not activated in SMB app
        When I try to login
        And I click tab Document
        And I click activated my biometric
        And I activated my biometric
        And I click tab Document
        And I will see pop up information to touch the sensor area on my device
        And I put my finger in the sensor area on my device
        And I will see pop up biometric is success authenticated
        And I will see loading icon
        Then I will directing to page document

    @C157533
    Scenario: Check email after success delete other document
        Given I am a customer that has other document
        And I success delete other document
        When I open my email inbox
        Then I will see email delete other document is success

    @C157534
    Scenario: Cancel upload other document while uploading
        Given I am a customer active
        And has been complete onboarding document brankas
        And currently in detail Tab brankas
        When I click upload other document
        And I choose file
        And I see file still uploading
        And I click icon cancel the upload
        Then I will see the upload is terminated

    @C157535
    Scenario: View other document in section upload
        Given I am a customer active
        And has been complete onboarding document brankas
        And currently in detail Tab brankas
        When I click upload other document
        And I choose file
        And I wait till file uploaded
        And I click file name
        Then I will see view page of the document

    @C157536
    Scenario: Download and view other document in menu other document
        Given I am a customer active
        And has been complete onboarding document brankas
        And currently in detail Tab brankas
        When I click upload other document
        And I choose file
        And I wait till file uploaded
        And I click button save document
        And I click icon download file
        Then I will see view page of the document
        And can be download via google drive

    @C157537
    Scenario: Upload other document more than 15MB
        Given I am a customer active
        And has been complete onboarding document brankas
        And currently in detail Tab brankas
        When I click upload other document
        And I choose file with size more than 15MB
        Then I will see message error "File melebihi maksimal ukuran 15MB."
        And display file name and icon delete

    @C157538
    Scenario: Upload other document direct via app
        Given I am a customer active
        And has been complete onboarding document brankas
        And currently in detail Tab brankas using real device
        When I click upload other document
        And I choose file
        And I wait till file uploaded
        Then I will see icon success check green
        And display file name, size and icon delete
        And close bottom sheet is dissapear
        And button save document
        And after click button save document will direct to page other document with latest file uploaded
        And snackbar green success

    @C157539
    Scenario: Upload other document other than JPG/JPEG/PNG/PDF
        Given I am a customer active
        And has been complete onboarding document brankas
        And currently in detail Tab brankas
        When I click upload other document
        And I choose file other than JPG/JPEG/PNG/PDF
        Then I will see message error "File harus dalam format PDF / JPG / JPEG / PNG."
        And display file name and icon delete

    @C157540
    Scenario: Upload other document with bad connection
        Given I am a customer active
        And has been complete onboarding document brankas
        And currently in detail Tab brankas
        And has bad connection
        When I click upload other document
        And I choose file
        Then I will see message error "Koneksi bermasalah. Periksa jaringan Anda dan coba lagi."
        And display file name, icon reupload and icon delete

    @C157541
    Scenario: Upload other document with bad server
        Given I am a customer active
        And has been complete onboarding document brankas
        And currently in detail Tab brankas
        And has bad server to end point upload other document
        When I click upload other document
        And I choose file
        Then I will see snackbar error red "Terjadi kendala server, coba beberapa saat lagi."
        And will dissapear after 1-2 seconds

    @C157542
    Scenario: Delete document after get message error
        Given I am a customer active
        And currently in detail Tab brankas
        And get message error either because of file size or type or connection
        When I click delete file
        Then I will not see the file anymore

    @C157543
    Scenario: Reupload document after get error bad connection
        Given I am a customer active
        And has been complete onboarding document brankas
        And currently in detail Tab brankas
        And has bad connection
        When I click upload other document
        And I choose file
        And I will see message error "Koneksi bermasalah. Periksa jaringan Anda dan coba lagi."
        And I click reupload document
        Then I will see file restart to upload

    @C157544
    Scenario: Failed to delete other document in section upload because server error
        Given I am a customer active
        And has been complete onboarding document brankas
        And currently in section upload other doc with file has been uploaded
        And has bad server to end point delete other document
        When I click delete other document
        And I confirm delete
        Then I will see snackbar error red "Terjadi kendala server, coba beberapa saat lagi."
        And will dissapear after 1-2 seconds

    @C157545
    Scenario: Failed to delete other document in page other document because server error
        Given I am a customer active
        And has been complete onboarding document brankas
        And currently in section upload other doc from menu other doc with file has been uploaded
        And has bad server to end point delete other document
        When I click delete other document
        And I confirm delete
        Then I will see snackbar error red "Terjadi kendala server, coba beberapa saat lagi."
        And will dissapear after 1-2 seconds