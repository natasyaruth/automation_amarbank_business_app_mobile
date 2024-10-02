const fs = require('fs');
const path = require('path');

const { I, resetStateDao, globalVariable } = inject();

const env = globalVariable.returnEnvi();

const userID = globalVariable.login.userID;
const password = globalVariable.login.password;

module.exports = {

    loadImageAsBase64(filePath) {
        const img = fs.readFileSync(filePath);

        return Buffer.from(img).toString('base64');
    },

    async uploadKTP() {

        const base64Ktp = this.loadImageAsBase64('./data/eKTP.jpg');

        const bearerToken = (await resetStateDao.getTokenLogin(userID, password)).bearerToken;

        I.amBearerAuthenticated(secret(bearerToken));

        const responseKtp = await I.sendPostRequest("https://" + env + "-smb-user.otoku.io/api/v1/user/photo/ktp", secret({
            imageFormat: "jpg",
            file: base64Ktp,
        }));

        I.seeResponseCodeIsSuccessful();

        return {
            status: responseKtp.status,
            data: responseKtp.data,
        }

    },

    async uploadSelfie() {

        const base64Selfie = this.loadImageAsBase64('./data/selfie.jpg');

        const bearerToken = (await resetStateDao.getTokenLogin(userID, password)).bearerToken;

        I.amBearerAuthenticated(secret(bearerToken))

        const responseSelfie = await I.sendPostRequest("https://" + env + "-smb-user.otoku.io/api/v1/user/photo/selfie", secret({
            imageFormat: "jpg",
            file: base64Selfie,
        }));

        I.seeResponseCodeIsSuccessful();

        return {
            status: responseSelfie.status,
            data: responseSelfie.data,
        }
    },

    async uploadOtherDoc(fileType) {

        let base64File;
        let fileName;

        const pathPdf = './data/file_upload/CV MAJU BERSAMA.pdf';
        const pathJpg = './data/file_upload/PT ABC XYZ.jpg';
        const pathJpeg = './data/file_upload/USAHA BISNIS KU.jpeg';
        const pathPng = './data/file_upload/UD ABANG MEDAN.png';

        switch (fileType) {
            case "pdf":
                base64File = this.loadImageAsBase64(pathPdf);
                fileName = path.basename(pathPdf);
                break;
            case "jpg":
                base64File = this.loadImageAsBase64(pathJpg);
                fileName = path.basename(pathJpg);
                break;
            case "jpeg":
                base64File = this.loadImageAsBase64(pathJpeg);
                fileName = path.basename(pathJpeg);
                break;
            case "png":
                base64File = this.loadImageAsBase64(pathPng);
                fileName = path.basename(pathPng);
                break;
            default:
                throw new Error("File type is not recognize");
        }

        globalVariable.uploadDocuments.fileName = fileName;

        const bearerToken = (await resetStateDao.getTokenLogin(userID, password)).bearerToken;

        I.amBearerAuthenticated(secret(bearerToken))

        const responseDoc = await I.sendPostRequest("https://" + env + "-smb-user.otoku.io/api/v1/document/other", secret({
            fileFormat: fileType,
            fileName: fileName,
            file: base64File,
        }));

        I.seeResponseCodeIsSuccessful();

        I.wait(3);

        return {
            status: responseDoc.status,
            data: responseDoc.data,
        }

    },

    async uploadDocBusiness(enumDoc, fileType) {

        let base64File;

        switch (fileType) {
            case "pdf":
                base64File = this.loadImageAsBase64('./data/file_upload/CV MAJU BERSAMA.pdf');
                break;
            case "jpg":
                base64File = this.loadImageAsBase64('./data/file_upload/PT ABC XYZ.jpg');
                break;
            case "jpeg":
                base64File = this.loadImageAsBase64('./data/file_upload/USAHA BISNIS KU.jpeg');
                break;
            case "png":
                base64File = this.loadImageAsBase64('./data/file_upload/UD ABANG MEDAN.png');
                break;
            default:
                throw new Error("File type is not recognize");
        }

        const bearerToken = (await resetStateDao.getTokenLogin(userID, password)).bearerToken;

        I.amBearerAuthenticated(secret(bearerToken))

        const responseDoc = await I.sendPostRequest("https://" + env + "-smb-user.otoku.io/api/v1/user/business/docs/" + enumDoc, secret({
            fileFormat: fileType,
            file: base64File,
        }));

        I.seeResponseCodeIsSuccessful();

        return {
            status: responseDoc.status,
            data: responseDoc.data,
        }
    },

    async allowDeviceData() {
        const bearerToken = (await resetStateDao.getTokenLogin(userID, password)).bearerToken;

        I.amBearerAuthenticated(secret(bearerToken));

        const responseDeviceData = await I.sendPostRequest("https://" + env + "-smb-user.otoku.io/api/v1/device", secret({
            deviceId: "QWERTY78922",
            payload: {
                ImageAndVideo: true,
                Location: true,
                PhoneCall: false
            }
        }));

        I.seeResponseCodeIsSuccessful();

        return {
            status: responseDeviceData.status,
            data: responseDeviceData.data
        }
    },

    async submitDataPersonalIndividual(lastEducation, motherName, referenceName, referencePhoneNumber, purposeAccount) {

        const base64File = this.loadImageAsBase64('./data/npwp.png');

        const bearerToken = (await resetStateDao.getTokenLogin(userID, password)).bearerToken;

        I.amBearerAuthenticated(secret(bearerToken));

        const responsePostData = await I.sendPostRequest("https://" + env + "-smb-user.otoku.io/api/v1/user/profile", secret({
            accountOpeningReason: purposeAccount,
            lastEducation: lastEducation,
            motherName: motherName,
            referenceName: referenceName,
            referencePhone: referencePhoneNumber,
            npwpFileFormat: "jpg",
            npwpNumber: base64File
        }));

        I.seeResponseCodeIsSuccessful();

        return {
            status: responsePostData.status,
            data: responsePostData.data
        }
    },

    async submitDataPersonalBusiness(lastEducation, motherName, referenceName, referencePhoneNumber) {

        const base64File = this.loadImageAsBase64('./data/npwp.png');

        const bearerToken = (await resetStateDao.getTokenLogin(userID, password)).bearerToken;

        I.amBearerAuthenticated(secret(bearerToken));

        const responsePostData = await I.sendPostRequest("https://" + env + "-smb-user.otoku.io/api/v1/user/profile", secret({
            lastEducation: lastEducation,
            motherName: motherName,
            referenceName: referenceName,
            referencePhone: referencePhoneNumber,
            npwpFileFormat: "jpg",
            npwpNumber: base64File
        }));

        I.seeResponseCodeIsSuccessful();

        return {
            status: responsePostData.status,
            data: responsePostData.data
        }
    },

    async submitProductType(type) {

        const bearerToken = (await resetStateDao.getTokenLogin(userID, password)).bearerToken;

        I.amBearerAuthenticated(secret(bearerToken));

        const responsePostData = await I.sendPostRequest("https://" + env + "-smb-user.otoku.io/api/v1/user/account-picker", secret({
            productType: type
        }));

        I.seeResponseCodeIsSuccessful();

        return {
            status: responsePostData.status,
            data: responsePostData.data
        }
    },

    async submitLegalityType(type, npwpBusiness) {

        const bearerToken = (await resetStateDao.getTokenLogin(userID, password)).bearerToken;

        I.amBearerAuthenticated(secret(bearerToken));

        let responsePostData;

        if (
            type === "Individual"
        ) {
            responsePostData = await I.sendPostRequest("https://" + env + "-smb-user.otoku.io/api/v1/user/account-creation", secret({
                accountType: 1,
                applicationID: "",
                legalityType: type,
                source: "funding"
            }));
        } else {
            responsePostData = await I.sendPostRequest("https://" + env + "-smb-user.otoku.io/api/v1/user/account-creation", secret({
                accountType: 2,
                applicationID: "",
                legalityType: type,
                source: "funding",
                businessNpwp: npwpBusiness
            }));
        }

        I.seeResponseCodeIsSuccessful();

        return {
            status: responsePostData.status,
            data: responsePostData.data
        }
    },

    async submitBusinessProfile(businessProfile, legality) {

        const bearerToken = (await resetStateDao.getTokenLogin(userID, password)).bearerToken;

        I.amBearerAuthenticated(secret(bearerToken));

        const responsePostData = await I.sendPostRequest("https://" + env + "-smb-user.otoku.io/api/v1/user/business/profile", secret({
            legalityType: legality,
            businessName: businessProfile["businessName"],
            businessEmail: "abcdef@test.com",
            businessType: businessProfile["businessType"],
            industryType: businessProfile["industryType"],
            monthlyIncome: businessProfile["monthlyIncome"],
            averageTransaction: businessProfile["averageTransaction"],
            annualEarnings: "500 juta",
            businessNPWP: businessProfile["businessNPWP"],
            nib: businessProfile["nib"],
            foundedAt: businessProfile["foundedAt"],
        }));

        I.seeResponseCodeIsSuccessful();

        return {
            status: responsePostData.status,
            data: responsePostData.data
        }
    },

    async submitOnePartner(businessPartner) {

        const bearerToken = (await resetStateDao.getTokenLogin(userID, password)).bearerToken;

        I.amBearerAuthenticated(secret(bearerToken));

        const partner = [
            {
                email: businessPartner["email"],
                fullName: businessPartner["fullName"],
                nik: "3173062009910005",
            }
        ];

        const responsePostData = await I.sendPostRequest("https://" + env + "-smb-user.otoku.io/api/v1/user/business/partners", partner);

        I.seeResponseCodeIsSuccessful();

        return {
            status: responsePostData.status,
            data: responsePostData.data
        }
    },

    async submitIdentityDetails(ktpData) {

        const bearerToken = (await resetStateDao.getTokenLogin(userID, password)).bearerToken;

        I.amBearerAuthenticated(secret(bearerToken));

        const responsePostData = await I.sendPostRequest("https://" + env + "-smb-user.otoku.io/api/v1/user/profile/ktp", secret({
            ktpnumber: ktpData["ktpnumber"],
            ktpname: ktpData["ktpname"],
            birthplace: ktpData["birthplace"],
            dateofbirth: ktpData["dateofbirth"],
            gender: ktpData["gender"],
            bloodtype: ktpData["bloodtype"],
            religion: ktpData["religion"],
            maritalstatus: ktpData["maritalstatus"],
            province: ktpData["province"],
            city: ktpData["city"],
            district: ktpData["district"],
            village: ktpData["village"],
            rt: ktpData["rt"],
            rw: ktpData["rw"],
            ktpaddress: ktpData["ktpaddress"],
            postalcode: ktpData["postalcode"],
            job: ktpData["job"],
            nationality: ktpData["nationality"],
            noWincoreProvince: ktpData["noWincoreProvince"],
            noWincoreCity: ktpData["noWincoreCity"],
            noWincoreDistrict: ktpData["noWincoreDistrict"],
            noWincoreVillage: ktpData["noWincoreVillage"],
            expiryDate: ktpData["expiryDate"],
        }));

        I.seeResponseCodeIsSuccessful();

        return {
            status: responsePostData.status,
            data: responsePostData.data
        }
    },

    async checkEligibilityNPWPBusiness(npwpBusiness) {

        let npwp = "";

        npwp = npwpBusiness;

        const bearerToken = (await resetStateDao.getTokenLogin(userID, password)).bearerToken;

        I.amBearerAuthenticated(secret(bearerToken));

        const response = await I.sendPostRequest("https://" + env + "-smb-user.otoku.io/api/v1/business/check-npwp", secret({
            npwp: npwp
        }));

        I.seeResponseCodeIsSuccessful();

        return {
            status: response.status,
            eligible: response.data.isEligible,
        }

    },

    async pushNotificationMaintananceApp() {

        I.haveRequestHeaders(secret({
            Authorization: "basic NWY2NjdjMTJmYmJmNjlmNzAwZjdkYzgzNTg0ZTc5ZDI2MmEwODVjMmJmOTIxYzU2MzZjNzgzNTExYzIzNDFhYg=="
        }));

        const currentDate = new Date();
        const day = currentDate.getDate();
        const month = currentDate.getMonth();
        const year = currentDate.getFullYear();

        const response = await I.sendPostRequest("https://" + env + "-smb-user.otoku.io/api/v1/notifications", {
            userId: userID,
            category: "Info",
            title: "Peringatan Pemeliharaan Sistem",
            summary: "Pemeliharan sistem pada " + day + "/" + month + "/" + year + ", jam 23.00-01.00 WIB",
            information: "Untuk meningkatkan layanan kami, kami akan melakukan pemeliharan sistem pada "+"\n" 
                         +day + "/" + month + "/" + year +" jam 23.00-01.00 WIB. Selama waktu ini, akses Anda "+"\n"
                         +"pada aplikasi Amar Bank Bisnis mungkin terganggu. Mohon maaf atas ketidaknyamanannya. Terima kasih."
        });

        return {
            status: response.status,
            data: response.data
        }
    },
}