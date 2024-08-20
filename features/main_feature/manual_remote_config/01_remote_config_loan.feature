
Scenario: User validate Remote configuration for wording explanation of Loan AP
    Given User on Main Dashboard
    When user click button Ajukan Limit Kredit 
    And user on loan type screen page
    And user see card AP "Saya butuh dana untuk membayar tagihan dari supplier."
    And user go to firebase
    And user click remote config
    And user search by name loanAP_explanation_text
    And user click edit button
    And user edit value name with "Anda memerlukan dana untuk membayar hutang perusahaan Anda."
    And user click button Save 
    And user click button Publish Changes
    And user will see confirmation message "After you publish, these changes are available to users."
    And user click Publish Changes button
    And user back to mobile and refresh
    And user will see the changes on card AP "Anda memerlukan dana untuk membayar hutang perusahaan Anda." 

Scenario: User validate Remote configuration for wording type of Loan AP
    Given User on Main Dashboard
    When user click button Ajukan Limit Kredit 
    And user on loan type screen page
    And user see card AP type "(Distibutor Financing)"
    And user go to firebase
    And user click remote config
    And user search by name loanAP_type_text
    And user click edit button
    And user edit value name with "Account Payable."
    And user click button Save 
    And user click button Publish Changes
    And user will see confirmation message "After you publish, these changes are available to users."
    And user click Publish Changes button
    And user back to mobile and refresh
    And user will see the changes on card AP type "(Account Payable)" 
    

Scenario: User validate Remote configuration for wording explanation of Loan AR
    Given User on Main Dashboard
    When user click button Ajukan Limit Kredit 
    And user on loan type screen page
    And user see card AR "Saya butuh dana dimuka karena pembeli belum bayar tagihan."
    And user go to firebase
    And user click remote config
    And user search by name loanAR_explanation_text
    And user click edit button
    And user edit value name with "Anda memerlukan dana untuk membiayai perusahaan karena pihak lain belum membayar hutang."
    And user click button Save 
    And user click button Publish Changes
    And user will see confirmation message "After you publish, these changes are available to users."
    And user click Publish Changes button
    And user back to mobile and refresh
    And user will see the changes on card AP "Anda memerlukan dana untuk membiayai perusahaan karena pihak lain belum membayar hutang." 


Scenario: User validate Remote configuration for wording type of Loan AR
    Given User on Main Dashboard
    When user click button Ajukan Limit Kredit 
    And user on loan type screen page
    And user see card AR type "(Supplier Financin)g"
    And user go to firebase
    And user click remote config
    And user search by name loanAR_type_text
    And user click edit button
    And user edit value name with "Account Receivable."
    And user click button Save 
    And user click button Publish Changes
    And user will see confirmation message "After you publish, these changes are available to users."
    And user click Publish Changes button
    And user back to mobile and refresh
    And user will see the changes on card AP type "(Account Receivable)" 


Scenario: User validate Remote configuration for wording explanation of Loan PO
    Given User on Main Dashboard
    When user click button Ajukan Limit Kredit 
    And user on loan type screen page
    And user see card AP "Saya butuh dana untuk membiayai proyek."
    And user go to firebase
    And user click remote config
    And user search by name loanPO_explanation_text
    And user click edit button
    And user edit value name with "Anda memerlukan dana untuk membeli bahan baku untuk proyek."
    And user click button Save 
    And user click button Publish Changes
    And user will see confirmation message "After you publish, these changes are available to users."
    And user click Publish Changes button
    And user back to mobile and refresh
    And user will see the changes on card AP "Anda memerlukan dana untuk membeli bahan baku untuk proyek." 


Scenario: User validate Remote configuration for wording type of Loan PO
    Given User on Main Dashboard
    When user click button Ajukan Limit Kredit 
    And user on loan type screen page
    And user see card PO type "(Project Financing)"
    And user go to firebase
    And user click remote config
    And user search by name loanPO_type_text
    And user click edit button
    And user edit value name with "Project."
    And user click button Save 
    And user click button Publish Changes
    And user will see confirmation message "After you publish, these changes are available to users."
    And user click Publish Changes button
    And user back to mobile and refresh
    And user will see the changes on card AP type "(Project)" 


Scenario: User validate for wording explanation back to default
    Given User on Firebase 
    When user click remote config
    And user search by name loanAR_explanation_text
    And user click edit button
    And user edit value name back to default with "Saya butuh dana dimuka karena pembeli belum bayar tagihan."
    And user click button Save 
    And user click button Publish Changes
    And user will see confirmation message "After you publish, these changes are available to users."
    And user click Publish Changes button
    And user refresh on loan type screen page
    And user see card AR back to deafult "Saya butuh dana dimuka karena pembeli belum bayar tagihan."

#remote config Pelajari Tipe Skema Kredit

