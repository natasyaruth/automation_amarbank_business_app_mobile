/// <reference types='codeceptjs' />
type steps_file = typeof import('./steps_file.js');
type registrationPage = typeof import('./pages/registration.js');
type otpConfirmationPage = typeof import('./pages/otpConfirmation.js');
type loginPage = typeof import('./pages/login.js');
type welcomePage = typeof import('./pages/welcome.js');
type changePhoneNumberPage = typeof import('./pages/changePhoneNumber.js');
type headerPage = typeof import('./pages/header.js');
type whitelistDao = typeof import('./dao/whitelistDao.js');
type verificationEmailPage = typeof import('./pages/verificationEmail.js');
type otpDao = typeof import('./dao/otpDao.js');
type loanDashboardPage = typeof import('./pages/loanDashboard.js');
type onboardingAccOpeningPage = typeof import('./pages/onboardingAccOpening.js');
type uploadKtpPage = typeof import('./pages/uploadKtp.js');
type formKtpPage = typeof import('./pages/formKtp.js');
type resetStateDao = typeof import('./dao/resetStateDao.js');
type globalVariable = typeof import('./global_variable.js');
type Appium = import('./helpers/JetpackComposeHelper.js');
type ChaiWrapper = import('codeceptjs-chai');

declare namespace CodeceptJS {
  interface SupportObject { I: I, current: any, registrationPage: registrationPage, otpConfirmationPage: otpConfirmationPage, loginPage: loginPage, welcomePage: welcomePage, changePhoneNumberPage: changePhoneNumberPage, headerPage: headerPage, whitelistDao: whitelistDao, verificationEmailPage: verificationEmailPage, otpDao: otpDao, loanDashboardPage: loanDashboardPage, onboardingAccOpeningPage: onboardingAccOpeningPage, uploadKtpPage: uploadKtpPage, formKtpPage: formKtpPage, resetStateDao: resetStateDao, globalVariable: globalVariable }
  interface Methods extends Appium, ChaiWrapper, REST, JSONResponse {}
  interface I extends ReturnType<steps_file>, WithTranslation<ChaiWrapper>, WithTranslation<JSONResponse> {}
  namespace Translation {
    interface Actions {}
  }
}
