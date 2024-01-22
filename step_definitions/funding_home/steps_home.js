const {
    I,
    transactionHistoryPage,
    amountDetailPage,
    globalVariable,
} = inject();

Given(/I am on home page/, () => {
    transactionHistoryPage.viewUserName();
});
When(/I should see button history on saldo card/, () => {
    transactionHistoryPage.seeBtnHistory();
});
Then(/I want to click button history transaction/, () => {
    transactionHistoryPage.clickBtnHistory();
});
Then(/I will redirect to history transaction page/, () => {
    transactionHistoryPage.viewPageHistoryTransaction();
});


// hitory page
Given(/I want to click button filter history/, () => {
    transactionHistoryPage.clicBtnFilter();
});
When(/I should see buttom sheet filter history/, () => {
    transactionHistoryPage.viewBtmSheetFilterHistory();
});
Then(/I want to click button close/, () => {
    transactionHistoryPage.clicBtnClose();
});
Then(/I want to click button start date/, () => {
    transactionHistoryPage.clicFieldStartDate();
});
Then(/I should see form date displayed/, () => {
    transactionHistoryPage.viewFormDate();
});
Then(/I choose the start date \"([^\"]*)\" with tap \"([^\"]*)\"/, (Date, Qty) => {
    transactionHistoryPage.selectDayDate(Date, Qty);
    transactionHistoryPage.selectMonthDate(Date);
    transactionHistoryPage.clickBtnChoose();
});
Then(/I want to click button end date/, () => {
    transactionHistoryPage.clicFieldEndDate();
});
Then(/I choose the end date/, () => {
    transactionHistoryPage.clickBtnChoose();
});
Then(/I want to click button ok/, () => {
    transactionHistoryPage.clickBtnOk();
});


//transaction detail
Given(/I want to click list transfer \"([^\"]*)\"/, (trfType) => {
    transactionHistoryPage.clickListTransfer(trfType);
});
When(/I should see text view transfer \"([^\"]*)\"/, (trfType) => {
    transactionHistoryPage.validateTextViewTransfer(trfType);
});
Then(/I should see reference number value \"([^\"]*)\"/, (trfType) => {
    transactionHistoryPage.shouldSeeTextViewRefNumber(trfType);
});
Then(/I want to copied reference number value/, () => {
    transactionHistoryPage.clickBtnCopied();
});
Then(/I should see text view value date transfer \"([^\"]*)\"/, (trfType) => {
    transactionHistoryPage.shouldSeeTextViewDate(trfType);
});
Then(/I should see text view value time transfer \"([^\"]*)\"/, (trfType) => {
    transactionHistoryPage.shouldSeeTextViewTime(trfType);
});
Then(/I should see text view value note transfer \"([^\"]*)\"/, (trfType) => {
    transactionHistoryPage.shouldSeeTextViewNoted(trfType);
});
Then(/I should see text view value category transfer \"([^\"]*)\"/, (trfType) => {
    transactionHistoryPage.shouldSeeTextViewCategory(trfType);
});
Then(/I want to click button share/, () => {
    transactionHistoryPage.clickBtnShare();
});
Then(/I click menu tab testing/, () => {
    transactionHistoryPage.clickTabTesting();
});

// Amount detail

Given("I wait until my account name {string} displayed", (name) => {
    I.waitForText(name, 30);
});

When("I click detail amount", () => {
    amountDetailPage.openDetailAmount();
    I.waitForText("Saldo Rekening Giro", 10);
});

When("I mask my amount", () => {
    amountDetailPage.clickIconEye();
    I.wait(1);
});

When("I will see my active, blocking and total amount", async () => {
    I.wait(3);
    globalVariable.dashboard.activeAmount = await amountDetailPage.getActiveAmount();
    globalVariable.dashboard.blockingAmount = await amountDetailPage.getBlockingAmount();
    globalVariable.dashboard.totalAmount = await amountDetailPage.getTotalAmount();
});

Then("I will not see my active, blocking and total amount", async () => {
    I.dontSee(globalVariable.dashboard.activeAmount);
    I.dontSee(globalVariable.dashboard.blockingAmount);
    I.dontSee(globalVariable.dashboard.totalAmount);
});

Then("I will see my active, blocking and total amount are Rp 0", async () => {
    let expectedAmount = "Rp0"

    let actualActiveAmount = await amountDetailPage.getActiveAmount();
    let actualBlockingAmount = await amountDetailPage.getBlockingAmount();
    let actualTotalAmount = await amountDetailPage.getTotalAmount();

    I.assertEqual(actualActiveAmount, expectedAmount);
    I.assertEqual(actualBlockingAmount, expectedAmount);
    I.assertEqual(actualTotalAmount, expectedAmount);

});

