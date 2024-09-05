Feature: Apply Either Loan and select the loan
    In order to apply loan
    As a customer
    I want to apply from the first loan

    Background: User has registered and login to dashboard
        Given I am a registered customer with following details:
            | userID   | leed4a96|
            | password | Test12345|
        And I filling in form login with the following details:
            | userID   | leed4a96|
            | password | Test12345 |
        And I click login
        And I click later
        Then I will direct to dashboard
        And I click menu tab testing
        And I click button loan dashboard
        

 Scenario: User validate and select loan type AR Direct
        Given I am on onboarding loan
        When I click button ajukan pinjaman
        And I Input Nominal Pinjaman '560000000'
        And I Input Tenor '30'
        And I select business location 'jabodetabek'    
        And I click on button Selanjutnya              
        And I select loan type "AP"
        And I click on Lihat Skema Pinjaman        
        And I click button select the schema
        And I click icon other anchor             
        And I fill a field "anchorName" with "PT. AR Direct Test"
        When I select industry type
        And I select the date cooperating
        And I fill a field "PICNameField" with "Rara AR"
        And I fill a field "PICNumberField" with "081234567890"
        And I click button next
        And I click button continue complete the data
        And I choose legality business type 'company'
        And I submit my legality type
        And I fill NPWP Business
        And I click continue to data personal
        And I click confirm NPWP Business
        And I see page 'Upload eKTP'
        And I upload my eKTP photo
        And I will directing to page submit form KTP
        And I fill all information identity details as followings:
      | eKtpNumber    | 3173035601860007          |
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
    Then I will notify my information identity details has successfully submitted
    And I will direct to page capture selfie
    And I upload my selfie photo
    And I will n otify my photo selfie has successfully submitted
    And I will directing to page submit Data Personal
    And I submit my personal data details business and upload my npwp as followings:
            | lastEducation  | SMA           |
            | motherName     | NADYA LAMUSU  |
    And I upload NPWP Individu
    And i click Save the details
    And I will direct to page domicile address
    And I submit my domicile address
    And I will notify my domicile address has successfully submitted
    And I will direct to page Data Employment
    And I fill my employment details as followings:
            | workType     | Pegawai Swasta       |
            | sourceIncome | Pemasukan dari Usaha |
    And I submit my employment data
    And I continue to process KYB
    And I fill my business profile as followings:
            | businessName      | PT. ABCD        |
            | industry          | Jasa            |
            | businessField     | Restoran        |
            | monthlyIncome     | 30 - 50 juta    |
            | npwp              | 906283213036000 |
            | nib               | 9129106701234   |
            | businessDateStart | 10/10/2010      |
    And I submit my business profile
    Andn I will notify my business profile has successfully submitted
    And I will directing to page director list
    And I submit business director
    And I will notify business director list has successfully submitted
    And I will directing to page business address
    And I fill my business address as followings:
            | address  | Jl. Gambir Belok kanan No. 23 |
            | rt       | 010                           |
            | rw       | 027                           |
            | province | DKI JAKARTA                   |
            | city     | JAKARTA SELATAN               |
            | district | PANCORAN                      |
            | village  | PANCORAN                      |
    And I tick checkbox Rights & Policy 
    And I tick T&C about loan
    And I click button Send Apply Loan
    And I should see text bottom sheet "Selamat, Pengajuan Berhasil Dikirim" in field "titleBottomSheet"    
    And I close the bottom sheet
    





    