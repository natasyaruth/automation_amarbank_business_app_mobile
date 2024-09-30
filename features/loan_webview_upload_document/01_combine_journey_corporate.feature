Feature: Upload Data Documents For Cases Combine Journey Corporate
    In order to upload data documents for cases combine journey corporate has types loan
    As a User
    I want to access the link web view for uploading data documents

    Background:
        Given Access to The Link Web View for Uploading Data Documents
        When I has been opened browser
        When I input the link web view for uploading data documents
        And I redirect to the upload data documents page
        Then I should able to see 'Progress Upload Dokumen' page

    Scenario: Verify Page of "Progress Upload Dokumen" with Loan Type AP "PT Perusahaan or CV"
        Given I has been access to the link web view for uploading data documents AP "PT Perusahaan or CV"
        When I see the wording of "Supplier"
        And I see Supplier name
        And I see Loan Id
        Then I see "NIB"
        And I see "Akta Pendirian"
        And I see "SK Kemenkumham"
        And I see "NPWP Perusahaan"
        And I see "KTP & NPWP Komisioner & Pemegang Saham"
        And I see "Minimal 3 contoh invoice dengan supplier terkait"
        And I see "Contoh Mutasi Rekening Koran 6 Bulan Terakhir"
        And I see "Laporan Keuangan dalam 2 tahun terakhir dan tahun berjalan"
        And I see button to update the Progress

    Scenario: Update Progress After Upload Document with Loan Type AP "PT Perusahaan or CV" with Case Partial Uploaded
        Given I has been access to the link web view for uploading data documents AP "PT Perusahaan or CV"
        When I see the wording of "Supplier"
        And I see Supplier name
        And I see Loan Id
        And I upload document in field "NIB"
        And I upload document in field "Akta Pendirian"
        And I upload document in field "SK Kemenkumham"
        Then I update the Progress
        And I see fields upload document
        And I see icon edit

    Scenario: Update Progress After Upload Document with Loan Type AP "PT Perusahaan or CV" with Case Full Uploaded
        Given I has been access to the link web view for uploading data documents AP "PT Perusahaan or CV"
        When I see the wording of "Supplier"
        And I see Supplier name
        And I see Loan Id
        And I upload document in field "NIB"
        And I upload document in field "Akta Pendirian"
        And I upload document in field "SK Kemenkumham"
        And I upload document in field "NPWP Perusahaan"
        And I upload document in field "KTP & NPWP Komisioner & Pemegang Saham"
        And I upload document in field "Minimal 3 contoh invoice dengan supplier terkait"
        And I upload document in field "Contoh Mutasi Rekening Koran 6 Bulan Terakhir"
        And I upload document in field "Laporan Keuangan dalam 2 tahun terakhir dan tahun berjalan"
        Then I update the Progress
        And I see fields upload document

    Scenario: Verify Page of "Progress Upload Dokumen" with Loan Type AP "PT Perorangan or UD"
        Given I has been access to the link web view for uploading data documents AP "PT Perorangan or UD"
        When I see the wording of "Supplier"
        And I see Supplier name
        And I see Loan Id
        Then I see "NIB"
        And I see "Akta Pendirian"
        And I see "Minimal 3 contoh invoice dengan supplier terkait"
        And I see "Contoh Mutasi Rekening Koran 6 Bulan Terakhir"
        And I see "Laporan Keuangan dalam 2 tahun terakhir dan tahun berjalan"
        And I see button to update the Progress

    Scenario: Update Progress After Upload Document with Loan Type AP "PT Perorangan or UD" with Case Partial Uploaded
        Given I has been access to the link web view for uploading data documents AP "PT Perorangan or UD"
        When I see the wording of "Supplier"
        And I see Supplier name
        And I see Loan Id
        And I upload document in field "NIB"
        And I upload document in field "Akta Pendirian"
        Then I update the Progress
        And I see fields upload document
        And I see icon edit

    Scenario: Update Progress After Upload Document with Loan Type AP "PT Perorangan or UD" with Case Full Uploaded
        Given I has been access to the link web view for uploading data documents AP "PT Perorangan or UD"
        When I see the wording of "Supplier"
        And I see Supplier name
        And I see Loan Id
        And I upload document in field "NIB"
        And I upload document in field  "Akta Pendirian"
        And I upload document in field  "Minimal 3 contoh invoice dengan supplier terkait"
        And I upload document in field "Contoh Mutasi Rekening Koran 6 Bulan Terakhir"
        And I upload document in field "Laporan Keuangan dalam 2 tahun terakhir dan tahun berjalan"
        And I see button to update the Progress
        Then I update the Progress
        And I see fields upload document

    Scenario: Verify Page of "Progress Upload Dokumen" with Loan Type AP "Individu"
        Given I has been access to the link web view for uploading data documents AP "Individu"
        When I see the wording of "Supplier"
        And I see Supplier name
        And I see Loan Id
        Then I see "Minimal 3 contoh invoice dengan supplier terkait"
        And I see "Contoh Mutasi Rekening Koran 6 Bulan Terakhir"
        And I see "Laporan Keuangan dalam 2 tahun terakhir dan tahun berjalan"
        And I see button to update the Progress

    Scenario: Update Progress After Upload Document with Loan Type AP "Individu" with Case Partial Uploaded
        Given I has been access to the link web view for uploading data documents AP "Individu"
        When I see the wording of "Supplier"
        And I see Supplier name
        And I see Loan Id
        And I upload document in field "Minimal 3 contoh invoice dengan supplier terkait"
        And I upload document in field "Contoh Mutasi Rekening Koran 6 Bulan Terakhir"
        Then I update the Progress
        And I see fields upload document
        And I see icon edit

    Scenario: Update Progress After Upload Document with Loan Type AP "Individu" with Case Full Uploaded
        Given I has been access to the link web view for uploading data documents AP "Individu"
        When I see the wording of "Supplier"
        And I see Supplier name
        And I see Loan Id
        And I upload document in field  "Minimal 3 contoh invoice dengan supplier terkait"
        And I upload document in field "Contoh Mutasi Rekening Koran 6 Bulan Terakhir"
        And I upload document in field "Laporan Keuangan dalam 2 tahun terakhir dan tahun berjalan"
        And I see button to update the Progress
        Then I update the Progress
        And I see fields upload document

    Scenario: Verify Page of "Progress Upload Dokumen" with Loan Type AR "PT Perusahaan or CV"
        Given I has been access to the link web view for uploading data documents AP "PT Perusahaan or CV"
        When I see the wording of "Buyer"
        And I see Buyer name
        And I see Loan Id
        Then I see "NIB"
        And I see "Akta Pendirian"
        And I see "SK Kemenkumham"
        And I see "NPWP Perusahaan"
        And I see "KTP & NPWP Komisioner & Pemegang Saham"
        And I see "Minimal 3 contoh invoice dengan buyer terkait"
        And I see "Contoh Mutasi Rekening Koran 6 Bulan Terakhir"
        And I see "Laporan Keuangan dalam 2 tahun terakhir dan tahun berjalan"
        And I see button to update the Progress

    Scenario: Update Progress After Upload Document with Loan Type AR "PT Perusahaan or CV" with Case Partial Uploaded
        Given I has been access to the link web view for uploading data documents AP "PT Perusahaan or CV"
        When I see the wording of "Supplier"
        And I see Buyer name
        And I see Loan Id
        And I upload document in field "NIB"
        And I upload document in field "Akta Pendirian"
        And I upload document in field "SK Kemenkumham"
        Then I update the Progress
        And I see fields upload document
        And I see icon edit

    Scenario: Update Progress After Upload Document with Loan Type AR "PT Perusahaan or CV" with Case Full Uploaded
        Given I has been access to the link web view for uploading data documents AP "PT Perusahaan or CV"
        When I see the wording of "Buyer"
        And I see Buyer name
        And I see Loan Id
        And I upload document in field "NIB"
        And I upload document in field "Akta Pendirian"
        And I upload document in field "SK Kemenkumham"
        And I upload document in field "NPWP Perusahaan"
        And I upload document in field "KTP & NPWP Komisioner & Pemegang Saham"
        And I upload document in field "Minimal 3 contoh invoice dengan buyer terkait"
        And I upload document in field "Contoh Mutasi Rekening Koran 6 Bulan Terakhir"
        And I upload document in field "Laporan Keuangan dalam 2 tahun terakhir dan tahun berjalan"
        Then I update the Progress
        And I see fields upload document

    Scenario: Verify Page of "Progress Upload Dokumen" with Loan Type AP "PT Perorangan or UD"
        Given I has been access to the link web view for uploading data documents AP "PT Perorangan or UD"
        When I see the wording of "Buyer"
        And I see Buyer name
        And I see Loan Id
        Then I see "NIB"
        And I see "Akta Pendirian"
        And I see "Minimal 3 contoh invoice dengan buyer terkait"
        And I see "Contoh Mutasi Rekening Koran 6 Bulan Terakhir"
        And I see "Laporan Keuangan dalam 2 tahun terakhir dan tahun berjalan"
        And I see button to update the Progress

    Scenario: Update Progress After Upload Document with Loan Type AR "PT PT Perorangan or UD" with Case Partial Uploaded
        Given I has been access to the link web view for uploading data documents AP "PT Perorangan or UD"
        When I see the wording of "Buyer"
        And I see Buyer name
        And I see Loan Id
        And I upload document in field "NIB"
        And I upload document in field "Akta Pendirian"
        Then I update the Progress
        And I see fields upload document
        And I see icon edit

    Scenario: Update Progress After Upload Document with Loan Type AR "PT Perorangan or UD" with Case Full Uploaded
        Given I has been access to the link web view for uploading data documents AP "PT Perorangan or UD"
        When I see the wording of "Buyer"
        And I see Buyer name
        And I see Loan Id
        And I upload document in field "NIB"
        And I upload document in field  "Akta Pendirian"
        And I upload document in field  "Minimal 3 contoh invoice dengan buyer terkait"
        And I upload document in field "Contoh Mutasi Rekening Koran 6 Bulan Terakhir"
        And I upload document in field "Laporan Keuangan dalam 2 tahun terakhir dan tahun berjalan"
        And I see button to update the Progress
        Then I update the Progress
        And I see fields upload document

    Scenario: Verify Page of "Progress Upload Dokumen" with Loan Type AR "Individu"
        Given I has been access to the link web view for uploading data documents AP "Individu"
        When I see the wording of "Buyer"
        And I see Buyer name
        And I see Loan Id
        Then I see "Minimal 3 contoh invoice dengan buyer terkait"
        And I see "Contoh Mutasi Rekening Koran 6 Bulan Terakhir"
        And I see "Laporan Keuangan dalam 2 tahun terakhir dan tahun berjalan"
        And I see button to update the Progress

    Scenario: Update Progress After Upload Document with Loan Type AR "Individu" with Case Partial Uploaded
        Given I has been access to the link web view for uploading data documents AP "Individu"
        When I see the wording of "Buyer"
        And I see Buyer name
        And I see Loan Id
        And I upload document in field "Minimal 3 contoh invoice dengan buyer terkait"
        And I upload document in field "Contoh Mutasi Rekening Koran 6 Bulan Terakhir"
        Then I update the Progress
        And I see fields upload document
        And I see icon edit

    Scenario: Update Progress After Upload Document with Loan Type AR "Individu" with Case Full Uploaded
        Given I has been access to the link web view for uploading data documents AP "Individu"
        When I see the wording of "Buyer"
        And I see Buyer name
        And I see Loan Id
        And I upload document in field  "Minimal 3 contoh invoice dengan supplier terkait"
        And I upload document in field "Contoh Mutasi Rekening Koran 6 Bulan Terakhir"
        And I upload document in field "Laporan Keuangan dalam 2 tahun terakhir dan tahun berjalan"
        And I see button to update the Progress
        Then I update the Progress
        And I see fields upload document

    Scenario: Direct to the expired link upload document
        Given I has been access to the link web view for upload document
        When I am on the expired link page
        Then I see wording "Link Telah Kedaluwarsa"
        And I see wording "Anda dapat membuat link baru di dalam aplikasi Amar Bank Bisnis Anda"

    Scenario: Update Progress After Upload Multiple Documents With Loan Type AP Corporate
        Given I has been access to the link web view for upload multiple data documents AP "PT Perusahaan or CV"
        When I see the wording of "Supplier"
        And I see Supplier name
        And I see Loan Id
        And I see wording of "Format file: PDF"
        And I see wording of "Maximal ukuran per file: 15B"
        And I see wording of "Anda dapat upload langsung beberapa file"
        And I see "NIB"
        And I see "Akta Pendirian"
        And I see "SK Kemenkumham"
        And I see "NPWP Perusahaan"
        Then I upload multiple documents of field "KTP Komisioner & Pemegang Saham"
        And I upload multiple documents of field "NPWP Komisioner & Pemegang Saham"
        And I upload multiple documents of field "Minimal 3 contoh invoice dengan supplier terkait"
        And I upload multiple documents of field "Contoh Mutasi Rekening Koran 6 Bulan Terakhir"
        And I upload multiple documents of field "Laporan Keuangan dalam 2 tahun terakhir dan tahun berjalan"
        And I click button to update the Progress

    Scenario: Update Progress After Upload Multiple Documents With Loan Type AR Corporate
        Given I has been access to the link web view for upload multiple data documents AP "PT Perusahaan or CV"
        When I see the wording of "Supplier"
        And I see Supplier name
        And I see Loan Id
        And I see wording of "Format file: PDF"
        And I see wording of "Maximal ukuran per file: 15B"
        And I see wording of "Anda dapat upload langsung beberapa file"
        And I see "NIB"
        And I see "Akta Pendirian"
        And I see "SK Kemenkumham"
        And I see "NPWP Perusahaan"
        Then I upload multiple documents of field "KTP Komisioner & Pemegang Saham"
        And I upload multiple documents of field "NPWP Komisioner & Pemegang Saham"
        And I upload multiple documents of field "Minimal 3 contoh invoice dengan buyer terkait"
        And I upload multiple documents of field "Contoh Mutasi Rekening Koran 6 Bulan Terakhir"
        And I upload multiple documents of field "Laporan Keuangan dalam 2 tahun terakhir dan tahun berjalan"
        And I click button to update the Progress

    Scenario: Delete Uploaded Document Loan Type Corporate when upload file more than 15MB
        Given I has been access to the link web view for upload multiple data documents for AP or AR Corporate
        When I upload multiple documents of field "Laporan Keuangan dalam 2 tahun terakhir dan tahun berjalan"
        And I delete one of the document
        Then the deleted document will dissapear from the field
        And I click button to update the Progres
        And the new updated document will updated to mobile apps

    Scenario: Cancel Uploading Document Loan Type Corporate
        Given I has been access to the link web view for upload multiple data documents for AP or AR Corporate
        When I upload multiple documents of field "Laporan Keuangan dalam 2 tahun terakhir dan tahun berjalan"
        And I see botton cancel uploading
        And cancel the uploading document process
        Then the uploading document will canceled and dissapear from the field
        And I click button to update the Progres
        And the new updated document will updated to mobile apps

    Scenario: Delete The Document After Success Upload Document
        Given I has been access to the link web view for upload multiple data documents
        When I upload multiple documents of field "Rekening Koran/Mutasi operasional 6 bulan terakhir"
        And I see botton delete upload
        And delete the uploading document process
        And I see pop up confirmation delete document
        And I click button delete
        Then the document is deleted
        And the document will dissapear
        And the new deleted document will dissapear from mobile apps as well

    Scenario: Cancel Document Deletion After Success Uploading Document
        Given I has been access to the link web view for upload multiple data documents
        When I upload multiple documents of field "Rekening Koran/Mutasi operasional 6 bulan terakhir"
        And I see botton delete upload
        And delete the uploading document process
        And I see pop up confirmation delete document
        And I click button cancel
        Then the deleting document is cancelled
        And the document still appears in its field


