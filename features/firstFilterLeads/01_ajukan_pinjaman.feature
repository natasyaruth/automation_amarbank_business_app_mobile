
Feature: First Filter from source Ajukan Pinjaman
    As a customer,
    I want to filter from source Ajukan Pinjaman
    So that I can improve data quality and application relevance

    
    Scenario: with monthly income 5 juta sampai 50 juta and click Install Aplikasi Tunaiku
        Given I am a registered customer with following details:
            | userID      | arij6841 |
            | password    | Ari12345 |
            | userIDstg   | perob6d5 |
            | passwordStg | Eca12345 |
        When I filling in form login with the following details:
            | userID      | arij6841 |
            | password    | Ari12345 |
            | userIDstg   | perob6d5 |
            | passwordStg | Eca12345 |
        And I click login
        When I click button Ajukan Pinjaman Limit
        And I click Ayo Mulai Sekarang
        And I choose Untuk Kebutuhan bisnis atau usaha "1"
        And I click Selanjutnya
        And I choose 5 juta sampai 50 juta "1"
        And I click Selanjutnya
        Then I should see message Install aplikasi Tunaiku
        And I click Install aplikasi tunaiku

    
    Scenario: with monthly income 5 juta sampai 50 juta and click hubungi call center
        Given I am a registered customer with following details:
            | userID      | arij6841 |
            | password    | Ari12345 |
            | userIDstg   | perob6d5 |
            | passwordStg | Eca12345 |
        When I filling in form login with the following details:
            | userID      | arij6841 |
            | password    | Ari12345 |
            | userIDstg   | perob6d5 |
            | passwordStg | Eca12345 |
        And I click login
        When I click button Ajukan Pinjaman Limit
        And I click Ayo Mulai Sekarang
        And I choose Untuk Kebutuhan bisnis atau usaha "1"
        And I click Selanjutnya
        And I choose 5 juta sampai 50 juta "2"
        And I click Selanjutnya
        Then I should see message Install aplikasi Tunaiku
        And I click Hubungi Call Center
        And I should see bottom sheet Hubungi Tim Kami

    
    Scenario: with monthly income 50 juta sampai 100 juta with cases pembayaran invoice
        Given I am a registered customer with following details:
            | userID      | arij6841 |
            | password    | Ari12345 |
            | userIDstg   | perob6d5 |
            | passwordStg | Eca12345 |
        When I filling in form login with the following details:
            | userID      | arij6841 |
            | password    | Ari12345 |
            | userIDstg   | perob6d5 |
            | passwordStg | Eca12345 |
        And I click login
        When I click button Ajukan Pinjaman Limit
        And I click Ayo Mulai Sekarang
        And I choose Untuk Kebutuhan bisnis atau usaha "1"
        And I click Selanjutnya
        And I choose 50 juta sampai 100 juta "3"
        And I click Selanjutnya
        And I choose Pemabayaran Invoice "1"
        And I click Selanjutnya
        Then I should see Pengajuan Limit Kredit Bisnis

    
    Scenario: with monthly income 50 juta sampai 100 juta with cases Pembelian Persediaan
        Given I am a registered customer with following details:
            | userID      | arij6841 |
            | password    | Ari12345 |
            | userIDstg   | perob6d5 |
            | passwordStg | Eca12345 |
        When I filling in form login with the following details:
            | userID      | arij6841 |
            | password    | Ari12345 |
            | userIDstg   | perob6d5 |
            | passwordStg | Eca12345 |
        And I click login
        When I click button Ajukan Pinjaman Limit
        And I click Ayo Mulai Sekarang
        And I choose Untuk Kebutuhan bisnis atau usaha "1"
        And I click Selanjutnya
        And I choose 50 juta sampai 100 juta "3"
        And I click Selanjutnya
        And I choose Pembelian Persediaan "2"
        And I click Selanjutnya
        Then I should see message Invoice Dibutuhkan Sebagai Syarat Pencairan Pinjaman 
        And I click Mengerti & Lanjutkan Pengajuan
        Then I should see Pengajuan Limit Kredit Bisnis

    @TestAjukanPinjaman
    Scenario: with monthly income 50 juta sampai 100 juta with cases Investasi Bisnis (Pengembangan & Perluasan Usaha)
       Given I am a registered customer with following details:
            | userID      | arij6841 |
            | password    | Ari12345 |
            | userIDstg   | perob6d5 |
            | passwordStg | Eca12345 |
        When I filling in form login with the following details:
            | userID      | arij6841 |
            | password    | Ari12345 |
            | userIDstg   | perob6d5 |
            | passwordStg | Eca12345 |
        And I click login
        When I click button Ajukan Pinjaman Limit
        And I click Ayo Mulai Sekarang
        And I choose Untuk Kebutuhan bisnis atau usaha "1"
        And I click Selanjutnya
        And I choose 50 juta sampai 100 juta "3"
        And I click Selanjutnya
        And I choose Investasi Bisnis, Pengembangan & Perluasan Usaha "3"
        And I click Selanjutnya
        Then I should see message Terima Kasih Telah Menjawab Pertanyaan Kami
        And I click Mengerti

    Scenario: with monthly income 50 juta sampai 100 juta with cases Pembayaran Sewa Tempat Usaha
        Given I am a registered customer with following details:
            | userID      | arij6841 |
            | password    | Ari12345 |
            | userIDstg   | perob6d5 |
            | passwordStg | Eca12345 |
        When I filling in form login with the following details:
            | userID      | arij6841 |
            | password    | Ari12345 |
            | userIDstg   | perob6d5 |
            | passwordStg | Eca12345 |
        And I click login
        When I click button Ajukan Pinjaman Limit
        And I click Ayo Mulai Sekarang
        And I choose Untuk Kebutuhan bisnis atau usaha "1"
        And I click Selanjutnya
        And I choose 50 juta sampai 100 juta "3"
        And I click Selanjutnya
        And I choose Pembayaran Sewa Tempat Usaha "4"
        And I click Selanjutnya
        Then I should see message Terima Kasih Telah Menjawab Pertanyaan Kami
        And I click Mengerti

    Scenario: with monthly income 50 juta sampai 100 juta with cases Lainnya
        Given I am a registered customer with following details:
            | userID      | arij6841 |
            | password    | Ari12345 |
            | userIDstg   | perob6d5 |
            | passwordStg | Eca12345 |
        When I filling in form login with the following details:
            | userID      | arij6841 |
            | password    | Ari12345 |
            | userIDstg   | perob6d5 |
            | passwordStg | Eca12345 |
        And I click login
        When I click button Ajukan Pinjaman Limit
        And I choose Untuk Kebutuhan bisnis atau usaha "1"
        And I click Selanjutnya
        And I choose 50 juta sampai 100 juta "3"
        And I click Selanjutnya
        And I choose Lainnya "5"
        And I filling field lainnya
        And I click Selanjutnya
        Then I should see message Terima Kasih Telah Menjawab Pertanyaan Kami
        And I click Mengerti

    Scenario: Source from Ajukan Pinjaman (untuk kebutuhan pribadi) and click install aplikasi tunaiku
        Given I am a registered customer with following details:
            | userID      | arij6841 |
            | password    | Ari12345 |
            | userIDstg   | perob6d5 |
            | passwordStg | Eca12345 |
        When I filling in form login with the following details:
            | userID      | arij6841 |
            | password    | Ari12345 |
            | userIDstg   | perob6d5 |
            | passwordStg | Eca12345 |
        And I click login
        When I click button Ajukan Pinjaman Limit
        And I click Ayo Mulai Sekarang
        And I choose Untuk Kebutuhan Pribadi "2"
        And I click Selanjutnya
        Then I should see message Install aplikasi Tunaiku
        And I click Install aplikasi tunaiku

    Scenario: Source from Ajukan Pinjaman (untuk kebutuhan pribadi) and hubungi call center
        Given I am a registered customer with following details:
            | userID      | arij6841 |
            | password    | Ari12345 |
            | userIDstg   | perob6d5 |
            | passwordStg | Eca12345 |
        When I filling in form login with the following details:
            | userID      | arij6841 |
            | password    | Ari12345 |
            | userIDstg   | perob6d5 |
            | passwordStg | Eca12345 |
        And I click login
        When I click button Ajukan Pinjaman Limit
        And I click Ayo Mulai Sekarang
        And I choose Untuk Kebutuhan Pribadi "2"
        And I click Selanjutnya
        Then I should see message Install aplikasi Tunaiku
        And I click Hubungi Call Center
        And I should see bottom sheet Hubungi Tim Kami










