@upload_document_business
Feature: Account Opening KYB CV - Upload Document Business
    In order to opening my Giro account with legality business type CV in SMB
    As a customer
    I want to upload document business as part of the KYB Process

    @C101348
    Scenario: Upload some document business
        Given I am a registered customer with following details:
            | userID      | nata5ff1 |
            | password    | 1234Test |
            | userIDstg   | ruth7cb8 |
            | passwordStg | 1234Test |
        And I filling in form login with the following details:
            | userID      | nata5ff1 |
            | password    | 1234Test |
            | userIDstg   | ruth7cb8 |
            | passwordStg | 1234Test |
        And I click login
        And I will directing to Hook 1 Onboarding Account Opening
        And I swipe to card Giro Account
        And I choose Giro Account
        And I choose Giro Account Corporate
        And I choose legality business type 'cv'
        And I submit my legality type
        And I update my last journey step to 'Data Employment'
        When I continue to process KYB
        And I fill my business profile as followings:
            | businessName      | PT. BOTOL MINUM PERKASA RAYA DAN JAYA |
            | industry          | Jasa                                  |
            | businessField     | Restoran                              |
            | monthlyIncome     | 30 - 50 juta                          |
            | npwp              | 906283213036000                       |
            | nib               | 9129106701234                         |
            | businessDateStart | 10/10/2010                            |
        And I submit my business profile
        And I click add business director
        And I fill business director data as followings:
            | fullName | COKI PARDEDE                |
            | email    | coki.pardede@trash-mail.com |
            | nik      | 3175064412930004            |
        And I save data director
        And I validate my first director
        And I click add business director
        And I fill business director data as followings:
            | fullName | TRETAN UNIVERSE                |
            | email    | tretanuniverse1@trash-mail.com |
            | nik      | 3171036412910007               |
        And I save data director
        And I validate my second director
        And I submit business director list
        And I confirm my director lists
        And I fill my business address as followings:
            | address  | Jl. Gambir Belok Kiri No. 10 |
            | rt       | 000                          |
            | rw       | 011                          |
            | province | ACEH                         |
            | city     | KAB. ACEH TIMUR              |
            | district | DARUL AMAN                   |
            | village  |                              |
        And I allow company to store my data
        And I submit my business address
        When I click button upload document
        And I see files that need to be uploaded for type company
        And I upload document business 'NIB Berbasis Resiko'
        And I upload document business 'Akta Perusahaan'
        Then I will not see button continue
        And I will not see additional information in the top of section

    @C101349
    Scenario: Upload document and user drop off
        Given I am a registered customer with following details:
            | userID      | nata5ff1 |
            | password    | 1234Test |
            | userIDstg   | stag76ee |
            | passwordStg | Test1234 |
        And I filling in form login with the following details:
            | userID      | nata5ff1 |
            | password    | 1234Test |
            | userIDstg   | stag76ee |
            | passwordStg | Test1234 |
        And I click login
        And I will directing to Hook 1 Onboarding Account Opening
        And I swipe to card Giro Account
        And I choose Giro Account
        And I choose Giro Account Corporate
        And I choose legality business type 'cv'
        And I submit my legality type
        And I update my last journey step to 'Data Employment'
        When I continue to process KYB
        And I fill my business profile as followings:
            | businessName      | PT. BOTOL MINUM PERKASA RAYA DAN JAYA |
            | industry          | Jasa                                  |
            | businessField     | Restoran                              |
            | monthlyIncome     | 30 - 50 juta                          |
            | npwp              | 906283213036000                       |
            | nib               | 9129106701234                         |
            | businessDateStart | 10/10/2010                            |
        And I submit my business profile
        And I click add business director
        And I fill business director data as followings:
            | fullName | COKI PARDEDE                |
            | email    | coki.pardede@trash-mail.com |
            | nik      | 3175064412930004            |
        And I save data director
        And I validate my first director
        And I click add business director
        And I fill business director data as followings:
            | fullName | TRETAN UNIVERSE                |
            | email    | tretanuniverse1@trash-mail.com |
            | nik      | 3171036412910007               |
        And I save data director
        And I validate my second director
        And I submit business director list
        And I confirm my director lists
        And I fill my business address as followings:
            | address  | Jl. Gambir Belok Kiri No. 10 |
            | rt       | 000                          |
            | rw       | 011                          |
            | province | ACEH                         |
            | city     | KAB. ACEH TIMUR              |
            | district | DARUL AMAN                   |
            | village  |                              |
        And I allow company to store my data
        And I submit my business address
        When I click button upload document
        And I see files that need to be uploaded for type company
        And I upload document business 'NIB Berbasis Resiko'
        And I back to dashboard
        And I will see card continue to complete upload document business
        And I can continue to page 'Upload Document Business'
        And I click button upload document
        Then I will see document 'NIB Berbasis Resiko' still exists

    @C101350
    Scenario: Upload document with file size more than 10 MB
        Given I am a registered customer with following details:
            | userID      | nata5ff1 |
            | password    | 1234Test |
            | userIDstg   | stag76ee |
            | passwordStg | Test1234 |
        And I filling in form login with the following details:
            | userID      | nata5ff1 |
            | password    | 1234Test |
            | userIDstg   | stag76ee |
            | passwordStg | Test1234 |
        And I click login
        And I will directing to Hook 1 Onboarding Account Opening
        And I swipe to card Giro Account
        And I choose Giro Account
        And I choose Giro Account Corporate
        And I choose legality business type 'cv'
        And I submit my legality type
        And I update my last journey step to 'Data Employment'
        When I continue to process KYB
        And I fill my business profile as followings:
            | businessName      | PT. BOTOL MINUM PERKASA RAYA DAN JAYA |
            | industry          | Jasa                                  |
            | businessField     | Restoran                              |
            | monthlyIncome     | 30 - 50 juta                          |
            | npwp              | 906283213036000                       |
            | nib               | 9129106701234                         |
            | businessDateStart | 10/10/2010                            |
        And I submit my business profile
        And I click add business director
        And I fill business director data as followings:
            | fullName | COKI PARDEDE                |
            | email    | coki.pardede@trash-mail.com |
            | nik      | 3175064412930004            |
        And I save data director
        And I validate my first director
        And I click add business director
        And I fill business director data as followings:
            | fullName | TRETAN UNIVERSE                |
            | email    | tretanuniverse1@trash-mail.com |
            | nik      | 3171036412910007               |
        And I save data director
        And I validate my second director
        And I submit business director list
        And I confirm my director lists
        And I fill my business address as followings:
            | address  | Jl. Gambir Belok Kiri No. 10 |
            | rt       | 000                          |
            | rw       | 011                          |
            | province | ACEH                         |
            | city     | KAB. ACEH TIMUR              |
            | district | DARUL AMAN                   |
            | village  |                              |
        And I allow company to store my data
        And I submit my business address
        When I click button upload document
        And I upload document business with size more than 10MB
        Then I will see message error 'Ukuran file melebihi 10MB. Silahkan coba lagi' in the below of section upload document

    @C101351
    Scenario: Upload document with file other than PDF
        Given I am a registered customer with following details:
            | userID      | nata5ff1 |
            | password    | 1234Test |
            | userIDstg   | stag76ee |
            | passwordStg | Test1234 |
        And I filling in form login with the following details:
            | userID      | nata5ff1 |
            | password    | 1234Test |
            | userIDstg   | stag76ee |
            | passwordStg | Test1234 |
        And I click login
        And I will directing to Hook 1 Onboarding Account Opening
        And I swipe to card Giro Account
        And I choose Giro Account
        And I choose Giro Account Corporate
        And I choose legality business type 'cv'
        And I submit my legality type
        And I update my last journey step to 'Data Employment'
        When I continue to process KYB
        And I fill my business profile as followings:
            | businessName      | PT. BOTOL MINUM PERKASA RAYA DAN JAYA |
            | industry          | Jasa                                  |
            | businessField     | Restoran                              |
            | monthlyIncome     | 30 - 50 juta                          |
            | npwp              | 906283213036000                       |
            | nib               | 9129106701234                         |
            | businessDateStart | 10/10/2010                            |
        And I submit my business profile
        And I click add business director
        And I fill business director data as followings:
            | fullName | COKI PARDEDE                |
            | email    | coki.pardede@trash-mail.com |
            | nik      | 3175064412930004            |
        And I save data director
        And I validate my first director
        And I click add business director
        And I fill business director data as followings:
            | fullName | TRETAN UNIVERSE                |
            | email    | tretanuniverse1@trash-mail.com |
            | nik      | 3171036412910007               |
        And I save data director
        And I validate my second director
        And I submit business director list
        And I confirm my director lists
        And I fill my business address as followings:
            | address  | Jl. Gambir Belok Kiri No. 10 |
            | rt       | 000                          |
            | rw       | 011                          |
            | province | ACEH                         |
            | city     | KAB. ACEH TIMUR              |
            | district | DARUL AMAN                   |
            | village  |                              |
        And I allow company to store my data
        And I submit my business address
        When I click button upload document
        And I upload document business with file other than PDF
        Then I will see message error 'File tidak boleh selain pdf' in the below of section upload document

    @C101352
    Scenario: Access call center in Page upload document
        Given I am a registered customer with following details:
            | userID      | nata5ff1 |
            | password    | 1234Test |
            | userIDstg   | stag76ee |
            | passwordStg | Test1234 |
        And I filling in form login with the following details:
            | userID      | nata5ff1 |
            | password    | 1234Test |
            | userIDstg   | stag76ee |
            | passwordStg | Test1234 |
        And I click login
        And I will directing to Hook 1 Onboarding Account Opening
        And I swipe to card Giro Account
        And I choose Giro Account
        And I choose Giro Account Corporate
        And I choose legality business type 'cv'
        And I submit my legality type
        And I update my last journey step to 'Data Employment'
        When I continue to process KYB
        And I fill my business profile as followings:
            | businessName      | PT. BOTOL MINUM PERKASA RAYA DAN JAYA |
            | industry          | Jasa                                  |
            | businessField     | Restoran                              |
            | monthlyIncome     | 30 - 50 juta                          |
            | npwp              | 906283213036000                       |
            | nib               | 9129106701234                         |
            | businessDateStart | 10/10/2010                            |
        And I submit my business profile
        And I click add business director
        And I fill business director data as followings:
            | fullName | COKI PARDEDE                |
            | email    | coki.pardede@trash-mail.com |
            | nik      | 3175064412930004            |
        And I save data director
        And I validate my first director
        And I click add business director
        And I fill business director data as followings:
            | fullName | TRETAN UNIVERSE                |
            | email    | tretanuniverse1@trash-mail.com |
            | nik      | 3171036412910007               |
        And I save data director
        And I validate my second director
        And I submit business director list
        And I confirm my director lists
        And I fill my business address as followings:
            | address  | Jl. Gambir Belok Kiri No. 10 |
            | rt       | 000                          |
            | rw       | 011                          |
            | province | ACEH                         |
            | city     | KAB. ACEH TIMUR              |
            | district | DARUL AMAN                   |
            | village  |                              |
        And I allow company to store my data
        And I submit my business address
        When I click button upload document
        And I click link call center in page upload document
        Then I will see bottom sheet with email contact

    @C101353
    Scenario: Upload All document business type CV
        Given I am a registered customer with following details:
            | userID      | alfife18 |
            | password    | 1234Test |
            | userIDstg   | stag76ee |
            | passwordStg | Test1234 |
        And I filling in form login with the following details:
            | userID      | alfife18 |
            | password    | 1234Test |
            | userIDstg   | stag76ee |
            | passwordStg | Test1234 |
        And I click login
        And I will directing to Hook 1 Onboarding Account Opening
        And I swipe to card Giro Account
        And I choose Giro Account
        And I choose Giro Account MSME
        And I choose legality business type 'cv'
        And I submit my legality type
        And I skip step upload eKTP photo
        And I fill all information identity details as followings:
            | eKtpNumber    | 3171047103790001          |
            | fullName      | NADYA LAROSA              |
            | placeOfBirth  | MEDAN                     |
            | dateOfBirth   | 11/11/1995                |
            | gender        | Laki-laki                 |
            | address       | Jl. Durian Runtuh No. 13  |
            | rt            | 01                        |
            | rw            | 05                        |
            | province      | DKI JAKARTA               |
            | city          | KOTA ADM. JAKARTA SELATAN |
            | district      | KEBAYORAN BARU            |
            | village       | SENAYAN                   |
            | religion      | Katolik                   |
            | maritalStatus | Belum Kawin               |
        And I submit my information identity details
        And I skip flow upload selfie photo
        And I submit my personal data details business and upload my npwp as followings:
            | lastEducation | SMA          |
            | motherName    | NADYA LAMUSU |
        And I submit my personal data details
        And I choose my domicile address same with my identity information
        And I submit my domicile address
        And I fill my employment details as followings:
            | workType     | Pegawai Swasta       |
            | sourceIncome | Pemasukan dari Usaha |
        And I submit my employment data
        And I continue to process KYB
        And I fill my business profile as followings:
            | businessName      | PT. BOTOL MINUM PERKASA RAYA DAN JAYA |
            | industry          | Jasa                                  |
            | businessField     | Restoran                              |
            | monthlyIncome     | 30 - 50 juta                          |
            | npwp              | 906283213036000                       |
            | nib               | 9129106701234                         |
            | businessDateStart | 10/10/2010                            |
        And I submit my business profile
        And I click add business director
        And I fill business director data as followings:
            | fullName | COKI PARDEDE                |
            | email    | coki.pardede@trash-mail.com |
            | nik      | 3175064412930004            |
        And I save data director
        And I validate my first director
        And I click add business director
        And I fill business director data as followings:
            | fullName | TRETAN UNIVERSE                |
            | email    | tretanuniverse1@trash-mail.com |
            | nik      | 3171036412910007               |
        And I save data director
        And I validate my second director
        And I submit business director list
        And I confirm my director lists
        And I fill my business address as followings:
            | address  | Jl. Gambir Belok Kiri No. 10 |
            | rt       | 000                          |
            | rw       | 011                          |
            | province | ACEH                         |
            | city     | KAB. ACEH TIMUR              |
            | district | DARUL AMAN                   |
            | village  |                              |
        And I allow company to store my data
        And I submit my business address
        When I click button upload document
        And I see files that need to be uploaded for type company
        And I upload all document business for type company
        And I continue to main dashboard
        Then I will see card continue to complete upload document business
        And I can continue to page 'Upload Document Business'