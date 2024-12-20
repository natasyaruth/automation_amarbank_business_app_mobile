Feature: Account Opening KYB - Upload Document Business
    In order to opening my Giro account with legality business type CV in SMB
    As a customer
    I want to upload document business as part of the KYB Process

    @C171501
    Scenario: Upload document with file size more than 15 MB in mobile
        Given I am a registered customer
        And already register till business address
        When I upload document with size more than 15MB
        Then I will see message error 'File melebihi maksimal ukuran 15MB.' in the below of section upload document
        And I see filename and size of the file
        And I see icon to delete file
        And after I delete, there is no pop up to confirm

    @C171502
    Scenario: Upload document with file other than PDF, JPG, PNG and JPEG in mobile
        Given I am a customer
        And access link upload document
        When I upload document with type other than PDF, JPG, PNG and JPEG
        Then  I will see message error 'File harus dalam format PDF / JPG / JPEG / PNG.' in the below of section upload document
        And I see filename and size of the file
        And I see icon to delete file and reupload file
        And after I delete, there is no pop up to confirm
        And if I click reupload file, it would reupload again the file

    @C171503
    Scenario: Upload document with file size more than 15 MB in web view
        Given I am a registered customer
        And access link upload document
        When I upload document with size more than 15MB
        Then I will see message error 'File melebihi maksimal ukuran 15MB.' in the below of section upload document
        And I see filename and size of the file
        And I see icon to delete file
        And after I delete, there is no pop up to confirm

    @C171504
    Scenario: Upload document with file other than PDF, JPG, PNG and JPEG in web view
        Given I am a registered customer
        And access link upload document
        When I upload document with type other than PDF, JPG, PNG and JPEG
        Then  I will see message error 'File harus dalam format PDF / JPG / JPEG / PNG.' in the below of section upload document
        And I see filename and size of the file
        And I see icon to delete file and reupload file
        And after I delete, there is no pop up to confirm
        And if I click reupload file, it would reupload again the file    

    @C171506
    Scenario: Upload document and get error timeout in mobile
        Given I am a registered customer
        And already register till business address
        When I upload document and timeout
        Then I will see message error 'Koneksi bermasalah. Periksa jaringan Anda dan coba lagi.' in the below of section upload document

    @C171507
    Scenario: Delete document and get error server in mobile
        Given I am a registered customer
        And already register till business address
        When I upload document
        And I delete my document and got error
        Then I will see snackbar error with message 'Terjadi kendala server, coba beberapa saat lagi.'

    @C171508
    Scenario: Check pop up permission
        Given I am a registered customer
        And already register till submit list director
        And I disallowed permission for app SMB
        When I try to login again
        And I continue to submit business address
        Then I will see pop up permission storage with wording same with figma
        And I click understand
        And I allowed the permission

    @C171510
    Scenario: Upload all doc PT Perusahaan via link
        Given I am a registered customer
        And already register as PT Perusahaan till business address
        When I click upload via other device
        And I copy link
        And I access the link
        And I upload all document
        Then I will see all document are uploaded successfully
        And I will see button complete upload document business

    @C171511
    Scenario: Upload all doc CV via link
        Given I am a registered customer
        And already register as CV till business address
        When I click upload via other device
        And I copy link
        And I access the link
        And I upload all document
        Then I will see all document are uploaded successfully
        And I will see button complete upload document business

    @C171512
    Scenario: Upload all doc UD via link
        Given I am a registered customer
        And already register as UD till business address
        When I click upload via other device
        And I copy link
        And I access the link
        And I upload all document
        Then I will see all document are uploaded successfully
        And I will see button complete upload document business

    @C171514
    Scenario: Upload all doc PT Perorangan via link
        Given I am a registered customer
        And already register as PT Perorangan till business address
        When I click upload via other device
        And I copy link
        And I access the link
        And I upload all document
        Then I will see all document are uploaded successfully
        And I will see button complete upload document business

    @C171515
    Scenario: Upload document PT Perusahaan only required
        Given I am a registered customer
        And already register as PT Perusahaan till business address
        When I click upload via other device
        And I copy link
        And I access the link
        And I upload only required document
        Then I will see all required document are uploaded successfully
        And I will see button complete upload document business

    @C171517
    Scenario: Upload document CV only required
        Given I am a registered customer
        And already register as CV till business address
        When I click upload via other device
        And I copy link
        And I access the link
        And I upload only required document
        Then I will see all required document are uploaded successfully
        And I will see button complete upload document business

    @C171518
    Scenario: Upload document PT Perorangan only required
        Given I am a registered customer
        And already register as PT Perorangan till business address
        When I click upload via other device
        And I copy link
        And I access the link
        And I upload only required document
        Then I will see all required document are uploaded successfully
        And I will see button complete upload document business

    @C171520
    Scenario: Checking button complete upload document if user upload un-required document each business type (PT Perusahaan, CV and PT Perorangan)
        Given I am a registered customer
        And already register as PT Perusahaan/CV/PT Perorangan till business address
        When I click upload via other device
        And I copy link
        And I access the link
        And I upload only unrequired document
        Then I will see unrequired document are uploaded successfully
        And I will not see button complete upload document business

    @C171521
    Scenario: Checking button complete upload document if user has upload all required document and then delete one of the required document
        Given I am a registered customer
        And already register as PT Perusahaan/CV/PT Perorangan till business address
        When I click upload via other device
        And I copy link
        And I access the link
        And I upload all document
        And I will see button complete upload document business
        And I delete one of the required document
        Then I will not see button complete upload document business

    @C171523
    Scenario: Upload some doc via link
        Given I am a registered customer
        And already register till business address
        When I click upload via other device
        And I copy link
        And I access the link
        And I upload some document
        Then I will see some document are uploaded successfully
        And I will not see button send request account opening

    @C171525
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

    @C171526
    Scenario: Upload from app and check in link upload
        Given I am a registered customer
        And already upload all my document in app
        When I click upload via other device
        And I copy link
        And I access the link
        Then I will see all document already uploaded

    @C171529
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

    @C171530
    Scenario: Delete document from app and check in link upload
        Given I am a registered customer
        And already delete one or some document in app
        When I click upload via other device
        And I copy link
        And I access the link
        Then I will see documents that I remove recently is not there anymore

    @C171532
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

    @C171533
    Scenario: Upload doc both in app and link at the same time
        Given I am a registered customer
        And already register till business address
        And I standby in two device with other is access link to upload document
        When I try to upload document with same type at the same time
        Then The document that was first successfully uploaded will be updated on both devices

    @C171535
    Scenario: Check in CRM after upload doc via app
        Given I am a registered customer
        And already upload all my document in app
        When I go to CRM
        And access menu verification
        And I open my details request
        Then I will see all documents are uploaded successfully

    @C171538
    Scenario: Check in CRM after upload doc via link upload
        Given I am a registered customer
        And already upload all my document via link upload
        When I go to CRM
        And access menu verification
        And I open my details request
        Then I will see all documents are uploaded successfully

    @C171539    
    Scenario: Check in CRM after delete doc via app
        Given I am a registered customer
        And already delete one or some document in app
        When I go to CRM
        And access menu verification
        And I open my details request
        Then I will see documents that I remove recently is not there anymore

    @C171541
    Scenario: Check in CRM after delete doc via link upload
        Given I am a registered customer
        And already delete one or some document via link upload
        When I go to CRM
        And access menu verification
        And I open my details request
        Then I will see documents that I remove recently is not there anymore

    @C171543
    Scenario: Check in app after upload doc via CRM
        Given I am a registered customer
        And already upload all my document via CRM
        When I go to SMB app
        And continue to page document upload
        Then I will see all documents are uploaded successfully

    @C171545
    Scenario: Check in link upload after upload doc via CRM
        Given I am a registered customer
        And already upload all my document via CRM
        When I go to link upload
        Then I will see all documents are uploaded successfully

    @C171547
    Scenario: Update progress in web view link upload
        Given I am a registered customer
        And already register till business address
        And I standby in two device with other is access link to upload document
        When I upload all document in app
        And I move to device with link upload
        And I click update progress
        Then I will see all documents are uploaded successfully

    @C171548
    Scenario: View document after upload in app
        Given I am a registered customer
        And already register till business address
        When I click upload via other device
        And I copy link
        And I access the link
        And I upload some document
        And I click link document name
        Then I will see document preview

    @C171550
    Scenario: Access link upload after 24 hours    
        Given I am a registered customer
        And already receive link upload
        When I access link after 24 hours
        Then I will direct to page link is expired

    @C171552
    Scenario: Access link upload again in same device
        Given I am a registered customer
        And I already access the link upload
        When I access again the link
        Then I will direct to page upload doc

    @C171553
    Scenario: Access link upload again in different device
        Given I am a registered customer
        And I have two devices
        And I already access the link upload in one device
        When I access again the link in other device
        Then I will direct to page upload doc

    @C171555
    Scenario: Access link upload with SMB app still not installed yet
        Given I have device with app SMB still not installed yet
        When I access link upload document
        Then I will notify I need to install app first