## Add File Size ##
    @FunctTestLending
    Scenario: validate document size when upload document AP PT.Perusahaan or CV   
        Given I has been access to the link web view for upload multiple data documents AP "PT Perusahaan or CV"
        When I see the wording of "Supplier"
        And I see Supplier name
        And I see Loan Id
        And I see wording of "Format file: PDF"
        And I see wording of "Maximal ukuran per file: 15B"
        And I see wording of "Anda dapat upload langsung beberapa file"
        And I see "NIB"
        And I see the file size should be displayed  "2.1MB"
        And I see "Akta Pendirian"
        And I see the file size should be displayed "2.1MB"
        And I see "SK Kemenkumham"
        And I see the file size should be displayed "2.1MB"
        And I see "NPWP Perusahaan"
        And I see the file size should be displayed "2.1MB"
        Then I upload multiple documents of field "KTP Komisioner & Pemegang Saham"
        And I see the file size should be displayed "5 MB"
        And I upload multiple documents of field "NPWP Komisioner & Pemegang Saham"
        And I see the file size should be displayed "4 MB"
        And I upload multiple documents of field "Minimal 3 contoh invoice dengan supplier terkait"
        And I see the file size should be displayed "2 MB"
        And I upload multiple documents of field "Contoh Mutasi Rekening Koran 6 Bulan Terakhir"
        And I see the file size should be displayed "1.4 MB"
        And I upload multiple documents of field "Laporan Keuangan dalam 2 tahun terakhir dan tahun berjalan"
        And I see the file size should be displayed "1.5 MB"
        And I see button to update the Progress

        
