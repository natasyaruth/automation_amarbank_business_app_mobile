Feature: Account Opening KYC UD - Submit Form KTP
  In order to opening my Giro account with legality business type UD in SMB
  As a customer
  I want to submit my identity information as part of the KYC Process

  Background: User choose legality business type UD
    Given I am a registered customer with following details:
      | userID   | ruthb2e9 |
      | password | 1234Test |
    And I filling in form login with the following details:
      | userID   | ruthb2e9 |
      | password | 1234Test |
    And I click login
    Then I will direct to dashboard
    When I swipe to card Giro Account
    And I choose Giro Account
    And I choose legality business type 'ud'
    And I submit my legality type
    And I upload my eKTP photo

  # Please use this list to fill State Name:
  # - Tipe Bisnis
  # - Foto eKTP
  # - Verifikasi Data eKTP
  # - Selfie
  # - Data Diri
  # - Alamat Tempat Tinggal
  # - Data Pekerjaan
  # - Profil Bisnis
  # - Pemilik Bisnis
  # - Upload Dokumen

  @kyc_submit_form_ktp
  Scenario: Submit form KTP successfully
    Given I am a customer who has selected the business type UD
    When I fill all information identity details as followings:
      | eKtpNumber    | 3171016006920003          |
      | fullName      | NADYA LAROSA              |
      | placeOfBirth  | MEDAN                     |
      | dateOfBirth   | 11/11/1995                |
      | gender        | Perempuan                 |
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