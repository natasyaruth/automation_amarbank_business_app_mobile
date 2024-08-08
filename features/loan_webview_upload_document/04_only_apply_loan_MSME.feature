Feature: Upload Data Documents For Cases Loan Only Journey MSME
    In order to upload data documents for cases loan only journey MSME has types loan
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
        Then I see "KTP & NPWP Komisioner & Pemegang Saham"
        And I see "Minimal 3 contoh invoice dengan supplier terkait"
        And I see "Contoh Mutasi Rekening Koran 6 Bulan Terakhir"
        And I see "Laporan Keuangan dalam 1 tahun terakhir"
        And I see button to update the Progress

    Scenario: Update Progress After Upload Document with Loan Type AP "PT Perusahaan or CV" with Case Partial Uploaded
        Given I has been access to the link web view for uploading data documents AP "PT Perusahaan or CV"
        When I see the wording of "Supplier"
        And I see Supplier name
        And I see Loan Id
        And I see "KTP & NPWP Komisioner & Pemegang Saham"
        And "Minimal 3 contoh invoice dengan supplier terkait"
        Then I update the Progress
        And I see fields upload document
        And I see icon edit

    Scenario: Update Progress After Upload Document with Loan Type AP "PT Perusahaan or CV" with Case Full Uploaded
        Given I has been access to the link web view for uploading data documents AP "PT Perusahaan or CV"
        When I see the wording of "Supplier"
        And I see Supplier name
        And I see Loan Id
        And I upload document in field "KTP & NPWP Komisioner & Pemegang Saham"
        And I upload document in field "Minimal 3 contoh invoice dengan supplier terkait"
        And I upload document in field "Contoh Mutasi Rekening Koran 6 Bulan Terakhir"
        And I upload document in field "Laporan Keuangan dalam 1 tahun terakhir"
        Then I update the Progress
        And I see fields upload document

    Scenario: Verify Page of "Progress Upload Dokumen" with Loan Type AP "PT Perorangan or UD"
        Given I has been access to the link web view for uploading data documents AP "PT Perorangan or UD"
        When I see the wording of "Supplier"
        And I see Supplier name
        And I see Loan Id
        Then I see "Minimal 3 contoh invoice dengan supplier terkait"
        And I see "Contoh Mutasi Rekening Koran 6 Bulan Terakhir"
        And I see "Laporan Keuangan dalam 1 tahun terakhir"
        And I see button to update the Progress

    Scenario: Update Progress After Upload Document with Loan Type AP "PT Perorangan or UD" with Case Partial Uploaded
        Given I has been access to the link web view for uploading data documents AP "PT Perorangan or UD"
        When I see the wording of "Supplier"
        And I see Supplier name
        And I see Loan Id
        And I see "Minimal 3 contoh invoice dengan supplier terkait"
        And I see "Contoh Mutasi Rekening Koran 6 Bulan Terakhir"Perusahaan"
        Then I update the Progress
        And I see fields upload document
        And I see icon edit

    Scenario: Update Progress After Upload Document with Loan Type AP "PT Perorangan or UD" with Case Full Uploaded
        Given I has been access to the link web view for uploading data documents AP "PT Perorangan or UD"
        When I see the wording of "Supplier"
        And I see Supplier name
        And I see Loan Id
        And I upload document in field  "Minimal 3 contoh invoice dengan supplier terkait"
        And I upload document in field "Contoh Mutasi Rekening Koran 6 Bulan Terakhir"
        And I upload document in field "Laporan Keuangan dalam 1 tahun terakhir"
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
        And I see "Laporan Keuangan dalam 1 tahun terakhir"
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
        And I upload document in field "Laporan Keuangan dalam 1 tahun terakhir"
        And I see button to update the Progress
        Then I update the Progress
        And I see fields upload document

    Scenario: Verify Page of "Progress Upload Dokumen" with Loan Type AR "PT Perusahaan or CV"
        Given I has been access to the link web view for uploading data documents AR "PT Perusahaan or CV"
        When I see the wording of "Buyer"
        And I see Buyer name
        And I see Loan Id
        Then I see "KTP & NPWP Komisioner & Pemegang Saham"
        And I see "Minimal 3 contoh invoice dengan buyer terkait"
        And I see "Contoh Mutasi Rekening Koran 6 Bulan Terakhir"
        And I see "Laporan Keuangan dalam 1 tahun terakhir"
        And I see button to update the Progress

    Scenario: Update Progress After Upload Document with Loan Type AR "PT Perusahaan or CV" with Case Partial Uploaded
        Given I has been access to the link web view for uploading data documents AR "PT Perusahaan or CV"
        When I see the wording of "Buyer"
        And I see Buyer name
        And I see Loan Id
        And I upload document in field "Minimal 3 contoh invoice dengan buyer terkait"
        And I upload document in field "Contoh Mutasi Rekening Koran 6 Bulan Terakhir"
        Then I update the Progress
        And I see fields upload document
        And I see icon edit

    Scenario: Update Progress After Upload Document with Loan Type AR "PT Perusahaan or CV" with Case Full Uploaded
        Given I has been access to the link web view for uploading data documents AR "PT Perusahaan or CV"
        When I see the wording of "Buyer"
        And I see Buyer name
        And I see Loan Id
        And I upload document in field "KTP & NPWP Komisioner & Pemegang Saham"
        And I upload document in field "Minimal 3 contoh invoice dengan buyer terkait"
        And I upload document in field "Contoh Mutasi Rekening Koran 6 Bulan Terakhir"
        And I upload document in field "Laporan Keuangan dalam 1 tahun terakhir"
        Then I update the Progress
        And I see fields upload document

    Scenario: Verify Page of "Progress Upload Dokumen" with Loan Type AR "PT Perorangan or UD"
        Given I has been access to the link web view for uploading data documents AR "PT Perorangan or UD"
        When I see the wording of "Buyer"
        And I see Buyer name
        And I see Loan Id
        Then I see "Minimal 3 contoh invoice dengan buyer terkait"
        And I see "Contoh Mutasi Rekening Koran 6 Bulan Terakhir"
        And I see "Laporan Keuangan dalam 1 tahun terakhir"
        And I see button to update the Progress

    Scenario: Update Progress After Upload Document with Loan Type AR "PT Perorangan or UD" with Case Partial Uploaded
        Given I has been access to the link web view for uploading data documents AR "PT Perorangan or UD"
        When I see the wording of "Buyer"
        And I see Buyer name
        And I see Loan Id
        And I upload document in field "Minimal 3 contoh invoice dengan buyer terkait"
        And I upload document in field "Contoh Mutasi Rekening Koran 6 Bulan Terakhir"Perusahaan"
        Then I update the Progress
        And I see fields upload document
        And I see icon edit

    Scenario: Update Progress After Upload Document with Loan Type AR "PT Perorangan or UD" with Case Full Uploaded
        Given I has been access to the link web view for uploading data documents AR "PT Perorangan or UD"
        When I see the wording of "Buyer"
        And I see Buyer name
        And I see Loan Id
        And I upload document in field  "Minimal 3 contoh invoice dengan buyer terkait"
        And I upload document in field "Contoh Mutasi Rekening Koran 6 Bulan Terakhir"
        And I upload document in field "Laporan Keuangan dalam 1 tahun terakhir"
        And I see button to update the Progress
        Then I update the Progress
        And I see fields upload document

    Scenario: Verify Page of "Progress Upload Dokumen" with Loan Type AR "Individu"
        Given I has been access to the link web view for uploading data documents AR "Individu"
        When I see the wording of "Buyer"
        And I see Buyer name
        And I see Loan Id
        Then I see "Minimal 3 contoh invoice dengan buyer terkait"
        And I see "Contoh Mutasi Rekening Koran 6 Bulan Terakhir"
        And I see "Laporan Keuangan dalam 1 tahun terakhir"
        And I see button to update the Progress

    Scenario: Update Progress After Upload Document with Loan Type AR "Individu" with Case Partial Uploaded
        Given I has been access to the link web view for uploading data documents AR "Individu"
        When I see the wording of "Buyer"
        And I see Buyer name
        And I see Loan Id
        And I upload document in field "Minimal 3 contoh invoice dengan buyer terkait"
        And I upload document in field "Contoh Mutasi Rekening Koran 6 Bulan Terakhir"
        Then I update the Progress
        And I see fields upload document
        And I see icon edit

    Scenario: Update Progress After Upload Document with Loan Type AR "Individu" with Case Full Uploaded
        Given I has been access to the link web view for uploading data documents AR "Individu"
        When I see the wording of "Buyer"
        And I see Buyer name
        And I see Loan Id
        And I upload document in field  "Minimal 3 contoh invoice dengan supplier terkait"
        And I upload document in field "Contoh Mutasi Rekening Koran 6 Bulan Terakhir"
        And I upload document in field "Laporan Keuangan dalam 1 tahun terakhir"
        And I see button to update the Progress
        Then I update the Progress
        And I see fields upload document

    Scenario: Verify Page of "Progress Upload Dokumen" with Loan Type PO "PT Perusahaan or CV"
        Given I has been access to the link web view for uploading data documents PO "PT Perusahaan or CV"
        When I see the wording of "Bouwheer"
        And I see Bouwheer name
        And I see Loan Id
        Then I see "KTP & NPWP Komisioner & Pemegang Saham"
        And I see "Surat Perintah Kerja (SPK) dari bouwheer"
        And I see "Contoh Mutasi Rekening Koran 6 Bulan Terakhir"
        And I see "Laporan Keuangan dalam 1 tahun"
        And I see button to update the Progress

    Scenario: Update Progress After Upload Document with Loan Type PO "PT Perusahaan or CV" with Case Partial Uploaded
        Given I has been access to the link web view for uploading data documents PO "PT Perusahaan or CV"
        When I see the wording of "Bouwheer"
        And I see Bouwheer name
        And I see Loan Id
        And I upload document in field "KTP & NPWP Komisioner & Pemegang Saham"
        And I upload document in field "Surat Perintah Kerja (SPK) dari bouwheer"
        And I upload document in field "Contoh Mutasi Rekening Koran 6 Bulan Terakhir"
        Then I update the Progress
        And I see fields upload document
        And I see icon edit

    Scenario: Update Progress After Upload Document with Loan Type PO "PT Perusahaan or CV" with Case Full Uploaded
        Given I has been access to the link web view for uploading data documents PO "PT Perusahaan or CV"
        When I see the wording of "Bouwheer"
        And I see Bouwheer name
        And I see Loan Id
        And I upload document in field "KTP & NPWP Komisioner & Pemegang Saham"
        And I upload document in field "Surat Perintah Kerja (SPK) dari bouwheer"
        And I upload document in field "Contoh Mutasi Rekening Koran 6 Bulan Terakhir"
        And I upload document in field "Laporan Keuangan dalam 1 tahun"
        Then I update the Progress
        And I see fields upload document

    Scenario: Verify Page of "Progress Upload Dokumen" with Loan Type PO "PT Perorangan or UD"
        Given I has been access to the link web view for uploading data documents PO "PT Perorangan or UD"
        When I see the wording of "Bouwheer"
        And I see Bouwheer name
        And I see Loan Id
        And I see "Surat Perintah Kerja (SPK) dari bouwheer"
        Then I see "Contoh Mutasi Rekening Koran 6 Bulan Terakhir"
        And I see "Laporan Keuangan dalam 1 tahun"
        And I see button to update the Progress

    Scenario: Update Progress After Upload Document with Loan Type PO "PT Perorangan or UD" with Case Partial Uploaded
        Given I has been access to the link web view for uploading data documents PO "PT Perorangan or UD"
        When I see the wording of "BBouwheer"
        And I see Bouwheer name
        And I see Loan Id
        And I upload document in field "NIB"
        And I upload document in field "Akta Perusahaan"
        Then I update the Progress
        And I see fields upload document
        And I see icon edit

    Scenario: Update Progress After Upload Document with Loan Type PO "PT Perorangan or UD" with Case Full Uploaded
        Given I has been access to the link web view for uploading data documents PO "PT Perorangan or UD"
        When I see the wording of "Bouwheer"
        And I see Bouwheer name
        And I see Loan Id
        And I upload document in field "Surat Perintah Kerja (SPK) dari bouwheer"
        And I upload document in field "Contoh Mutasi Rekening Koran 6 Bulan Terakhir"
        And I upload document in field "Laporan Keuangan dalam 1 tahun"
        And I see button to update the Progress
        Then I update the Progress
        And I see fields upload document

    Scenario: Verify Page of "Progress Upload Dokumen" with Loan Type PO "Individu"
        Given I has been access to the link web view for uploading data documents PO "Individu"
        When I see the wording of "Bouwheer"
        And I see Bouwheer name
        And I see Loan Id
        Then I see "Surat Perintah Kerja (SPK) dari bouwheer"
        And I see "Contoh Mutasi Rekening Koran 6 Bulan Terakhir"
        And I see "Laporan Keuangan dalam 1 tahun"
        And I see button to update the Progress

    Scenario: Update Progress After Upload Document with Loan Type PO "Individu" with Case Partial Uploaded
        Given I has been access to the link web view for uploading data documents PO "Individu"
        When I see the wording of "Bouwheer"
        And I see Bouwheer name
        And I see Loan Id
        And I upload document in field "Surat Perintah Kerja (SPK) dari bouwheer"
        And I upload document in field "Contoh Mutasi Rekening Koran 6 Bulan Terakhir"
        Then I update the Progress
        And I see fields upload document
        And I see icon edit

    Scenario: Update Progress After Upload Document with Loan Type PO "Individu" with Case Full Uploaded
        Given I has been access to the link web view for uploading data documents PO "Individu"
        When I see the wording of "Bouwheer"
        And I see Bouwheer name
        And I see Loan Id
        And I upload document in field  "Surat Perintah Kerja (SPK) dari bouwheer"
        And I upload document in field "Contoh Mutasi Rekening Koran 6 Bulan Terakhir"
        And I upload document in field "Laporan Keuangan dalam 1 tahun"
        And I see button to update the Progress
        Then I update the Progress
        And I see fields upload document

    Scenario: Direct to the expired link upload document
        Given I has been access to the link web view for upload document
        When I am on the expired link page
        Then I see wording "Link Telah Kedaluwarsa"
        And I see wording "Anda dapat membuat link baru di dalam aplikasi Amar Bank Bisnis Anda"

    Scenario: Delete Uploaded Document Loan Type MSME when upload file more than 15MB
        Given I has been access to the link web view for upload multiple data documents for AP or AR or PO MSME
        When I upload multiple documents of field "Laporan Keuangan dalam 1 tahun terakhir"
        And I delete one of the document
        Then the deleted document will dissapear from the field
        And I click button to update the Progres
        And the new updated document will updated to mobile apps

    Scenario: Cancel Uploading Document Loan Type MSME
        Given I has been access to the link web view for upload multiple data documents for AP or AR or PO MSME
        When I upload multiple documents of field "Laporan Keuangan dalam 1 tahun terakhir"
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


