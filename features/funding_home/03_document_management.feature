Feature: Document Management
    As a customer
    I want to view business document that I previously uploaded

    Scenario: Verify tab profile user individual active
        Given I am a registered customer with following details:
            | userID   | autocaea |
            | password | 1234Test |
        And I filling in form login with the following details:
            | userID   | autocaea |
            | password | 1234Test |
        And I click login
        And I click later
        And I will see card account 'active'
        When I click tab profile
        Then I will see my profile individual data
        And I will not see button document business

    Scenario: Verify tab profile user individual on verification
        Given I am a registered customer with following details:
            | userID   | auto4424 |
            | password | 1234Test |
        And I filling in form login with the following details:
            | userID   | auto4424 |
            | password | 1234Test |
        And I click login
        And I click later
        And I will see card account 'on verification'
        When I click tab profile
        Then I will see my profile individual data
        And I will not see button document business

    Scenario: Verify tab profile user PT Perusahaan active
        Given I am a registered customer with following details:
            | userID   | autofb2c |
            | password | 1234Test |
        And I filling in form login with the following details:
            | userID   | autofb2c |
            | password | 1234Test |
        And I click login
        And I click later
        And I will see card account 'active'
        When I click tab profile
        And I see my profile company data
        And I click document business
        And I click document giro
        Then I will see document business for type company

    Scenario: Verify tab profile user PT Perusahaan on verification
        Given I am a registered customer with following details:
            | userID   | auto79e2 |
            | password | 1234Test |
        And I filling in form login with the following details:
            | userID   | auto79e2 |
            | password | 1234Test |
        And I click login
        And I click later
        And I will see card account 'on verification'
        When I click tab profile
        And I see my profile company data
        And I click document business
        And I click document giro
        Then I will see document business for type company

    Scenario: Verify tab profile user PT Perusahaan complete document
        Given I am a registered customer with following details:
            | userID   | auto436d |
            | password | 1234Test |
        And I filling in form login with the following details:
            | userID   | auto436d |
            | password | 1234Test |
        And I click login
        And I click later
        And I will see card account 'complete document'
        When I click tab profile
        And I see my profile company data
        And I click document business
        And I click document giro
        Then I will see document business for type company

    Scenario: Verify tab profile user CV active
        Given I am a registered customer with following details:
            | userID   | autoeb6a |
            | password | 1234Test |
        And I filling in form login with the following details:
            | userID   | autoeb6a |
            | password | 1234Test |
        And I click login
        And I click later
        And I will see card account 'active'
        When I click tab profile
        And I see my profile company data
        And I click document business
        And I click document giro
        Then I will see document business for type company

    Scenario: Verify tab profile user CV on verification
        Given I am a registered customer with following details:
            | userID   | auto0e1c |
            | password | 1234Test |
        And I filling in form login with the following details:
            | userID   | auto0e1c |
            | password | 1234Test |
        And I click login
        And I click later
        And I will see card account 'on verification'
        When I click tab profile
        And I see my profile company data
        And I click document business
        And I click document giro
        Then I will see document business for type company

    Scenario: Verify tab profile user CV complete document
        Given I am a registered customer with following details:
            | userID   | autoc10a |
            | password | 1234Test |
        And I filling in form login with the following details:
            | userID   | autoc10a |
            | password | 1234Test |
        And I click login
        And I click later
        And I will see card account 'complete document'
        When I click tab profile
        And I see my profile company data
        And I click document business
        And I click document giro
        Then I will see document business for type company

    Scenario: Verify tab profile user PT Perorangan active
        Given I am a registered customer with following details:
            | userID   | autoa645 |
            | password | 1234Test |
        And I filling in form login with the following details:
            | userID   | autoa645 |
            | password | 1234Test |
        And I click login
        And I click later
        And I will see card account 'active'
        When I click tab profile
        And I see my profile individual company data
        And I click document business
        And I click document giro
        Then I will see document business for type individual company

    Scenario: Verify tab profile user PT Perorangan on verification
        Given I am a registered customer with following details:
            | userID   | auto94a2 |
            | password | 1234Test |
        And I filling in form login with the following details:
            | userID   | auto94a2 |
            | password | 1234Test |
        And I click login
        And I click later
        And I will see card account 'on verification'
        When I click tab profile
        And I see my profile individual company data
        And I click document business
        And I click document giro
        Then I will see document business for type individual company

    Scenario: Verify tab profile user PT Perorangan complete document
        Given I am a registered customer with following details:
            | userID   | auto7d0b |
            | password | 1234Test |
        And I filling in form login with the following details:
            | userID   | auto7d0b |
            | password | 1234Test |
        And I click login
        And I click later
        And I will see card account 'complete document'
        When I click tab profile
        And I see my profile individual company data
        And I click document business
        And I click document giro
        Then I will see document business for type individual company

    Scenario: Verify tab profile user UD active
        Given I am a registered customer with following details:
            | userID   | autod015 |
            | password | 1234Test |
        And I filling in form login with the following details:
            | userID   | autod015 |
            | password | 1234Test |
        And I click login
        And I click later
        And I will see card account 'active'
        When I click tab profile
        And I see my profile individual company data
        And I click document business
        And I click document giro
        Then I will see document business for type individual company

    Scenario: Verify tab profile user UD on verification
        Given I am a registered customer with following details:
            | userID   | auto590e |
            | password | 1234Test |
        And I filling in form login with the following details:
            | userID   | auto590e |
            | password | 1234Test |
        And I click login
        And I click later
        And I will see card account 'on verification'
        When I click tab profile
        And I see my profile individual company data
        And I click document business
        And I click document giro
        Then I will see document business for type individual company

    Scenario: Verify tab profile user UD complete document
        Given I am a registered customer with following details:
            | userID   | autob386 |
            | password | 1234Test |
        And I filling in form login with the following details:
            | userID   | autob386 |
            | password | 1234Test |
        And I click login
        And I click later
        And I will see card account 'complete document'
        When I click tab profile
        And I see my profile individual company data
        And I click document business
        And I click document giro
        Then I will see document business for type individual company

    Scenario: Verify button business document is not appear if user still not upload any document
        Given I am a registered customer with following details:
            | userID   | autofded |
            | password | 1234Test |
        And I filling in form login with the following details:
            | userID   | autofded |
            | password | 1234Test |
        And I click login
        And I click later
        And I will see card account 'complete document'
        When I click tab profile
        Then I will not see button document business
        And I see my profile individual company data

    Scenario: Verify button business document is appear if user upload 1 document
        Given I am a registered customer with following details:
            | userID   | auto19fc |
            | password | 1234Test |
        And I filling in form login with the following details:
            | userID   | auto19fc |
            | password | 1234Test |
        And I click login
        And I click later
        And I will see card account 'complete document'
        When I click tab profile
        And I see my profile individual company data
        And I click document business
        And I click document giro
        Then I will see one document giro

    Scenario: Back to page profile from page Dokumen Bisnis
        Given I am a registered customer with following details:
            | userID   | autoc10a |
            | password | 1234Test |
        And I filling in form login with the following details:
            | userID   | autoc10a |
            | password | 1234Test |
        And I click login
        And I click later
        And I will see card account 'complete document'
        When I click tab profile
        And I see my profile company data
        And I click document business
        And I back to page profile business
        Then I will see card account 'complete document'

    Scenario: Back to page Dokumen Bisnis from page Dokumen Giro
        Given I am a registered customer with following details:
            | userID   | autoc10a |
            | password | 1234Test |
        And I filling in form login with the following details:
            | userID   | autoc10a |
            | password | 1234Test |
        And I click login
        And I click later
        And I will see card account 'complete document'
        When I click tab profile
        And I see my profile company data
        And I click document business
        And I click document giro
        And I back to page document business
        Then I will direct to page document business