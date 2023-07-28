/// <reference types='codeceptjs' />
type steps_file = typeof import('./steps_file.js');
type registrationPage = typeof import('./pages/registration.js');
type optConfirmationPage = typeof import('./pages/optConfirmation.js');
type loginPage = typeof import('./pages/login.js');
type welcomePage = typeof import('./pages/welcome.js');
type changePhoneNumberPage = typeof import('./pages/changePhoneNumber.js');
type JetpackComposeHelper = import('./helpers/JetpackComposeHelper.js');

declare namespace CodeceptJS {
  interface SupportObject { I: I, current: any, registrationPage: registrationPage, optConfirmationPage: optConfirmationPage, loginPage: loginPage, welcomePage: welcomePage, changePhoneNumberPage: changePhoneNumberPage }
  interface Methods extends Appium, JetpackComposeHelper {}
  interface I extends ReturnType<steps_file>, WithTranslation<JetpackComposeHelper> {}
  namespace Translation {
    interface Actions {}
  }
}
