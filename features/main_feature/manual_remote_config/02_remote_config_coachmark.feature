Feature: Remote config on coachmark
 As a customer lead
 I want to change wording on coachmark loan by remote connfig


@FunctTestLending
Scenario: User validate Remote configuration for title AP coachmark
    Given User on Main Dashboard
    When user click button Ajukan Limit Kredit 
    And user on loan type screen page
    And user will see if user first time access loan selection page then coach mark will shown after 1 second page loan type open
    And user see coachmark title on card AP "Contoh Kebutuhan:"
    And user go to firebase
    And user click remote config
    And user search by name loanAP_coachMark_title_text
    And user click edit button
    And user edit value name with "Penjelasan singkat kebutuhan Anda:"
    And user click button Save 
    And user click button Publish Changes
    And user will see confirmation message "After you publish, these changes are available to users."
    And user click Publish Changes button
    And user back to mobile and refresh
    And user will see coachmark title on the AP card change to "Penjelasan singkat kebutuhan Anda:"

@FunctTestLending
Scenario: User validate remote configuration changes only change on the AP card title
    Given User on Main Dashboard
    When user click button Ajukan Limit Kredit 
    And user on loan type screen page
    And user will see if user first time access loan selection page then coach mark will shown after 1 second page loan type open
    And user will see coachmark title on the AP card change "Penjelasan singkat kebutuhan Anda:"
    And user click on chevron button 
    And user will move to card AR
    And user will see user see coachmark title on card AR "Contoh Kebutuhan:"
    And user will click on chevron button
    And user will move to card PO
    And user will see user see coachmark title on card PO "Contoh Kebutuhan:"

@FunctTestLending
Scenario: User validate Remote configuration for title AR coachmark
    Given User on Main Dashboard
    When user click button Ajukan Limit Kredit 
    And user on loan type screen page
    And user will see if user first time access loan selection page then coach mark will shown after 1 second page loan type open
    And user see coachmark title on card AR "Contoh Kebutuhan:"
    And user go to firebase
    And user click remote config
    And user search by name loanAR_coachMark_title_text
    And user click edit button
    And user edit value name with "Kebutuhan for AR:"
    And user click button Save 
    And user click button Publish Changes
    And user will see confirmation message "After you publish, these changes are available to users."
    And user click Publish Changes button
    And user back to mobile and refresh
    And user will see coachmark title on the AP card change to "Kebutuhan for AR:"

@FunctTestLending
Scenario: User validate Remote configuration for title PO coachmark
    Given User on Main Dashboard
    When user click button Ajukan Limit Kredit 
    And user on loan type screen page
    And user will see if user first time access loan selection page then coach mark will shown after 1 second page loan type open
    And user see coachmark title on card PO "Contoh Kebutuhan:"
    And user go to firebase
    And user click remote config
    And user search by name loanPO_coachMark_title_text
    And user click edit button
    And user edit value name with "Kebutuhan for PO:"
    And user click button Save 
    And user click button Publish Changes
    And user will see confirmation message "After you publish, these changes are available to users."
    And user click Publish Changes button
    And user back to mobile and refresh
    And user will see coachmark title on the AP card change to "Kebutuhan for PO:"

@FunctTestLending
Scenario: User validate for title on each loan back to default
    Given User on Firebase 
    When user click remote config
    And user search by name loanAP_coachMark_title_text
    And user click edit button
    And user edit value name back to default with "Contoh Kebutuhan"
    And user click button Save 
    And user search by name loanAR_coachMark_title_text
    And user click edit button
    And user edit value name back to default with "Contoh Kebutuhan"
    And user click button Save 
    And user search by name loanPO_coachMark_title_text
    And user click edit button
    And user edit value name back to default with "Contoh Kebutuhan"
    And user click button Save 
    And user click button Publish Changes
    And user will see confirmation message "After you publish, these changes are available to users."
    And user click Publish Changes button
    And user refresh on loan type screen page
    And user click coachmark icon
    And user see title coachmark card AP back to deafult "Contoh Kebutuhan"
    And user click on chevron button 
    And user see title coachmark card AR back to deafult "Contoh Kebutuhan"
    And user click on chevron button
    And user see title coachmark card PO back to deafult "Contoh Kebutuhan"
    And user click Publish Changes button
    And user back to mobile and refresh
    And user will see the coachmark title back to default 