@FunctTestLending
Scenario: validate document size when upload document AR PT.Perusahaan or CV   
        Given I has been access to the link web view for upload multiple data documents AR "PT Perusahaan or CV"
        When I see the wording of "Buyer"
        And I see Supplier name
        And I see Loan Id
        And I see wording of "Format file: PDF"
        And I see wording of "Maximal ukuran per file: 15B"
        And I see wording of "Anda dapat upload langsung beberapa file"
        And I see "NIB"
        And I see the file size should be displayed "1.7 MB"
        And I see "Akta Pendirian"
        And I see the file size should be displayed "1.4 MB"
        And I see "SK Kemenkumham"
        And I see the file size should be displayed "1.8 MB"
        And I see "NPWP Perusahaan"
        And I see the file size should be displayed "1.2 MB"
        Then I upload multiple documents of field "KTP Komisioner & Pemegang Saham"
        And I see the file size should be displayed  "1.2 MB"
        And I upload multiple documents of field "NPWP Komisioner & Pemegang Saham"
        And I see the file size should be displayed  "1.2 MB"
        And I upload multiple documents of field "Minima l contoh invoice dengan buyer terkait"
        And I see the file size should be displayed  "1.2 MB"
        And I upload multiple documents of field "Contoh Mutasi Rekening Koran 6 Bulan Terakhir"
        And I see the file size should be displayed  "1.2 MB"
        And I upload multiple documents of field "Laporan Keuangan dalam 2 tahun terakhir dan tahun berjalan"
        And I see the file size should be displayed  "1.2 MB"
        And I see button to update the Progress

        
