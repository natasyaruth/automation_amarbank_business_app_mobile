Feature: Remote config force update
 As a customer lead
 I want to change status of force update by remote config


@FunctTestLendingSprint5
Scenario: user activate internal app sharing on play store
    Given user on Playstore
    When user click menu settings
    And user go to Menu about
    And user click seven times on Play Store version
    And user will see toast bar "You are now a Developer"
    And user click  menu general
    And user click menu Developer Action
    And user turn on Internal app sharing
    Then user close playstore

@FunctTestLendingSprint5
Scenario: user install apk version 1.0
    Given user already click link for install
    When user click install
    And user will see dsmb successfully installed
    And  user open the apps
    Then user swipe up the apps

@FunctTestLendingSprint5
Scenario: user update on firebase and change to Flexible
    Given User on Firebase project ab-p-dsmb
    When user click remote config
    And user search by general_forceUpdate
    And user click edit button
    And user edit value name with flexible
    And user click button Save
    And user click button Publish Changes
    And user will see confirmation message "After you publish, these changes are available to users."
    And user click Publish Changes button

@FunctTestLendingSprint5
Scenario: user install apk version 1.1
    Given user already open link to install
    When user on playstore
    And user will see page to Update application
    And user do not click button Update
    Then user swipe up the apps

   
#Flexible Update
@FunctTestLendingSprint5
Scenario: User verify see dialog google to Update the version when the status is flexible
    Given user already install the old version apps
    When user click open the app
    And user will see dialog google "Update Tersedia"
    And user will see description "Untuk menggunakan aplikasi ini, download versi terbaru. Anda dapat terus menggunakan aplikasi ini saat mendownload update".
    And user will see button Update
    And user do not click button Update
    And user click X button
    Then user swipe up the apps

@FunctTestLendingSprint5
Scenario: user update on firebase changes to Force
    Given User on Firebase project ab-d-dsmb
    When user click remote config
    And user search by general_forceUpdate
    And user click edit button
    And user edit value name with force
    And user click button Save
    And user click button Publish Changes
    And user will see confirmation message "After you publish, these changes are available to users."
    And user click Publish Changes button


#Force Update
@FunctTestLendingSprint5
Scenario: User verify that user has to update the apps if the status is Force
    Given user already install the old version apps
    When user click open the app
    And user on Playstore page with status "Update Available"
    And user see description "Untuk menggunakan aplikasi ini, download versi terbaru"
    And user will see button Update
    And user do not click button Update
    And user click X button
    Then user also exits the application

@FunctTestLendingSprint5
Scenario: user update on firebase changes to None
    Given User on Firebase project ab-d-dsmb
    When user click remote config
    And user search by general_forceUpdate
    And user click edit button
    And user edit value name with force
    And user click button Save
    And user click button Publish Changes
    And user will see confirmation message "After you publish, these changes are available to users."
    And user click Publish Changes button   

#None Update

@FunctTestLendingSprint5
Scenario: User verify that user has to update the apps if the status is None
    Given user already install the old version apps
    When user click open the app
    And user will not see any info to force update
    
@FunctTestLendingSprint5
Scenario: user update on firebase changes to Flexible
    Given User on Firebase project ab-d-dsmb
    When user click remote config
    And user search by general_forceUpdate
    And user click edit button
    And user edit value name with force
    And user click button Save
    And user click button Publish Changes
    And user will see confirmation message "After you publish, these changes are available to users."
    And user click Publish Changes button   

#No Force Update and status remote config is flexible
@FunctTestLendingSprint5
Scenario: User verify no update aplication and set remote config to Flexible
    Given user already install the apps
    When user click open the app
    And user will not see any info to force update
    

@FunctTestLendingSprint5
Scenario: user update on firebase changes to Random Value
    Given User on Firebase project ab-d-dsmb
    When user click remote config
    And user search by general_forceUpdate
    And user click edit button
    And user edit value name with testing
    And user click button Save
    And user click button Publish Changes
    And user will see confirmation message "After you publish, these changes are available to users."
    And user click Publish Changes button   


#No Force Update and status remote config is Random value
@FunctTestLendingSprint5
Scenario: User verify no update aplication and set remote config with random value
    Given user already install the apps
    When user click open the app
    And user will not see any info to force update
   




