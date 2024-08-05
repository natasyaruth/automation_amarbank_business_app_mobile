module.exports = {

    returnEnvi(){
        let environment;
        if(process.env.ENVIRONMENT == "staging"){
            environment = "staging";
        } else{
            environment = "dev";
        }
        return environment;
    },
    registration: {
        fullName: "",
        fullNamePartner: "",
        phoneNumber: "",
        phoneNumberPartner: "",
        otpCode: "",
        email: "",
        emailPartner: "",
        password: "",
        passwordPartner: "",
        companyName: "",
        businessCode: "",
        userID: "",
    },
    onBoarding:{
        legality: "",
        status: "",
        productType: "",
    },
    login: {
        password: "",
        passwordPartner: "",
        userID: "",
        userIDPartner: "",
        countValue: "",
        date: "",
        time: "",
        lastStep: "",
        newDeviceID: "",
    },
    forgotPassword: {
        userID: "",
        email: "",
    },
    changePassword:{
        oldPassword: "",
        newPassword: "",
        confirmPassword: "",
    },
    formKtp:{
        eKTPNumber: "",
        fullName:"",
        address: "",
        province: "",
        city: "",
        district: "",
        village: "",
    },
    formPersonal:{
        isUploadNpwp: true,
    },
    formDirector:{
        fullName: "",
        email:"",
        nik:"",
        numberOfDirectors: 0
    },
    uploadDocuments:{
        nib: false,
        akta: false,
        sk: false,
        npwp: false,
    },
    createPin:{
        newPin:"",
        otp: "",
    },
    friendList:{
        bankName:"",
        receiverName:"",
        friendListName: "",
        friendListAccNumber: "",
    },
    transfer:{
        amount:0,
        service:"",
        note:"",
        category:"",
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
    dashboard:{
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
    historyTrx:{
        startDate: "",
        endDate: "",
    },
}