Feature: User Should See Coachmark after limit active
    In main dashboard
    As a customer
    I need to see coachmark

    Background: User must login to home da
        Given I am a registered customer w
            | userID      | bots937a |
            | password    | Test1234 |
            | userIDstg   | stag76ee |
            | passwordStg | Test1234 |
        When I filling in form login with
            | userID      | bots937a |
            | password    | Test1234 |
            | userIDstg   | stag76ee |
            | passwordStg | Test1234 |
        And I click login
        And I click later



Scenario: User validate coachmark on main dashboard after active limit
    Given user first login after has active Loan
    When user on tab Loan
    And user will see coachmark loan "Butuh informasi tentang pinjaman Anda? Klik tab Pinjaman untuk melihat detail lengkapnya."
    And user click next button
    And user will see coachmark account giro "Kelola keuangan Anda dengan mudah. Klik tab Rekening Giro untuk memeriksa saldo, melakukan transfer, dan lainnya."
    And user click next button
    And user will see coachmark Aktivitas Pinjaman "Klik pada menu Aktivitas Pinjaman ini untuk melihat riwayat tentang pinjaman Anda."
    And user click next button
    And user will see coachmark Limit baru "Ajukan penambahan fasilitas limit pinjaman Anda dengan mudah melalui menu Tambah Limit Baru."



Scenario: User validate coachmark on main dashboard after update new version and on their first access to the unified dashboard
    Given user after update new version
    When user on tab loan 
    And user will see coachmark loan "Butuh informasi tentang pinjaman Anda? Klik tab Pinjaman untuk melihat detail lengkapnya."
    And user click next button
    And user will see coachmark account giro "Kelola keuangan Anda dengan mudah. Klik tab Rekening Giro untuk memeriksa saldo, melakukan transfer, dan lainnya."
    And user click next button
    And user will see coachmark Aktivitas Pinjaman "Klik pada menu Aktivitas Pinjaman ini untuk melihat riwayat tentang pinjaman Anda."
    And user click next button
    And user will see coachmark Limit baru "Ajukan penambahan fasilitas limit pinjaman Anda dengan mudah melalui menu Tambah Limit Baru."