module.exports = {

    returnEnvi() {
        let environment;
        if (process.env.ENVIRONMENT == "staging") {
            environment = "staging";
        } else {
            environment = "dev";
        }
        return environment;
    },
    getCurrentDay() {
        const currentDate = new Date();
        const day = currentDate.getDay();

        return day;
    },
    getCurrentDateWithoutZero() {
        const currentDate = new Date();
        const date = currentDate.getDate();

        return date;
    },
    getCurrentDateWithZero() {
        const currentDate = new Date();
        const date = currentDate.getDate();
        let stringDate;

        if (
            date < 10
        ) {
            stringDate = "0" + date;
            return stringDate;

        } else {

            return date;
        }
    },
    getMonth() {
        const currentDate = new Date();
        const month = currentDate.getMonth();

        return month;
    },
    getMonthString() {
        const month = this.getMonth();

        return this.constant.months[month];
    },
    getCurrentYear() {
        const currentDate = new Date();
        const year = currentDate.getFullYear();

        return year;
    },
    getCurrentFullDate(format) {

        const currentDate = new Date();
        const day = currentDate.getDay();
        const month = currentDate.getMonth();
        const year = currentDate.getFullYear();

        if (

            format === "ddmmmyyyy"
        ) {

            const date = this.getCurrentDateWithZero();
            return date + " " + this.constant.months[month] + " " + year;
        }
    },
    constant: {
        months: [
            "Januari", "Februari", "Maret", "April",
            "Mei", "Juni", "Juli", "Agustus",
            "September", "Oktober", "November", "Desember"
        ],
        formatDate: {
            ddmmmyyyy: "ddmmmyyyy",
        }
    },
    registration: {
        fullName: "",
        fullNamePartner: "",
        phoneNumber: "",
        phoneNumberPartner: "",
        otpCode: "",
        email: "",
        emailPartner: "",
        newEmailPartner: "",
        password: "",
        passwordPartner: "",
        companyName: "",
        businessCode: "",
        userID: "",
        npwpBusinessDefault: "449645570040911",
        npwpBusiness: "",
    },
    onBoarding: {
        legality: "",
        status: "",
        productType: "",
    },
    login: {
        password: "",
        passwordPartner: "",
        passwordFriendlist: "",
        dummyPassword: "Ruth!@#$$",
        userID: "",
        userIDPartner: "",
        userIDInitiator: "",
        userIDFriendlist: "",
        countValue: "",
        date: "",
        time: "",
        lastStep: "",
        newDeviceID: "",
        tokenLogin: "",
    },
    forgotPassword: {
        userID: "",
        email: "",
    },
    changePassword: {
        oldPassword: "",
        newPassword: "",
        confirmPassword: "",
    },
    formKtp: {
        eKTPNumber: "",
        fullName: "",
        address: "",
        province: "",
        city: "",
        district: "",
        village: "",
    },
    formPersonal: {
        isUploadNpwp: true,
    },
    formBusinessProfile: {
        businessName: "",
        industry: "",
        businessField: "",
        monthlyIncome: "",
        averageTransaction: "",
        npwp: "",
        nib: "",
    },
    formDirector: {
        fullName: "",
        email: "",
        nik: "",
        numberOfDirectors: 1
    },
    uploadDocuments: {
        nib: false,
        akta: false,
        sk: false,
        npwp: false,
        fileType: "",
        fileName: [],
    },
    createPin: {
        newPin: "",
        otp: "",
    },
    friendList: {
        bankName: "",
        receiverName: "",
        friendListName: "",
        friendListAccNumber: "",
    },
    transfer: {
        amount: 0,
        amountTransfer: "",
        service: "",
        note: "",
        category: "",
        accountNumber: "",
        date: "",
        senderName: "",
        senderBankName: "",
        senderAccountNumber: "",
        recipientName: "",
        recipientBankName: "",
        recipientAccountNumber: "",
        makerName: "",
        status: "",
        adminFee: 0,
        adminFeeRTOL: "6.500",
        adminFeeBIFAST: "2.500",
        adminFeeSKN: "2.900",
        adminFeeRTGS: "30.000",
        activeAmount: "",
        method: "",
        totalAmount: "",
    },
    dashboard: {
        activeAmount: "",
        blockingAmount: "",
        totalAmount: "",
        companyName: "",
        userName: "",
        approverName: "",
        senderName: "",
        recipientName: "",
        recipientBankName: "",
        recipientAccNumber: "",
        date: "",
        amountTransaction: "",
        lastPage: "",
    },
    historyTrx: {
        startDate: "",
        endDate: "",
    },
    survey: {
        feedBack: "",
        lengthFeedback: ""
    },
    notificationCenter: {
        desc: "",
        date: "",
        descTrx: "",
        numberOfNotif: 0,
    },
    profile: {
        fullName: "",
        phoneNumber: "",
        email: "",
        domicileAddress: "",
        companyName: "",
    },
}