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
    const listAmount = await I.grabValueFromAll(transactionHistoryPage.textFields.amountBucketlist);
    const countAmount = 0;

    for (let i = 0; i < listAmount.length(); i++) {
        const amountValue = listAmount[i].replace(/[\d\.]/g, "");

        if (amountValue !== "+") {
            countAmount++;
        }
    }
    I.assertEqual(countAmount, 0);
});

When("I will direct to list transfer out", async () => {
    I.wait(1);
    const listAmount = await I.grabValueFromAll(transactionHistoryPage.textFields.amountBucketlist);
    const countAmount = 0;

    for (let i = 0; i < listAmount.length(); i++) {
        const amountValue = listAmount[i].replace(/[\d\.]/g, "").toString();

        if (amountValue !== "-") {
            countAmount++;
        }
    }
    I.assertEqual(countAmount, 0);
});

When("I click detail card transaction transfer out {string} without approval", async (method) => {
    I.waitForElement(transactionHistoryPage.buttons.detailHistorySecond, 10);
    if (
        method === "Overbooking"
    ) {
        I.dontSee("Biaya Transaksi");
        I.dontSeeElement(transactionHistoryPage.textFields.adminFeeTitleSecond);
        I.dontSeeElement(transactionHistoryPage.textFields.adminFeeAmountSecond);
    } else {
        I.waitForElement(transactionHistoryPage.textFields.adminFeeTitleSecond, 10);
        I.see("Biaya Transaksi")

        const actualAdminFee = await transactionHistoryPage.getAdminFeeAmountSecond();
        if (
            method === "BI-FAST"
        ) {
            I.assertEqual(actualAdminFee, "-Rp" + globalVariable.transfer.adminFeeBI - FAST);
        } else if (
            method === "RTOL"
        ) {
            I.assertEqual(actualAdminFee, "-Rp" + globalVariable.transfer.adminFeeRTOL);
        } else if (
            method === "SKN"
        ) {
            I.assertEqual(actualAdminFee, "-Rp" + globalVariable.transfer.adminFeeSKN);
        } else if (
            method === "RTGS"
        ) {
            I.assertEqual(actualAdminFee, "-Rp" + globalVariable.transfer.adminFeeRTGS);
        }
    }

    const actualDate = await transactionHistoryPage.getTransactionDateBucketList();

    const lastComma = actualDate.lastIndexOf(',');
    globalVariable.dashboard.date = lastComma !== -1 ? actualDate.substring(lastComma + 1).trim() : '';
    globalVariable.dashboard.recipientName = await transactionHistoryPage.getTransactionNameBucketListSecond();
    globalVariable.dashboard.recipientBankName = await transactionHistoryPage.getTransactionBankNameBucketListSecond();
    globalVariable.dashboard.recipientAccNumber = await transactionHistoryPage.getTransactionAccNumberBucketListSecond();
    globalVariable.dashboard.amountTransaction = await transactionHistoryPage.getTransactionAmountBucketListSecond();

    transactionHistoryPage.openDetailHistory();
});

When("I click detail latest card history transaction", ()=>{
    transactionHistoryPage.openDetailHistory();
});

When("I see tab filter all transaction, inbound transaction and outbound transaction", async ()=>{
    I.waitForElement(transactionHistoryPage.tabs.allTransaction, 10);
    const titleAllTransaction = await I.grabTextFrom(transactionHistoryPage.tabs.allTransaction);
    I.assertEqual(titleAllTransaction, "Semua");

    const titleInboundransaction = await I.grabTextFrom(transactionHistoryPage.tabs.allTransaction);
    I.assertEqual(titleInboundransaction, "Masuk");

    const titleOutboundTransaction = await I.grabTextFrom(transactionHistoryPage.tabs.allTransaction);
    I.assertEqual(titleOutboundTransaction, "Keluar");
});

When("I click link reset history date", ()=>{
    transactionHistoryPage.resetFilter();
});

