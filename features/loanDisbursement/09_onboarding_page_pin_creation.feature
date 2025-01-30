Feature: Onboarding page PIN creation on first disbursement journey
    In order to test onboarding page PIN creation on first disbursement journey
    As a customer 
    I am able to see onboarding page PIN creation 

    Scenario: During PIN creation, the user will be required to input their password to verify their identity
        Given I have successfully uploaded the invoice document for disbursement
        When I click button lanjut Ajukan Pencairan
        And I should see onboarding page create PIN
        When I click button Buat PIN Sekarang 
        And I should see page input password before create PIN
        And I input password
        And I submit my password

    Scenario: The user creates an incorrect password when trying to create a PIN
        Given I have successfully uploaded the invoice document for disbursement
        When I click button lanjut Ajukan Pencairan
        And I should see onboarding page create PIN
        When I click button Buat PIN Sekarang 
        And I should see page input password before create PIN
        And I input incorrect password
        And I submit my password
        Then I should see pop up Password incorrect
        And I click button coba lagi

    Scenario: Check Onboarding page PIN creation and Create PIN when user first disbursement on loan type AP Anchor Led
        Given I have successfully uploaded the invoice document for disbursement using the loan type AP Anchor led
        When I click button lanjut Ajukan Pencairan
        And I should see onboarding page create PIN
        When I click button Buat PIN Sekarang 
        And I should see page input password before create PIN
        And I input password
        And I submit my password
        And I should see page create PIN
        And I create PIN with '111111'
        And I should see page confirmation create PIN
        And I confirm create PIN
        And I will receive email contain with OTP
        And I input correct OTP
        Then I should see proses pengecekan invoice 

    Scenario: Check Onboarding page PIN creation and Create PIN when user first disbursement on loan type AP Direct
        Given I have successfully uploaded the invoice document for disbursement using the loan type AP Direct
        When I click button lanjut Ajukan Pencairan
        And I should see onboarding page create PIN
        When I click button Buat PIN Sekarang 
        And I should see page input password before create PIN
        And I input password
        And I submit my password
        And I should see page create PIN
        And I create PIN with '111111'
        And I should see page confirmation create PIN
        And I confirm create PIN
        And I will receive email contain with OTP
        And I input correct OTP
        Then I should see proses pengecekan invoice 

    Scenario: Check Onboarding page PIN creation and Create PIN when user first disbursement on loan type AR Direct
        Given I have successfully uploaded the invoice document for disbursement using the loan type AR Direct
        When I click button lanjut Ajukan Pencairan
        And I should see onboarding page create PIN
        When I click button Buat PIN Sekarang 
        And I should see page input password before create PIN
        And I input password
        And I submit my password
        And I should see page create PIN
        And I create PIN with '111111'
        And I should see page confirmation create PIN
        And I confirm create PIN
        And I will receive email contain with OTP
        And I input correct OTP
        Then I should see proses pengecekan invoice 
    
    Scenario: Check Onboarding page PIN creation and Create PIN when user first disbursement on loan type PO Direct
        Given I have successfully uploaded the invoice document for disbursement using the loan type PO Direct
        When I click button lanjut Ajukan Pencairan
        And I should see onboarding page create PIN
        When I click button Buat PIN Sekarang 
        And I should see page input password before create PIN
        And I input password
        And I submit my password
        And I should see page create PIN
        And I create PIN with '111111'
        And I should see page confirmation create PIN
        And I confirm create PIN
        And I will receive email contain with OTP
        And I input correct OTP
        Then I should see proses pengecekan invoice 

    Scenario: The user already has a PIN and is not redirected to the onboarding page for creating a PIN
        Given I have successfully uploaded the invoice for disbursement and have create PIN
        When I click button lanjut Ajukan Pencairan
        And I should see page create PIN
        And I create PIN with '111111'
        Then I should see proses pengecekan invoice

    Scenario: The user dropped off while creating a PIN and, upon logging back in, is redirected to the onboarding page for PIN creation.
        Given I have successfully uploaded the invoice document for disbursement
        When I click button lanjut Ajukan Pencairan
        And I should see onboarding page create PIN
        When I click button Buat PIN Sekarang 
        And I should see page input password before create PIN
        And I input password
        And I submit my password
        And I should see page create PIN
        When I close page confirmation create PIN
        And I click button ya,batalkan proses
        Then I redirect to main dashboard
        When I selected the disbursement to proceed with
        When I click button lanjut Ajukan Pencairan
        And I should see onboarding page create PIN
        When I click button Buat PIN Sekarang 
        And I should see page input password before create PIN
        And I input password
        And I submit my password
        And I should see page create PIN
        And I create PIN with '111111'
        And I should see page confirmation create PIN
        And I confirm create PIN
        And I will receive email contain with OTP
        And I input correct OTP
        Then I should see proses pengecekan invoice

    Scenario: The user attempts to create a PIN with a mismatched confirmation PIN
        Given I have successfully uploaded the invoice document for disbursement using the loan type PO Direct
        When I click button lanjut Ajukan Pencairan
        And I should see onboarding page create PIN
        When I click button Buat PIN Sekarang 
        And I should see page input password before create PIN
        And I input password
        And I submit my password
        And I should see page create PIN
        And I create PIN with '111111'
        And I should see page confirmation create PIN
        And I confirm create PIN '121212'
        Then I should see message error 


    