### coachmark caption
@FunctTestLending
Scenario: User validate Remote configuration for caption AP coachmark
    Given User on Main Dashboard
    When user click button Ajukan Limit Kredit 
    And user on loan type screen page
    And user will see if user first time access loan selection page then coach mark will shown after 1 second page loan type open
    And user see coachmark title on card AP "Contoh Kebutuhan:"
    And user see coachmark caption on card AP "Bisnis Anda membutuhkan pembayaran rutin kepada supplier bahan baku agar produksi tidak berhenti."
    And user go to firebase
    And user click remote config
    And user search by name loanAP_coachMark_caption_text
    And user click edit button
    And user edit value name with "Bisnis Anda memerlukan dana untuk membayar hutang kepada supplier."
    And user click button Save 
    And user click button Publish Changes
    And user will see confirmation message "After you publish, these changes are available to users."
    And user click Publish Changes button
    And user back to mobile and refresh
    And user see coachmark title on card AP "Contoh Kebutuhan:"
    And user will see coachmark title on the AP card change to "Bisnis Anda memerlukan dana untuk membayar hutang kepada supplier."

@FunctTestLending
Scenario: User validate Remote configuration for caption AR coachmark
    Given User on Main Dashboard
    When user click button Ajukan Limit Kredit 
    And user on loan type screen page
    And user will see if user first time access loan selection page then coach mark will shown after 1 second page loan type open
    And user see coachmark title on card AR "Contoh Kebutuhan:"
    And user see coachmark caption on card AR "Pembeli Anda belum membayar tagihan faktur, sementara Anda perlu dana sekarang."
    And user go to firebase
    And user click remote config
    And user search by name loanAR_coachMark_caption_text
    And user click edit button
    And user edit value name with "Supplier belum membayar tagihan"
    And user click button Save 
    And user click button Publish Changes
    And user will see confirmation message "After you publish, these changes are available to users."
    And user click Publish Changes button
    And user back to mobile and refresh
    And user see coachmark title on card AR "Contoh Kebutuhan:"
    And user will see coachmark title on the AP card change to "Supplier belum membayar tagihan."

@FunctTestLending
Scenario: User validate Remote configuration for caption PO coachmark
    Given User on Main Dashboard
    When user click button Ajukan Limit Kredit 
    And user on loan type screen page
    And user will see if user first time access loan selection page then coach mark will shown after 1 second page loan type open
    And user see coachmark title on card PO "Contoh Kebutuhan:"
    And user see coachmark caption on card PO "Misal Anda adalah kontraktor yang mendapat proyek dari Bouwheer. Anda membutuhkan dana untuk membeli bahan baku dari berbagai macam supplier."
    And user go to firebase
    And user click remote config
    And user search by name loanPO_coachMark_caption_text
    And user click edit button
    And user edit value name with "Saya membutuhkan dana untuk mengerjakan projek dari bouwheer."
    And user click button Save 
    And user click button Publish Changes
    And user will see confirmation message "After you publish, these changes are available to users."
    And user click Publish Changes button
    And user back to mobile and refresh
    And user see coachmark title on card PO "Contoh Kebutuhan:"
    And user will see coachmark title on the AP card change to "Saya membutuhkan dana untuk mengerjakan projek dari bouwheer."


##coachmark for both title and caption