@FunctTestLending        
Scenario: validate document size when upload document AP PT.Perorangan or UD   
        Given I has been access to the link web view for upload multiple data documents AP "PT Perorangan or UD"
        When I see the wording of "Supplier"
        And I see Supplier name
        And I see Loan Id
        And I see wording of "Format file: PDF"
        And I see wording of "Maximal ukuran per file: 15B"
        And I see wording of "Anda dapat upload langsung beberapa file"
        And I see "NIB"
        And I see the file size should be displayed  "1.2 MB"
        And I see "Akta Pendirian"
        And I see the file size should be displayed      
        And I upload multiple documents of field "Minimal 3 contoh invoice dengan supplier terkait"
        And I see the file size should be displayed  "1.2 MB"
        And I upload multiple documents of field "Contoh Mutasi Rekening Koran 6 Bulan Terakhir"
        And I see the file size should be displayed "1.2 MB"
        And I upload multiple documents of field "Laporan Keuangan dalam 2 tahun terakhir dan tahun berjalan"
        And I see the file size should be displayed  "1.2 MB"
        And I see button to update the Progress


@FunctTestLending
Scenario: validate document size when upload document AR PT.Perorangan or UD   
        Given I has been access to the link web view for upload multiple data documents AR "PT Perorangan or UD"
        When I see the wording of "Buyer"
        And I see Supplier name
        And I see Loan Id
        And I see wording of "Format file: PDF"
        And I see wording of "Maximal ukuran per file: 15B"
        And I see wording of "Anda dapat upload langsung beberapa file"
        And I see "NIB"
        And I see the file size should be displayed  "1.2 MB"
        And I see "Akta Pendirian"
        And I see the file size should be displayed  "1.2 MB"     
        And I upload multiple documents of field "Minimal 3 contoh invoice dengan buyer terkait"
        And I see the file size should be displayed  "1.2 MB"
        And I upload multiple documents of field "Contoh Mutasi Rekening Koran 6 Bulan Terakhir"
        And I see the file size should be displayed  "1.2 MB"
        And I upload multiple documents of field "Laporan Keuangan dalam 2 tahun terakhir dan tahun berjalan"
        And I see the file size should be displayed  "1.2 MB"
        And I see button to update the Progress

    
