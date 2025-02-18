const {
    I,
    formEmploymentDataPage,
    formBusinessProfilePage,
    globalVariable
} = inject();

When("I continue to process KYB", () => {
    formEmploymentDataPage.continueToKYB();
});

When("I fill my business profile as followings:", (table) => {
    I.waitForElement(formBusinessProfilePage.fields.businessName, 10);

    const businessProfile = table.parse().rowsHash();
    formBusinessProfilePage.fillBusinessProfile(businessProfile);

    delete businessProfile["businessDateStart"];

    Object.keys(businessProfile).forEach((key) => {
        globalVariable.formBusinessProfile[key] = businessProfile[key];
    });
});

When("I submit my business profile", () => {
    formBusinessProfilePage.saveBusinessProfile();
});