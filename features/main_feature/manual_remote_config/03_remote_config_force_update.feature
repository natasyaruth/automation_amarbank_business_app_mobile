
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


Scenario: user install apk version 1.0
    Given user already click link for install
    When user click install
    And user will see dsmb successfully installed
    Then user close the apps



Scenario: user update on firebase
    Given User on Firebase project ab-d-dsmb
    When user click remote config
    And user search by general_forceUpdate
    And user click edit button
    And user edit value name with flexible
    And user click button Save
    And user click button Publish Changes
    And user will see confirmation message "After you publish, these changes are available to users."
    And user click Publish Changes button


Scenario: user install apk version 1.1
    Given user already open link to install
    When user on playstore
    And user will see page to Update application
    Then user do not click button Update
   

Scenario: User will see dialog google to Update the version
    Given user already install the old version apps
    When user click open
    And user will see dialog "Download the latest version"
    And user will see button Update


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