@FunctTestLending    
Scenario: validate document size when upload document AP Individu
        Given I has been access to the link web view for upload multiple data documents AP "Individu"
        When I see the wording of "Supplier"
        And I see Supplier name
        And I see Loan Id
        And I see wording of "Format file: PDF"
        And I see wording of "Maximal ukuran per file: 15B"
        And I see wording of "Anda dapat upload langsung beberapa file"           
        And I upload multiple documents of field "Minimal 3 contoh invoice dengan supplier terkait"
        And I see the file size should be displayed  "1.2 MB"
        And I upload multiple documents of field "Contoh Mutasi Rekening Koran 6 Bulan Terakhir"
        And I see the file size should be displayed  "1.2 MB"
        And I upload multiple documents of field "Laporan Keuangan dalam 2 tahun terakhir dan tahun berjalan"
        And I see the file size should be displayed  "1.2 MB"
        And I see button to update the Progress


@FunctTestLending
Scenario: validate document size when upload document AR Individu
        Given I has been access to the link web view for upload multiple data documents AR "Individu"
        When I see the wording of "Buyer"
        And I see Supplier name
        And I see Loan Id
        And I see wording of "Format file: PDF"
        And I see wording of "Maximal ukuran per file: 15B"
        And I see wording of "Anda dapat upload langsung beberapa file"           
        And I upload multiple documents of field "Minimal 3 contoh invoice dengan buyer terkait"
        And I see the file size should be displayed  "1.2 MB"
        And I upload multiple documents of field "Contoh Mutasi Rekening Koran 6 Bulan Terakhir"
        And I see the file size should be displayed  "1.2 MB"
        And I upload multiple documents of field "Laporan Keuangan dalam 2 tahun terakhir dan tahun berjalan"
        And I see the file size should be displayed  "1.2 MB"
        And I see button to update the Progress

@FunctTestLending
Scenario: Validate all the document successfully uploaded on web in AP PT.Perusahaan
        Given I has been access to the link web view for upload multiple data documents AP "PT Perusahaan or CV"
        When I see the wording of "Supplier"
        And I see Supplier name
        And I see Loan Id
        And I see wording of "Format file: PDF"
        And I see wording of "Maximal ukuran per file: 15B"
        And I see wording of "Anda dapat upload langsung beberapa file"
        And I see "NIB"
        And I see the file size should be displayed "1.7 MB"
        And I see "Akta Pendirian"
        And I see the file size should be displayed "1.4 MB"
        And I see "SK Kemenkumham"
        And I see the file size should be displayed "1.8 MB"
        And I see "NPWP Perusahaan"
        And I see the file size should be displayed "1.2 MB"
        Then I upload multiple documents of field "KTP Komisioner & Pemegang Saham"
        And I see the file size should be displayed  "1.2 MB"
        And I upload multiple documents of field "NPWP Komisioner & Pemegang Saham"
        And I see the file size should be displayed  "1.2 MB"
        And I upload multiple documents of field "Minima l contoh invoice dengan supplier terkait"
        And I see the file size should be displayed  "1.2 MB"
        And I upload multiple documents of field "Contoh Mutasi Rekening Koran 6 Bulan Terakhir"
        And I see the file size should be displayed  "1.2 MB"
        And I upload multiple documents of field "Laporan Keuangan dalam 2 tahun terakhir dan tahun berjalan"
        And I see the file size should be displayed  "1.2 MB"
        And I click button to update the Progress
        And I click button Perbarui Progress on mobile
        And I see button Kirim Pengajuan Limit Kredit
        
