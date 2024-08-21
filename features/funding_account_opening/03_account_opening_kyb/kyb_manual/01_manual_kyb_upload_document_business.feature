Feature: Account Opening KYB - Upload Document Business
    In order to opening my Giro account with legality business type CV in SMB
    As a customer
    I want to upload document business as part of the KYB Process

    @C131927
    Scenario: Upload document with file size more than 15 MB in mobile
        Given I am a registered customer
        And already register till business address
        When I upload document with size more than 15MB
        Then I will see message error 'File melebihi maksimal ukuran 15MB.' in the below of section upload document
        And I see filename and size of the file
        And I see icon to delete file
        And after I delete, there is no pop up to confirm

    @C131928
    Scenario: Upload document with file other than PDF, JPG, PNG and JPEG in mobile
        Given I am a customer
        And access link upload document
        When I upload document with type other than PDF, JPG, PNG and JPEG
        Then  I will see message error 'File harus dalam format PDF / JPG / JPEG / PNG.' in the below of section upload document
        And I see filename and size of the file
        And I see icon to delete file and reupload file
        And after I delete, there is no pop up to confirm
        And if I click reupload file, it would reupload again the file

    Scenario: Upload document with file size more than 15 MB in web view
        Given I am a registered customer
        And access link upload document
        When I upload document with size more than 15MB
        Then I will see message error 'File melebihi maksimal ukuran 15MB.' in the below of section upload document
        And I see filename and size of the file
        And I see icon to delete file
        And after I delete, there is no pop up to confirm

    Scenario: Upload document with file other than PDF, JPG, PNG and JPEG in web view
        Given I am a registered customer
        And access link upload document
        When I upload document with type other than PDF, JPG, PNG and JPEG
        Then  I will see message error 'File harus dalam format PDF / JPG / JPEG / PNG.' in the below of section upload document
        And I see filename and size of the file
        And I see icon to delete file and reupload file
        And after I delete, there is no pop up to confirm
        And if I click reupload file, it would reupload again the file    

    Scenario: Upload document and get error timeout in mobile
        Given I am a registered customer
        And already register till business address
        When I upload document and timeout
        Then I will see message error 'Koneksi bermasalah. Periksa jaringan Anda dan coba lagi.' in the below of section upload document

    Scenario: Delete document and get error server in mobile
        Given I am a registered customer
        And already register till business address
        When I upload document
        And I delete my document and got error
        Then I will see snackbar error with message 'Terjadi kendala server, coba beberapa saat lagi.'

    @C137189
    Scenario: Check pop up permission
        Given I am a registered customer
        And already register till submit list director
        And I disallowed permission for app SMB
        When I try to login again
        And I continue to submit business address
        Then I will see pop up permission storage with wording same with figma
        And I click understand
        And I allowed the permission

    @C137190
    Scenario: Upload all doc PT Perusahaan via link
        Given I am a registered customer
        And already register as PT Perusahaan till business address
        When I click upload via other device
        And I copy link
        And I access the link
        And I upload all document
        Then I will see all document are uploaded successfully
        And I will not see button send request account opening

    @C137191
    Scenario: Upload all doc CV via link
        Given I am a registered customer
        And already register as CV till business address
        When I click upload via other device
        And I copy link
        And I access the link
        And I upload all document
        Then I will see all document are uploaded successfully
        And I will not see button send request account opening

    @C137192
    Scenario: Upload all doc UD via link
        Given I am a registered customer
        And already register as UD till business address
        When I click upload via other device
        And I copy link
        And I access the link
        And I upload all document
        Then I will see all document are uploaded successfully
        And I will not see button send request account opening

    @C137193
    Scenario: Upload all doc PT Perorangan via link
        Given I am a registered customer
        And already register as PT Perorangan till business address
        When I click upload via other device
        And I copy link
        And I access the link
        And I upload all document
        Then I will see all document are uploaded successfully
        And I will not see button send request account opening

    @C137194
    Scenario: Upload some doc via link
        Given I am a registered customer
        And already register till business address
        When I click upload via other device
        And I copy link
        And I access the link
        And I upload some document
        Then I will see some document are uploaded successfully
        And I will not see button send request account opening

    @C137195
    Scenario: Upload doc and delete via link
        Given I am a registered customer
        And already register till business address
        When I click upload via other device
        And I copy link
        And I access the link
        And I upload all document
        And I delete one document
        Then I will see that document successfully deleted
        And the remaining document still exists

    @C137196
    Scenario: Upload from app and check in link upload
        Given I am a registered customer
        And already upload all my document in app
        When I click upload via other device
        And I copy link
        And I access the link
        Then I will see all document already uploaded

    @C137197
    Scenario: Upload from link and check in app
        Given I am a registered customer
        And already register till business address
        When I click upload via other device
        And I copy link
        And I access the link
        And I upload all document
        And I will see all document are uploaded successfully
        And I back again to app
        And continue to page document upload
        Then I will see all documents are uploaded successfully

    @C137198
    Scenario: Delete document from app and check in link upload
        Given I am a registered customer
        And already delete one or some document in app
        When I click upload via other device
        And I copy link
        And I access the link
        Then I will see documents that I remove recently is not there anymore

    @C137199
    Scenario: Delete document from link upload and check in app
        Given I am a registered customer
        And already register till business address
        When I click upload via other device
        And I copy link
        And I access the link
        And I upload all document
        And I will see all document are uploaded successfully
        And I delete one or some documents
        And I back again to app
        And continue to page document upload
        Then I will see documents that I remove recently is not there anymore

    @C137200
    Scenario: Upload doc both in app and link at the same time
        Given I am a registered customer
        And already register till business address
        And I standby in two device with other is access link to upload document
        When I try to upload document with same type at the same time
        Then The document that was first successfully uploaded will be updated on both devices

    @C137201
    Scenario: Check in CRM after upload doc via app
        Given I am a registered customer
        And already upload all my document in app
        When I go to CRM
        And access menu verification
        And I open my details request
        Then I will see all documents are uploaded successfully

    @C137202
    Scenario: Check in CRM after upload doc via link upload
        Given I am a registered customer
        And already upload all my document via link upload
        When I go to CRM
        And access menu verification
        And I open my details request
        Then I will see all documents are uploaded successfully

    @C137203    
    Scenario: Check in CRM after delete doc via app
        Given I am a registered customer
        And already delete one or some document in app
        When I go to CRM
        And access menu verification
        And I open my details request
        Then I will see documents that I remove recently is not there anymore

    @C137204
    Scenario: Check in CRM after delete doc via link upload
        Given I am a registered customer
        And already delete one or some document via link upload
        When I go to CRM
        And access menu verification
        And I open my details request
        Then I will see documents that I remove recently is not there anymore

    @C137205
    Scenario: Check in app after upload doc via CRM
        Given I am a registered customer
        And already upload all my document via CRM
        When I go to SMB app
        And continue to page document upload
        Then I will see all documents are uploaded successfully

    @C137206
    Scenario: Check in link upload after upload doc via CRM
        Given I am a registered customer
        And already upload all my document via CRM
        When I go to link upload
        Then I will see all documents are uploaded successfully

    @C137207
    Scenario: Update progress in web view link upload
        Given I am a registered customer
        And already register till business address
        And I standby in two device with other is access link to upload document
        When I upload all document in app
        And I move to device with link upload
        And I click update progress
        Then I will see all documents are uploaded successfully

    @C137208
    Scenario: View document after upload in app
        Given I am a registered customer
        And already register till business address
        When I click upload via other device
        And I copy link
        And I access the link
        And I upload some document
        And I click link document name
        Then I will see document preview

    @C137209
    Scenario: Access link upload after 24 hours    
        Given I am a registered customer
        And already receive link upload
        When I access link after 24 hours
        Then I will direct to page link is expired

    @C137210
    Scenario: Access link upload again in same device
        Given I am a registered customer
        And I already access the link upload
        When I access again the link
        Then I will direct to page upload doc

    @C137211
    Scenario: Access link upload again in different device
        Given I am a registered customer
        And I have two devices
        And I already access the link upload in one device
        When I access again the link in other device
        Then I will direct to page upload doc

    @C137212
    Scenario: Access link upload with SMB app still not installed yet
        Given I have device with app SMB still not installed yet
        When I access link upload document
        Then I will notify I need to install app first 