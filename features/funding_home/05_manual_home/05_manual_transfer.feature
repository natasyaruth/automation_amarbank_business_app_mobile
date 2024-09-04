Feature: Manual Transfer
    In error mapping on transfer feature
    As a customer
    I want to make sure show error when rekening is inactive or not exist

@C157063
Scenario: Checking inactive account number for Business
    Given I am a customer that want to transfer with business account
    When I login to app
    And I click menu transfer
    And I click button tambah ke penerima baru
    And I click button pilih nama bank
    And I choose Bank Amar
    And I input account number that inactive
    And I click button periksa
    Then Show error message Nomor rekening tidak aktif
    And User not available to continue the process

@C157064
Scenario: Checking not exist account number for Business
    Given I am a customer that want to transfer with business account
    When I login to app
    And I click menu transfer
    And I click button tambah ke penerima baru
    And I click button pilih nama bank
    And I choose Bank Amar
    And I input account number that not exist
    And I click button periksa
    Then Show error message Nomor rekening tidak ditemukan
    And User not available to continue the process

@C157065
Scenario: Checking inactive account number for Individual
    Given I am a customer that want to transfer with individual account
    When I login to app
    And I click menu transfer
    And I click button tambah ke penerima baru
    And I click button pilih nama bank
    And I choose Bank Amar
    And I input account number that inactive
    And I click button periksa
    Then Show error message Nomor rekening tidak aktif
    And User not available to continue the process

@C157066
Scenario: Checking not exist account number for Individual
    Given I am a customer that want to transfer with individual account
    When I login to app
    And I click menu transfer
    And I click button tambah ke penerima baru
    And I click button pilih nama bank
    And I choose Bank Amar
    And I input account number that not exist
    And I click button periksa
    Then Show error message Nomor rekening tidak ditemukan
    And User not available to continue the process