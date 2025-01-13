@kycSubmitFormDomicileAddressCV
Feature: Account Opening KYC CV - Submit Domicile Address
    In order to opening my Giro account with legality business type CV in SMB
    As a customer
    I want to submit my domiciles address as part of the KYC Process

    Background: User choose legality business type CV
        Given I am a registered customer with following details:
            | userID      | ruth07f9 |
            | password    | 1234Test |
            | userIDstg   | ruthf5d5 |
            | passwordStg | 1234Test |
        And I filling in form login with the following details:
            | userID      | ruth07f9 |
            | password    | 1234Test |
            | userIDstg   | ruthf5d5 |
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
        And I update my last journey step to 'Data Personal'

    @C170745
    Scenario: Submit form Domicile address same with KTP successfully business type CV
        Given I am a customer who has submitted my personal data details
        And register my identity details as below
            | ktpnumber        | 3173035601860007          |
            | ktpname          | NADYA LAROSA              |
            | birthplace       | MANGGARAI                 |
            | dateofbirth      | 11/11/1995                |
            | gender           | Laki-laki                 |
            | bloodtype        | -                         |
            | religion         | Katolik                   |
            | maritalstatus    | Belum Kawin               |
            | province         | DKI JAKARTA               |
            | city             | KOTA ADM. JAKARTA SELATAN |
            | district         | PESANGGRAHAN              |
            | village          | ULUJAMI                   |
            | rt               | 01                        |
            | rw               | 05                        |
            | ktpaddress       | Jl. Durian Manis No. 99   | 
            | postalcode       | 12250                     |
            | job              | KARYAWAN SWASTA           |
            | nationality      | WNI                       |
            | noWincoreProvince| 0300                      |
            | noWincoreCity    | 0394                      |
            | noWincoreDistrict| GC10                      |
            | noWincoreVillage | GC1005                    |            
            | expiryDate       | SEUMUR HIDUP              | 
        And I update my last journey step to 'Data Personal'
        And I see my eKTP address
        When I choose my domicile address same with my identity information
        And I submit my domicile address
        Then I will notify my domicile address has successfully submitted
        And I will direct to page Data Employment
        And I reset my state journey

    @C170746
    Scenario: Submit form Domicile address with new address successfully business type CV
        Given I am a customer who has submitted my personal data details
        When I choose my new domicile address
        And I fill new domicile details as followings:
            | typeResidence | Kantor                    |
            | address       | JL. KS TUBUN NO. 27       |
            | rt            | 01                        |
            | rw            | 01                        |
            | province      | DKI JAKARTA               |
            | city          | KOTA ADM. JAKARTA SELATAN |
            | district      | PANCORAN                  |
            | village       | PANCORAN                  |
        And I submit my domicile address
        Then I will notify my domicile address has successfully submitted
        And I will direct to page Data Employment
        And I reset my state journey