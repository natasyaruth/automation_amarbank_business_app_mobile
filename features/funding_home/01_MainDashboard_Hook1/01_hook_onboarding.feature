Feature: User Should See Transaction Hi
    In home
    As a customer
    I need to see history transaction

    Background: User must login to home da
        Given I am a registered customer w
            | userID   | pang6f17 |
            | password | Test1234 |
        When I filling in form login with
            | userID   | pang6f17 |
            | password | Test1234 |
        And I click login

    Scenario: User want see a onboarding card and validate the wording
        Given user on onboarding loan
        When user validate content onboarding "loan"
        Then user swipe the card onboarding
        And user should see onboarding account opening
        And user validate content onboarding "ac"

    Scenario: User want see a default main dashboard
        Given user on onboarding loan
        When I click later
        And user on main dashboard default
        Then user should see text button "Ajukan Pinjaman" on field "btnLoan"
        And user should see text button "Buka Rekening Giro" on field "btnOpenAccount"