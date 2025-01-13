const {
    I,
    transactionHistoryPage,
    amountDetailPage,
    transferPage,
    resetStateDao,
    getDataDao,
    globalVariable,
    headerPage,
    welcomePage,
} = inject();

When("I will direct to list transfer in", async () => {
    I.wait(1);
    I.see("+");
});

When("I will direct to list transfer out", async () => {
    I.wait(1);
    I.dontSee("+")
});

When("I click detail latest card history transaction", () => {
    transactionHistoryPage.openDetailHistory();
});

When("I see tab filter all transaction, inbound transaction and outbound transaction", async () => {
    I.waitForElement(transactionHistoryPage.tabs.allTransaction, 10);
    const titleAllTransaction = await I.grabTextFrom(transactionHistoryPage.textFields.titleTabAll);
    I.assertEqual(titleAllTransaction, "Semua");

    const titleInboundransaction = await I.grabTextFrom(transactionHistoryPage.textFields.titleTabInbound);
    I.assertEqual(titleInboundransaction, "Masuk");

    const titleOutboundTransaction = await I.grabTextFrom(transactionHistoryPage.textFields.titleTabOutbound);
    I.assertEqual(titleOutboundTransaction, "Keluar");
});

When("I click link reset history date", () => {
    transactionHistoryPage.resetFilter();
});

When("I click share receipt transaction", () => {
    transactionHistoryPage.clickBtnShare();
});

When("I will see field start and end date is empty", async () => {
    I.wait(1);

    I.dontSee(globalVariable.historyTrx.startDate);
    I.dontSee(globalVariable.historyTrx.endDate);
});

When("I fill start date more than end date", () => {
    transactionHistoryPage.chooseFutureStartDate();
    transactionHistoryPage.chooseDate();

    transactionHistoryPage.choosePastEndDate();
    transactionHistoryPage.chooseDate();
});

When("I fill start date history transaction", async () => {
    transactionHistoryPage.choosePastStartDate();
    transactionHistoryPage.chooseDate();

    I.waitForElement(transactionHistoryPage.textFields.choosenStartDate, 10);
    globalVariable.historyTrx.startDate = await transactionHistoryPage.getChoosenStartDate();
});

When("I fill end date history transaction", async () => {
    transactionHistoryPage.choosePastEndDate();
    transactionHistoryPage.chooseDate();

    I.waitForElement(transactionHistoryPage.textFields.choosenEndDate, 10);
    globalVariable.historyTrx.endDate = await transactionHistoryPage.getChoosenEndDate();
});

When("I fill start date transaction with condition there is no transaction", () => {
    transactionHistoryPage.chooseFutureStartDate();
    transactionHistoryPage.chooseDate();
});

When("I fill end date transaction with condition there is no transaction", () => {
    transactionHistoryPage.chooseFutureEndDate();
    transactionHistoryPage.chooseDate();
});

When("I click detail card transaction transfer out {string} with approval", async (method) => {
    I.waitForElement(transactionHistoryPage.buttons.detailHistory, 10);
    if (
        method === "Overbooking"
    ) {
        I.dontSee("Biaya Transaksi");
        I.dontSeeElement(transactionHistoryPage.textFields.adminFeeTitle);
        I.dontSeeElement(transactionHistoryPage.textFields.adminFeeAmount);
    } else {
        I.waitForElement(transactionHistoryPage.textFields.adminFeeTitle, 10);
        I.see("Biaya Transaksi")

        const actualAdminFee = await transactionHistoryPage.getAllAdminFeeAmount();
        if (
            method === globalVariable.constant.methodTf.bifast
        ) {
            I.assertEqual(actualAdminFee[0], "Rp" + globalVariable.transfer.adminFeeBIFAST);
        } else if (
            method === globalVariable.constant.methodTf.rtol
        ) {
            I.assertEqual(actualAdminFee[0], "Rp" + globalVariable.transfer.adminFeeRTOL);
        } else if (
            method === globalVariable.constant.methodTf.skn
        ) {
            I.assertEqual(actualAdminFee[0], "Rp" + globalVariable.transfer.adminFeeSKN);
        } else if (
            method === globalVariable.constant.methodTf.rtgs
        ) {
            I.assertEqual(actualAdminFee[0], "Rp" + globalVariable.transfer.adminFeeRTGS);
        }
    }

    const actualDate = await transactionHistoryPage.getTransactionDateBucketList();

    const lastComma = actualDate.lastIndexOf(',');
    globalVariable.dashboard.date = lastComma !== -1 ? actualDate.substring(lastComma + 1).trim() : '';

    const recipientName = await transactionHistoryPage.getListTransactionNameBucketList();
    globalVariable.dashboard.recipientName = recipientName[0];

    const recipientBankName = await transactionHistoryPage.getListTransactionBankNameBucketList();
    globalVariable.dashboard.recipientBankName = recipientBankName[0];

    const recipientAccNumber = await transactionHistoryPage.getListTransactionAccNumberBucketList();
    globalVariable.dashboard.recipientAccNumber = (recipientAccNumber[0]).replace(/\s+/g, '').replace(/-/g, '');

    const amountTransaction = await transactionHistoryPage.getListTransactionAmountBucketList();
    globalVariable.dashboard.amountTransaction = amountTransaction[0];

    transactionHistoryPage.openDetailHistory();
});

