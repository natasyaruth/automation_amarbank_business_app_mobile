Feature: Remote config limit expired countdown
 As a customer lead
 I want to change wording on loan by remote connfig



@FunctTestLending6
Scenario: User validate Remote configuration for wording limit expired countdown
    Given I have been on Loan Dashboard to checking if anchor already upload invoice
    When user click button Gunakan Limit
    And user on anchor detail page
    And user see 'Masa aktif limit tinggal 180 hari lagi'
    And user go to firebase
    And user click remote config
    And user search by limit_expiredCoundown_days
    And user click edit button
    And user edit value name with number '45'
    And user click button Save 
    And user click button Publish Changes
    And user will see confirmation message "After you publish, these changes are available to users."
    And user click Publish Chang es button
    And user back to mobile and refresh
    And user will see 'Masa aktif limit tinggal 90 hari lagi'