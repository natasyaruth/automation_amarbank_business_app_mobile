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
type forgotPasswordPage = typeof import('./pages/forgotPassword.js');
type loanDashboardPage = typeof import('./pages/loanDashboard.js');
type Appium = import('./helpers/JetpackComposeHelper.js');
type ChaiWrapper = import('codeceptjs-chai');
type loanTypePage = typeof import('./pages/loanType.js');
type selectAnchorPage = typeof import('./pages/selectAnchor.js');
type selectLoanAmountPage = typeof import('./pages/selectLoanAmountTenor.js');
type loanMonitoringProcessPage = typeof import('./pages/loanMonitoringProcess.js');
type loanDashboardPage = typeof import('./pages/loanDashboard.js');
type loanDisbursementPage = typeof import('./pages/loanDisbursement.js');

declare namespace CodeceptJS {
  interface SupportObject { I: I, current: any, registrationPage: registrationPage, otpConfirmationPage: otpConfirmationPage, loginPage: loginPage, welcomePage: welcomePage, changePhoneNumberPage: changePhoneNumberPage, headerPage: headerPage, whitelistDao: whitelistDao, verificationEmailPage: verificationEmailPage, otpDao: otpDao, loanDashboardPage: loanDashboardPage, loanDisbursementPage: loanDisbursementPage }
  interface Methods extends Appium, ChaiWrapper, REST, JSONResponse {}
  interface I extends ReturnType<steps_file>, WithTranslation<Methods> {}
  namespace Translation {
    interface Actions {}
  }
}