When("I click detail card transaction transfer in {string}", async (method) => {
    I.waitForElement(transactionHistoryPage.buttons.detailHistory, 10);
    I.wait(1);

    const actualDate = await transactionHistoryPage.getTransactionDateBucketList();
    const lastComma = actualDate.lastIndexOf(',');
    globalVariable.dashboard.date = lastComma !== -1 ? actualDate.substring(lastComma + 1).trim() : '';

    if (
        method === globalVariable.constant.methodTf.bifast ||
        method === globalVariable.constant.methodTf.rtol
    ) {

        const senderName = await transactionHistoryPage.getListTransactionNameBucketList();
        globalVariable.transfer.senderName = senderName[1];

        const senderBankName = await transactionHistoryPage.getListTransactionBankNameBucketList();
        globalVariable.transfer.senderBankName = senderBankName[0];

        const senderAccountNumber = await transactionHistoryPage.getListTransactionAccNumberBucketList();
        globalVariable.transfer.senderAccountNumber = (senderAccountNumber[0]).replace(/\s+/g, '').replace(/-/g, '');

        const amountTransaction = await transactionHistoryPage.getListTransactionAmountBucketList();
        globalVariable.dashboard.amountTransaction = amountTransaction[1];

        transactionHistoryPage.openSecondDetailHistory();

    } else if (
        method === "Overbooking"
    ) {
        const actualTransactionName = await transactionHistoryPage.getTransactionNameBucketList();
        I.assertEqual(actualTransactionName, "Transaksi Masuk");

        globalVariable.dashboard.amountTransaction = await transactionHistoryPage.getTransactionAmountBucketList();

        transactionHistoryPage.openDetailHistory();
    }
});

Then("I will see bottom sheet share history transaction", () => {

});

Then("I will see no transaction history", () => {
    I.waitForText("Belum ada riwayat transaksi", 10);
    I.see("Riwayat Transaksi");
});

Then("I will not see all tab to filter type transaction", () => {
    I.dontSeeElement(transactionHistoryPage.tabs.allTransaction);
    I.dontSeeElement(transactionHistoryPage.tabs.inTransaction);
    I.dontSeeElement(transactionHistoryPage.tabs.outTransaction);
});

Then("I will see in card bucketlist information such as Recipient Name, Bank Name, Account Number and Amount transaction", async () => {

    const currentDays = globalVariable.getCurrentDayString();

    const actDate = await transactionHistoryPage.getTransactionDateBucketList();
    I.assertEqual(actDate, currentDays + ", " + globalVariable.transfer.date);

    const actRecipientName = await transactionHistoryPage.getTransactionNameBucketList();
    I.assertEqual(actRecipientName, globalVariable.friendList.friendListName);

    const actRecipientBankName = await transactionHistoryPage.getTransactionBankNameBucketList();
    I.assertEqual(actRecipientBankName, globalVariable.friendList.bankName);

    const actRecipientAccNumber = (await transactionHistoryPage.getTransactionAccNumberBucketList()).replace(/\s+/g, '').replace(/-/g, '');
    I.assertEqual(actRecipientAccNumber, globalVariable.friendList.friendListAccNumber.replace(/\s+/g, '').replace(/-/g, ''));

    const actTransferAmount = await transactionHistoryPage.getTransactionAmountBucketList();
    I.assertEqual(actTransferAmount, globalVariable.transfer.amountTransfer);

    I.waitForElement(transactionHistoryPage.buttons.buttonDetail, 10);
});

