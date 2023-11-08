@kybSubmitFormBusinessOwnersCV
Feature: Account Opening KYB CV - Submit Business Directors
    In order to opening my Giro account with legality business type CV in SMB
    As a customer
    I want to submit list business director as part of the KYB Process

    Background: User choose legality business type CV
        Given I am a registered customer with following details:
            | userID   | ruth8094                     |
            | password | 1234Test                     |
            | email    | ruth.hutauruk@amarbank.co.id |
        And I filling in form login with the following details:
            | userID   | ruth8094 |
            | password | 1234Test |
        And I click login
        And I will directing to Hook 1 Onboarding Account Opening
        And I swipe to card Giro Account
        And I choose Giro Account
        And I choose legality business type 'cv'
        And I submit my legality type
        And I upload my eKTP photo
        And I fill all information identity details as followings:
            | eKtpNumber    | 3192851710820021          |
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
        And I upload my selfie photo
        And I fill my personal data details as followings:
            | lastEducation | SMA             |
            | motherName    | NADYA LAMUSU    |
            | npwp          | 121785542123321 |
        And I submit my personal data details
        And I choose my domicile address same with my identity information
        And I submit my domicile address
        And I fill my employment details as followings:
            | workType     | Pegawai Swasta       |
            | sourceIncome | Pemasukan dari Usaha |
        And I submit my employment data
        When I continue to process KYB
        And I fill my business profile as followings:
            | businessName      | PT. ABCD        |
            | industry          | Jasa            |
            | businessField     | Restoran        |
            | monthlyIncome     | 30 - 50 juta    |
            | npwp              | 906283213036000 |
            | nib               | 9129106701234   |
            | businessDateStart | 10/10/2010      |
        And I submit my business profile

    @C96554
    Scenario: Submit one business director successfully business type CV
        Given I am a customer who has submitted my business profile
        And I am the only one business director
        When I submit business director list
        Then I will notify business director list has successfully submitted
        And I will directing to page business address

    @C96555
    Scenario: Submit more than one business director successfully business type CV
        Given I am a customer who has submitted my business profile
        When I click add business director
        And I fill business director data as followings:
            | fullName | PUPUT                |
            | email    | puput@trash-mail.com |
            | nik      | 3155021710820021     |
        And I save data director
        And I validate my first director
        And I click add business director
        And I fill business director data as followings:
            | fullName | CITAYANI FANY                |
            | email    | citayana.fany@trash-mail.com |
            | nik      | 3195021710820021             |
        And I save data director
        And I validate my second director
        And I submit business director list
        And I validate all the data in the confirmation list
        And I confirm my director lists
        Then I will notify business director list has successfully submitted
        And I will directing to page business address

    @C96556
    Scenario: Delete director for business type CV
        Given I am a customer who has submitted my business profile
        When I click add business director
        And I fill business director data as followings:
            | fullName | NURUL                |
            | email    | nurul@trash-mail.com |
            | nik      | 7166021710820021     |
        And I save data director
        And I delete the director
        And I confirm to delete the director
        Then I will notify director successfully deleted
        And I will not be able to see the deleted data director

    @C96557
    Scenario: Delete director and then submit for business type PT Perusahaan
        Given I am a customer who has submitted my business profile
        When I click add business director
        And I fill business director data as followings:
            | fullName | AVIL PURWOKO                |
            | email    | avil.purwoko@trash-mail.com |
            | nik      | 8166021710820021            |
        And I save data director
        And I validate my first director
        And I click add business director
        And I fill business director data as followings:
            | fullName | DHANI ADITYA                |
            | email    | dhani.aditya@trash-mail.com |
            | nik      | 6633021710820021            |
        And I save data director
        And I validate my second director
        And I delete the director
        And I confirm to delete the director
        And I submit business director list
        And I validate deleted data should be not in the confirmation list
        And I confirm my director lists
        Then I will notify business director list has successfully submitted
        And I will directing to page business address

    @C96558
    Scenario: Update director for business type CV
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
            | fullName | TOMMY DWI                |
            | email    | tommy.dwi@trash-mail.com |
            | nik      | 9855000710820021         |
        And I confirm to update data director
        Then I will notify director successfully updated
        And I will see the updated director

    @C96559
    Scenario: Update director and then submit for business type CV
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
            | fullName | MAURISKA SALSABILA                |
            | email    | mauriska.salsabila@trash-mail.com |
            | nik      | 8355021710820021                  |
        And I confirm to update data director
        And I submit business director list
        And I validate all the data in the confirmation list
        And I confirm my director lists
        Then I will notify business director list has successfully submitted
        And I will directing to page business address