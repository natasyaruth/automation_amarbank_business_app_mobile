Feature: Account Opening KYB PT Perusahaan - Upload Document Business
    In order to opening my Giro account with legality business type PT Perusahaan in SMB
    As a customer
    I want to upload document business as part of the KYB Process

    Background: User choose legality business type PT Perusahaan
        Given I am a registered customer with following details:
            | userID      | ptpeff9b |
            | password    | 1234Test |
            | userIDstg   | ruthbd98 |
            | passwordStg | 1234Test |
        And I filling in form login with the following details:
            | userID      | ptpeff9b |
            | password    | 1234Test |
            | userIDstg   | ruthbd98 |
            | passwordStg | 1234Test |
        And I click login
        And I will directing to Hook 1 Onboarding Account Opening
        And I swipe to card Giro Account
        And I choose Giro Account
        And I choose Giro Account Corporate
        And I choose legality business type 'company'
        And I submit my legality type
        And I upload my eKTP photo
        And I fill all information identity details as followings:
            | eKtpNumber    | 3173074702850001                         |
            | fullName      | PT PERUSAHAAN TERBARU KYC INVITED REJECT |
            | placeOfBirth  | PEKANBARU                                |
            | dateOfBirth   | 11/11/1995                               |
            | gender        | Laki-laki                                |
            | address       | Jl. Durian kamu No. 14                   |
            | rt            | 00                                       |
            | rw            | 00                                       |
            | province      | DKI JAKARTA                              |
            | city          | KOTA ADM. JAKARTA BARAT                  |
            | district      | GROGOL PETAMBURAN                        |
            | village       | TANJUNG DUREN UTARA                      |
            | religion      | Islam                                    |
            | maritalStatus | Kawin                                    |
        And I submit my information identity details
        And I upload my selfie photo
        And I fill my personal data details as followings:
            | lastEducation | SMA             |
            | motherName    | NADYA LAMUSU    |
            | npwp          | 121780042123321 |
        And I submit my personal data details
        And I choose my domicile address same with my identity information
        And I submit my domicile address
        And I fill my employment details as followings:
            | workType     | Pegawai Swasta       |
            | sourceIncome | Pemasukan dari Usaha |
        And I submit my employment data
        When I continue to process KYB
        And I fill my business profile as followings:
            | businessName      | PT PERUSAHAAN TERBARU KYC INVITED REJECT |
            | industry          | Jasa                                     |
            | businessField     | Restoran                                 |
            | monthlyIncome     | 30 - 50 juta                             |
            | npwp              | 906283213036000                          |
            | nib               | 9129106701234                            |
            | businessDateStart | 10/10/2010                               |
        And I submit my business profile
        And I click add business director
        And I fill business director data as followings:
            | fullName | TRETAN MUSLIM                |
            | email    | tretan.muslim@trash-mail.com |
            | nik      | 3175094112940002             |
        And I save data director
        And I validate my first director
        And I click add business director
        And I fill business director data as followings:
            | fullName | TRYSE REZZA                |
            | email    | tryse.rezza@trash-mail.com |
            | nik      | 3171036412910007           |
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

    @C131939
    Scenario: Upload All document business type PT Perusahaan
        Given I am a customer who has uploaded my eKTP photo and selfie
        And has submitted business address
        When I click button upload document
        And I see files that need to be uploaded for type company
        And I upload all document business for type company
        And I continue to main dashboard
        Then I will see card continue to complete upload document business
        And I can continue to page 'Upload Document Business'