Then("admin fee information from transaction transfer", async () => {

    const actTitleAdMinFee = await transactionHistoryPage.getAdminFeeTitle();
    I.assertEqual(actTitleAdMinFee, "Biaya Transaksi");

    const numberString = globalVariable.transfer.adminFee.toString().split('');

    for (let i = numberString.length - 3; i > 0; i -= 3) {
        numberString.splice(i, 0, '.');
    }
    const expectedAdminFee = numberString.join('');

    const actAdMinFee = await transactionHistoryPage.getAdminFeeAmount();
    I.assertEqual(actAdMinFee, "Rp" + expectedAdminFee);
});

Then("I click detail card history transaction", () => {
    transactionHistoryPage.openDetailHistory();
});

Then("I close page detail history transaction", () => {
    transactionHistoryPage.clicBtnClose();
});

Then("I will see message error start date should be less than end date", async () => {
    const actualMessageError = await transactionHistoryPage.getMessageErrorFilterHistoryTransaction();
    I.assertEqual(actualMessageError, "Tanggal awal harus sebelum tanggal akhir");
});

Then("I will see notes in detail history transaction", async () => {
    I.performSwipe({ x: 1000, y: 1000 }, { x: 100, y: 100 });

    I.waitForText("Catatan", 10);
    const actualNotes = await transactionHistoryPage.getNotes();
    I.assertEqual(actualNotes, globalVariable.transfer.note);
});

Then("I will see detail transaction transfer out with approval", async () => {
    I.waitForText("Rincian Transaksi", 10);

    const actualSenderName = await transactionHistoryPage.getSenderNameDetail();
    const expectedSenderName = (await getDataDao.getAccountHolderName(globalVariable.login.userID, globalVariable.login.password)).accountHolderName;
    I.assertEqual(actualSenderName, expectedSenderName);

    const actualSenderBankName = await transactionHistoryPage.getSenderBankNameDetail();
    I.assertEqual(actualSenderBankName, "Bank Amar Indonesia")

    const actualSenderAccNumber = (await transactionHistoryPage.getSenderAccNumberDetail()).replace(/\s+/g, '').replace(/-/g, '');
    const expectedSenderAccNumber = (await resetStateDao.getAccountNumber(globalVariable.login.userID, globalVariable.login.password)).accountNumber;
    I.assertEqual(actualSenderAccNumber, expectedSenderAccNumber);

    const actualRecipientName = await transactionHistoryPage.getRecipientNameDetail();
    I.assertEqual(actualRecipientName, globalVariable.friendList.friendListName);

    const actualRecipientBankName = await transactionHistoryPage.getRecipientBankNameDetail();
    I.assertEqual(actualRecipientBankName, globalVariable.friendList.bankName);

    const actualRecipientAccNumber = (await transactionHistoryPage.getRecipientAccNumberDetail()).replace(/\s+/g, '').replace(/-/g, '');
    I.assertEqual(actualRecipientAccNumber, globalVariable.friendList.friendListAccNumber.replace(/\s+/g, '').replace(/-/g, ''));

    I.see("Transaksi Keluar");
    const actualAmount = await transactionHistoryPage.getAmountDetail();
    const actualTransferOut = globalVariable.transfer.amount;

    const numberString = actualTransferOut.toString().split('');

    for (let i = numberString.length - 3; i > 0; i -= 3) {
        numberString.splice(i, 0, '.');
    }
    const expAmount = numberString.join('');

    I.assertEqual(actualAmount, "Rp" + expAmount);

    I.see("Dibuat oleh");
    const actualCreatedBy = await transactionHistoryPage.getCreatedByName();
    I.assertEqual(actualCreatedBy, globalVariable.transfer.makerName);

    I.see("Disetujui oleh");
    const actualApprovedBy = await transactionHistoryPage.getApprovedByName();
    const expectedApprovedBy = (await resetStateDao.getFullName(globalVariable.login.userID, globalVariable.login.password)).ktpName;
    I.assertEqual(actualApprovedBy, expectedApprovedBy);

    I.performSwipe({ x: 1000, y: 1000 }, { x: 100, y: 100 });

    I.see("Nomor Referensi");
    I.waitForElement(transactionHistoryPage.textFields.referenceNumber, 10);
    I.waitForElement(transactionHistoryPage.buttons.btnCopied, 10);

    I.see("Tanggal Disetujui");
    const actualDate = await transactionHistoryPage.getDate();
    const expDate = globalVariable.getCurrentDateWithZero();
    const expMonth = globalVariable.getMonthString();
    const expYear = globalVariable.getCurrentYear();
    I.assertEqual(actualDate, expDate + " " + expMonth + " " + expYear);

    I.see("Waktu");
    I.waitForElement(transactionHistoryPage.textFields.timeDetailHistory, 10);

    I.see("Kategori");
    const actualCategory = await transactionHistoryPage.getCategory();
    I.assertEqual(actualCategory, "Pembayaran");

    if (
        globalVariable.transfer.method !== globalVariable.constant.methodTf.overbooking
    ) {
        I.see("Layanan Transaksi");
        const actualMethod = await transactionHistoryPage.getMethodTransaction();
        I.assertEqual(actualMethod, globalVariable.transfer.method);
    } else {
        I.dontSee("Layanan Transaksi");
        I.dontSeeElement(transactionHistoryPage.textFields.methodTransaction);
    }

    if (
        globalVariable.transfer.note === ""
    ) {
        I.dontSee("Catatan");
        I.dontSeeElement(transactionHistoryPage.textFields.textNote);

    } else {

        I.performSwipe({ x: 1000, y: 1000 }, { x: 100, y: 100 });
        I.waitForText("Catatan", 10);
        I.see(globalVariable.transfer.note);
    }

    I.see("Bagikan Bukti Transaksi");
    I.waitForElement(transactionHistoryPage.buttons.btnShare, 10);
});

