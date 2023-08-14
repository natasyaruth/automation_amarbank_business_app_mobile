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
  },
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
        newCommandTimeout: 300,
      },
    },
    ChaiWrapper: {
      require: "codeceptjs-chai",
    },
  },
  include: {
    I: "./steps_file.js",

    registrationPage: "./pages/registration.js",

    optConfirmationPage: "./pages/optConfirmation.js",

    loginPage: "./pages/login.js",

    welcomePage: "./pages/welcome.js",

    changePhoneNumberPage: "./pages/changePhoneNumber.js",

    headerPage: "./pages/header.js",
  },
  mocha: {},
  bootstrap: null,
  timeout: null,
  teardown: null,
  hooks: [],
  gherkin: {
    features: "./features/*.feature",
    steps: ["./step_definitions/steps.js"],
  },
  plugins: {
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
};
