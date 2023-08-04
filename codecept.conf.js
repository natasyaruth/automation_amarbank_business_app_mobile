exports.config = {
  output: "./output",
  helpers: {
    Appium: {
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
    JetpackComposeHelper: {
      require: "./helpers/JetpackComposeHelper.js",
    },
  },
  ChaiWrapper:{
    require: "codeceptjs-chai",
  },
  include: {
    I: "./steps_file.js",

    registrationPage: "./pages/registration.js",

    optConfirmationPage: "./pages/optConfirmation.js",

    loginPage: "./pages/login.js",

    welcomePage: "./pages/welcome.js",
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
  },
  stepTimeout: 0,
  stepTimeoutOverride: [{
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