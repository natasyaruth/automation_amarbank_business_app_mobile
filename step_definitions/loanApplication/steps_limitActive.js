const limitActive = require("../../pages/loanApplication/limitActive");

const { I, limitActivePage} = inject();

Then(/I should see the wording dan card design of "Loan AP"/,()=>{
});
// screen active limit
Then(/user click button back/, () =>{
    limitActivePage.clickBtnBack();
});
Then(/user click button copy/, () =>{
    limitActivePage.clickBtnCopy();
});
Then(/user click button lihat pinjaman/, () =>{
    limitActivePage.clickBtnBackToDashboard();
});

//scenario: csat on limit activated
Given('I am a customer who wants to see CSAT after activated limit', () => {

});

Then("I will direct to page Offering limit AP MSME", () => {
   I.see('Selamat, Limit Pinjaman Telah Aktif');
   I.see('Supplier');
   I.see('Informasi Tambahan');   
});
Then("I see CSAT will displayed in page active loan", () => {
   
    I.waitForText("Berikan penilaian terhadap aplikasi Amar Bank Bisnis", 20);
    I.see("(1 Sangat Tidak Puas, 5 Sangat Puas)");

    I.waitForElement(limitActivePage.buttons.onestar, 10);
    I.waitForElement(limitActivePage.buttons.twoStar, 10);
    I.waitForElement(limitActivePage.buttons.threestar,10);
    I.waitForElement(limitActivePage.buttons.fourstar, 10);
    I.waitForElement(limitActivePage.buttons.fivestar, 10);
   
    I.dontSee("Mengapa Memberi Penilaian Tersebut?");
    I.dontSee("Tulis disini...");
    I.dontSeeElement(limitActivePagefields.sendFeedbacklending);
    
    I.dontSee("Kirim Penilaian");
    I.dontSeeElement(limitActivePage.buttons.sendLending);
});
Then("I will direct to page Offering limit AR MSME", () => {
    I.grabTextFrom(limitActivePage.textView.headerLimitActive, 10);
    I.grabTextFrom(limitActivePage.textView.textViewLimitTersedia, 10);
    I.grabTextFrom(limitActivePage.textView.textViewLimitBuyer, 10);
    I.grabTextFrom(limitActivePage.textView.textViewLimitInformasiTambahan, 10);
});
Then("I will direct to page Offering limit PO MSME", () => {
    I.grabTextFrom(limitActivePage.textView.headerLimitActive, 10);
    I.grabTextFrom(limitActivePage.textView.textViewLimitTersedia, 10);
    I.grabTextFrom(limitActivePage.textView.textViewLimitBouwheer, 10);
    I.grabTextFrom(limitActivePage.textView.textViewLimitInformasiTambahan, 10);
});
Then("I will direct to page Offering limit AP Corp", () => {
    I.grabTextFrom(limitActivePage.textView.headerLimitActive, 10);
    I.grabTextFrom(limitActivePage.textView.textViewLimitTersedia, 10);
    I.grabTextFrom(limitActivePage.textView.textViewLimitSupplier, 10);
    I.grabTextFrom(limitActivePage.textView.textViewLimitInformasiTambahan, 10);
});
Then("I will direct to page Offering limit AR Corp", () => {
    I.grabTextFrom(limitActivePage.textView.headerLimitActive, 10);
    I.grabTextFrom(limitActivePage.textView.textViewLimitTersedia, 10);
    I.grabTextFrom(limitActivePage.textView.textViewLimitBuyer, 10);
    I.grabTextFrom(limitActivePage.textView.textViewLimitInformasiTambahan, 10);
});
When("I give {string} for activated limit", (ratings) => {
    limitActivePage.clickRatingLending(ratings);
});
When("I give {string} for rejected limit", (ratings) => {
    limitActivePage.clickRatingLending(ratings);
});
Then("I will see comment box to give feedback", () => {
    limitActivePage.InputFeedback();
});
Then("I click Kirim Penilaian", () => {
    limitActivePage.sendFeedbacklending();
});
Then("I will see toastbar my survey is sent", () => {
    I.waitForText('Terima kasih untuk penilaiannya!');
});
Then("I will see pop up rating survey is in main dashboard", () => {
    I.waitForText("Berikan penilaian terhadap aplikasi Amar Bank Bisnis", 20);
    I.see("(1 Sangat Tidak Puas, 5 Sangat Puas)");

    I.waitForElement(limitActivePage.buttons.onestar, 10);
    I.waitForElement(limitActivePage.buttons.twoStar, 10);
    I.waitForElement(limitActivePage.buttons.threestar,10);
    I.waitForElement(limitActivePage.buttons.fourstar, 10);
    I.waitForElement(limitActivePage.buttons.fivestar, 10);
   
    I.dontSee("Mengapa Memberi Penilaian Tersebut?");
    I.dontSee("Tulis disini...");
    I.dontSeeElement(surveyRatingPage.fields.feedback);
    I.dontSeeElement(surveyRatingPage.texts.counter);

    I.dontSee("Kirim Penilaian");
    I.dontSeeElement(surveyRatingPage.buttons.send);
});
Then("I will see toastbar my survey is failed", () => {
    I.waitForText('Gagal mengirim penilaian.');
});
Then("I will not see rating survey is in active loan", () => {
    I.waitForElement(onboardingAccOpeningPage.tabs.home, 10);

    I.dontSee("Berikan penilaian terhadap aplikasi Amar Bank Bisnis");
    I.dontSee("(1 Sangat Tidak Puas, 5 Sangat Puas)");

    I.dontSeeElement(surveyRatingPage.buttons.oneStar);
});
Then("I will direct to page rejected limit AP MSME", () => {
    limitActivePage.textView.textviewheaderRejectPage();
    limitActivePage.textview.textViewLimitSupplier();
});
Then("I see CSAT will displayed in page rejected limit", () => {
    I.waitForText("Berikan penilaian terhadap aplikasi Amar Bank Bisnis", 20);
    I.see("(1 Sangat Tidak Puas, 5 Sangat Puas)");

    I.waitForElement(limitActivePage.buttons.onestar, 10);
    I.waitForElement(limitActivePage.buttons.twoStar, 10);
    I.waitForElement(limitActivePage.buttons.threestar,10);
    I.waitForElement(limitActivePage.buttons.fourstar, 10);
    I.waitForElement(limitActivePage.buttons.fivestar, 10);
   
    I.dontSee("Mengapa Memberi Penilaian Tersebut?");
    I.dontSee("Tulis disini...");
    I.dontSeeElement(limitActivePagefields.sendFeedbacklending);
    
    I.dontSee("Kirim Penilaian");
    I.dontSeeElement(limitActivePage.buttons.sendLending);
});
Then("I will direct to page rejected limit AR MSME", () => {
    limitActivePage.textView.textviewheaderRejectPage();
    limitActivePage.textview.textViewLimitBuyer();
});
Then("I will direct to page rejected limit PO MSME", () => {
    limitActivePage.textView.textviewheaderRejectPage();
    limitActivePage.textview.textViewLimitBouwheer();
});
Then("I will direct to page rejected limit AP Corp", () => {
    limitActivePage.textView.textviewheaderRejectPage();
    limitActivePage.textview.textViewLimitSupplier();
});
Then("I will direct to page rejected limit AR Corp", () => {
    limitActivePage.textView.textviewheaderRejectPage();
    limitActivePage.textview.textViewLimitBuyer();
});
When("I input feedback survey {string}", (text) =>{
    limitActivePage.InputFeedback(text);
});