When("I click share receipt transaction", ()=>{
    transactionHistoryPage.clickBtnShare();
});

When("I will see field start and end date is empty", async ()=>{
    const actualStartDate = await I.grabTextFrom(transactionHistoryPage.fields.startDateField);
    I.assertEqual(actualStartDate, "");

    const actualEndDate = await I.grabTextFrom(transactionHistoryPage.fields.endDateField);
    I.assertEqual(actualEndDate, "");
});

When("I fill start date more than end date", ()=>{
    transactionHistoryPage.chooseFutureStartDate();
    transactionHistoryPage.chooseDate();

    transactionHistoryPage.choosePastEndDate();
    transactionHistoryPage.chooseDate();
});

When("I fill start date history transaction", ()=>{
    transactionHistoryPage.choosePastStartDate();
    transactionHistoryPage.chooseDate();
});

When("I fill end date history transaction", ()=>{
    transactionHistoryPage.choosePastEndDate();
    transactionHistoryPage.chooseDate();
});

When("I fill start date transaction with condition there is no transaction", ()=>{
    transactionHistoryPage.chooseFutureStartDate();
    transactionHistoryPage.chooseDate();
});

When("I fill end date transaction with condition there is no transaction", ()=>{
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

        const actualAdminFee = await transactionHistoryPage.getAdminFeeAmount();
        if (
            method === "BI-FAST"
        ) {
            I.assertEqual(actualAdminFee, "-Rp" + globalVariable.transfer.adminFeeBI - FAST);
        } else if (
            method === "RTOL"
        ) {
            I.assertEqual(actualAdminFee, "-Rp" + globalVariable.transfer.adminFeeRTOL);
        } else if (
            method === "SKN"
        ) {
            I.assertEqual(actualAdminFee, "-Rp" + globalVariable.transfer.adminFeeSKN);
        } else if (
            method === "RTGS"
        ) {
            I.assertEqual(actualAdminFee, "-Rp" + globalVariable.transfer.adminFeeRTGS);
        }
    }

    const actualDate = await transactionHistoryPage.getTransactionDateBucketList();

    const lastComma = actualDate.lastIndexOf(',');
    globalVariable.dashboard.date = lastComma !== -1 ? actualDate.substring(lastComma + 1).trim() : '';
    globalVariable.dashboard.recipientName = await transactionHistoryPage.getTransactionNameBucketList();
    globalVariable.dashboard.recipientBankName = await transactionHistoryPage.getTransactionBankNameBucketList();
    globalVariable.dashboard.recipientAccNumber = await transactionHistoryPage.getTransactionAccNumberBucketList();
    globalVariable.dashboard.amountTransaction = await transactionHistoryPage.getTransactionAmountBucketList();

    transactionHistoryPage.openDetailHistory();
});