@FunctTestLending
Scenario: Validate all the document successfully uploaded on web in AR PT.Perusahaan or CV   
        Given I has been access to the link web view for upload multiple data documents AR "PT Perusahaan or CV"
        When I see the wording of "Buyer"
        And I see Supplier name
        And I see Loan Id
        And I see wording of "Format file: PDF"
        And I see wording of "Maximal ukuran per file: 15B"
        And I see wording of "Anda dapat upload langsung beberapa file"
        And I see "NIB"
        And I see the file size should be displayed "1.7 MB"
        And I see "Akta Pendirian"
        And I see the file size should be displayed "1.4 MB"
        And I see "SK Kemenkumham"
        And I see the file size should be displayed "1.8 MB"
        And I see "NPWP Perusahaan"
        And I see the file size should be displayed "1.2 MB"
        Then I upload multiple documents of field "KTP Komisioner & Pemegang Saham"
        And I see the file size should be displayed  "1.2 MB"
        And I upload multiple documents of field "NPWP Komisioner & Pemegang Saham"
        And I see the file size should be displayed  "1.2 MB"
        And I upload multiple documents of field "Minima l contoh invoice dengan buyer terkait"
        And I see the file size should be displayed  "1.2 MB"
        And I upload multiple documents of field "Contoh Mutasi Rekening Koran 6 Bulan Terakhir"
        And I see the file size should be displayed  "1.2 MB"
        And I upload multiple documents of field "Laporan Keuangan dalam 2 tahun terakhir dan tahun berjalan"
        And I see the file size should be displayed  "1.2 MB"
        And I click button to update the Progress
        And I click button Perbarui Progress on mobile
        And I see button Kirim Pengajuan Limit Kredit


@FunctTestLending
Scenario: Validate all the document successfully uploaded on web in AP PT.Perorangan or UD   
        Given I has been access to the link web view for upload multiple data documents AP "PT Perorangan or UD"
        When I see the wording of "Supplier"
        And I see Supplier name
        And I see Loan Id
        And I see wording of "Format file: PDF"
        And I see wording of "Maximal ukuran per file: 15B"
        And I see wording of "Anda dapat upload langsung beberapa file"
        And I see "NIB"
        And I see the file size should be displayed  "1.2 MB"
        And I see "Akta Pendirian"
        And I see the file size should be displayed      
        And I upload multiple documents of field "Minimal 3 contoh invoice dengan supplier terkait"
        And I see the file size should be displayed  "1.2 MB"
        And I upload multiple documents of field "Contoh Mutasi Rekening Koran 6 Bulan Terakhir"
        And I see the file size should be displayed "1.2 MB"
        And I upload multiple documents of field "Laporan Keuangan dalam 2 tahun terakhir dan tahun berjalan"
        And I see the file size should be displayed  "1.2 MB"
        And I click button to update the Progress
        And I click button Perbarui Progress on mobile
        And I see button Kirim Pengajuan Limit Kredit


@FunctTestLending
Scenario: Validate all the document successfully uploaded on web in AP PT.Perorangan or UD   
        Given I has been access to the link web view for upload multiple data documents AP "PT Perorangan or UD"
        When I see the wording of "Supplier"
        And I see Supplier name
        And I see Loan Id
        And I see wording of "Format file: PDF"
        And I see wording of "Maximal ukuran per file: 15B"
        And I see wording of "Anda dapat upload langsung beberapa file"
        And I see "NIB"
        And I see the file size should be displayed  "1.2 MB"
        And I see "Akta Pendirian"
        And I see the file size should be displayed      
        And I upload multiple documents of field "Minimal 3 contoh invoice dengan supplier terkait"
        And I see the file size should be displayed  "1.2 MB"
        And I upload multiple documents of field "Contoh Mutasi Rekening Koran 6 Bulan Terakhir"
        And I see the file size should be displayed "1.2 MB"
        And I upload multiple documents of field "Laporan Keuangan dalam 2 tahun terakhir dan tahun berjalan"
        And I see the file size should be displayed  "1.2 MB"
        And I click button to update the Progress
        And I click button Perbarui Progress on mobile
        And I see button Kirim Pengajuan Limit Kredit

@FunctTestLending
Scenario: Validate all the document successfully uploaded on web in AR PT.Perorangan or UD   
        Given I has been access to the link web view for upload multiple data documents AR "PT Perorangan or UD"
        When I see the wording of "Buyer"
        And I see Supplier name
        And I see Loan Id
        And I see wording of "Format file: PDF"
        And I see wording of "Maximal ukuran per file: 15B"
        And I see wording of "Anda dapat upload langsung beberapa file"
        And I see "NIB"
        And I see the file size should be displayed  "1.2 MB"
        And I see "Akta Pendirian"
        And I see the file size should be displayed  "1.2 MB"     
        And I upload multiple documents of field "Minimal 3 contoh invoice dengan buyer terkait"
        And I see the file size should be displayed  "1.2 MB"
        And I upload multiple documents of field "Contoh Mutasi Rekening Koran 6 Bulan Terakhir"
        And I see the file size should be displayed  "1.2 MB"
        And I upload multiple documents of field "Laporan Keuangan dalam 2 tahun terakhir dan tahun berjalan"
        And I see the file size should be displayed  "1.2 MB"
        And I click button to update the Progress
        And I click button Perbarui Progress on mobile
        And I see button Kirim Pengajuan Limit Kredit

