@e2e_acc_opening_ud
Feature: Account Opening - UD
  In order to opening my Giro account with legality business type UD in SMB
  As a customer
  I should complete process KYC and KYB

  @C161022
  Scenario: Complete KYC and KYB business type UD
    Given I am a customer that recently registered to amarbank business with data as below
        | fullName        | Staging                            |
        | email           | ud_staging_01@gmail.com            |
        | phoneNumber     | 812340984041                       |
        | password        | 1234Test                           |
        | confirmPassword | 1234Test                           |
    And I login using my user id that I recently receive through email
    And I click later in pop up biometric
    And I will directing to Hook 1 Onboarding Account Opening
    And I swipe to card Giro Account
    And I choose Giro Account
    And I choose Giro Account Corporate
    And I submit my giro type
    And I choose legality business type 'ud'
    And I submit my legality type
    And I fill NPWP Business
    And I click continue to data personal
    And I click confirm NPWP Business
    And I see page 'Upload eKTP'
    And I click take photo eKTP
    And I will directing to page take photo eKTP
    And I take photo eKTP
    And I submit my eKTP photo
    And I fill all information identity details as followings:
      | eKtpNumber    | 3171131810770033          |
    And I swipe to button save data eKTP
    And I submit my information identity details
    And I click take my photo selfie
    And I will direct to page take selfie picture KYC
    And I take selfie picture
    And I submit my selfie photo
    And I click take photo selfie with KTP
    And I will directing to page take selfie with KTP
    And I click take photo
    And I submit my selfie with KTP
    And I will directing to page submit Data Personal
    And I submit my personal data details business and upload my npwp as followings:
        | lastEducation        | SMA          |
        | motherName           | NADYA LAMUSU |
        | referenceName        | IBU SAYA     |
        | referencePhoneNumber | 812343455677 |
    And I choose my domicile address same with my identity information
    And I submit my domicile address
    And I fill my employment details as followings:
        | workType     | Pegawai Swasta       |
        | sourceIncome | Pemasukan dari Usaha |
    And I submit my employment data
    And I continue to process KYB
    And I fill my business profile as followings:
        | businessName       | PT. ABCD        |
        | industry           | Jasa            |
        | businessField      | Restoran        |
        | monthlyIncome      | 30 - 50 juta    |
        | averageTransaction | 2000000         |
        | nib                | 9129106701234   |
        | businessDateStart  | 10/10/2010      |
    And I submit my business profile
    And I submit business director list
    And I fill my business address as followings:
        | address  | Jl. Gambir Belok Kiri No. 10 |
        | rt       | 000                          |
        | rw       | 011                          |
        | province | DKI JAKARTA                  |
        | city     | JAKARTA SELATAN              |
        | district | PANCORAN                     |
        | village  | PANCORAN                     |
    And I agree to carry out the Rights and Obligations
    And I will directing to page Rights and Obligations
    And I click button agree with Rights and Obligations
    And I will see checkbox Rights and Obligations is checked
    And I submit my business address
    And I will directing to page upload require documents for business individual
    And I choose method upload document
    And I choose direct upload via app
    And I see files that need to be uploaded for type individual company
    And I upload all document business for type individual company
    And I click button progress upload document
    And I will see all document business individual company has been uploaded
    And I click button request account opening
    And I click link go to main dashboard
    Then I will see card account 'on verification'