When("I click detail card transaction transfer in {string}", async (method) => {
    I.waitForElement(transactionHistoryPage.buttons.detailHistory, 10);

    if (
        method === "Overbooking" ||
        method === "BI-FAST" ||
        method === "RTOL"
    ) {
        const actualDate = await transactionHistoryPage.getTransactionDateBucketList();

        const lastComma = actualDate.lastIndexOf(',');
        globalVariable.dashboard.date = lastComma !== -1 ? actualDate.substring(lastComma + 1).trim() : '';
        globalVariable.transfer.senderName = await transactionHistoryPage.getTransactionNameBucketList();
        globalVariable.transfer.senderBankName = await transactionHistoryPage.getTransactionBankNameBucketList();
        globalVariable.transfer.senderAccountNumber = await transactionHistoryPage.getTransactionAccNumberBucketList();
        globalVariable.dashboard.amountTransaction = await transactionHistoryPage.getTransactionAmountBucketList();

    } else if (
        method === "SKN" ||
        method === "RTGS"
    ) {
        I.see("Transaksi Masuk");
        const actualDate = await transactionHistoryPage.getTransactionDateBucketList();

        const lastComma = actualDate.lastIndexOf(',');
        globalVariable.dashboard.date = lastComma !== -1 ? actualDate.substring(lastComma + 1).trim() : '';
        globalVariable.transfer.amount = await transactionHistoryPage.getTransactionAmountBucketList();
    }

    transactionHistoryPage.openDetailHistory();
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

Then("I will see message error start date should be less than end date", async()=>{
    const actualMessageError = await transactionHistoryPage.getMessageErrorFilterHistoryTransaction();
    I.assertEqual(actualMessageError, "Tanggal awal harus sebelum tanggal akhir");
});

Then("I will see notes in detail history transaction", async()=>{
    I.performSwipe({ x: 1000, y: 1000 }, { x: 100, y: 100 });

    I.waitForText("Catatan", 10);
    const actualNotes = await transactionHistoryPage.getNotes();
    I.assertEqual(actualNotes, globalVariable.transfer.note);
});

Then("I will see detail transaction transfer out {string} with approval", async (method) => {
    I.waitForText("Rincian Transaksi", 10);

    const actualSenderName = await transactionHistoryPage.getSenderAccNumberDetail();
    const expectedSenderName = (await resetStateDao.getCompanyName(globalVariable.login.userID, globalVariable.login.password)).businessName;
    I.assertEqual(actualSenderName, expectedSenderName);

    const actualSenderBankName = await transactionHistoryPage.getSenderBankNameDetail();
    I.assertEqual(actualSenderBankName, "Bank Amar Indonesia")

    const actualSenderAccNumber = await transactionHistoryPage.getSenderAccNumberDetail().replace(/\s+/g, '');
    const expectedSenderAccNumber = (await resetStateDao.getAccountNumber(globalVariable.login.userID, globalVariable.login.password)).accountNumber;
    I.assertEqual(actualSenderAccNumber, expectedSenderAccNumber);

    const actualRecipientName = await transactionHistoryPage.getRecipientNameDetail();
    I.assertEqual(actualRecipientName, globalVariable.dashboard.recipientName);

    const actualRecipientBankName = await transactionHistoryPage.getRecipientBankNameDetail();
    I.assertEqual(actualRecipientBankName, globalVariable.dashboard.recipientBankName);

    const actualRecipientAccNumber = await transactionHistoryPage.getRecipientAccNumberDetail().replace(/\s+/g, '');
    I.assertEqual(actualRecipientAccNumber, globalVariable.dashboard.recipientAccNumber);

    I.see("Transaksi Keluar");
    const actualAmount = await transactionHistoryPage.getAmountDetail();
    I.assertEqual(actualAmount, globalVariable.dashboard.amountTransaction);

    I.see("Dibuat oleh");
    const actualCreatedBy = await transactionHistoryPage.getCreatedByName();
    const userIdBusinessPartner = (await resetStateDao.getBusinessPartnerUserID(globalVariable.login.userID, globalVariable.login.password)).userIdPartner;
    const expectedCreatedBy = (await resetStateDao.getFullName(userIdBusinessPartner, globalVariable.login.password)).ktpName;
    I.assertEqual(actualCreatedBy, expectedCreatedBy);

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

    I.see("Catatan");

    I.see("Bagikan Bukti Transaksi");
    I.waitForElement(transactionHistoryPage.buttons.btnShare, 10);
});

Then("I will see detail transaction transfer out {string} without approval", async (method) => {
    I.waitForText("Rincian Transaksi", 10);

    const actualSenderName = await transactionHistoryPage.getSenderAccNumberDetail();
    const expectedSenderName = (await resetStateDao.getCompanyName(globalVariable.login.userID, globalVariable.login.password)).businessName;
    I.assertEqual(actualSenderName, expectedSenderName);

    const actualSenderBankName = await transactionHistoryPage.getSenderBankNameDetail();
    I.assertEqual(actualSenderBankName, "Bank Amar Indonesia")

    const actualSenderAccNumber = await transactionHistoryPage.getSenderAccNumberDetail().replace(/\s+/g, '');
    const expectedSenderAccNumber = (await resetStateDao.getAccountNumber(globalVariable.login.userID, globalVariable.login.password)).accountNumber;
    I.assertEqual(actualSenderAccNumber, expectedSenderAccNumber);

    const actualRecipientName = await transactionHistoryPage.getRecipientNameDetail();
    I.assertEqual(actualRecipientName, globalVariable.dashboard.recipientName);

    const actualRecipientBankName = await transactionHistoryPage.getRecipientBankNameDetail();
    I.assertEqual(actualRecipientBankName, globalVariable.dashboard.recipientBankName);

    const actualRecipientAccNumber = await transactionHistoryPage.getRecipientAccNumberDetail().replace(/\s+/g, '');
    I.assertEqual(actualRecipientAccNumber, globalVariable.dashboard.recipientAccNumber);

    I.see("Transaksi Keluar");
    const actualAmount = await transactionHistoryPage.getAmountDetail();
    I.assertEqual(actualAmount, globalVariable.dashboard.amountTransaction);

    I.see("Dibuat oleh");
    const actualCreatedBy = await transactionHistoryPage.getCreatedByName();
    const userIdBusinessPartner = (await resetStateDao.getBusinessPartnerUserID(globalVariable.login.userID, globalVariable.login.password)).userIdPartner;
    const expectedCreatedBy = (await resetStateDao.getFullName(userIdBusinessPartner, globalVariable.login.password)).ktpName;
    I.assertEqual(actualCreatedBy, expectedCreatedBy);

    I.dontSee("Disetujui oleh");
    I.dontSeeElement(transactionHistoryPage.textFields.createdBy);

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

    I.see("Catatan");

    I.see("Bagikan Bukti Transaksi");
    I.waitForElement(transactionHistoryPage.buttons.btnShare, 10);
});

Then("I will see detail transaction transfer in {string}", async (method) => {
    I.waitForText("Rincian Transaksi", 10);

    if (
        method === "Overbooking" ||
        method === "BI-FAST" ||
        method === "RTOL"
    ) {
        const actualSenderName = await transactionHistoryPage.getSenderAccNumberDetail();
        I.assertEqual(actualSenderName, globalVariable.transfer.senderName);

        const actualSenderBankName = await transactionHistoryPage.getSenderBankNameDetail();
        I.assertEqual(actualSenderBankName, globalVariable.transfer.senderBankName);

        const actualSenderAccNumber = await transactionHistoryPage.getSenderAccNumberDetail().replace(/\s+/g, '');
        I.assertEqual(actualSenderAccNumber, globalVariable.transfer.senderAccountNumber);

        const actualRecipientName = await transactionHistoryPage.getRecipientNameDetail();
        const expectedRecipientName = await (await resetStateDao.getFullName(globalVariable.login.userID, globalVariable.login.password)).ktpName;
        I.assertEqual(actualRecipientName, expectedRecipientName);

        const actualRecipientBankName = await transactionHistoryPage.getRecipientBankNameDetail();
        I.assertEqual(actualRecipientBankName, "Bank Amar Indonesia");

        const actualRecipientAccNumber = await transactionHistoryPage.getRecipientAccNumberDetail().replace(/\s+/g, '');
        const expectedRecipientAccNumber = await (await resetStateDao.getAccountNumber(globalVariable.login.userID, globalVariable.login.password)).accountNumber;
        I.assertEqual(actualRecipientAccNumber, expectedRecipientAccNumber);

    } else if (
        method === "SKN" ||
        method === "RTGS"
    ) {
        I.dontSee(transactionHistoryPage.textFields.senderName);
        I.dontSee(transactionHistoryPage.textFields.senderBankName);
        I.dontSee(transactionHistoryPage.textFields.senderAccNumber);
        I.dontSee(transactionHistoryPage.textFields.recipientName);
        I.dontSee(transactionHistoryPage.textFields.recipientBankName);
        I.dontSee(transactionHistoryPage.textFields.recipientAccNumber);
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