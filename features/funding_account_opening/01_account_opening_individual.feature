Feature: Account Opening - Individual
  In order to opening my Giro account with legality business type CV in SMB
  As a customer
  I should complete process KYC and KYB

  @acc_opening_individual
  Scenario: Complete KYC and KYB business type Individual
    Given I am a customer that recently registered to amarbank business with data as below
        | fullName        | <your name>         |
        | email           | <your email>        |
        | phoneNumber     | <your phonenumber>  |
        | password        | <your password>     |
        | confirmPassword | <your password>     |
    And I login using my user id that I recently receive through email
    And I click later in pop up biometric
    And I will directing to Hook 1 Onboarding Account Opening
    And I swipe to card Giro Account
    And I choose Giro Account
    And I choose Giro Account Corporate
    And I submit my giro type
    And I choose legality business type 'individual'
    And I submit my legality type
    And I see page 'Upload eKTP'
    And I click take photo eKTP
    And I will directing to page take photo eKTP
    And I take photo eKTP
    And I submit my eKTP photo
    And I fill all information identity details as followings:
      | eKtpNumber    | <your KTP ID>          |
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
    And I will directing to page submit Data Personal individual
    And I submit my personal data details individual and upload my npwp as followings:
      | lastEducation        | <your last education>  |
      | motherName           | <your mother name>     |
      | referenceName        | <your reference name>  |
      | referencePhoneNumber | <your reference number>|
      | purposeAccount       | <your purpose account> |
    And I choose my domicile address same with my identity information
    And I submit my domicile address
    And I fill my employment details as followings:
      | workType           | <your work type>           |
      | sourceIncome       | <your source income>       |
      | monthlyIncome      | <your monthly income>      |
      | averageTransaction | <your average transaction> |
      | industry           | <your industry work>       |
      | companyName        | <your company name>        |
    And I agree to carry out the Rights and Obligations
    And I will directing to page Rights and Obligations
    And I click button agree with Rights and Obligations
    And I will see checkbox Rights and Obligations is checked
    And I submit my employment data individual
    Then I will notify that my personal data details needs to be verified first
    And I will see card account 'on verification'