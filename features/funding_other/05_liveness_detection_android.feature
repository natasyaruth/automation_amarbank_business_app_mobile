Feature: SDK Integration for Liveness Detection
    In order to perform liveness detection in the Android app
    As a user
    I want to interact with the SDK to complete the process and get results

    
    Scenario: User gets API access token for the SDK
        Given I am a registered user
        When I request an API access token from "active-liveness/auth/advanceaisdk/v1"
        Then I should receive a valid API access token

    
    Scenario: User is redirected to SDK page
        Given I have a valid API access token
        When I initiate the SDK process
        Then I should be redirected to the SDK page

    
    Scenario: User starts the liveness detection process
        Given I am on the SDK page
        When I click the "Mulai" button
        Then the SDK process should start

    
    Scenario: User activates camera permissions
        Given the SDK process has started
        When I grant camera permissions
        Then the camera should activate successfully

    
    Scenario: User captures a selfie for liveness detection
        Given the camera is activated
        When I position my face within the frame
        And I follow the instructions displayed on the SDK
        Then my selfie should be captured successfully

    
    Scenario: SDK uploads liveness data and returns a result
        Given my selfie has been captured
        When the SDK uploads the liveness data
        Then I should receive a liveness detection result

    
    Scenario: SDK provides a callback with Liveness ID
        Given I have received the liveness detection result
        When the SDK triggers a callback
        Then I should receive the Liveness ID

    
    Scenario: API stores the transaction with Liveness ID
        Given I have the Liveness ID
        When I send a POST request to "active-liveness/abadi/advanceaisdk/android/store/v1" with the Liveness ID
        Then I should receive a callback with a Transaction ID

    
    Scenario: Demo app receives the Transaction ID
        Given I have completed the transaction
        When the API sends a callback with the Transaction ID
        Then the Transaction ID should be passed to the demo app

    
    Scenario: User denies camera permissions
        Given the SDK process has started
        When I deny camera permissions
        Then I should receive an event result "CAMERA_PERMISSION_DENIED"
