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
    getCurrentDayString() {
        const currentDate = new Date();
        const day = currentDate.getDay();
        const adjustedIndex = (day === 0) ? 6 : day - 1;

        return this.constant.days[adjustedIndex];
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
        days:[
            "Senin", "Selasa", "Rabu", "Kamis", "Jumat", "Sabtu", "Minggu"
        ],
        formatDate: {
            ddmmmyyyy: "ddmmmyyyy",
        },
        methodTf: {
            overbooking: "OVERBOOK",
            bifast: "BIFAST",
            rtol: "RTOL",
            skn: "SKN",
            rtgs: "RTGS"
        },
        industryType: {
            industryCreative: "Industri Kreatif",
            processing: "Industri Pengolahan",
            food: "Industri Makanan & Minuman",
            service: "Jasa",
            contruction: "Konstruksi",
            finance: "Keuangan & Asuransi",
            education: "Pendidikan",
            warehouse: "Pengangkutan & Pergudangan",
            mining: "Pertambangan & Penggalian",
            retail: "Perdagangan Besar & Eceran",
            hospitality: "Restoran, Kafe dan Hotel",
            healthService: "Rumah Sakit, Apotik dan Industri Kesehatan",
            IT: "Teknologi Informasi",
            transportation: "Transportasi",
            other: "Lainnya",
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
        npwpBusinessDefault: "449645570040922",
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
        listPassword: [],
        dummyPassword: "Ruth!@#$$",
        userID: "",
        userIDPartner: "",
        userIDInitiator: "",
        userIDFriendlist: "",
        listUserID: [],
        countValue: "",
        date: "",
        time: "",
        lastStep: "",
        newDeviceID: "",
        tokenLogin: "",
        oldOtp: "",
        newOtp: "",
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
        optionChoose: "",
        otherIndustryType: "",
        otherBusinessField: "",
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
        folderName: [],
        folderDeleted: "",
        updateFolderName: "",
        updateFileName: "",
        levelBackFolder: 0,
        fileNameGiro: "",
        openedFolder: [],
        moveFolderFile: "",
        copiedFiles: [],
    },
    createPin: {
        newPin: "",
        oldPin: "",
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
        dailyLimit: 0,
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
        listApproval: [],
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