Then("I will see detail transaction transfer out without approval", async () => {
    I.waitForText("Rincian Transaksi", 10);

    const actualSenderName = await transactionHistoryPage.getSenderNameDetail();
    const expectedSenderName = (await getDataDao.getAccountHolderName(globalVariable.login.userID, globalVariable.login.password)).accountHolderName;
    I.assertEqual(actualSenderName, expectedSenderName);

    const actualSenderBankName = await transactionHistoryPage.getSenderBankNameDetail();
    I.assertEqual(actualSenderBankName, "Bank Amar Indonesia")

    const actualSenderAccNumber = (await transactionHistoryPage.getSenderAccNumberDetail()).replace(/\s+/g, '').replace(/-/g, '');
    const expectedSenderAccNumber = (await resetStateDao.getAccountNumber(globalVariable.login.userID, globalVariable.login.password)).accountNumber;
    I.assertEqual(actualSenderAccNumber, expectedSenderAccNumber);

    const actualRecipientName = await transactionHistoryPage.getRecipientNameDetail();
    I.assertEqual(actualRecipientName, globalVariable.friendList.friendListName);

    const actualRecipientBankName = await transactionHistoryPage.getRecipientBankNameDetail();
    I.assertEqual(actualRecipientBankName, globalVariable.friendList.bankName);

    const actualRecipientAccNumber = (await transactionHistoryPage.getRecipientAccNumberDetail()).replace(/\s+/g, '').replace(/-/g, '');
    I.assertEqual(actualRecipientAccNumber, globalVariable.friendList.friendListAccNumber.replace(/\s+/g, '').replace(/-/g, ''));

    I.see("Transaksi Keluar");
    const actualAmount = await transactionHistoryPage.getAmountDetail();
    const actualTransferOut = globalVariable.transfer.amount;

    const numberString = actualTransferOut.toString().split('');

    for (let i = numberString.length - 3; i > 0; i -= 3) {
        numberString.splice(i, 0, '.');
    }
    const expAmount = numberString.join('');

    I.assertEqual(actualAmount, "Rp" + expAmount);

    I.dontSee("Dibuat oleh");
    I.dontSeeElement(transactionHistoryPage.textFields.createdBy);

    I.dontSee("Disetujui oleh");
    I.dontSeeElement(transactionHistoryPage.textFields.approveBy);

    I.see("Nomor Referensi");
    I.waitForElement(transactionHistoryPage.textFields.referenceNumber, 10);
    I.waitForElement(transactionHistoryPage.buttons.btnCopied, 10);

    I.dontSee("Tanggal Disetujui");
    I.see("Tanggal")
    const actualDate = await transactionHistoryPage.getDate();
    const expDate = globalVariable.getCurrentDateWithZero();
    const expMonth = globalVariable.getMonthString();
    const expYear = globalVariable.getCurrentYear();
    I.assertEqual(actualDate, expDate + " " + expMonth + " " + expYear);

    I.see("Waktu");
    I.waitForElement(transactionHistoryPage.textFields.timeDetailHistory, 10);

    I.see("Kategori");
    const actualCategory = await transactionHistoryPage.getCategory();
    I.assertEqual(actualCategory, "Pembayaran");

    if (
        globalVariable.transfer.method !== globalVariable.constant.methodTf.overbooking
    ) {
        I.see("Layanan Transaksi");
        const actualMethod = await transactionHistoryPage.getMethodTransaction();
        I.assertEqual(actualMethod, globalVariable.transfer.method);
    } else {
        I.dontSee("Layanan Transaksi");
        I.dontSeeElement(transactionHistoryPage.textFields.methodTransaction);
    }

    if (
        globalVariable.transfer.note === ""
    ) {
        I.dontSee("Catatan");
        I.dontSeeElement(transactionHistoryPage.textFields.textNote);

    } else {

        I.performSwipe({ x: 1000, y: 1000 }, { x: 100, y: 100 });
        I.waitForText("Catatan", 10);
        I.see(globalVariable.transfer.note);
    }

    I.see("Bagikan Bukti Transaksi");
    I.waitForElement(transactionHistoryPage.buttons.btnShare, 10);
});

