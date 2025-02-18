const {
    I,
    formBusinessOwnerPage
} = inject();

When("I submit business owner list", () => {
    formBusinessOwnerPage.saveBusinessOwner();
});

When("I submit business director list", () => {
    formBusinessOwnerPage.saveListDirectors();
});