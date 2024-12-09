require("dotenv").config();
// require("./heal");

// const getRelease = require("./latest_releas.staging.js");
// console.log(getRelease);

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
  },
};

let appPackage = "id.co.amarbank.smb.dev";
if (
  process.env.ENVIRONMENT != undefined &&
  process.env.ENVIRONMENT == "staging"
) {
  appPackage = "id.co.amarbank.smb.staging";
}

let defaultAppium = {
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
    appPackage: appPackage,
    appActivity: "id.co.amarbank.smb.ui.MainActivity",
    autoGrantPermissions: true,
  },
};

if (process.env.BROWSERSTACK) {
  defaultAppium = {
    require: "./helpers/JetpackComposeHelper.js",
    app: process.env.BROWSERSTACK_APPID_HASHED,
    appiumV2: true,
    autoGrantPermissions: true,
    host: "hub-cloud.browserstack.com",
    port: 4444,
    platform: "android",
    user: process.env.BROWSERSTACK_USERNAME,
    key: process.env.BROWSERSTACK_API_KEY,
    platformName: "android",
    platformVersion: 13.0,
    deviceName: "Google Pixel 7 Pro", // if needed to adding others deviceName, replace this value, the value for the device are reference to browserstack device list.
    device: "Google Pixel 7 Pro",
    desiredCapabilities: {
      platformName: "android",
      platformVersion: "13.0",
      newCommandTimeout: 300000,
      androidDeviceReadyTimeout: 300000,
      androidInstallTimeout: 90000,
      appWaitDuration: 300000,
      autoGrantPermissions: true,
    },
  };
}