Then("I will see detail transaction transfer in {string}", async (method) => {
    I.waitForText("Rincian Transaksi", 10);

    if (
        globalVariable.transfer.method === globalVariable.constant.methodTf.bifast ||
        globalVariable.transfer.method === globalVariable.constant.methodTf.rtol
    ) {
        const actualSenderName = await transactionHistoryPage.getSenderNameDetail();
        I.assertEqual(actualSenderName, globalVariable.transfer.senderName);

        const actualSenderBankName = await transactionHistoryPage.getSenderBankNameDetail();
        I.assertEqual(actualSenderBankName, globalVariable.transfer.senderBankName);

        const actualSenderAccNumber = (await transactionHistoryPage.getSenderAccNumberDetail()).replace(/\s+/g, '').replace(/-/g, '');
        I.assertEqual(actualSenderAccNumber, globalVariable.transfer.senderAccountNumber);

        const actualRecipientName = await transactionHistoryPage.getRecipientNameDetail();
        const expectedRecipientName = (await resetStateDao.getCompanyName(globalVariable.login.userID, globalVariable.login.password)).businessName;
        I.assertEqual(actualRecipientName, expectedRecipientName);

        const actualRecipientBankName = await transactionHistoryPage.getRecipientBankNameDetail();
        I.assertEqual(actualRecipientBankName, "Bank Amar Indonesia");

        const actualRecipientAccNumber = (await transactionHistoryPage.getRecipientAccNumberDetail()).replace(/\s+/g, '').replace(/-/g, '');
        const expectedRecipientAccNumber = await (await resetStateDao.getAccountNumber(globalVariable.login.userID, globalVariable.login.password)).accountNumber;
        I.assertEqual(actualRecipientAccNumber, expectedRecipientAccNumber);

    } else if (
        globalVariable.transfer.method === globalVariable.constant.methodTf.overbooking
    ) {
        // I.dontSee(transactionHistoryPage.textFields.senderName);
        // I.dontSee(transactionHistoryPage.textFields.senderBankName);
        // I.dontSee(transactionHistoryPage.textFields.senderAccNumber);
        // I.dontSee(transactionHistoryPage.textFields.recipientName);
        // I.dontSee(transactionHistoryPage.textFields.recipientBankName);
        // I.dontSee(transactionHistoryPage.textFields.recipientAccNumber);
    }

    I.see("Transaksi Masuk");
    const actualAmount = await transactionHistoryPage.getAmountDetail();
    I.assertEqual(actualAmount, globalVariable.dashboard.amountTransaction);

    I.dontSee("Dibuat oleh");
    I.dontSee(transactionHistoryPage.textFields.createdBy);

    I.dontSee("Disetujui oleh");
    I.dontSee(transactionHistoryPage.textFields.approveBy);

    I.see("Nomor Referensi");
    I.waitForElement(transactionHistoryPage.textFields.referenceNumber, 10);
    I.waitForElement(transactionHistoryPage.buttons.btnCopied, 10);

    I.see("Tanggal");
    const actualDate = await transactionHistoryPage.getDate();
    I.assertEqual(actualDate, globalVariable.dashboard.date);

    I.see("Waktu");
    I.waitForElement(transactionHistoryPage.textFields.timeDetailHistory, 10);

    I.dontSee("Kategori");
    I.dontSee(transactionHistoryPage.textFields.category);

    I.dontSee("Layanan Transaksi");
    I.dontSee(transactionHistoryPage.textFields.methodTransaction);

    I.see("Catatan");

    I.see("Bagikan Bukti Transaksi");
    I.waitForElement(transactionHistoryPage.buttons.btnShare, 10);
});

