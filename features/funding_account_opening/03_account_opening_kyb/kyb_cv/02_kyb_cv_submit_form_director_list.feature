@kybSubmitFormBusinessOwnersCV
Feature: Account Opening KYB CV - Submit Business Directors
    In order to opening my Giro account with legality business type CV in SMB
    As a customer
    I want to submit list business director as part of the KYB Process

    Background: User choose legality business type CV
        Given I am a registered customer with following details:
            | userID      | ruth0c1c |
            | password    | 1234Test |
            | userIDstg   | ruth7cb8 |
            | passwordStg | 1234Test |
        And I filling in form login with the following details:
            | userID      | ruth0c1c |
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
            | businessName      | PT. ABCD        |
            | industry          | Jasa            |
            | businessField     | Restoran        |
            | monthlyIncome     | 30 - 50 juta    |
            | npwp              | 906283213036000 |
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
            | @C101302    | fullName | Nama lengkap |
            | @C101303    | email    | E-mail       |
            | @C101304    | nik      | Nomor KTP    |

    Scenario Outline: Verifying one fields hasn't been filled by user in form Add Director
        Given I am a customer who has submitted my business profile
        When I click add business director
        And I fill form Add Director except field '<Field>'
        And I save data director
        Then I should see message error '<Field Name> wajib diisi' in the below of field '<Field>' in form Add Director
        Examples:
            | testRailTag | Field    | Field Name   |
            | @C101305    | fullName | Nama lengkap |
            | @C101306    | email    | E-mail       |
            | @C101307    | nik      | Nomor KTP    |

    Scenario Outline: Verifying full name with invalid value in form Add Director
        Given I am a customer who has submitted my business profile
        When I click add business director
        And I fill field 'fullName' with '<Value>' in form Add Director
        Then I should see message error '<Message>' in the below of field 'fullName' in form Add Director
        Examples:                                                                 ❸
            | testRailTag | Value                                               | Message                                                                        |
            | @C101308    | 31245                                               | Nama lengkap tidak boleh mengandung angka dan spesial karakter kecuali (.,\'-) |
            | @C101309    | Ruth Natasya 1                                      | Nama lengkap tidak boleh mengandung angka dan spesial karakter kecuali (.,\'-) |
            | @C101310    | Ruth Natasya Natasya Natasya Natasya Natasya Natasy | Nama lengkap minimal 3 & maksimal 50 karakter                                  |
            | @C101311    | Ru                                                  | Nama lengkap minimal 3 & maksimal 50 karakter                                  |
            | @C101312    |                                                     | Nama lengkap wajib diisi                                                       |

    @C101313
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
            | @C101314    | ruth.natasyagmail.com  | E-mail tidak sesuai format |
            | @C101315    | ruth natasya@gmail.com | E-mail tidak sesuai format |
            | @C101316    |                        | E-mail wajib diisi         |

    Scenario Outline: Verifying NIK field with invalid value in form Add Director
        Given I am a customer who has submitted my business profile
        When I click add business director
        And I fill field 'nik' with '<Value>' in form Add Director
        Then I should see message error '<Message>' in the below of field 'nik' in form Add Director
        Examples:                                                                 ❸
            | testRailTag | Value              | Message                             |
            | @C101317    | 31730aa601860007   | Nomor KTP tidak sesuai format       |
            | @C101318    | 31730@!601860007   | Nomor KTP tidak sesuai format       |
            | @C101319    | 31730 601860007    | Nomor KTP tidak sesuai format       |
            | @C101320    | 31730356018607     | Nomor KTP harus 16 digit            |
            | @C101321    | 317303560186000712 | Nomor KTP harus 16 digit            |
            | @C101322    | 417303560186000712 | Nomor KTP tidak boleh diawali 0 & 4 |
            | @C101323    |                    | Nomor KTP wajib diisi               |

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