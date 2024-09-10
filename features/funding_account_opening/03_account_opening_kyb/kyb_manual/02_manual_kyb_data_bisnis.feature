Feature: Account Opening Manual - Data Bisnis
    In order to opening my Giro account in SMB
    As a customer
    I want to submit my data personal as part of the KYB Process

    Scenario: Check bottomsheet on Data Bisnis 
        Given I am a customer want to check bottomsheet on Data Bisnis
        When I regist account
        And I am on page Alamat Bisnis
        And I click bottomsheet for Provinsi
        Then User direct to field Cari Nama Provinsi
        And Show all province on list
        And User available to scroll the list
        And User available to type name of province
        When I do the same process for Kabupaten, Kecamatan and Kelurahan
        And Show all Kabupaten, Kecamatan, Kelurahan on list
        And User available to scroll the list
        And User available to type name of Kabupaten, Kecamatan and Kelurahan