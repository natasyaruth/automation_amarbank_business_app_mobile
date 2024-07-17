Feature: Manual Document Management
    As a customer
    I want to view business document that I previously uploaded

    @C137170
    Scenario: Open document using biometric active
        Given I am a customer active with biometric is active
        When I login to app using biometric
        And I directing to main dashboard
        And I click tab document
        And I will see pop up information to touch the sensor area on my device
        And I put my finger in the sensor area on my device
        And I will see pop up biometric is success authenticated
        And I will see loading icon
        And I will directing to page document 

    @C137171
    Scenario: Open document with failed biometric once
        Given I am a customer active with biometric is active
        When I login to app using biometric
        And I directing to main dashboard
        And I click tab document
        And I will see pop up information to touch the sensor area on my device
        And I put my wrong finger in the sensor area on my device
        Then I will see pop up biometric is failed with information biometric is not recognize

    @C137172
    Scenario: Open document with failed biometric twice
        Given I am a customer active with biometric is active
        When I login to app using biometric
        And I directing to main dashboard
        And I click tab document
        And I will see pop up information to touch the sensor area on my device
        And I put my wrong finger in the sensor area on my device
        And I will see pop up biometric is failed with information biometric is not recognize
        And I try again with wrong finger
        And I will see pop up biometric is failed with information biometric is not recognize

    @C137173
    Scenario: Open document with too many attempts failed biometric
        Given I am a customer active with biometric is active
        When I login to app using biometric
        And I directing to main dashboard
        And I click tab document
        And I will see pop up information to touch the sensor area on my device
        And I put my wrong finger in the sensor area on my device
        And I will see pop up biometric is failed with information biometric is not recognize
        And I try again with wrong finger
        And I will see pop up biometric is failed with information biometric is not recognize
        And I try again with wrong finger till 5 times
        And I will see information too many attempts
        And  I will see pop up biometric is failed with information need to authenticated using password
        And I click understand
        Then I will see bottom sheet input password

    @C137174
    Scenario: Open document with password after too many attempts failed biometric
        Given I am a customer active with biometric is active
        And has too many attempts failed biometric to open document
        When I click tab document
        Then I will see pop up biometric is failed with information need to authenticated using password
        And I click understand
        Then I will see bottom sheet input password

    @C137175
    Scenario: Preview document
        Given I am a customer active with biometric is active
        And has document giro and loan
        When I click tab document
        And I put my finger in the sensor area on my device
        And I will see pop up biometric is success authenticated
        And I will see loading icon
        And I preview document giro
        Then I will see preview document giro
        And I preview document loan
        Then I will see preview document loan

    @C137176
    Scenario: Access document when device still not activated biometric
        Given I am a customer active with biometric is inactive in device
        When I login to app
        And I click tab document
        Then I will see bottom sheet input password
        And I input password
        Then I will see document page

    @C137177
    Scenario: Activated biometric via document management
        Given I am a customer active with biometric still not activated in SMB app
        When I try to login
        And I click tab Document
        And I click activated my biometric
        And I activated my biometric
        And I click tab Document
        And I will see pop up information to touch the sensor area on my device
        And I put my finger in the sensor area on my device
        And I will see pop up biometric is success authenticated
        And I will see loading icon
        Then I will directing to page document 