/// <reference types='codeceptjs' />
type steps_file = typeof import('./steps_file.js');
type registrationPage = typeof import('./pages/registration.js');
type otpConfirmationPage = typeof import('./pages/otpConfirmation.js');
type loginPage = typeof import('./pages/login.js');
type welcomePage = typeof import('./pages/welcome.js');
type headerPage = typeof import('./pages/header.js');
type whitelistDao = typeof import('./dao/whitelistDao.js');
type verificationEmailPage = typeof import('./pages/verificationEmail.js');
type otpDao = typeof import('./dao/otpDao.js');
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
type uploadBusinessDocPage = typeof import('./pages/uploadBusinessDoc.js');
type uploadDao = typeof import('./dao/uploadDao.js');
type firstRegistrationDao = typeof import('./dao/firstRegistrationDao.js');
type getDataDao = typeof import('./dao/getDataDao.js');
type uploadSelfieKtpPage = typeof import('./pages/uploadSelfieKtp.js');
type Appium = import('./helpers/JetpackComposeHelper.js');
type ChaiWrapper = import('codeceptjs-chai');

declare namespace CodeceptJS {
  interface SupportObject { I: I, current: any, registrationPage: registrationPage, otpConfirmationPage: otpConfirmationPage, loginPage: loginPage, welcomePage: welcomePage, 
    changePhoneNumberPage: changePhoneNumberPage, headerPage: headerPage, whitelistDao: whitelistDao, verificationEmailPage: verificationEmailPage, otpDao: otpDao,
    selectAnchorPage: selectAnchorPage, selectLoanAmountPage: selectLoanAmountPage, loanMonitoringProcessPage: loanMonitoringProcessPage, forgotPasswordPage: forgotPasswordPage, 
    nboardingAccOpeningPage: onboardingAccOpeningPage, uploadKtpPage: uploadKtpPage, formKtpPage: formKtpPage, resetStateDao: resetStateDao, globalVariable: globalVariable, 
    uploadSelfiePage: uploadSelfiePage, formPersonalDataPage: formPersonalDataPage, formDomicileAddressPage: formDomicileAddressPage, formEmploymentDataPage: formEmploymentDataPage, 
    formBusinessProfilePage: formBusinessProfilePage, formBusinessOwnerPage: formBusinessOwnerPage, formBusinessAddressPage: formBusinessAddressPage, uploadBusinessDocPage: uploadBusinessDocPage, 
    uploadDao: uploadDao, firstRegistrationDao: firstRegistrationDao, getDataDao: getDataDao, uploadSelfieKtpPage: uploadSelfieKtpPage}
  interface Methods extends Appium, ChaiWrapper, REST, JSONResponse {}
  interface I extends ReturnType<steps_file>, WithTranslation<Methods> {}
  namespace Translation {
    interface Actions {}
  }
}