@FunctTestLending    
Scenario: Validate all the document successfully uploaded on web in AP Individu
        Given I has been access to the link web view for upload multiple data documents AP "Individu"
        When I see the wording of "Supplier"
        And I see Supplier name
        And I see Loan Id
        And I see wording of "Format file: PDF"
        And I see wording of "Maximal ukuran per file: 15B"
        And I see wording of "Anda dapat upload langsung beberapa file"           
        And I upload multiple documents of field "Minimal 3 contoh invoice dengan supplier terkait"
        And I see the file size should be displayed  "1.2 MB"
        And I upload multiple documents of field "Contoh Mutasi Rekening Koran 6 Bulan Terakhir"
        And I see the file size should be displayed  "1.2 MB"
        And I upload multiple documents of field "Laporan Keuangan dalam 2 tahun terakhir dan tahun berjalan"
        And I see the file size should be displayed  "1.2 MB"
        And I click button to update the Progress
        And I click button Perbarui Progress on mobile
        And I see button Kirim Pengajuan Limit Kredit

@FunctTestLending
Scenario: Validate all the document successfully uploaded on web in AR Individu
        Given I has been access to the link web view for upload multiple data documents AR "Individu"
        When I see the wording of "Buyer"
        And I see Supplier name
        And I see Loan Id
        And I see wording of "Format file: PDF"
        And I see wording of "Maximal ukuran per file: 15B"
        And I see wording of "Anda dapat upload langsung beberapa file"           
        And I upload multiple documents of field "Minimal 3 contoh invoice dengan buyer terkait"
        And I see the file size should be displayed  "1.2 MB"
        And I upload multiple documents of field "Contoh Mutasi Rekening Koran 6 Bulan Terakhir"
        And I see the file size should be displayed  "1.2 MB"
        And I upload multiple documents of field "Laporan Keuangan dalam 2 tahun terakhir dan tahun berjalan"
        And I see the file size should be displayed  "1.2 MB"
        And I click button to update the Progress
        And I click button Perbarui Progress on mobile
        And I see button Kirim Pengajuan Limit Kredit


##Click button “Upload Dokumen Selesai” after upload all mandatory
@FunctTestLendingSprint5
    Scenario: Verify after upload all mandatory documents in combine journey AP 
        Given I has been access to the link web view for upload multiple data documents AP "PT Perorangan or UD"
        When I see the wording of "Supplier"
        And I see Supplier name
        And I see Loan Id
        And I see wording of "Format file: PDF"
        And I see wording of "Maximal ukuran per file: 15B"
        And I see wording of "Anda dapat upload langsung beberapa file"
        And I see "NIB"
        And I see the file size should be displayed  "1.2 MB"
        And I see "Akta Pendirian"
        And I see the file size should be displayed      
        And I upload multiple documents of field "Minimal 3 contoh invoice dengan supplier terkait"
        And I see the file size should be displayed  "1.2 MB"
        And I upload multiple documents of field "Contoh Mutasi Rekening Koran 6 Bulan Terakhir"
        And I see the file size should be displayed "1.2 MB"
        And I upload multiple documents of field "Laporan Keuangan dalam 2 tahun terakhir dan tahun berjalan"
        And I see the file size should be displayed  "1.2 MB"
        Then I see button Upload Dokumen Selesai
@FunctTestLendingSprint5
    Scenario: User successfully uploaded all documents in web for loan AP
        Given I has upload all documents in web
        When I clik button Upload Dokumen Selesai
        And I see dialog box confirmation 'Upload Dokumen Selesai'
        And I click button Mengerti
        Then I see on Mobile and all documents have uploaded 
        And I see button Kirim Pengajuan Limit Kredit

@FunctTestLendingSprint5
    Scenario: Verify button Kirim Dokumen after re-Upload if there is new document uploaded and all mandatory
        Given I has been access to the link web view for upload multiple data documents AP "PT Perorangan or UD"
        When I see the wording of "Supplier"
        And I see Supplier name
        And I see Loan Id
        And I see wording of "Format file: PDF"
        And I see wording of "Maximal ukuran per file: 15B"
        And I see wording of "Anda dapat upload langsung beberapa file" 
        And I upload multiple documents of field "Contoh Mutasi Rekening Koran 6 Bulan Terakhir"
        And I see the file size should be displayed "1.8 MB"
        And I see button Kirim Dokumen

