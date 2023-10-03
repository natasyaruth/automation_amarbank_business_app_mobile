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
type loanTypePage = typeof import('./pages/loanApplication/loanType.js');
type selectAnchorPage = typeof import('./pages/loanApplication/selectAnchor.js');
type selectLoanAmountPage = typeof import('./pages/loanApplication/selectLoanAmountTenor.js');
type loanMonitoringProcessPage = typeof import('./pages/loanApplication/loanMonitoringProcess.js');
type forgotPasswordPage = typeof import('./pages/forgotPassword.js');
type Appium = import('./helpers/JetpackComposeHelper.js');
type ChaiWrapper = import('codeceptjs-chai');
type loanTypePage = typeof import('./pages/loanType.js');
type selectAnchorPage = typeof import('./pages/selectAnchor.js');
type selectLoanAmountPage = typeof import('./pages/selectLoanAmountTenor.js');
type loanMonitoringProcessPage = typeof import('./pages/loanMonitoringProcess.js');
type loanDashboardPage = typeof import('./pages/loanDashboard.js');
type loanDisbursementPage = typeof import('./pages/loanDisbursement.js');
type uploadDocLoanPage = typeof import('./pages/loanApplication/uploadDocLoanApp.js');
type privyAggrementPage = typeof import('./pages/loanApplication/privyAggrement.js');
type onboardingAccOpeningPage = typeof import('./pages/onboardingAccOpening.js');
type uploadKtpPage = typeof import('./pages/uploadKtp.js');
type formKtpPage = typeof import('./pages/formKtp.js');
type resetStateDao = typeof import('./dao/resetStateDao.js');
type globalVariable = typeof import('./global_variable.js');
type uploadSelfiePage = typeof import('./pages/uploadSelfie.js');
type formPersonalDataPage = typeof import('./pages/formPersonalData.js');
type formDomicileAddressPage = typeof import('./pages/formDomicileAddress.js');
type formEmploymentDataPage = typeof import('./pages/formEmploymentData.js');
type formBusinessProfilePage = typeof import('./pages/formBusinessProfile.js');
type formBusinessOwnerPage = typeof import('./pages/formBusinessOwner.js');
type formBusinessAddressPage = typeof import('./pages/formBusinessAddress.js');
type Appium = import('./helpers/JetpackComposeHelper.js');
type ChaiWrapper = import('codeceptjs-chai');

declare namespace CodeceptJS {
  interface SupportObject { I: I, current: any, registrationPage: registrationPage, otpConfirmationPage: otpConfirmationPage, loginPage: loginPage, welcomePage: welcomePage, changePhoneNumberPage: changePhoneNumberPage, headerPage: headerPage, whitelistDao: whitelistDao, verificationEmailPage: verificationEmailPage, otpDao: otpDao, loanTypePage: loanTypePage, selectAnchorPage: selectAnchorPage, selectLoanAmountPage: selectLoanAmountPage, loanMonitoringProcessPage: loanMonitoringProcessPage, forgotPasswordPage: forgotPasswordPage, uploadDocLoanPage: uploadDocLoanPage, loanDashboardPage: loanDashboardPage, privyAggrementPage: privyAggrementPage,onboardingAccOpeningPage: onboardingAccOpeningPage, uploadKtpPage: uploadKtpPage, formKtpPage: formKtpPage, resetStateDao: resetStateDao, globalVariable: globalVariable, uploadSelfiePage: uploadSelfiePage, formPersonalDataPage: formPersonalDataPage, formDomicileAddressPage: formDomicileAddressPage, formEmploymentDataPage: formEmploymentDataPage, formBusinessProfilePage: formBusinessProfilePage, formBusinessOwnerPage: formBusinessOwnerPage, formBusinessAddressPage: formBusinessAddressPage }
  interface Methods extends Appium, ChaiWrapper, REST, JSONResponse {}
  interface I extends ReturnType<steps_file>, WithTranslation<ChaiWrapper>, WithTranslation<JSONResponse> {}
  namespace Translation {
    interface Actions {}
  }
}
