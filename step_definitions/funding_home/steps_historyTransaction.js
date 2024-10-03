const {
    I,
    transactionHistoryPage,
    amountDetailPage,
    resetStateDao,
    globalVariable,
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

When("I click detail card transaction transfer out {string} without approval", async (method) => {
    I.waitForElement(transactionHistoryPage.buttons.detailHistorySecond, 10);
    if (
        method === "Overbooking"
    ) {
        I.dontSee("Biaya Transaksi");
        I.dontSeeElement(transactionHistoryPage.textFields.adminFeeTitle);
        I.dontSeeElement(transactionHistoryPage.textFields.adminFeeAmount);
    } else {
        I.waitForElement(transactionHistoryPage.textFields.adminFeeTitle, 10);
        I.see("Biaya Transaksi");

        const actualAdminFee = await transactionHistoryPage.getAllAdminFeeAmount();

        if (
            method === "BI-FAST"
        ) {
            I.assertEqual(actualAdminFee[1], "Rp" + globalVariable.transfer.adminFeeBIFAST);
        } else if (
            method === "RTOL"
        ) {
            I.assertEqual(actualAdminFee[1], "Rp" + globalVariable.transfer.adminFeeRTOL);
        } else if (
            method === "SKN"
        ) {
            I.assertEqual(actualAdminFee[1], "Rp" + globalVariable.transfer.adminFeeSKN);
        } else if (
            method === "RTGS"
        ) {
            I.assertEqual(actualAdminFee[1], "Rp" + globalVariable.transfer.adminFeeRTGS);
        }
    }

    const actualDate = await transactionHistoryPage.getTransactionDateBucketList();

    const lastComma = actualDate.lastIndexOf(',');
    globalVariable.dashboard.date = lastComma !== -1 ? actualDate.substring(lastComma + 1).trim() : '';

    const recipientName = await transactionHistoryPage.getListTransactionNameBucketList();
    globalVariable.dashboard.recipientName = recipientName[1];

    const recipientBankName = await transactionHistoryPage.getListTransactionBankNameBucketList();
    globalVariable.dashboard.recipientBankName = recipientBankName[1];

    const recipientAccNumber = await transactionHistoryPage.getListTransactionAccNumberBucketList();
    globalVariable.dashboard.recipientAccNumber = (recipientAccNumber[1]).replace(/\s+/g, '').replace(/-/g, '');

    const amountTransaction = await transactionHistoryPage.getListTransactionAmountBucketList();
    globalVariable.dashboard.amountTransaction = amountTransaction[1];

    transactionHistoryPage.openSecondDetailHistory();
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
            method === "BI-FAST"
        ) {
            I.assertEqual(actualAdminFee[0], "Rp" + globalVariable.transfer.adminFeeBIFAST);
        } else if (
            method === "RTOL"
        ) {
            I.assertEqual(actualAdminFee[0], "Rp" + globalVariable.transfer.adminFeeRTOL);
        } else if (
            method === "SKN"
        ) {
            I.assertEqual(actualAdminFee[0], "Rp" + globalVariable.transfer.adminFeeSKN);
        } else if (
            method === "RTGS"
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
        method === "BI-FAST" ||
        method === "RTOL"
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
    I.waitForElement(transactionHistoryPage.textFields.dateBucketlist, 10);
    I.waitForElement(transactionHistoryPage.textFields.nameBucketlist, 10);
    I.waitForElement(transactionHistoryPage.textFields.bankNameBucketlist, 10);
    I.waitForElement(transactionHistoryPage.textFields.accNumberBucketlist, 10);
    I.waitForElement(transactionHistoryPage.textFields.amountBucketlist, 10);
    I.waitForElement(transactionHistoryPage.buttons.detailHistory, 10);
});

Then("admin fee information from transaction transfer", () => {
    I.see("Biaya Transaksi")
    I.waitForElement(transactionHistoryPage.textFields.adminFeeTitle, 10);
    I.waitForElement(transactionHistoryPage.textFields.adminFeeAmount, 10);
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

Then("I will see detail transaction transfer out {string} with approval", async (method) => {
    I.waitForText("Rincian Transaksi", 10);

    const actualSenderName = await transactionHistoryPage.getSenderNameDetail();
    const expectedSenderName = (await resetStateDao.getCompanyName()).businessName;
    I.assertEqual(actualSenderName, expectedSenderName);

    const actualSenderBankName = await transactionHistoryPage.getSenderBankNameDetail();
    I.assertEqual(actualSenderBankName, "Bank Amar Indonesia")

    const actualSenderAccNumber = (await transactionHistoryPage.getSenderAccNumberDetail()).replace(/\s+/g, '').replace(/-/g, '');
    const expectedSenderAccNumber = (await resetStateDao.getAccountNumber()).accountNumber;
    I.assertEqual(actualSenderAccNumber, expectedSenderAccNumber);

    const actualRecipientName = await transactionHistoryPage.getRecipientNameDetail();
    I.assertEqual(actualRecipientName, globalVariable.dashboard.recipientName);

    const actualRecipientBankName = await transactionHistoryPage.getRecipientBankNameDetail();
    I.assertEqual(actualRecipientBankName, globalVariable.dashboard.recipientBankName);

    const actualRecipientAccNumber = (await transactionHistoryPage.getRecipientAccNumberDetail()).replace(/\s+/g, '').replace(/-/g, '');
    I.assertEqual(actualRecipientAccNumber, globalVariable.dashboard.recipientAccNumber);

    I.see("Transaksi Keluar");
    const actualAmount = await transactionHistoryPage.getAmountDetail();
    I.assertEqual(actualAmount, globalVariable.dashboard.amountTransaction);

    I.see("Dibuat oleh");
    const actualCreatedBy = await transactionHistoryPage.getCreatedByName();
    const userIdBusinessPartner = (await resetStateDao.getBusinessPartnerUserID()).userIdPartner;
    const expectedCreatedBy = (await resetStateDao.getFullName(userIdBusinessPartner, globalVariable.login.password)).ktpName;
    I.assertEqual(actualCreatedBy, expectedCreatedBy);

    I.see("Disetujui oleh");
    const actualApprovedBy = await transactionHistoryPage.getApprovedByName();
    const expectedApprovedBy = (await resetStateDao.getFullName()).ktpName;
    I.assertEqual(actualApprovedBy, expectedApprovedBy);

    I.performSwipe({ x: 1000, y: 1000 }, { x: 100, y: 100 });

    I.see("Nomor Referensi");
    I.waitForElement(transactionHistoryPage.textFields.referenceNumber, 10);
    I.waitForElement(transactionHistoryPage.buttons.btnCopied, 10);

    I.see("Tanggal Disetujui");
    const actualDate = await transactionHistoryPage.getDate();
    I.assertEqual(actualDate, globalVariable.dashboard.date);

    I.see("Waktu");
    I.waitForElement(transactionHistoryPage.textFields.timeDetailHistory, 10);

    I.see("Kategori");
    const actualCategory = await transactionHistoryPage.getCategory();
    I.assertEqual(actualCategory, "Pembayaran");

    if (
        method !== "Overbooking"
    ) {
        I.see("Layanan Transaksi");
        const actualMethod = await transactionHistoryPage.getMethodTransaction();
        I.assertEqual(actualMethod, method);
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

Then("I will see detail transaction transfer out {string} without approval", async (method) => {
    I.waitForText("Rincian Transaksi", 10);

    const actualSenderName = await transactionHistoryPage.getSenderNameDetail();
    const expectedSenderName = (await resetStateDao.getCompanyName()).businessName;
    I.assertEqual(actualSenderName, expectedSenderName);

    const actualSenderBankName = await transactionHistoryPage.getSenderBankNameDetail();
    I.assertEqual(actualSenderBankName, "Bank Amar Indonesia")

    const actualSenderAccNumber = (await transactionHistoryPage.getSenderAccNumberDetail()).replace(/\s+/g, '').replace(/-/g, '');
    const expectedSenderAccNumber = (await resetStateDao.getAccountNumber()).accountNumber;
    I.assertEqual(actualSenderAccNumber, expectedSenderAccNumber);

    const actualRecipientName = await transactionHistoryPage.getRecipientNameDetail();
    I.assertEqual(actualRecipientName, globalVariable.dashboard.recipientName);

    const actualRecipientBankName = await transactionHistoryPage.getRecipientBankNameDetail();
    I.assertEqual(actualRecipientBankName, globalVariable.dashboard.recipientBankName);

    const actualRecipientAccNumber = (await transactionHistoryPage.getRecipientAccNumberDetail()).replace(/\s+/g, '').replace(/-/g, '');
    I.assertEqual(actualRecipientAccNumber, globalVariable.dashboard.recipientAccNumber);

    I.see("Transaksi Keluar");
    const actualAmount = await transactionHistoryPage.getAmountDetail();
    I.assertEqual(actualAmount, globalVariable.dashboard.amountTransaction);

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
    I.assertEqual(actualDate, globalVariable.dashboard.date);

    I.see("Waktu");
    I.waitForElement(transactionHistoryPage.textFields.timeDetailHistory, 10);

    I.see("Kategori");
    const actualCategory = await transactionHistoryPage.getCategory();
    I.assertEqual(actualCategory, "Pembayaran");

    if (
        method !== "Overbooking"
    ) {
        I.see("Layanan Transaksi");
        const actualMethod = await transactionHistoryPage.getMethodTransaction();
        I.assertEqual(actualMethod, method);
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
        method === "BI-FAST" ||
        method === "RTOL"
    ) {
        const actualSenderName = await transactionHistoryPage.getSenderNameDetail();
        I.assertEqual(actualSenderName, globalVariable.transfer.senderName);

        const actualSenderBankName = await transactionHistoryPage.getSenderBankNameDetail();
        I.assertEqual(actualSenderBankName, globalVariable.transfer.senderBankName);

        const actualSenderAccNumber = (await transactionHistoryPage.getSenderAccNumberDetail()).replace(/\s+/g, '').replace(/-/g, '');
        I.assertEqual(actualSenderAccNumber, globalVariable.transfer.senderAccountNumber);

        const actualRecipientName = await transactionHistoryPage.getRecipientNameDetail();
        const expectedRecipientName = (await resetStateDao.getCompanyName()).businessName;
        I.assertEqual(actualRecipientName, expectedRecipientName);

        const actualRecipientBankName = await transactionHistoryPage.getRecipientBankNameDetail();
        I.assertEqual(actualRecipientBankName, "Bank Amar Indonesia");

        const actualRecipientAccNumber = (await transactionHistoryPage.getRecipientAccNumberDetail()).replace(/\s+/g, '').replace(/-/g, '');
        const expectedRecipientAccNumber = await (await resetStateDao.getAccountNumber()).accountNumber;
        I.assertEqual(actualRecipientAccNumber, expectedRecipientAccNumber);

    } else if (
        method === "Overbooking"
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