@FunctTestLendingSprint5
    Scenario: User successfully re-Upload documents
        Given I has reupload documents in web
        When I clik button Kirim Dokumen
        And I see dialog box confirmation 'Dokumen Berhasil Diubah'
        And I click button Mengerti
        Then I back to upload document page
   
    #Loan AR
    @FunctTestLendingSprint5
    Scenario: Verify after upload all mandatory documents in combine journey AR 
        Given I has been access to the link web view for upload multiple data documents AR "PT Perusahaan or CV"
        When I see the wording of "Buyer"
        And I see Supplier name
        And I see Loan Id
        And I see wording of "Format file: PDF"
        And I see wording of "Maximal ukuran per file: 15B"
        And I see wording of "Anda dapat upload langsung beberapa file"
        And I see "NIB"
        And I see the file size should be displayed "1.7 MB"
        And I see "Akta Pendirian"
        And I see the file size should be displayed "1.4 MB"
        And I see "SK Kemenkumham"
        And I see the file size should be displayed "1.8 MB"
        And I see "NPWP Perusahaan"
        And I see the file size should be displayed "1.2 MB"
        Then I upload multiple documents of field "KTP Komisioner & Pemegang Saham"
        And I see the file size should be displayed  "1.2 MB"
        And I upload multiple documents of field "NPWP Komisioner & Pemegang Saham"
        And I see the file size should be displayed  "1.2 MB"
        And I upload multiple documents of field "Minima l contoh invoice dengan buyer terkait"
        And I see the file size should be displayed  "1.2 MB"
        And I upload multiple documents of field "Contoh Mutasi Rekening Koran 6 Bulan Terakhir"
        And I see the file size should be displayed  "1.2 MB"
        And I upload multiple documents of field "Laporan Keuangan dalam 2 tahun terakhir dan tahun berjalan"
        And I see the file size should be displayed  "1.2 MB"
        Then I see button Upload Dokumen Selesai

    @FunctTestLendingSprint5
    Scenario: User successfully uploaded all documents in web for loan AR
        Given I has upload all documents in web
        When I clik button Upload Dokumen Selesai
        And I see dialog box confirmation 'Upload Dokumen Selesai'
        And I click button Mengerti
        Then I see on Mobile and all documents have uploaded 
        And I see button Kirim Pengajuan Limit Kredit

    @FunctTestLendingSprint5
    Scenario: Verify button Kirim Dokumen after re-Upload if there is new document uploaded and all mandatory
        Given I has been access to the link web view for upload multiple data documents AR "PT Perusahaan or CV"
        When I see the wording of "Buyer"
        And I see Supplier name
        And I see Loan Id
        And I see wording of "Format file: PDF"
        And I see wording of "Maximal ukuran per file: 15B"
        And I see wording of "Anda dapat upload langsung beberapa file" 
        And I upload multiple documents of field "Contoh Mutasi Rekening Koran 6 Bulan Terakhir"
        And I see the file size should be displayed "1.8 MB"
        And I see button Kirim Dokumen

    @FunctTestLendingSprint5
    Scenario: User successfully re-Upload documents
        Given I has reupload documents in web
        When I clik button Kirim Dokumen
        And I see dialog box confirmation 'Dokumen Berhasil Diubah'
        And I click button Mengerti
        Then I back to upload document page


    #Loan AP Individu
    @FunctTestLendingSprint5
    Scenario: Verify after upload all mandatory documents in combine journey AP
        Given I has been access to the link web view for upload multiple data documents AP "Individu"
        When I see the wording of "Supplier"
        And I see Supplier name
        And I see Loan Id
        And I see wording of "Format file: PDF"
        And I see wording of "Maximal ukuran per file: 15B"
        And I see wording of "Anda dapat upload langsung beberapa file"           
        And I upload multiple documents of field "Minimal 3 contoh invoice dengan supplier terkait"
        And I see the file size should be displayed  "1.2 MB"
        And I upload multiple documents of field "Contoh Mutasi Rekening Koran 6 Bulan Terakhir"
        And I see the file size should be displayed  "1.2 MB"
        And I upload multiple documents of field "Laporan Keuangan dalam 2 tahun terakhir dan tahun berjalan"
        And I see the file size should be displayed  "1.2 MB"
        Then I see button Upload Dokumen Selesai

    @FunctTestLendingSprint5
    Scenario: User successfully uploaded all documents in web for loan AP
        Given I has upload all documents in web
        When I clik button Upload Dokumen Selesai
        And I see dialog box confirmation 'Upload Dokumen Selesai'
        And I click button Mengerti
        Then I see on Mobile and all documents have uploaded 
        And I see button Kirim Pengajuan Limit Kredit


    @FunctTestLendingSprint5
    Scenario: Verify button Kirim Dokumen after re-Upload if there is new document uploaded and all mandatory
        Given I has been access to the link web view for upload multiple data documents AP "Individu"
        When I see the wording of "Supplier"
        And I see Supplier name
        And I see Loan Id
        And I see wording of "Format file: PDF"
        And I see wording of "Maximal ukuran per file: 15B"
        And I see wording of "Anda dapat upload langsung beberapa file" 
        And I upload multiple documents of field "Contoh Mutasi Rekening Koran 6 Bulan Terakhir"
        And I see the file size should be displayed "1.8 MB"
        And I see button Kirim Dokumen

    @FunctTestLendingSprint5
    Scenario: User successfully re-Upload documents
        Given I has reupload documents in web
        When I clik button Kirim Dokumen
        And I see dialog box confirmation 'Dokumen Berhasil Diubah'
        And I click button Mengerti
        Then I back to upload document page