Scenario: User validate Remote configuration of "Distributor financing"
    Given User on Main Dashboard
    When user click button Ajukan Limit Kredit 
    And user on loan type screen page
    And user click Pelajari Tipe Skema Kredit button
    And user will see "Distributor Financing"
    And user go to firebase
    And user click remote config
    And user search by name loanAP_type_text
    And user edit value name with "Account Payable."
    And user click button Save 
    And user click button Publish Changes
    And user will see confirmation message "After you publish, these changes are available to users."
    And user click Publish Changes button
    And user back to mobile and refresh
    And user will see the changes on card AP type "Account Payable"     
    And user will see "Account Payable" on bottomsheet Pelajari Tipe Skema Kredit and same like card type AP
 

Scenario: User validate Remote configuration of "Supplier" Financing”
    Given User on Main Dashboard
    When user click button Ajukan Limit Kredit 
    And user on loan type screen page
    And user click Pelajari Tipe Skema Kredit button
    And user will see "Supplier Financing"
    And user go to firebase
    And user click remote config
    And user search by name loanAR_type_text
    And user edit value name with "Account Payable."
    And user click button Save 
    And user click button Publish Changes
    And user will see confirmation message "After you publish, these changes are available to users."
    And user click Publish Changes button
    And user back to mobile and refresh
    And user will see the changes on card AR type "Account Payable"    
    And user will see "Account Payable" on bottomsheet Pelajari Tipe Skema Kredit and same  like card AR type

 
Scenario: User validate Remote configuration of “Project Financing”
    Given User on Main Dashboard
    When user click button Ajukan Limit Kredit 
    And user on loan type screen page
    And user click Pelajari Tipe Skema Kredit button
    And user will see "Project Financing"
    And user go to firebase
    And user click remote config
    And user search by name loanPO_type_text
    And user edit value name with "Project"
    And user click button Save 
    And user click button Publish Changes
    And user will see confirmation message "After you publish, these changes are available to users."
    And user click Publish Changes button
    And user back to mobile and refresh
    And user will see the changes on card AP type "Project"    
    And user will see "Project" on bottomsheet Pelajari Tipe Skema Kredit and same like card PO type


Scenario: User validate for remote config all type loan at the same time 
    Given User on Firebase 
    When user click remote config
    And user search by name loanAP_type_text
    And user click edit button
    And user edit value name back to default with "Skema AP"
    And user click button Save       
    And user search by name loanAR_type_text
    And user click edit button
    And user edit value name back to default with "Skema AR"
    And user click button Save       
    And user search by name loanPO_type_text
    And user click edit button
    And user edit value name back to default with "Skema PO"
    And user click button Save    
    And user click button Publish Changes
    And user will see confirmation message "After you publish, these changes are available to users."
    And user click Publish Changes button
    And user refresh on loan type screen page
    And user click Peljari Tipe Skema Kredit button
    And user will see all type loan has changed 


Scenario: Validate Default value if system failed to get update from firebase for AP
    Given User on Main Dashboard
    When user click button Ajukan Limit Kredit 
    And user on loan type screen page
    And user click Pelajari Tipe Skema Kredit button
    And user will see "Distributor Financing"
    And user go to firebase
    And user click remote config
    And user search by name loanAP_type_text
    And user edit value "Distribution"
    And user click button Save 
    And user click button Publish Changes
    And user will see confirmation message "After you publish, these changes are available to users."
    And user click Publish Changes button
    And user back to mobile and refresh
    And user will see empty value on cardAP "(Distributor Financing)"   
    And user will see "Distributor Financing"  on card AP type on bottomsheet Pelajari Tipe Skema Kredit 

Scenario: Validate Default value if system failed to get update from firebase for AR
    Given User on Main Dashboard
    When user click button Ajukan Limit Kredit 
    And user on loan type screen page
    And user click Pelajari Tipe Skema Kredit button
    And user will see "Supplier Financing"
    And user go to firebase
    And user click remote config
    And user search by name loanAR_type_text
    And user edit values "Supplier"
    And user click button Save 
    And user click button Publish Changes
    And user will see confirmation message "After you publish, these changes are available to users."
    And user click Publish Changes button
    And user back to mobile and refresh
    And user will see empty value on card AR "(Supplier Financing)"    
    And user will see "Supplier Financing" on card AR type on bottomsheet Pelajari Tipe Skema Kredit 

Scenario: Validate Default value if system failed to get update from firebase for PO
    Given User on Main Dashboard
    When user click button Ajukan Limit Kredit 
    And user on loan type screen page
    And user click Pelajari Tipe Skema Kredit button
    And user will see "Project Financing"
    And user go to firebase
    And user click remote config
    And user search by name loanPO_type_text
    And user edit value "Project"
    And user click button Save 
    And user click button Publish Changes
    And user will see confirmation message "After you publish, these changes are available to users."
    And user click Publish Changes button
    And user back to mobile and refresh
    And user will see empty value on card PO "(Project Financing)"    
    And user will see "Project Financing" on card PO type on bottomsheet Pelajari Tipe Skema Kredit 


