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
type uploadDocLoanPage = typeof import('./pages/loanApplication/uploadDocLoanApp.js');
type loanDashboardPage = typeof import('./pages/loanDashboard.js');
type privyAggrementPage = typeof import('./pages/loanApplication/privyAggrement.js');
type onboardingAccOpeningPage = typeof import('./pages/onboardingAccOpening.js');
type steps_SecondloanMSMEPage = typeof import('./steps_SecondloanMSME.js');
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
type createPINPage = typeof import('./pages/createPIN.js');
type loanDisbursementPage = typeof import('./pages/loanDisbursement.js');
type friendListPage = typeof import('./pages/friendList.js');
type transferPage = typeof import('./pages/transfer.js');
type transactionHistoryPage = typeof import('./pages/transactionHistory.js');
type limitActivePage = typeof import('./pages/loanApplication/limitActive.js');
type businessLoanPage = typeof import('./pages/loanApplication/businessLoan.js');
type pdcDeliveryPage = typeof import('./pages/loanApplication/pdcDelivery.js');
type confirmInvoicePage = typeof import('./pages/loanApplication/confirmInvoice.js');
type invitationBusinessPage = typeof import('./pages/loanApplication/invitationBusiness.js');
type loanRepaymentPage = typeof import('./pages/loanRepayment.js');
type hookOnBoardingPage = typeof import('./pages/hookOnboarding/hookOnboarding.js');
type mainActivePage = typeof import('./pages/hookOnboarding/mainActive.js');
type uploadBusinessDocPage = typeof import('./pages/uploadBusinessDoc.js');
type profilePage = typeof import('./pages/profile.js');
type uploadDao = typeof import('./dao/uploadDao.js');
type accountDeletionPage = typeof import('./pages/accountDeletion.js');
type amountDetailPage = typeof import('./pages/amountDetail.js');
type documentManagementPage = typeof import('./pages/loanApplication/documentManagement.js');
type approvalTransactionPage = typeof import('./pages/approvalTransaction.js');
type loanFlaggingPage = typeof import('./pages/loanFlagging/loanFlagging.js');
type documentPage = typeof import('./pages/documentManagement.js');
type mockingDao = typeof import('./dao/mockingDao.js');
type firstRegistrationDao = typeof import('./dao/firstRegistrationDao.js');
type getDataDao = typeof import('./dao/getDataDao.js');
type otherPage = typeof import('./pages/other.js');
type uploadSelfieKtpPage = typeof import('./pages/uploadSelfieKtp.js');
type changePasswordPage = typeof import('./pages/changePassword.js');
type documentSafePage = typeof import('./pages/documentSafe.js');
type surveyRatingPage = typeof import('./pages/surveyRating.js');
type notificationCenterPage = typeof import('./pages/notificationCenter.js');
type firstFilterLeadsPage = typeof import('./pages/firstFilterLeads.js');
type Appium = import('./helpers/JetpackComposeHelper.js');
type ChaiWrapper = import('codeceptjs-chai');

declare namespace CodeceptJS {
  interface SupportObject { I: I, current: any, registrationPage: registrationPage, otpConfirmationPage: otpConfirmationPage, loginPage: loginPage, welcomePage: welcomePage, 
    changePhoneNumberPage: changePhoneNumberPage, headerPage: headerPage, whitelistDao: whitelistDao, verificationEmailPage: verificationEmailPage, otpDao: otpDao, loanTypePage: loanTypePage, 
    selectAnchorPage: selectAnchorPage, selectLoanAmountPage: selectLoanAmountPage, loanMonitoringProcessPage: loanMonitoringProcessPage, forgotPasswordPage: forgotPasswordPage, 
    uploadDocLoanPage: uploadDocLoanPage, loanDashboardPage: loanDashboardPage, privyAggrementPage: privyAggrementPage, onboardingAccOpeningPage: onboardingAccOpeningPage, 
    steps_SecondloanMSMEPage: steps_SecondloanMSMEPage, uploadKtpPage: uploadKtpPage, formKtpPage: formKtpPage, resetStateDao: resetStateDao, globalVariable: globalVariable, 
    uploadSelfiePage: uploadSelfiePage, formPersonalDataPage: formPersonalDataPage, formDomicileAddressPage: formDomicileAddressPage, formEmploymentDataPage: formEmploymentDataPage, 
    formBusinessProfilePage: formBusinessProfilePage, formBusinessOwnerPage: formBusinessOwnerPage, formBusinessAddressPage: formBusinessAddressPage, createPINPage: createPINPage, 
    loanDisbursementPage: loanDisbursementPage, friendListPage: friendListPage, transferPage: transferPage, transactionHistoryPage: transactionHistoryPage, limitActivePage: limitActivePage, 
    businessLoanPage: businessLoanPage, pdcDeliveryPage: pdcDeliveryPage, confirmInvoicePage: confirmInvoicePage, invitationBusinessPage: invitationBusinessPage, loanRepaymentPage: loanRepaymentPage, 
    hookOnBoardingPage: hookOnBoardingPage, mainActivePage: mainActivePage, uploadBusinessDocPage: uploadBusinessDocPage, profilePage: profilePage, uploadDao: uploadDao, accountDeletionPage: accountDeletionPage, 
    amountDetailPage: amountDetailPage, documentManagementPage: documentManagementPage, approvalTransactionPage: approvalTransactionPage, loanFlaggingPage: loanFlaggingPage, documentPage: documentPage, mockingDao: mockingDao, 
    firstRegistrationDao: firstRegistrationDao, getDataDao: getDataDao, otherPage: otherPage, uploadSelfieKtpPage: uploadSelfieKtpPage, changePasswordPage: changePasswordPage, documentSafePage: documentSafePage, 
    surveyRatingPage: surveyRatingPage, notificationCenterPage: notificationCenterPage, firstFilterLeadsPage:firstFilterLeadsPage }
  interface Methods extends Appium, ChaiWrapper, REST, JSONResponse {}
  interface I extends ReturnType<steps_file>, WithTranslation<Methods> {}
  namespace Translation {
    interface Actions {}
  }
}