@FunctTestLending
Scenario: User validate Remote configuration for title and caption AP coachmark
    Given User on Main Dashboard
    When user click button Ajukan Limit Kredit 
    And user on loan type screen page
    And user will see if user first time access loan selection page then coach mark will shown after 1 second page loan type open
    And user see coachmark title on card AP "Contoh Kebutuhan:"
    And user see coachmark caption on card AP "Bisnis Anda membutuhkan pembayaran rutin kepada supplier bahan baku agar produksi tidak berhenti." 
    And user go to firebase
    And user click remote config
    And user search by name loanAP_coachMark_title_text
    And user click edit button
    And user edit value name with "Penjelasan singkat kebutuhan Anda:"
    And user click button Save 
    And user search by name loanAP_coachMark_caption_text
    And user click edit button
    And user edit value name with "Bisnis Anda memerlukan dana untuk membayar hutang kepada supplier."
    And user click button Save 
    And user click button Publish Changes
    And user will see confirmation message "After you publish, these changes are available to users."
    And user click Publish Changes button
    And user back to mobile and refresh
    And user will see coachmark title on the AP card change to "Penjelasan singkat kebutuhan Anda:"
    And user will see coachmark title on the AP card change to "Bisnis Anda memerlukan dana untuk membayar hutang kepada supplier."


@FunctTestLending
Scenario: User validate Remote configuration for title and caption AR coachmark
    Given User on Main Dashboard
    When user click button Ajukan Limit Kredit 
    And user on loan type screen page
    And user will see if user first time access loan selection page then coach mark will shown after 1 second page loan type open
    And user see coachmark title on card AR "Contoh Kebutuhan:"
    And user see coachmark caption on card AR "Pembeli Anda belum membayar tagihan faktur, sementara Anda perlu dana sekarang."
    And user go to firebase
    And user click remote config
    And user search by name loanAR_coachMark_title_text
    And user click edit button
    And user edit value name with "Kebutuhan for AR:"
    And user click button Save 
    And user search by name loanAP_coachMark_caption_text
    And user click edit button
    And user edit value name with "Supplier belum membayar tagihan"
    And user click button Save 
    And user click button Publish Changes
    And user will see confirmation message "After you publish, these changes are available to users."
    And user click Publish Changes button
    And user back to mobile and refresh
    And user will see coachmark title on the AR card change to "Kebutuhan for AR:"
    And user will see coachmark title on the AR card change to "Supplier belum membayar tagihan"

@FunctTestLending
Scenario: User validate Remote configuration for title and caption PO coachmark
    Given User on Main Dashboard
    When user click button Ajukan Limit Kredit 
    And user on loan type screen page
    And user will see if user first time access loan selection page then coach mark will shown after 1 second page loan type open
    And user see coachmark title on card PO "Contoh Kebutuhan:"
    And user see coachmark caption on card PO "Misal Anda adalah kontraktor yang mendapat proyek dari Bouwheer. Anda membutuhkan dana untuk membeli bahan baku dari berbagai macam supplier."
    And user go to firebase
    And user click remote config
    And user search by name loanAR_coachMark_title_text
    And user click edit button
    And user edit value name with "Kebutuhan for PO:"
    And user click button Save 
    And user search by name loanAP_coachMark_caption_text
    And user click edit button
    And user edit value name with "Saya membutuhkan dana untuk mengerjakan projek dari bouwheer."
    And user click button Save 
    And user click button Publish Changes
    And user will see confirmation message "After you publish, these changes are available to users."
    And user click Publish Changes button
    And user back to mobile and refresh
    And user will see coachmark title on the AR card change to "Kebutuhan for PO:"
    And user will see coachmark title on the AR card change to "Saya membutuhkan dana untuk mengerjakan projek dari bouwheer."


@FunctTestLending
Scenario: User validate for turn off coach mark
    Given User on Firebase 
    When user click remote config
    And user search by name loanType_coachMark_show
    And user click edit button
    And user edit value name to "False"
    And user click button Save    
    And user click button Publish Changes
    And user will see confirmation message "After you publish, these changes are available to users."
    And user click Publish Changes button
    And user back to mobile and refresh
    And user didn't see coachmark icon on loan type screen page

@FunctTestLending
Scenario: User validate for turn on coach mark
    Given User on Firebase 
    When user click remote config
    And user search by name loanType_coachMark_show
    And user click edit button
    And user edit value name to "True"
    And user click button Save    
    And user click button Publish Changes
    And user will see confirmation message "After you publish, these changes are available to users."
    And user click Publish Changes button
    And user back to mobile and refresh
    And user see coachmark icon on loan type screen page