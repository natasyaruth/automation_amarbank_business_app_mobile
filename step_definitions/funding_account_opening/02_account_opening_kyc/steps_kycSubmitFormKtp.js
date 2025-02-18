const {
    I,
    formKtpPage,
    globalVariable} = inject();

When("I fill all information identity details as followings:",
    async (table) => {
        const ktpData = table.parse().rowsHash();
        if (process.env.ENVIRONMENT === "staging") {
            if (
                Object.keys(ktpData).indexOf("eKtpNumberStg") !== -1
            ) {
                ktpData["eKtpNumber"] = ktpData["eKtpNumberStg"];
                delete ktpData["eKtpNumberStg"];
            }
        } else {
            if (
                Object.keys(ktpData).indexOf("eKtpNumberStg") !== -1
            ) {
                delete ktpData["eKtpNumberStg"];
            }
        }

        I.waitForElement(formKtpPage.fields.eKtpNumber, 10);
        formKtpPage.fillInformation(ktpData);
        globalVariable.formKtp.eKTPNumber = ktpData["eKtpNumber"];
        globalVariable.formKtp.fullName = ktpData["fullName"];
    }
);

When("I submit my information identity details", () => {
    formKtpPage.saveKtpData();
});