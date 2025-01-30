Feature: Edge Cases SDK Active Liveness Integration for IOS App

    Scenario: Successfully perform liveness verification and save transaction
        Given the user has obtained an API access token from "active-liveness/auth/advanceaisdk/v1"
        And the user is redirected to the SDK page
        When the user clicks the "Mulai" button
        And the user activates the camera permission
        And the user accesses the selfie camera
        And the user follows the liveness instructions
        And the user waits for the upload to complete
        Then the SDK returns a callback with the Liveness ID
        When the Liveness ID is used to hit POST API "active-liveness/abadi/advanceaisdk/ios/store/v1"
        Then the API returns a callback with the TransactionID
        And the TransactionID is sent as a callback to the demo app

    Scenario: User denies camera permission
        Given the user has obtained an API access token from "active-liveness/auth/advanceaisdk/v1"
        And the user is redirected to the SDK page
        When the user clicks the "Mulai" button
        And the user denies the camera permission
        Then the SDK returns a result event with an empty Liveness ID string

    Scenario: SDK fails to return Liveness ID due to network issue
        Given the user has obtained an API access token from "active-liveness/auth/advanceaisdk/v1"
        And the user is redirected to the SDK page
        When the user clicks the "Mulai" button
        And the user activates the camera permission
        And the user accesses the selfie camera
        And the user follows the liveness instructions
        And the network connection is lost during upload
        Then the SDK returns an error message "UPLOAD_FAILED"

    Scenario: API fails to return TransactionID due to invalid Liveness ID
        Given the user has obtained an API access token from "active-liveness/auth/advanceaisdk/v1"
        And the user is redirected to the SDK page
        When the user clicks the "Mulai" button
        And the user activates the camera permission
        And the user accesses the selfie camera
        And the user follows the liveness instructions
        And the user waits for the upload to complete
        And the SDK returns a callback with the Liveness ID
        When the Liveness ID is invalid and is used to hit POST API "active-liveness/abadi/advanceaisdk/ios/store/v1"
        Then the API returns an error response "INVALID_LIVENESS_ID"

    Scenario: Edge case - User closes the app during the process
        Given the user has obtained an API access token from "active-liveness/auth/advanceaisdk/v1"
        And the user is redirected to the SDK page
        When the user clicks the "Mulai" button
        And the user closes the app before completing the liveness process
        Then the SDK does not return a callback
        And no further action is taken

    Scenario: Edge case - User submits multiple selfies simultaneously
        Given the user has obtained an API access token from "active-liveness/auth/advanceaisdk/v1"
        And the user is redirected to the SDK page
        When the user clicks the "Mulai" button
        And the user activates the camera permission
        And the user submits multiple selfies simultaneously
        Then the SDK returns an error message "MULTIPLE_SUBMISSIONS_NOT_ALLOWED"

    Scenario: Edge case - User clicks "Mulai" button multiple times
        Given the user has obtained an API access token from "active-liveness/auth/advanceaisdk/v1"
        And the user is redirected to the SDK page
        When the user clicks the "Mulai" button multiple times
        Then the SDK handles the redundant clicks gracefully
        And the process proceeds without duplication