exports.config = {
  output: "./output",
  helpers: {
    Appium: defaultAppium,
    ChaiWrapper: {
      require: "codeceptjs-chai",
    },
    REST: {
      endpoint: "https://dev-api-sms.otoku.io",
      defaultHeaders: {
        Authorization:
          "basic NWY2NjdjMTJmYmJmNjlmNzAwZjdkYzgzNTg0ZTc5ZDI2MmEwODVjMmJmOTIxYzU2MzZjNzgzNTExYzIzNDFhYg==",
        "Content-Type": "application/json",
        Accept: "application/json",
      },
    },
    JSONResponse: {},
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

    loanMonitoringProcessPage:
      "./pages/loanApplication/loanMonitoringProcess.js",

    forgotPasswordPage: "./pages/forgotPassword.js",

    uploadDocLoanPage: "./pages/loanApplication/uploadDocLoanApp.js",

    loanDashboardPage: "./pages/loanDashboard.js",

    privyAggrementPage: "./pages/loanApplication/privyAggrement.js",

    onboardingAccOpeningPage: "./pages/onboardingAccOpening.js",

    steps_SecondloanMSMEPage: "./steps_SecondloanMSME.js",

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

    transactionHistoryPage: "./pages/transactionHistory.js",

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

    accountDeletionPage: "./pages/accountDeletion.js",

    amountDetailPage: "./pages/amountDetail.js",

    documentManagementPage: "./pages/loanApplication/documentManagement.js",

    approvalTransactionPage: "./pages/approvalTransaction.js",

    loanFlaggingPage: "./pages/loanFlagging/loanFlagging.js",

    documentPage: "./pages/documentManagement.js",

    mockingDao: "./dao/mockingDao.js",

    firstRegistrationDao: "./dao/firstRegistrationDao.js",

    getDataDao: "./dao/getDataDao.js",

    otherPage: "./pages/other.js",

    uploadSelfieKtpPage: "./pages/uploadSelfieKtp.js",

    changePasswordPage: "./pages/changePassword.js",

    documentSafePage: "./pages/documentSafe.js",

    surveyRatingPage: "./pages/surveyRating.js",

    notificationCenterPage: "./pages/notificationCenter.js",

    filterLoanHistory: "./pages/filterLoanHistory.js",

    firstFilterLeadsPage: "./pages/firstFilterLeads.js",
  },
  settings: {
    logging: {
      level: "warn",
    },
  },
  mocha: {
    reporterOptions: {
      "codeceptjs-cli-reporter": {
        stdout: "-",
        options: {
          verbose: true,
          steps: true,
        },
      },
      mochawesome: {
        stdout: "./output/console.log",
        options: {
          reportDir: "./output",
          reportFilename: "report",
        },
      },
        "mocha-junit-reporter": {
          "stdout": "./output/console.log",
          "options": {
            "mochaFile": "./output/result.xml",
            "attachments": true //add screenshot for a failed test
          }
      }
    },
  },
  bootstrap: null,
  timeout: 5000,
  teardown: null,
  hooks: [],
  gherkin: {
    features: [
      "./features/*.feature",
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
      "./features/funding_account_opening/02_account_opening_kyc/*.feature",
      "./features/funding_account_opening/03_account_opening_kyb/*.feature",
      "./features/funding_transaction/01_transaction_pin_management/*.feature",
      "./features/funding_transaction/02_transaction_transfer/*.feature",
      "./features/funding_transaction/03_transaction_history/*.feature",
      "./features/funding_transfer/*.feature",
      "./features/funding_profile/*.feature",
      "./features/funding_document_management/*.feature",
      "./features/funding_other/*.feature",
      "./features/loanDisbursement/*.feature",
      "./features/funding_home/*.feature",
      "./features/funding_home/01_MainDashboard_Hook1/*.feature",
      "./features/loanRepayment/*.feature",
      "./features/funding_home/02_MainDashboard_DropOff/*.feature",
      "./features/funding_home/03_MainDashboard_Active/*.feature",
      "./features/main_feature/loan_app_journey/01_Registration.feature",
      "./features/main_feature/account_opening_only/*.feature",
      "./features/main_feature/MSME/secondLoan/loanTypeAP/*.feature",
      "./features/main_feature/corporate/loanTypeAP/*.feature",
      "./features/main_feature/corporate/loanTypeAR/*.feature",
      "./features/main_feature/loanTypeAP/*.feature",
      "./features/main_feature/loanDisbursement/*.feature",
      "./features/main_feature/funding_flow/register_cases/*.feature",
      "./features/main_feature/funding_flow/funding_transfer/*.feature",
      "./features/main_feature/funding_flow/pin_management_and_others/*.feature",
      "./features/funding_e2e/funding_e2e_account_opening/*.feature",
      "./features/firstFilterLeads/01_ajukan_pinjaman.feature",
    ],
    steps: [
      "./step_definitions/funding_account_creation/steps_registration.js",
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
      "./step_definitions/funding_account_opening/02_account_opening_kyc/steps_kycUploadSelfieWithKtp.js",
      "./step_definitions/funding_account_opening/02_account_opening_kyc/steps_kycSubmitFormDataPersonal.js",
      "./step_definitions/funding_account_opening/02_account_opening_kyc/steps_kycSubmitFormDomicileAddress.js",
      "./step_definitions/funding_account_opening/02_account_opening_kyc/steps_kycSubmitFormDataEmployment.js",
      "./step_definitions/funding_account_opening/03_account_opening_kyb/steps_kybSubmitFormBusinessProfile.js",
      "./step_definitions/funding_account_opening/03_account_opening_kyb/steps_kybSubmitFormBusinessOwner.js",
      "./step_definitions/funding_account_opening/03_account_opening_kyb/steps_kybSubmitFormBusinessAddress.js",
      "./step_definitions/funding_account_opening/03_account_opening_kyb/steps_kybUploadBusinessDocuments.js",
      "./step_definitions/funding_transfer/steps_friend_list.js",
      "./step_definitions/funding_transfer/steps_transfer.js",
      "./step_definitions/funding_transfer/steps_eStatement.js",
      "./step_definitions/funding_home/steps_historyTransaction.js",
      "./step_definitions/funding_create_pin/steps_createPin.js",
      "./step_definitions/loanDisbursement/steps_loanDisbursementTypeAP.js",
      "./step_definitions/loanDisbursement/steps_loanDisbursementTypeDirectLoanAP.js",
      "./step_definitions/loanDisbursement/steps_loanDisbursementTypePO.js",
      "./step_definitions/loanDisbursement/steps_loanDisbursementTypeAR.js",
      "./step_definitions/funding_home/steps_home.js",
      "./step_definitions/funding_other/steps_other.js",
      "./step_definitions/funding_other/steps_change_password.js",
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
      "./step_definitions/funding_profile/steps_profile.js",
      "./step_definitions/funding_home/steps_document.js",
      "./step_definitions/loanApplication/steps_documentManagement.js",
      "./step_definitions/funding_profile/steps_maker_and_approver.js",
      "./step_definitions/loanFlagging/steps_SecondloanMSME.js",
      "./step_definitions/loanFlagging/steps_firstloan.js",
      "./step_definitions/loanFlagging/steps_loanFlagging.js",
      "./step_definitions/loanFlagging/steps_monitoring.js",
      "./step_definitions/loanFlagging/steps_selectAnchor.js",
      "./step_definitions/loanFlagging/steps_submitLoan.js",
      "./step_definitions/loanDashboard/steps_Filter_History_Page_Limit.js",
      "./step_definitions/loanDashboard/steps_Filter_History_Page_Disbursement.js",
      "./step_definitions/loanDashboard/steps_Filter_History_Page_Repayment.js",
      "./step_definitions/firstFilterLeads/steps_first_filter_leads.js",
    ],
  },
  plugins: {
    heal: {
      enabled: false,
    },
    screenshotOnFail: {
      enabled: true,
    },
    tryTo: {
      enabled: true,
    },
    retryFailedStep: {
      enabled: true,
    },
    retryTo: {
      enabled: true,
    },
    eachElement: {
      enabled: true,
    },
    pauseOnFail: {},
    testrail: env.testrail,
  },
  stepTimeout: 0,
  stepTimeoutOverride: [
    {
      pattern: "wait.*",
      timeout: 0,
    },
    {
      pattern: "amOnPage",
      timeout: 0,
    },
  ],
  tests: "./*_test.js",
  name: "amarbank-smb-mobile-testing",
  ai: {
    request: async (messages) => {
      const OpenAI = require("openai");
      const openai = new OpenAI({
        apiKey: "",
      });

      const completion = await openai.chat.completions.create({
        model: "gpt-3.5-turbo-0125",
        messages,
      });

      return completion?.choices[0]?.message?.content;
    },
  },
};
