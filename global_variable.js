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
}