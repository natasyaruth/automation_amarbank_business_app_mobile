@kybSubmitFormBusinessProfileCV
Feature: Account Opening KYB CV - Submit Business Profile
    In order to opening my Giro account with legality business type CV in SMB
    As a customer
    I want to submit my business profile as part of the KYB Process

    Background: User choose legality business type CV
        Given I am a registered customer with following details:
            | userID      | revv286a |
            | password    | 1234Test |
            | userIDstg   | testb741 |
            | passwordStg | 1234Test |
        And I reset my state journey
        And I filling in form login with the following details:
            | userID      | revv286a |
            | password    | 1234Test |
            | userIDstg   | testb741 |
            | passwordStg | 1234Test |
        And I click login
        And I click later in pop up biometric
        And I will directing to Hook 1 Onboarding Account Opening
        And I swipe to card Giro Account
        And I choose Giro Account
        And I choose Giro Account Corporate
        And I submit my giro type
        And I choose legality business type 'cv'
        And I submit my legality type
        And I fill NPWP Business
        And I click continue to data personal
        And I click confirm NPWP Business
        And I see page 'Upload eKTP'
        And I update my last journey step to 'Data Employment'

    @validation_kyb_fields_text_business_profile
    Scenario Outline: Verifying form Business Profile fields has been filled and then empty the fields
        Given I am a customer who has completed my KYC process
        When I fill field '<Field>' with '121212' in form Business Profile
        And I clear the field '<Field>' in form Business Profile
        Then I should see message error '<Field Name> wajib diisi' in the below of field '<Field>' in form Business Profile
        Examples:
            | testRailTag | Field              | Field Name            |
            | @C171325    | businessName       | Nama bisnis           |
            | @C171327    | averageTransaction | Rata - rata transaksi |
            | @C171328    | nib                | NIB Berbasis Resiko   |

    @validation_kyb_one_empty_field_business_profile
    Scenario Outline: Verifying one fields hasn't been filled by user in form Business Profile
        Given I am a customer who has completed my KYC process
        When I fill form Business Profile except field '<Field>'
        And I submit my business profile
        And I swipe to field '<Field>' in form Business Profile
        Then I should see message error '<Field Name> wajib diisi' in the below of field '<Field>' in form Business Profile
        Examples:
            | testRailTag | Field             | Field Name                   |
            | @C171329    | businessName      | Nama bisnis                  |
            | @C171330    | industry          | Tipe industri                |
            | @C171331    | businessField     | Jenis bisnis                 |
            | @C171332    | monthlyIncome     | Penghasilan bisnis per bulan |
            | @C171333    | averageTransaction| Rata - rata transaksi        |
            | @C171334    | nib               | NIB Berbasis Resiko          |
            | @C171335    | businessDateStart | Tanggal bisnis berdiri       |

    Scenario Outline: Verifying business name with invalid value in form Business Profile
        Given I am a customer who has completed my KYC process
        When I fill field 'businessName' with '<Value>' in form Business Profile
        Then I should see message error '<Message>' in the below of field 'businessName' in form Business Profile
        Examples:                                                                 ❸
            | testRailTag | Value                                                                                                                                                   | Message                                       |
            | @C171336    | Pa                                                                                                                                                      | Nama bisnis minimal 3 & maksimal 150 karakter |
            | @C171337    | Offlineeeeeeeeeee licenses are for using KSE without the internett Once generatedd the license cannot be revoked or transferred to a different machinee | Nama bisnis minimal 3 & maksimal 150 karakter |

    @C171338
    Scenario: Verifying field business name contain with special char and number
        Given I am a customer who has completed my KYC process
        When I fill field 'businessName' with 'John Doe S.Kom, M\'Kom- 11233' in form Business Profile
        Then I shouldn't see message error in the below of field 'businessName' in form Business Profile

    @C171339
    Scenario: Verifying field average transaction contain with special char and alphabeth
        Given I am a customer who has completed my KYC process
        When I fill field 'averageTransaction' with '20;0000ty@#$' in form Business Profile
        Then I should see message error 'Rata - rata transaksi wajib diisi' in the below of field 'averageTransaction' in form Business Profile   

    Scenario Outline: Verifying NIB field with invalid value in form Business Profile
        Given I am a customer who has completed my KYC process
        When I fill field 'nib' with '<Value>' in form Business Profile
        Then I should see message error '<Message>' in the below of field 'nib' in form Business Profile
        Examples:                                                                 ❸
            | testRailTag | Value           | Message                                 |
            | @C171342    | 9129106701A!4   | NIB Berbasis Resiko tidak sesuai format |
            | @C171344    | 912910670123412 | NIB harus 13 digit                      |
            | @C171345    | 912910          | NIB harus 13 digit                      |

    @C172490
    Scenario: Validate content business field with industry type "Teknologi Informasi"
        Given I am a customer who has completed my KYC process
        When I click dropdown 'industry' in form Business Profile
        And I will see content of dropdown industry
        And I choose option 'Teknologi Informasi'
        And I submit my industry type
        And I will see dropdown 'industry' is filled with the option choosen
        And I click dropdown 'businessField' in form Business Profile
        Then I will see content of dropdown business field with type 'Teknologi Informasi'

    @C172491
    Scenario: Validate content business field with industry type "Rumah Sakit, Apotik dan Industri Kesehatan"
        Given I am a customer who has completed my KYC process
        When I click dropdown 'industry' in form Business Profile
        And I choose option 'Rumah Sakit, Apotik dan Industri Kesehatan'
        And I submit my industry type
        And I will see dropdown 'industry' is filled with the option choosen
        And I click dropdown 'businessField' in form Business Profile
        Then I will see content of dropdown business field with type 'Rumah Sakit, Apotik dan Industri Kesehatan'

    @C172492
    Scenario: Validate content business field with industry type "Keuangan & Asuransi"
        Given I am a customer who has completed my KYC process
        When I click dropdown 'industry' in form Business Profile
        And I choose option 'Keuangan & Asuransi'
        And I submit my industry type
        And I will see dropdown 'industry' is filled with the option choosen
        And I click dropdown 'businessField' in form Business Profile
        Then I will see content of dropdown business field with type 'Keuangan & Asuransi'

    @C172493
    Scenario: Validate content business field with industry type "Perdagangan Besar & Eceran"
        Given I am a customer who has completed my KYC process
        When I click dropdown 'industry' in form Business Profile
        And I choose option 'Perdagangan Besar & Eceran'
        And I submit my industry type
        And I will see dropdown 'industry' is filled with the option choosen
        And I click dropdown 'businessField' in form Business Profile
        Then I will see content of dropdown business field with type 'Perdagangan Besar & Eceran'

    @C172494
    Scenario: Validate content business field with industry type "Industri Pengolahan"
        Given I am a customer who has completed my KYC process
        When I click dropdown 'industry' in form Business Profile
        And I choose option 'Industri Pengolahan'
        And I submit my industry type
        And I will see dropdown 'industry' is filled with the option choosen
        And I click dropdown 'businessField' in form Business Profile
        Then I will see content of dropdown business field with type 'Industri Pengolahan'

    @C172495
    Scenario: Validate content business field with industry type "Konstruksi"
        Given I am a customer who has completed my KYC process
        When I click dropdown 'industry' in form Business Profile
        And I choose option 'Konstruksi'
        And I submit my industry type
        And I will see dropdown 'industry' is filled with the option choosen
        And I click dropdown 'businessField' in form Business Profile
        Then I will see content of dropdown business field with type 'Konstruksi'

    @C172496
    Scenario: Validate content business field with industry type "Pendidikan"
        Given I am a customer who has completed my KYC process
        When I click dropdown 'industry' in form Business Profile
        And I choose option 'Pendidikan'
        And I submit my industry type
        And I will see dropdown 'industry' is filled with the option choosen
        And I click dropdown 'businessField' in form Business Profile
        Then I will see content of dropdown business field with type 'Pendidikan'

    @C172497
    Scenario: Validate content business field with industry type "Jasa"
        Given I am a customer who has completed my KYC process
        When I click dropdown 'industry' in form Business Profile
        And I choose option 'Jasa'
        And I submit my industry type
        And I will see dropdown 'industry' is filled with the option choosen
        And I click dropdown 'businessField' in form Business Profile
        Then I will see content of dropdown business field with type 'Jasa'

    @C172498
    Scenario: Validate content business field with industry type "Transportasi"
        Given I am a customer who has completed my KYC process
        When I click dropdown 'industry' in form Business Profile
        And I choose option 'Transportasi'
        And I submit my industry type
        And I will see dropdown 'industry' is filled with the option choosen
        And I click dropdown 'businessField' in form Business Profile
        Then I will see content of dropdown business field with type 'Transportasi'

    @C172499
    Scenario: Validate content business field with industry type "Pengangkutan & Pergudangan"
        Given I am a customer who has completed my KYC process
        When I click dropdown 'industry' in form Business Profile
        And I choose option 'Pengangkutan & Pergudangan'
        And I submit my industry type
        And I will see dropdown 'industry' is filled with the option choosen
        And I click dropdown 'businessField' in form Business Profile
        Then I will see content of dropdown business field with type 'Pengangkutan & Pergudangan'

    @C172500
    Scenario: Validate content business field with industry type "Pertambangan & Penggalian"
        Given I am a customer who has completed my KYC process
        When I click dropdown 'industry' in form Business Profile
        And I choose option 'Pertambangan & Penggalian'
        And I submit my industry type
        And I will see dropdown 'industry' is filled with the option choosen
        And I click dropdown 'businessField' in form Business Profile
        Then I will see content of dropdown business field with type 'Pertambangan & Penggalian'

    @C172501
    Scenario: Validate content business field with industry type "Industri Kreatif"
        Given I am a customer who has completed my KYC process
        When I click dropdown 'industry' in form Business Profile
        And I choose option 'Industri Kreatif'
        And I submit my industry type
        And I will see dropdown 'industry' is filled with the option choosen
        And I click dropdown 'businessField' in form Business Profile
        Then I will see content of dropdown business field with type 'Industri Kreatif'

    @C172502
    Scenario: Validate content business field with industry type "Restoran, Kafe dan Hotel"
        Given I am a customer who has completed my KYC process
        When I click dropdown 'industry' in form Business Profile
        And I choose option 'Restoran, Kafe dan Hotel'
        And I submit my industry type
        And I will see dropdown 'industry' is filled with the option choosen
        And I click dropdown 'businessField' in form Business Profile
        Then I will see content of dropdown business field with type 'Restoran, Kafe dan Hotel'

    @C172503
    Scenario: Validate content business field with industry type "Industri Makanan & Minuman"
        Given I am a customer who has completed my KYC process
        When I click dropdown 'industry' in form Business Profile
        And I choose option 'Industri Makanan & Minuman'
        And I submit my industry type
        And I will see dropdown 'industry' is filled with the option choosen
        And I click dropdown 'businessField' in form Business Profile
        Then I will see content of dropdown business field with type 'Industri Makanan & Minuman'                             

    @C172504
    Scenario: Validate content business field with industry type "Lainnya"
        Given I am a customer who has completed my KYC process
        When I click dropdown 'industry' in form Business Profile
        And I choose option 'Lainnya'
        And I will see text field to fill my industry type
        And I fill field other industry type with 'Olahraga'
        And I submit my industry type
        And I will see dropdown 'industry' is filled with the option choosen
        And I click dropdown 'businessField' in form Business Profile
        Then I will see text field to fill my business field

    @C172505
    Scenario: Choose business field without choose industry type
        Given I am a customer who has completed my KYC process
        When I click dropdown 'businessField' in form Business Profile
        Then I will see information I need to choose industry type first
        And I close bottom sheet business field

    @C172506
    Scenario: Choose industry type and then change again
        Given I am a customer who has completed my KYC process
        When I click dropdown 'industry' in form Business Profile
        And I choose option 'Jasa'
        And I submit my industry type
        And I will see dropdown 'industry' is filled with the option choosen
        And I click dropdown 'industry' in form Business Profile
        And I choose option 'Teknologi Informasi'
        And I submit my industry type
        And I will see dropdown 'industry' is filled with the option choosen

    @C172507
    Scenario: Fill field other industry type and then delete
        Given I am a customer who has completed my KYC process
        When I click dropdown 'industry' in form Business Profile
        And I will see content of dropdown industry
        And I choose option 'Lainnya'
        And I will see text field to fill my industry type
        And I fill field other industry type with 'Olahraga'
        And I will see button submit industry type is enabled
        And I clear field other industry type
        Then I will see button submit industry type is disabled

    @C172508
    Scenario: Fill field other business field and then delete
        Given I am a customer who has completed my KYC process
        When I click dropdown 'industry' in form Business Profile
        And I will see content of dropdown industry
        And I choose option 'Lainnya'
        And I will see text field to fill my industry type
        And I fill field other industry type with 'Olahraga'
        And I submit my industry type
        And I will see dropdown 'industry' is filled with the option choosen
        And I click dropdown 'businessField' in form Business Profile
        And I will see text field to fill my business field
        And I fill field other business field with 'Olahraga'
        And I will see button submit business field is enabled
        And I clear field other business field
        Then I will see button submit business field is disabled

    @C172509
    Scenario: Fill field other industry type with char more than 50
        Given I am a customer who has completed my KYC process
        When I click dropdown 'industry' in form Business Profile
        And I will see content of dropdown industry
        And I choose option 'Lainnya'
        And I will see text field to fill my industry type
        And I fill field other industry type with 'Olahraga Olahraga Olahraga Olahraga Olahraga Olahraga'
        Then I will see field other industry type is limited 50 character

    @C172510
    Scenario: Fill field other business field with char more than 50
        Given I am a customer who has completed my KYC process
        When I click dropdown 'industry' in form Business Profile
        And I will see content of dropdown industry
        And I choose option 'Lainnya'
        And I will see text field to fill my industry type
        And I fill field other industry type with 'Olahraga'
        And I submit my industry type
        And I will see dropdown 'industry' is filled with the option choosen
        And I click dropdown 'businessField' in form Business Profile
        And I will see text field to fill my business field
        And I fill field other business field with 'Olahraga Olahraga Olahraga Olahraga Olahraga Olahraga'
        Then I will see field other business field is limited 50 character

    @C172511
    Scenario: Fill option other in industry type and then choose other option
        Given I am a customer who has completed my KYC process
        When I click dropdown 'industry' in form Business Profile
        And I will see content of dropdown industry
        And I choose option 'Lainnya'
        And I will see text field to fill my industry type
        And I fill field other industry type with 'Olahraga'
        And I choose option 'Teknologi Informasi'
        Then I will not see text field to fill my industry type
        And I choose option 'Lainnya'
        And I will see text field to fill my industry type

    @C172512
    Scenario: Change option industry type after choose business field
        Given I am a customer who has completed my KYC process
        When I click dropdown 'industry' in form Business Profile
        And I choose option 'Jasa'
        And I submit my industry type
        And I will see dropdown 'industry' is filled with the option choosen
        And I click dropdown 'businessField' in form Business Profile
        And I choose option 'Operator tur'
        And I submit my business field
        And I will see dropdown 'businessField' is filled with the option choosen
        And I click dropdown 'industry' in form Business Profile
        And I choose option 'Teknologi Informasi'
        And I submit my industry type
        Then I will see dropdown 'businessField' is empty

    @C171347
    Scenario: Submit form Business Profile successfully business type CV
        Given I am a customer who has completed my KYC process
        When I see fields that available in Business Profile
        And I fill my business profile as followings:
            | businessName       | PT. ABCD        |
            | industry           | Jasa            |
            | businessField      | Operator tur    |
            | monthlyIncome      | 30 - 50 juta    |
            | averageTransaction | 2000000         |
            | nib                | 9129106701234   |
            | businessDateStart  | 10/10/2010      |
        And I submit my business profile
        Then I will notify my business profile has successfully submitted
        And I will directing to page director list