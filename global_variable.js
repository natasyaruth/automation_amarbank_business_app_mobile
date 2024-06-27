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
        phoneNumber: "",
        otpCode: "",
        email: "",
        password: "",
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
        userID: "",
        countValue: "",
        date: "",
        time: "",
        lastStep: "",
    },
    forgotPassword: {
        userID: "",
        email: "",
    },
    formKtp:{
        eKTPNumber: "",
        fullName:"",
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
    },
    historyTrx:{
        startDate: "",
        endDate: "",
    },
}