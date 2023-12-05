require("dotenv").config();

const env = {
  testrail: {
    require: "codeceptjs-testrail",
    host: process.env.TESTRAIL_HOST,
    user: process.env.TESTRAIL_USER,
    password: process.env.TESTRAIL_API_KEY,
    projectId: process.env.TESTRAIL_PROJECT_ID,
    suiteId: process.env.TESTRAIL_SUITE_ID,
    debugLog: process.env.TESTRAIL_DEBUG_LOG || false,
    enabled: process.env.TESTRAIL_ENABLED || false,
    runId: process.env.TESTRAIL_RUN_ID || undefined,
    closeTestRun: process.env.TESTRAIL_CLOSE_RUN || false,
  }
};

exports.config = {
  output: "./output",
  helpers: {
    Appium: {
      require: "./helpers/JetpackComposeHelper.js",
      appiumV2: true,
      // app: "./assets/app/app-development-debug.apk",
      platform: "Android",
      device: "emulator",
      path: "/wd/hub",
      desiredCapabilities: {
        platformName: "Android",
        // platformVersion: "12.0",
        automationName: "UiAutomator2",
        newCommandTimeout: 300,
        deviceName: "emulator-5554",
        appPackage: "id.co.amarbank.smb.dev",
        appActivity: "id.co.amarbank.smb.ui.MainActivity",
        autoGrantPermissions: true
      }
    },
    ChaiWrapper: {
      require: "codeceptjs-chai"
    },
    REST: {
      endpoint: "https://dev-api-sms.otoku.io",
      defaultHeaders: {
        Authorization: "basic NWY2NjdjMTJmYmJmNjlmNzAwZjdkYzgzNTg0ZTc5ZDI2MmEwODVjMmJmOTIxYzU2MzZjNzgzNTExYzIzNDFhYg==",
        "Content-Type": "application/json",
        Accept: "application/json"
      }
    },
    JSONResponse: {}
  },
  include: {
    I: "./steps_file.js",
    registrationPage: "./pages/registration.js",

    otpConfirmationPage: "./pages/otpConfirmation.js",

    loginPage: "./pages/login.js",

    welcomePage: "./pages/welcome.js",

    changePhoneNumberPage: "./pages/changePhoneNumber.js",

    headerPage: "./pages/header.js",

    whitelistDao: "./dao/whitelistDao.js",

    verificationEmailPage: "./pages/verificationEmail.js",

    otpDao: "./dao/otpDao.js",

    loanTypePage: "./pages/loanApplication/loanType.js",

    selectAnchorPage: "./pages/loanApplication/selectAnchor.js",

    selectLoanAmountPage: "./pages/loanApplication/selectLoanAmountTenor.js",

    loanMonitoringProcessPage: "./pages/loanApplication/loanMonitoringProcess.js",

    forgotPasswordPage: "./pages/forgotPassword.js",

    uploadDocLoanPage: "./pages/loanApplication/uploadDocLoanApp.js",

    loanDashboardPage: "./pages/loanDashboard.js",

    privyAggrementPage: "./pages/loanApplication/privyAggrement.js",

    onboardingAccOpeningPage: "./pages/onboardingAccOpening.js",

    uploadKtpPage: "./pages/uploadKtp.js",

    formKtpPage: "./pages/formKtp.js",

    resetStateDao: "./dao/resetStateDao.js",

    globalVariable: "./global_variable.js",

    uploadSelfiePage: "./pages/uploadSelfie.js",

    formPersonalDataPage: "./pages/formPersonalData.js",

    formDomicileAddressPage: "./pages/formDomicileAddress.js",

    formEmploymentDataPage: "./pages/formEmploymentData.js",

    formBusinessProfilePage: "./pages/formBusinessProfile.js",

    formBusinessOwnerPage: "./pages/formBusinessOwner.js",

    formBusinessAddressPage: "./pages/formBusinessAddress.js",

    createPINPage: "./pages/createPIN.js",

    loanDisbursementPage: "./pages/loanDisbursement.js",

    friendListPage: "./pages/friendList.js",

    transferPage: "./pages/transfer.js",

    homePage: "./pages/homePage.js",

    limitActivePage: "./pages/loanApplication/limitActive.js",

    businessLoanPage: "./pages/loanApplication/businessLoan.js",

    pdcDeliveryPage: "./pages/loanApplication/pdcDelivery.js",

    confirmInvoicePage: "./pages/loanApplication/confirmInvoice.js",

    invitationBusinessPage: "./pages/loanApplication/invitationBusiness.js",

    loanRepaymentPage: "./pages/loanRepayment.js",

    hookOnBoardingPage: "./pages/hookOnboarding/hookOnboarding.js",

    mainActivePage: "./pages/hookOnboarding/mainActive.js",

    uploadBusinessDocPage: "./pages/uploadBusinessDoc.js",

    profilePage: "./pages/profile.js",

    uploadDao: "./dao/uploadDao.js",
  },
  settings: {
    logging: {
      level: 'warn',
    },
  },
  mocha: {},
  bootstrap: null,
  timeout: null,
  teardown: null,
  hooks: [],
  gherkin: {
    features: ["./features/*.feature",
      "./features/loanApplication/loanTypeAP/*.feature",
      "./features/loanApplication/loanTypeAR/*.feature",
      "./features/loanApplication/loanTypePO/*.feature",
      "./features/loanDashboard/*.feature",
      "./features/funding_account_creation/*.feature",
      "./features/funding_account_opening/01_account_opening_onboarding_and_dashboard/*.feature",
      "./features/funding_account_opening/02_account_opening_kyc/kyc_cv/*.feature",
      "./features/funding_account_opening/02_account_opening_kyc/kyc_individual/*.feature",
      "./features/funding_account_opening/02_account_opening_kyc/kyc_pt_perorangan/*.feature",
      "./features/funding_account_opening/02_account_opening_kyc/kyc_pt_perusahaan/*.feature",
      "./features/funding_account_opening/02_account_opening_kyc/kyc_ud/*.feature",
      "./features/funding_account_opening/02_account_opening_kyc/kyc_user_invited/*.feature",
      "./features/funding_account_opening/03_account_opening_kyb/kyb_cv/*.feature",
      "./features/funding_account_opening/03_account_opening_kyb/kyb_pt_perorangan/*.feature",
      "./features/funding_account_opening/03_account_opening_kyb/kyb_pt_perusahaan/*.feature",
      "./features/funding_account_opening/03_account_opening_kyb/kyb_ud/*.feature",
      "./features/funding_transfer/*.feature",
      "./features/funding_create_pin/01_create_pin_journey_transfer.feature",
      "./features/funding_create_pin/02_create_pin_journey_menu_other.feature",
      "./features/funding_transfer/friend_list.feature",
      "./features/funding_create_pin/*.feature",
      "./features/loanDisbursement/*.feature",
      "./features/funding_home/*.feature",
      "./features/funding_home/01_MainDashboard_Hook1/*.feature",
      "./features/loanRepayment/*.feature",
      "./features/funding_home/02_MainDashboard_DropOff/*.feature",
      "./features/funding_home/03_MainDashboard_Active/*.feature",

    ],
    steps: ["./step_definitions/funding_account_creation/steps_registration.js",
      "./step_definitions/funding_account_creation/steps_login.js",
      "./step_definitions/loanApplication/steps_loanType.js",
      "./step_definitions/loanApplication/steps_selectAnchor.js",
      "./step_definitions/loanApplication/steps_loanAmountTenor.js",
      "./step_definitions/loanApplication/steps_loanMonitoring.js",
      "./step_definitions/loanApplication/steps_privyAggrement.js",
      "./step_definitions/loanApplication/steps_uploadDocLoan.js",
      "./step_definitions/funding_account_creation/steps_forgotPassword.js",
      "./step_definitions/loanDashboard/loanDashboard.js",
      "./step_definitions/loanDashboard/historyPage.js",
      "./step_definitions/funding_account_opening/01_account_opening_onboarding_and_dashboard/steps_onBoardingDashboard.js",
      "./step_definitions/funding_account_opening/02_account_opening_kyc/steps_kycUploadEKtp.js",
      "./step_definitions/funding_account_opening/02_account_opening_kyc/steps_kycSubmitFormKtp.js",
      "./step_definitions/funding_account_opening/02_account_opening_kyc/steps_kycUploadSelfie.js",
      "./step_definitions/funding_account_opening/02_account_opening_kyc/steps_kycSubmitFormDataPersonal.js",
      "./step_definitions/funding_account_opening/02_account_opening_kyc/steps_kycSubmitFormDomicileAddress.js",
      "./step_definitions/funding_account_opening/02_account_opening_kyc/steps_kycSubmitFormDataEmployment.js",
      "./step_definitions/funding_account_opening/03_account_opening_kyb/steps_kybSubmitFormBusinessProfile.js",
      "./step_definitions/funding_account_opening/03_account_opening_kyb/steps_kybSubmitFormBusinessOwner.js",
      "./step_definitions/funding_account_opening/03_account_opening_kyb/steps_kybSubmitFormBusinessAddress.js",
      "./step_definitions/funding_account_opening/03_account_opening_kyb/steps_kybUploadBusinessDocuments.js",
      "./step_definitions/funding_transfer/steps_friend_list.js",
      "./step_definitions/funding_transfer/steps_transfer.js",
      "./step_definitions/funding_create_pin/steps_createPin.js",
      "./step_definitions/loanDisbursement/steps_loanDisbursementTypeAP.js",
      "./step_definitions/loanDisbursement/steps_loanDisbursementTypeDirectLoanAP.js",
      "./step_definitions/funding_home/steps_home.js",
      "./step_definitions/loanApplication/steps_limitActive.js",
      "./step_definitions/loanApplication/steps_businessLoan.js",
      "./step_definitions/loanApplication/steps_pdcDelivery.js",
      "./step_definitions/loanApplication/steps_confirmInvoice.js",
      "./step_definitions/loanApplication/steps_invitationBusiness.js",
      "./step_definitions/loanRepayment/steps_loanRepaymentStatusDueDate.js",
      "./step_definitions/loanRepayment/steps_loanRepaymentStatusFailed.js",
      "./step_definitions/loanRepayment/steps_loanRepaymentStatusNormal.js",
      "./step_definitions/loanRepayment/steps_loanRepaymentStatusSuccess.js",
      "./step_definitions/funding_home/steps_onboarding.js",
      "./step_definitions/funding_home/steps_main_active.js",
      "./step_definitions/funding_home/steps_profile.js",
    ],
  },
  plugins: {
    screenshotOnFail: {
      enabled: true
    },
    tryTo: {
      enabled: true
    },
    retryFailedStep: {
      enabled: true
    },
    retryTo: {
      enabled: true
    },
    eachElement: {
      enabled: true
    },
    pauseOnFail: {},
    testrail: env.testrail
  },
  stepTimeout: 0,
  stepTimeoutOverride: [{
      pattern: "wait.*",
      timeout: 0
    },
    {
      pattern: "amOnPage",
      timeout: 0
    }
  ],
  tests: "./*_test.js",
  name: "amarbank-smb-mobile-testing"
};