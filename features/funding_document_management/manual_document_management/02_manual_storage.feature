Feature: Manual Document Management
    As a customer
    I want to view business document that I previously uploaded
        
    @C172538
    Scenario: Test upload document 15MB (check progress bar and total size) 
        Given I am a customer active with biometric is active
        And Storage on account is under 1GB
        And The storage scale for now is "0 GB/25 GB telah digunakan"
        When I login to app using biometric
        And I directing to main dashboard
        And I click tab brankas
        And I will see pop up information to touch the sensor area on my device
        And I put my finger in the sensor area on my device
        And I will see pop up biometric is success authenticated
        And I will see loading icon
        And I will directing to page brankas
        And I click hamburger button
        And I click button upload document
        And I success upload document
        And I click hamburger button
        And I check storage bar
        Then I see storage scale is still "0 GB/25 GB telah digunakan"

    @C172539
    Scenario: Performance testing 100MB, 500MB, 1GB 
        Given I am a customer active with biometric is active
        And Storage on account is under 1GB
        And The storage scale for now is "0 GB/25 GB telah digunakan"
        When I login to app using biometric
        And I directing to main dashboard
        And I click tab brankas
        And I will see pop up information to touch the sensor area on my device
        And I put my finger in the sensor area on my device
        And I will see pop up biometric is success authenticated
        And I will see loading icon
        And I will directing to page brankas
        And I click hamburger button
        And I am uploading document until 100MB
        And I success upload document
        And I click hamburger button
        And I check storage bar
        Then I see storage scale is still "0 GB/25 GB telah digunakan"
        And I click hamburger button
        And I am uploading document until 500MB
        And I success upload document
        And I click hamburger button
        And I check storage bar
        Then I see storage scale is still "0 GB/25 GB telah digunakan"
        And I am uploading document until 1GB
        And I success upload document
        And I click hamburger button
        And I check storage bar
        Then I see storage scale is still "1 GB/25 GB telah digunakan"

    @C172540
    Scenario: Test upload delete document 500MB (make sure storage calculation) 
        Given I am a customer active with biometric is active
        And Storage on account is under 1GB
        And The storage scale for now is "1 GB/25 GB telah digunakan"
        When I login to app using biometric
        And I directing to main dashboard
        And I click tab brankas
        And I will see pop up information to touch the sensor area on my device
        And I put my finger in the sensor area on my device
        And I will see pop up biometric is success authenticated
        And I will see loading icon
        And I will directing to page brankas
        And I delete document with total size 500MB
        And I click hamburger button
        And I check storage bar
        Then I see storage scale is still "1 GB/25 GB telah digunakan"

    @C172541
    Scenario: Test upload delete document 500MB from trash (make sure storage calculation) 
        Given I am a customer active with biometric is active
        And Storage on account is under 1GB
        And The storage scale for now is "1 GB/25 GB telah digunakan"
        When I login to app using biometric
        And I directing to main dashboard
        And I click tab brankas
        And I will see pop up information to touch the sensor area on my device
        And I put my finger in the sensor area on my device
        And I will see pop up biometric is success authenticated
        And I will see loading icon
        And I will directing to page brankas
        And I click hamburger button
        And I click menu trash
        And I delete permanenly document with total size 500MB
        And I click hamburger button
        And I check storage bar
        Then I see storage scale is back to "0 GB/25 GB telah digunakan"