Then("I will see my detail active, blocking and total amount are Rp 0", async () => {

    let expectedAmount = "Rp0"

    I.waitForText("Saldo Aktif", 10);
    I.see("Nominal saldo yang dapat digunakan untuk transaksi");

    I.see("Saldo Tertahan");
    I.see("Saldo yang didebit dari:");
    I.see("Saldo Minimum sebesar Rp500.000 (untuk individu)");
    I.see("Saldo Minimum sebesar Rp1.000.000 (untuk PT Perusahaan, CV, PT Perorangan, UD)");
    I.see("Total Penangguhan Saldo Pinjaman, jika Anda mempunyai pinjaman");
    I.see("Saldo tidak dapat digunakan untuk transaksi");

    I.see("Total Saldo");
    I.see("Seluruh total saldo yang ada di Amar Bank Bisnis");
    I.see("Rincian Perhitungan Total Saldo:");
    I.see("Saldo Aktif");
    I.see("Saldo Tertahan");
    I.see("Saldo Minimum + Total Penangguhan Saldo Pinjaman");
    I.see("Total Saldo");

    let actualActiveAmount = await amountDetailPage.getActiveAmount();
    let actualBlockingAmount = await amountDetailPage.getBlockingAmount();
    let actualTotalAmount = await amountDetailPage.getTotalAmount();

    I.assertEqual(actualActiveAmount, expectedAmount);
    I.assertEqual(actualBlockingAmount, expectedAmount);
    I.assertEqual(actualTotalAmount, expectedAmount);

});

Then("I will see my active amount decreased", async () => {
    let previousActiveAmount = globalVariable.dashboard.activeAmount.replace('Rp.', '');
    let expectedActiveAmount = previousActiveAmount - globalVariable.transfer.amount

    const numberString = expectedActiveAmount.toString().split('');

    for (let i = numberString.length - 3; i > 0; i -= 3) {
        numberString.splice(i, 0, '.');
    }

    const formattedActiveAmount = numberString.join('');

    let actualActiveAmount = await amountDetailPage.getActiveAmount();

    I.assertEqual(actualActiveAmount, "Rp" + formattedActiveAmount);

    globalVariable.dashboard.activeAmount = "Rp" + formattedActiveAmount;
});

Then("I will see my active amount detail decreased", async () => {
    I.performSwipe({ x: 1000, y: 1000 }, { x: 100, y: 100 });

    let actualActiveAmount = await amountDetailPage.getActiveAmount();

    I.assertEqual(actualActiveAmount, globalVariable.dashboard.activeAmount);
});

Then("my blocking amount still Rp. 500.000", async () => {
    let actualBlockingAmount = await amountDetailPage.getBlockingAmount();

    I.assertEqual(actualBlockingAmount, globalVariable.dashboard.blockingAmount);
});

Then("my blocking amount detail still Rp. 500.000", async () => {
    let actualBlockingAmount = await amountDetailPage.getBlockingAmount();

    I.assertEqual(actualBlockingAmount, globalVariable.dashboard.blockingAmount);
});

Then("my blocking amount still Rp. 1.000.000", async () => {
    let actualBlockingAmount = await amountDetailPage.getBlockingAmount();

    I.assertEqual(actualBlockingAmount, globalVariable.dashboard.blockingAmount);
});

Then("my blocking amount detail still Rp. 1.000.000", async () => {
    let actualBlockingAmount = await amountDetailPage.getBlockingAmount();

    I.assertEqual(actualBlockingAmount, globalVariable.dashboard.blockingAmount);
});

Then("my total amount increased", async () => {
    let previousTotalAmount = globalVariable.dashboard.totalAmount.replace('Rp.', '');
    let expectedTotalAmount = previousTotalAmount + globalVariable.transfer.amount

    const numberString = expectedTotalAmount.toString().split('');

    for (let i = numberString.length - 3; i > 0; i -= 3) {
        numberString.splice(i, 0, '.');
    }

    const formattedTotalAmount = numberString.join('');

    let actualTotalAmount = await amountDetailPage.getTotalAmount();

    I.assertEqual(actualTotalAmount, "Rp" + formattedTotalAmount);

    globalVariable.dashboard.totalAmount = "Rp" + formattedTotalAmount;
});

Then("my total amount detail increased", async () => {
    let actualTotalAmount = await amountDetailPage.getTotalAmount();

    I.assertEqual(actualTotalAmount, globalVariable.dashboard.totalAmount);
});