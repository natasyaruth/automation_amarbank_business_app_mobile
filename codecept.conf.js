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
      app: "./assets/app/app-debug.apk",
      platform: "Android",
      device: "emulator",
      path: "/",
      desiredCapabilities: {
        platformName: "Android",
        automationName: "UiAutomator2",
        newCommandTimeout: 300
      }
    },
    ChaiWrapper: {
      require: "codeceptjs-chai"
    },
    REST: {
      endpoint: "https://dev-api-sms.otoku.io",
      defaultHeaders: {
        Authorization:
          "basic NWY2NjdjMTJmYmJmNjlmNzAwZjdkYzgzNTg0ZTc5ZDI2MmEwODVjMmJmOTIxYzU2MzZjNzgzNTExYzIzNDFhYg==",
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

    uploadDocLoanPage: "./pages/uploadDocLoan.js",
    
    loanDashboardPage: "./pages/loanDashboard.js",

    onboardingAccOpeningPage: "./pages/onboardingAccOpening.js",

    uploadKtpPage: "./pages/uploadKtp.js",

    formKtpPage: "./pages/formKtp.js",

    resetStateDao: "./dao/resetStateDao.js",

    globalVariable: "./global_variable.js",

    uploadSelfiePage: "./pages/uploadSelfie.js",
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
      "./features/funding_account_opening/01_account_opening_kyc/*.feature",
      "./features/funding_account_opening/02_account_opening_kyb/*.feature",
    ],
    steps: ["./step_definitions/steps_registration.js",
      "./step_definitions/steps_login.js",
      "./step_definitions/loanApplication/steps_loanType.js",
      "./step_definitions/loanApplication/steps_selectAnchor.js",
      "./step_definitions/loanApplication/steps_loanAmountTenor.js",
      "./step_definitions/loanApplication/steps_loanMonitoring.js",
      "./step_definitions/steps_login.js",
      "./step_definitions/steps_forgotPassword.js",
      "./step_definitions/loanDashboard/loanDashboard.js",
      "./step_definitions/loanDashboard/historyPage.js",
      "./step_definitions/steps_onBoardingAccountOpening.js",
      "./step_definitions/steps_kycUploadEKtp.js",
      "./step_definitions/steps_kycSubmitFormKtp.js",
      "./step_definitions/steps_kycUploadSelfie.js"
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