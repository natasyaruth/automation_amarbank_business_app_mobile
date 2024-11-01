@kybSubmitFormBusinessOwnersCV
Feature: Account Opening KYB CV - Submit Business Directors
    In order to opening my Giro account with legality business type CV in SMB
    As a customer
    I want to submit list business director as part of the KYB Process

    Background: User choose legality business type CV
        Given I am a registered customer with following details:
            | userID      | deve196a |
            | password    | 1234Test |
            | userIDstg   | ruth7cb8 |
            | passwordStg | 1234Test |
        And I reset my state journey
        And I filling in form login with the following details:
            | userID      | deve196a |
            | password    | 1234Test |
            | userIDstg   | ruth7cb8 |
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
        And I see page 'Data Business Profile'
        When I fill my business profile as followings:
            | businessName      | PT. ABCD        |
            | industry          | Jasa            |
            | businessField     | Restoran        |
            | monthlyIncome     | 30 - 50 juta    |
            | averageTransaction| 2000000         |
            | nib               | 9129106701234   |
            | businessDateStart | 10/10/2010      |
        And I submit my business profile

    Scenario Outline: Verifying form Add Director fields has been filled and then empty the fields
        Given I am a customer who has submitted my business profile
        When I click add business director
        And I fill field '<Field>' with 'Testing' in form Add Director
        And I clear the field '<Field>' in form Add Director
        Then I should see message error '<Field Name> wajib diisi' in the below of field '<Field>' in form Add Director
        Examples:
            | testRailTag | Field    | Field Name   |
            | @C131873    | fullName | Nama lengkap |
            | @C131874    | email    | E-mail       |
            | @C131875    | nik      | Nomor KTP    |

    Scenario Outline: Verifying one fields hasn't been filled by user in form Add Director
        Given I am a customer who has submitted my business profile
        When I click add business director
        And I fill form Add Director except field '<Field>'
        And I save data director
        Then I should see message error '<Field Name> wajib diisi' in the below of field '<Field>' in form Add Director
        Examples:
            | testRailTag | Field    | Field Name   |
            | @C131876    | fullName | Nama lengkap |
            | @C131877    | email    | E-mail       |
            | @C131878    | nik      | Nomor KTP    |

    Scenario Outline: Verifying full name with invalid value in form Add Director
        Given I am a customer who has submitted my business profile
        When I click add business director
        And I fill field 'fullName' with '<Value>' in form Add Director
        Then I should see message error '<Message>' in the below of field 'fullName' in form Add Director
        Examples:                                                                 ❸
            | testRailTag | Value                                               | Message                                                                        |
            | @C131879    | 31245                                               | Nama lengkap tidak boleh mengandung angka dan spesial karakter kecuali (.,\'-) |
            | @C131880    | Ruth Natasya 1                                      | Nama lengkap tidak boleh mengandung angka dan spesial karakter kecuali (.,\'-) |
            | @C131881    | Ruth Natasya Natasya Natasya Natasya Natasya Natasy | Nama lengkap minimal 3 & maksimal 50 karakter                                  |
            | @C131882    | Ru                                                  | Nama lengkap minimal 3 & maksimal 50 karakter                                  |
            | @C131883    |                                                     | Nama lengkap wajib diisi                                                       |

    @C131884
    Scenario: Verifying field full name contain with special char and number
        Given I am a customer who has submitted my business profile
        When I click add business director
        And I fill field 'fullName' with 'John Doe S.Kom, M\'Kom-' in form Add Director
        Then I shouldn't see message error in the below of field 'fullName' in form Add Director

    Scenario Outline: Verifying email with invalid value in form Add Director
        Given I am a customer who has submitted my business profile
        When I click add business director
        And I fill field 'email' with '<Value>' in form Add Director
        Then I should see message error '<Message>' in the below of field 'email' in form Add Director
        Examples:                                                                 ❸
            | testRailTag | Value                  | Message                    |
            | @C131885    | ruth.natasyagmail.com  | E-mail tidak sesuai format |
            | @C131886    | ruth natasya@gmail.com | E-mail tidak sesuai format |
            | @C131887    |                        | E-mail wajib diisi         |

    Scenario Outline: Verifying NIK field with invalid value in form Add Director
        Given I am a customer who has submitted my business profile
        When I click add business director
        And I fill field 'nik' with '<Value>' in form Add Director
        Then I should see message error '<Message>' in the below of field 'nik' in form Add Director
        Examples:                                                                 ❸
            | testRailTag | Value              | Message                             |
            | @C131888    | 31730aa601860007   | Nomor KTP tidak sesuai format       |
            | @C131889    | 31730@!601860007   | Nomor KTP tidak sesuai format       |
            | @C131890    | 31730 601860007    | Nomor KTP tidak sesuai format       |
            | @C131891    | 31730356018607     | Nomor KTP harus 16 digit            |
            | @C131892    | 317303560186000712 | Nomor KTP harus 16 digit            |
            | @C131893    | 417303560186000712 | Nomor KTP tidak boleh diawali 0 & 4 |
            | @C131894    |                    | Nomor KTP wajib diisi               |

    @C131895
    Scenario: Submit one business director successfully business type CV
        Given I am a customer who has submitted my business profile
        And I am the only one business director
        When I submit business director list
        Then I will notify business director list has successfully submitted
        And I will directing to page business address

    @C131896
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
        And I validate all the data in the confirmation page
        And I confirm my director lists
        Then I will notify business director list has successfully submitted
        And I will directing to page business address

    @C131897
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

    @C131898
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
        And I validate deleted data should be not in the confirmation page
        And I confirm my director lists
        Then I will notify business director list has successfully submitted
        And I will directing to page business address

    @C131899
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

    @C131900
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