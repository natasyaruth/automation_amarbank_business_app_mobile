const {
    I,
    formPersonalDataPage,
    uploadDao,
    resetStateDao,
    globalVariable } = inject();

When("I fill my personal data details as followings:",
    async (table) => {
        const personalData = table.parse().rowsHash();
        I.waitForElement(formPersonalDataPage.dropDowns.lastEducation, 10);
        await formPersonalDataPage.fillPersonalData(personalData);
    }
);

When("I submit my personal data details individual and upload my npwp as followings:", async (table) => {
    const personalData = table.parse().rowsHash();

    await uploadDao.submitDataPersonalIndividual(
        globalVariable.login.userID, 
        globalVariable.login.password,
        personalData["lastEducation"],
        personalData["motherName"],
        personalData["referenceName"],
        personalData["referencePhoneNumber"],
        personalData["purposeAccount"]
    );

    resetStateDao.reloadPageAfterResetState();
});

When("I submit my personal data details business and upload my npwp as followings:", async (table) => {
    const personalData = table.parse().rowsHash();

    await uploadDao.submitDataPersonalBusiness(
        globalVariable.login.userID, 
        globalVariable.login.password,
        personalData["lastEducation"],
        personalData["motherName"],
        personalData["referenceName"],
        personalData["referencePhoneNumber"]
    );

    resetStateDao.reloadPageAfterResetState();
});