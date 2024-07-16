Feature:  Upload Data Documents For Cases Combine Journey MSME
    In order to upload data documents for cases combine journey MSME has types loan
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
        And I see "Akta Perusahaan"
        And I see "SK Kemenkumham"
        And I see "NPWP Perusahaan"
        And I see "KTP & NPWP Komisioner & Pemegang Saham"
        And I see "Minimal 3 contoh invoice dengan supplier terkait"
        And I see "Contoh Mutasi Rekening Koran 6 Bulan Terakhir"
        And I see "Laporan Keuangan dalam 1 tahun"
        And I see button to update the Progress

    Scenario: Update Progress After Upload Document with Loan Type AP "PT Perusahaan or CV" with Case Partial Uploaded
        Given I has been access to the link web view for uploading data documents AP "PT Perusahaan or CV"
        When I see the wording of "Supplier"
        And I see Supplier name
        And I see Loan Id
        And I upload document in field "NIB"
        And I upload document in field "Akta Perusahaan"
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
        And I upload document in field "Akta Perusahaan"
        And I upload document in field "SK Kemenkumham"
        And I upload document in field "NPWP Perusahaan"
        And I upload document in field "KTP & NPWP Komisioner & Pemegang Saham"
        And I upload document in field "Minimal 3 contoh invoice dengan supplier terkait"
        And I upload document in field "Contoh Mutasi Rekening Koran 6 Bulan Terakhir"
        And I upload document in field "Laporan Keuangan dalam 1 tahun"
        Then I update the Progress
        And I see fields upload document

    Scenario: Verify Page of "Progress Upload Dokumen" with Loan Type AP "PT Perorangan or UD"
        Given I has been access to the link web view for uploading data documents AP "PT Perorangan or UD"
        When I see the wording of "Supplier"
        And I see Supplier name
        And I see Loan Id
        Then I see "NIB"
        And I see "Akta Perusahaan"
        And I see "Minimal 3 contoh invoice dengan supplier terkait"
        And I see "Contoh Mutasi Rekening Koran 6 Bulan Terakhir"
        And I see "Laporan Keuangan dalam 1 tahun"
        And I see button to update the Progress

    Scenario: Update Progress After Upload Document with Loan Type AP "PT Perorangan or UD" with Case Partial Uploaded
        Given I has been access to the link web view for uploading data documents AP "PT Perorangan or UD"
        When I see the wording of "Supplier"
        And I see Supplier name
        And I see Loan Id
        And I upload document in field "NIB"
        And I upload document in field "Akta Perusahaan"
        Then I update the Progress
        And I see fields upload document
        And I see icon edit

    Scenario: Update Progress After Upload Document with Loan Type AP "PT Perorangan or UD" with Case Full Uploaded
        Given I has been access to the link web view for uploading data documents AP "PT Perorangan or UD"
        When I see the wording of "Supplier"
        And I see Supplier name
        And I see Loan Id
        And I upload document in field "NIB"
        And I upload document in field  "Akta Perusahaan"
        And I upload document in field  "Minimal 3 contoh invoice dengan supplier terkait"
        And I upload document in field "Contoh Mutasi Rekening Koran 6 Bulan Terakhir"
        And I upload document in field "Laporan Keuangan dalam 1 tahun"
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
        And I see "Laporan Keuangan dalam 1 tahun"
        And I see button to update the Progress

    Scenario: Update Progress After Upload Document with Loan Type AP "Individu" with Case Partial Uploaded
        Given I has been access to the link web view for uploading data documents AP "Individu"
        When I see the wording of "Supplier"
        And I see Supplier name
        And I see Loan Id
        And I upload document in field "Minimal 3 contoh invoice dengan supplier terkait"
        And I upload document in field "Laporan Keuangan dalam 1 tahun"
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
        And I upload document in field "Laporan Keuangan dalam 1 tahun"
        And I see button to update the Progress
        Then I update the Progress
        And I see fields upload document

    Scenario: Verify Page of "Progress Upload Dokumen" with Loan Type AR "PT Perusahaan or CV"
        Given I has been access to the link web view for uploading data documents AR "PT Perusahaan or CV"
        When I see the wording of "Buyer"
        And I see Buyer name
        And I see Loan Id
        Then I see "NIB"
        And I see "Akta Perusahaan"
        And I see "SK Kemenkumham"
        And I see "NPWP Perusahaan"
        And I see "KTP & NPWP Komisioner & Pemegang Saham"
        And I see "Minimal 3 contoh invoice dengan buyer terkait"
        And I see "Contoh Mutasi Rekening Koran 6 Bulan Terakhir"
        And I see "Laporan Keuangan dalam 1 tahun"
        And I see button to update the Progress

    Scenario: Update Progress After Upload Document with Loan Type AR "PT Perusahaan or CV" with Case Partial Uploaded
        Given I has been access to the link web view for uploading data documents AR "PT Perusahaan or CV"
        When I see the wording of "Supplier"
        And I see Buyer name
        And I see Loan Id
        And I upload document in field "NIB"
        And I upload document in field "Akta Perusahaan"
        And I upload document in field "SK Kemenkumham"
        Then I update the Progress
        And I see fields upload document
        And I see icon edit

    Scenario: Update Progress After Upload Document with Loan Type AR "PT Perusahaan or CV" with Case Full Uploaded
        Given I has been access to the link web view for uploading data documents AR "PT Perusahaan or CV"
        When I see the wording of "Buyer"
        And I see Buyer name
        And I see Loan Id
        And I upload document in field "NIB"
        And I upload document in field "Akta Perusahaan"
        And I upload document in field "SK Kemenkumham"
        And I upload document in field "NPWP Perusahaan"
        And I upload document in field "KTP & NPWP Komisioner & Pemegang Saham"
        And I upload document in field "Minimal 3 contoh invoice dengan buyer terkait"
        And I upload document in field "Contoh Mutasi Rekening Koran 6 Bulan Terakhir"
        And I upload document in field "Laporan Keuangan dalam 1 tahun"
        Then I update the Progress
        And I see fields upload document

    Scenario: Verify Page of "Progress Upload Dokumen" with Loan Type AR "PT Perorangan or UD"
        Given I has been access to the link web view for uploading data documents AR "PT Perorangan or UD"
        When I see the wording of "Buyer"
        And I see Buyer name
        And I see Loan Id
        Then I see "NIB"
        And I see "Akta Perusahaan"
        And I see "Minimal 3 contoh invoice dengan buyer terkait"
        And I see "Contoh Mutasi Rekening Koran 6 Bulan Terakhir"
        And I see "Laporan Keuangan dalam 1 tahun"
        And I see button to update the Progress

    Scenario: Update Progress After Upload Document with Loan Type AR "PT PT Perorangan or UD" with Case Partial Uploaded
        Given I has been access to the link web view for uploading data documents AR "PT Perorangan or UD"
        When I see the wording of "Buyer"
        And I see Buyer name
        And I see Loan Id
        And I upload document in field "NIB"
        And I upload document in field "Akta Perusahaan"
        Then I update the Progress
        And I see fields upload document
        And I see icon edit

    Scenario: Update Progress After Upload Document with Loan Type AR "PT Perorangan or UD" with Case Full Uploaded
        Given I has been access to the link web view for uploading data documents AR "PT Perorangan or UD"
        When I see the wording of "Buyer"
        And I see Buyer name
        And I see Loan Id
        And I upload document in field "NIB"
        And I upload document in field  "Akta Perusahaan"
        And I upload document in field  "Minimal 3 contoh invoice dengan buyer terkait"
        And I upload document in field "Contoh Mutasi Rekening Koran 6 Bulan Terakhir"
        And I upload document in field "Laporan Keuangan dalam 1 tahun"
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
        And I see "Laporan Keuangan dalam 1 tahun"
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
        And I upload document in field "Laporan Keuangan dalam 1 tahun"
        And I see button to update the Progress
        Then I update the Progress
        And I see fields upload document

    Scenario: Verify Page of "Progress Upload Dokumen" with Loan Type PO "PT Perusahaan or CV"
        Given I has been access to the link web view for uploading data documents PO "PT Perusahaan or CV"
        When I see the wording of "Bouwheer"
        And I see Bouwheer name
        And I see Loan Id
        Then I see "NIB"
        And I see "Akta Perusahaan"
        And I see "SK Kemenkumham"
        And I see "NPWP Perusahaan"
        And I see "KTP & NPWP Komisioner & Pemegang Saham"
        And I see "Surat Perintah Kerja (SPK) dari bouwheer"
        And I see "Contoh Mutasi Rekening Koran 6 Bulan Terakhir"
        And I see "Laporan Keuangan dalam 1 tahun"
        And I see button to update the Progress

    Scenario: Update Progress After Upload Document with Loan Type PO "PT Perusahaan or CV" with Case Partial Uploaded
        Given I has been access to the link web view for uploading data documents PO "PT Perusahaan or CV"
        When I see the wording of "Bouwheer"
        And I see Bouwheer name
        And I see Loan Id
        And I upload document in field "NIB"
        And I upload document in field "Akta Perusahaan"
        And I upload document in field "SK Kemenkumham"
        Then I update the Progress
        And I see fields upload document
        And I see icon edit

    Scenario: Update Progress After Upload Document with Loan Type PO "PT Perusahaan or CV" with Case Full Uploaded
        Given I has been access to the link web view for uploading data documents PO "PT Perusahaan or CV"
        When I see the wording of "Bouwheer"
        And I see Bouwheer name
        And I see Loan Id
        And I upload document in field "NIB"
        And I upload document in field "Akta Perusahaan"
        And I upload document in field "SK Kemenkumham"
        And I upload document in field "NPWP Perusahaan"
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
        Then I see "NIB"
        And I see "Akta Perusahaan"
        And I see "Surat Perintah Kerja (SPK) dari bouwheer"
        And I see "Contoh Mutasi Rekening Koran 6 Bulan Terakhir"
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
        And I upload document in field "NIB"
        And I upload document in field  "Akta Perusahaan"
        And I upload document in field  "Surat Perintah Kerja (SPK) dari bouwheer"
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
