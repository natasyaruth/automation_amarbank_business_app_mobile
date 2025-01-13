@kybSubmitFormBusinessOwnersCompany
Feature: Account Opening KYB PT Perusahaan - Submit Business Directors
    In order to opening my Giro account with legality business type PT Perusahaan in SMB
    As a customer
    I want to submit list business director as part of the KYB Process

    Background: User choose legality business type PT Perusahaan
        Given I am a registered customer with following details:
            | userID      | ruthec01 |
            | password    | 1234Test |
            | userIDstg   | ruthbd98 |
            | passwordStg | 1234Test |
        And I filling in form login with the following details:
            | userID      | ruthec01 |
            | password    | 1234Test |
            | userIDstg   | ruthbd98 |
            | passwordStg | 1234Test |
        And I click login
        And I click later in pop up biometric
        And I will directing to Hook 1 Onboarding Account Opening
        And I swipe to card Giro Account
        And I choose Giro Account
        And I choose Giro Account Corporate
        And I submit my giro type
        And I choose legality business type 'company'
        And I submit my legality type
        And I fill NPWP Business
        And I click continue to data personal
        And I click confirm NPWP Business
        And I see page 'Upload eKTP'
        And I update my last journey step to 'Data Employment'
        And I see page 'Data Business Profile'
        When I fill my business profile as followings:
            | businessName      | PT. ABCD        |
            | industry           | Jasa            |
            | businessField      | Operator tur    |
            | monthlyIncome     | 30 - 50 juta    |
            | nib               | 9129106701234   |
            | businessDateStart | 10/10/2010      |
        And I submit my business profile

    @C171468
    Scenario: Submit one business director successfully business type PT Perusahaan
        Given I am a customer who has submitted my business profile
        And I am the only one business director
        When I submit business director
        Then I will notify business director list has successfully submitted
        And I will directing to page business address

    @C171470
    Scenario: Delete director for business type PT Perusahaan
        Given I am a customer who has submitted my business profile
        When I click add business director
        And I fill business director data as followings:
            | fullName | BIMO PURWOKO        |
            | email    | bimo@trash-mail.com |
            | nik      | 3166021710820021    |
        And I save data director
        And I delete the director
        And I confirm to delete the director
        Then I will notify director successfully deleted
        And I will not be able to see the deleted data director

    @C171471
    Scenario: Delete director and then submit for business type PT Perusahaan
        Given I am a customer who has submitted my business profile
        When I click add business director
        And I fill business director data as followings:
            | fullName | BIMO PURWOKO        |
            | email    | bimo@trash-mail.com |
            | nik      | 3166021710820021    |
        And I save data director
        And I validate my first director
        And I click add business director
        And I fill business director data as followings:
            | fullName | ADRI GINANJAR       |
            | email    | adri@trash-mail.com |
            | nik      | 3133021710820021    |
        And I save data director
        And I validate my second director
        And I delete the director
        And I confirm to delete the director
        And I submit business director list
        And I validate all the data in the confirmation list
        And I confirm my director lists
        Then I will notify business director list has successfully submitted
        And I will directing to page business address

    @C171472
    Scenario: Update director for business type PT Perusahaan
        Given I am a customer who has submitted my business profile
        When I click add business director
        And I fill business director data as followings:
            | fullName | BIMO PURWOKO        |
            | email    | bimo@trash-mail.com |
            | nik      | 3166021710820021    |
        And I save data director
        And I validate my first director
        And I update data director
        And I fill business director data as followings:
            | fullName | TRYSE REZZA          |
            | email    | tryse@trash-mail.com |
            | nik      | 3155021710820021     |
        And I confirm to update data director
        Then I will notify director successfully updated
        And I will see the updated director

    @C171473
    Scenario: Update director and then submit for business type PT Perusahaan
        Given I am a customer who has submitted my business profile
        When I click add business director
        And I fill business director data as followings:
            | fullName | BIMO PURWOKO        |
            | email    | bimo@trash-mail.com |
            | nik      | 3166021710820021    |
        And I save data director
        And I validate my first director
        And I update data director
        And I fill business director data as followings:
            | fullName | TRYSE REZZA          |
            | email    | tryse@trash-mail.com |
            | nik      | 3155021710820021     |
        And I submit business director list
        And I validate all the data in the confirmation list
        And I confirm my director lists
        Then I will notify business director list has successfully submitted
        And I will directing to page business address

    @C171469
    Scenario: Submit more than one business director successfully business type PT Perusahaan
        Given I am a customer who has submitted my business profile
        When I click add business director
        And I fill business director data as followings:
            | fullName | BIMO PURWOKO        |
            | email    | bimo@trash-mail.com |
            | nik      | 3166021710820021    |
        And I save data director
        And I validate my first director
        And I click add business director
        And I fill business director data as followings:
            | fullName | ADRI GINANJAR       |
            | email    | adri@trash-mail.com |
            | nik      | 3133021710820021    |
        And I save data director
        And I validate my second director
        And I submit business director list
        And I validate all the data in the confirmation list
        And I confirm my director lists
        Then I will notify business director list has successfully submitted
        And I will directing to page business address    