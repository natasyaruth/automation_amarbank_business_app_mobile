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
  },
};

let appPackage = "package dev";
if (
  process.env.ENVIRONMENT != undefined &&
  process.env.ENVIRONMENT == "staging"
) {
  appPackage = "package staging";
}

let defaultAppium = {
  require: "./helpers/JetpackComposeHelper.js",
  appiumV2: true,
  app: "path app",
  platform: "Android",
  // device: "emulator",
  path: "/",
  desiredCapabilities: {
    platformName: "Android",
    platformVersion: "12.0",
    automationName: "UiAutomator2",
    newCommandTimeout: 300,
    deviceName: "emulator-5554",
    appPackage: appPackage,
    appActivity: "",
    autoGrantPermissions: true,
  },
};

exports.config = {
  output: "./output",
  helpers: {
    Appium: defaultAppium,
    ChaiWrapper: {
      require: "codeceptjs-chai",
    },
    REST: {
      endpoint: "your endpoint",
      defaultHeaders: {
        Authorization:
          "basic auth",
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

    uploadDao: "./dao/uploadDao.js",

    firstRegistrationDao: "./dao/firstRegistrationDao.js",

    getDataDao: "./dao/getDataDao.js",

    uploadSelfieKtpPage: "./pages/uploadSelfieKtp.js",
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
      "./features/funding_account_creation/*.feature",
      "./features/funding_account_opening/*.feature",
    ],
    steps: [
      "./step_definitions/funding_account_creation/steps_registration.js",
      "./step_definitions/funding_account_creation/steps_login.js",
      "./step_definitions/funding_account_opening/01_account_opening_onboarding_and_dashboard/steps_onBoardingDashboard.js",
      "./step_definitions/funding_home/steps_home.js",
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
  name: "",
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
