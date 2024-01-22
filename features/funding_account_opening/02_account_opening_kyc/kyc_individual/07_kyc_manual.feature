Feature: Manual Check test case in KYC Flow
  In order to execute testing manual in KYC Flow
  As a QA
  I need to create test case before execute testing manual

  Background: Precondition
    Given I am a registered customer with following details:
      | userID   | ruth07f9 |
      | password | 1234Test |
    And I filling in form login with the following details:
      | userID   | ruth07f9 |
      | password | 1234Test |
    And I click login
    And I will directing to Hook 1 Onboarding Account Opening
    And I swipe to card Giro Account
    And I choose Giro Account

  Scenario: Validate snackbar error case internet is lost
    Given I turn off my internet connection
    When I back to app
    Then I will see snackbar error red with wording text 'Koneksi internet Anda terputus'
    And I switch back to on my internet connection
    And I back to app
    Then I will see snackbar error green with wording text 'Koneksi internet Anda kembali terhubung'

  Scenario: Validate snackbar error case server error
    Given I mock endpoint submit legality type into server error 500
    When I choose legality business type 'individual'
    And I submit my legality type
    Then I will see snackbar error red with wording text 'Sedang terjadi kesalahan sistem.'

  Scenario: Validate snackbar error case server error
    Given I mock endpoint submit legality type into server error 500
    When I choose legality business type 'individual'
    And I submit my legality type
    Then I will see snackbar error red with wording text 'Sedang terjadi kesalahan sistem.'

  Scenario: Close bottom sheet permission
    Given I was choose any legality business type
    When I click button take photo eKTP
    And I see bottom sheet about permission to allow with text information same as figma
    And I click button close bottom sheet
    Then I will not see the bottom sheet

  Scenario: Allow permission camera and location
    Given I was choose any legality business type
    When I click button take photo eKTP
    And I see bottom sheet about permission to allow with text information same as figma
    And I click button I understand
    And I allow permission camera
    And I allow permission location
    Then I will direct page take photo eKTP with state camera is on

  Scenario: Reject permission camera and location
    Given I was choose any legality business type
    When I click button take photo eKTP
    And I see bottom sheet about permission to allow with text information same as figma
    And I click button I understand
    And I reject permission camera
    And I see information about the camera access same as figma
    And I click button I understand
    And I reject permission camera
    And I see information about user will direct to switch on the permission in setting
    And I click button I understand
    Then I will direct setting permission mobile

  Scenario: Validate OCR result with real eKTP photo
    Given I allowed permission camera and location
    When I capture photo of my eKTP
    And I click button send photo
    Then I will direct to page KTP verification with all fields are filled with correct values

  Scenario: Validate OCR result with photo is not eKTP
    Given I allowed permission camera and location
    When I capture photo that is not eKTP photo
    And I click button send photo
    Then I will direct to page KTP verification with all fields is blank

  Scenario: Validate OCR result with photo eKTP blur
    Given I allowed permission camera and location
    When I capture photo with blur eKTP photo
    And I click button send photo
    Then I will direct to page KTP verification with all fields is blank

  Scenario: Validate OCR result with photo eKTP and position is veritical
    Given I allowed permission camera and location
    When I capture photo of my eKTP with position camera is vertical
    And I click button send photo
    Then I will direct to page KTP verification with all fields are filled with correct values

  Scenario: Retake eKTP photo
    Given I allowed permission camera and location
    When I capture photo of my eKTP
    And I click button retake photo
    And I capture photo of my eKTP
    Then I will see the latest picture in the page

  Scenario: Submit data KTP with NIK indicated as DHN
    Given I was upload my eKTP photo
    When I fill data KTP with NIK indicated as DHN
    And I submit my identity details
    Then I will direct to page data KTP is rejected because KTP indicated as DHN with information same as figma
    And I can click close the page
    And I will direct main dashboard with card rejected

  Scenario: Submit data KTP with age under 17 years old
    Given I was upload my eKTP photo
    When I fill data KTP with birth date under 17 years old
    And I submit my identity details
    Then I will direct to page data KTP is rejected because birth date is under age
    And I can click close the page
    And I will direct main dashboard with card continue complete data personal

  Scenario: Submit data KTP with NIK was registered
    Given There are customer individual already registered and accepted from CRM with NIK A
    And I choose legality type individual
    And uploaded my eKTP photo
    When I fill data KTP with NIK A
    And I submit my identity details
    Then I will direct to page data KTP is rejected because KTP was registered
    And I can click close the page
    And I will direct main dashboard with card rejected

  Scenario: Take selfie with image blur/dark
    Given I submitted my identity details
    When I capture selfie with image is blur/dark
    And I click button send photo
    Then I will see snackbar error with wording text 'Foto terlalu gelap atau blur. Silakan ulangi selfie kamu.' 

  Scenario: Take selfie with other object
    Given I submitted my identity details
    When I capture selfie with other object
    And I click button send photo
    Then I will see snackbar error with wording text 'Pastikan kamu sudah mengambil foto selfie. Silakan ulangi selfie kamu'

  Scenario: Take selfie with two or more faces detected
    Given I submitted my identity details
    When I capture selfie with other people
    And I click button send photo
    Then I will see snackbar error with wording text 'Pastikan kamu sudah mengambil foto selfie. Silakan ulangi selfie kamu'  

  Scenario: Submit selfie and occur server error
    Given I submitted my identity details
    And I mock endpoint submit selfie image into server error 500
    When I capture selfie
    And I click button send photo
    Then I will see snackbar error with wording text 'Terjadi kendala sistem. Silakan coba kembali'

  Scenario: Take selfie with invalid image more than 2 times
    Given I submitted my identity details
    When I capture selfie with other object
    And I click button send photo
    And I click again button send photo
    And I click again button send photo
    Then I will direct to page data personal