Then("I will not see button download e-statement", () => {
    I.dontSee("Unduh E-Statement");
    I.dontSeeElement(transactionHistoryPage.buttons.btneStatementDownload);
});

Then("I will see button download e-statement", () => {
    I.waitForText("Unduh E-Statement");
    I.waitForElement(transactionHistoryPage.buttons.btneStatementDownload, 10);
});

Then("I will direct to detail transfer in successfully", async () => {

    I.waitForElement(headerPage.icon.callCenter, 10);
    I.waitForElement(headerPage.buttons.closePage, 10);
    I.waitForText("Transaksi Masuk", 10);

    I.dontSeeElement(transactionHistoryPage.textFields.senderName);
    I.dontSeeElement(transactionHistoryPage.textFields.senderBankName);
    I.dontSeeElement(transactionHistoryPage.textFields.senderAccNumber);

    I.dontSeeElement(transactionHistoryPage.textFields.recipientName);
    I.dontSeeElement(transactionHistoryPage.textFields.recipientBankName);
    I.dontSeeElement(transactionHistoryPage.textFields.recipientAccNumber);

    I.see("Transaksi Masuk");
    I.see(globalVariable.transfer.amountTransfer);

    I.see("Nomor Referensi");
    I.waitForElement(transactionHistoryPage.buttons.btnCopied, 10);

    I.see("Tanggal");
    I.see(globalVariable.notificationCenter.date);

    I.see("Waktu");

    I.see("Catatan");
    const actualNotes = await transferPage.getNotes();
    I.assertEqual(actualNotes, "TRANSAKSI KREDIT");

    I.waitForText("Bagikan Bukti Transfer", 10);
    I.waitForElement(transferPage.buttons.share, 10);
});

Then("I will direct to detail transfer out successfully", async () => {

    I.waitForText("Rincian Transaksi", 10);
    I.waitForElement(headerPage.buttons.closePage, 10);
    I.waitForElement(headerPage.icon.callCenter, 10);

    const actSenderName = await transactionHistoryPage.getSenderNameDetail();
    I.assertEqual(actSenderName, globalVariable.transfer.senderName);

    const actSenderBankName = await transactionHistoryPage.getSenderBankNameDetail();
    I.assertEqual(actSenderBankName, "Bank Amar Indonesia");

    const actSenderAccNumber = (await transactionHistoryPage.getSenderAccNumberDetail()).replace(/\s+/g, '');
    I.assertEqual(actSenderAccNumber, globalVariable.transfer.senderAccountNumber);

    const actRecipientName = await transactionHistoryPage.getRecipientNameDetail();
    I.assertEqual(actRecipientName, globalVariable.friendList.friendListName);

    const actRecipientBankName = await transactionHistoryPage.getRecipientBankNameDetail();
    I.assertEqual(actRecipientBankName, globalVariable.friendList.bankName);

    const actRecipientAccNumber = (await transactionHistoryPage.getRecipientAccNumberDetail()).replace(/\s+/g, '');
    I.assertEqual(actRecipientAccNumber, globalVariable.friendList.friendListAccNumber.replace(/\s+/g, '').replace(/-/g, ''));

    I.see("Transaksi Keluar");
    const actualAmount = await transactionHistoryPage.getAmountDetail();
    I.assertEqual(actualAmount, globalVariable.transfer.amountTransfer);

    I.see("Nomor Referensi");
    I.waitForElement(transactionHistoryPage.buttons.btnCopied, 10);

    I.see("Tanggal");
    I.see(globalVariable.notificationCenter.date);

    I.see("Waktu");

    I.see("Kategori");
    const actCategory = await transactionHistoryPage.getCategory();
    I.assertEqual(actCategory, globalVariable.transfer.category);

    if (
        globalVariable.transfer.method !== globalVariable.constant.methodTf.overbooking
    ) {
        I.see("Layanan Transaksi");
        const actualMethod = await transactionHistoryPage.getMethodTransaction();
        I.assertEqual(actualMethod, globalVariable.transfer.method);
    } else {
        I.dontSee("Layanan Transaksi");
        I.dontSeeElement(transactionHistoryPage.textFields.methodTransaction);
    }

    if (
        globalVariable.transfer.note === ""
    ) {
        I.dontSee("Catatan");
        I.dontSeeElement(transactionHistoryPage.textFields.textNote);

    } else {

        I.performSwipe({ x: 1000, y: 1000 }, { x: 100, y: 100 });
        I.waitForText("Catatan", 10);
        I.see(globalVariable.transfer.note);
    }
});