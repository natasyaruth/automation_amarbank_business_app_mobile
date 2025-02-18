const {
    I,
    formEmploymentDataPage,
    headerPage,
} = inject();

When("I fill my employment details as followings:", async (table) => {
    I.waitForElement(formEmploymentDataPage.dropDowns.workType, 10);

    const employmentData = table.parse().rowsHash();
    await formEmploymentDataPage.fillEmploymentData(employmentData);
});

When("I submit my employment data", () => {
    formEmploymentDataPage.saveEmploymentData();
    I.wait(3);
});

When("I submit my employment data individual", () => {
    formEmploymentDataPage.saveEmploymentData();
    I.wait(3);
});

Then("I will notify that my personal data details needs to be verified first", () => {
    I.waitForText("Terimakasih telah melengkapi semua data", 10);
    I.waitForElement(headerPage.icon.callCenter, 10);
    I.dontSee(headerPage.buttons.back);

    I.see("Kami akan melakukan verifikasi data Anda dalam waktu kurang-lebih 2 hari kerja.");
    I.see("Lanjut ke Dashboard");
    formEmploymentDataPage.continueToDashboard();
});