Feature: Remote config on CSAT in Lending
    As a customer lead
    I want to change wording on coachmark loan by remote connfig



Scenario: User change wording on remote config for disburse success
        Given User on Firebase
        When user click remote config
        And user search by name csat_afterDisbursement_title_text
        And user click edit button
        And user edit value name back to default with "Bagaimana kepuasan anda dengan pencairan limit di amar bank"        
        And user click button Save      
        And user click button Publish Changes
        And user will see confirmation message "After you publish, these changes are available to users."
        And user click Publish Changes button
        


Scenario: Validate wording remote config for disburse 
     Given User on Main Dashboard
     When user click button Aktivitas Pinjaman
     And User click menu Pencairan
     And user click tab Berhasil dicairkan
     And user click latest card disburse success
     And user will see wording csat based on remote config "Bagaimana kepuasan anda dengan pencairan limit di amar bank"


Scenario: User change wording on remote config for limit rejected
        Given User on Firebase
        When user click remote config
        And user search by name csat_limitRejected_title_text
        And user click edit button
        And user edit value name back to default with "Berapa penilaian Anda terhadap Amar Bank Bisnis"        
        And user click button Save      
        And user click button Publish Changes
        And user will see confirmation message "After you publish, these changes are available to users."
        And user click Publish Changes button


Scenario: Validate wording remote config for rejected limit
     Given User on Main Dashboard
     When user click button Aktivitas Pinjaman
     And user click tab Selesai
     And user click card status Pengajuan Belum Disetujui
     And user will see wording csat based on remote config "Berapa penilaian Anda terhadap Amar Bank Bisnis"


Scenario: User change wording on remote config for limit activated
        Given User on Firebase
        When user click remote config
        And user search by name csat_general_title_text
        And user click edit button
        And user edit value name back to default with "Berikan penilaian Anda"        
        And user click button Save      
        And user click button Publish Changes
        And user will see confirmation message "After you publish, these changes are available to users."
        And user click Publish Changes button

Scenario: Validate wording remote config for limit activated
    Given User on Main Dashboard
    And user click from push notif
    And user will go to Active Loan page
    And user will see wording csat based on remote config "Berapa penilain Anda"


Scenario: User change wording on remote config for repayment success
        Given User on Firebase
        When user click remote config
        And user search by name csat_afterRepayment_title_text
        And user click edit button
        And user edit value name back to default with "Seberapa puas Anda dengan proses pembayaran?"        
        And user click button Save      
        And user click button Publish Changes
        And user will see confirmation message "After you publish, these changes are available to users."
        And user click Publish Changes button


Scenario: Validate wording remote config for limit activated
    Given User on Main Dashboard
    When user click button Aktivitas Pinjaman
    And user go to menu Tagihan
    And user click tab Selesai
    And user will see wording csat based on remote config "Seberapa puas Anda dengan proses pembayaran?"