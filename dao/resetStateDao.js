const { I, headerPage, onboardingAccOpeningPage, globalVariable, getDataDao } = inject();
const env = globalVariable.returnEnvi();

module.exports = {

    async resetStateFlow(stateNumber) {

        const bearerToken = (await this.getTokenLogin()).bearerToken;

        I.amBearerAuthenticated(secret(bearerToken))

        const responseState = await I.sendPostRequest(secret("https://" + env + "-smb-user.otoku.io/api/v1/user/account-creation/set?step=" + stateNumber));
        I.wait(2);

        return {
            status: responseState.status,
            data: responseState.data,
        };
    },

    async updateFlagOnboardingDocumentSafeAndSurvey(status) {

        I.haveRequestHeaders({
            Authorization: "basic NWY2NjdjMTJmYmJmNjlmNzAwZjdkYzgzNTg0ZTc5ZDI2MmEwODVjMmJmOTIxYzU2MzZjNzgzNTExYzIzNDFhYg=="
        });

        const responseUpdate = await I.sendPostRequest("https://" + env + "-smb-user.otoku.io/api/v1/user/flags/bulk-update", secret({
            username: globalVariable.login.userID,
            flags: {
                brankasOnboarding: status,
                brankasSurvey: status
            }
        }));

        I.seeResponseCodeIsSuccessful();

        return {
            status: responseUpdate.status,
            data: responseUpdate.data
        }

    },

    async getIdOtherDoc() {

        const bearerToken = (await this.getTokenLogin()).bearerToken;

        I.amBearerAuthenticated(secret(bearerToken));

        const response = await I.sendGetRequest("https://" + env + "-smb-user.otoku.io/api/v1/document/other");

        I.seeResponseCodeIsSuccessful();

        return {
            status: response.status,
            idDocs: response.data,
        }

    },

    async deleteOtherDoc() {
        const idDoc = (await this.getIdOtherDoc()).idDocs;

        const bearerToken = (await this.getTokenLogin()).bearerToken;

        I.amBearerAuthenticated(secret(bearerToken));

        const response = await I.sendDeleteRequest("https://" + env + "-smb-user.otoku.io/api/v1/document/" + idDoc);

        return {
            status: response.status,
            data: response.data
        }

    },

    async deleteAllOtherDoc() {

        const idDoc = (await this.getIdOtherDoc()).idDocs;

        const bearerToken = (await this.getTokenLogin()).bearerToken;

        I.amBearerAuthenticated(secret(bearerToken));

        let response;

        if (idDoc.length !== 0) {
            for (let i = 0; i < idDoc.length; i++) {
                response = await I.sendDeleteRequest("https://" + env + "-smb-user.otoku.io/api/v1/document/" + idDoc[i].id);
                I.wait(3);
            }

            return {
                status: response.status,
                data: response.data
            }
        }
    },

    async deleteAllDocuments() {

        const listIdDocs = (await getDataDao.getListDocBusiness()).listDocBusiness;

        let response;

        if (listIdDocs !== null) {

            for (let i = 0; i < listIdDocs.length; i++) {

                if (

                    listIdDocs[i].type === "nib_berbasis_resiko"
                ) {

                    response = await I.sendDeleteRequest("https://" + env + "-smb-user.otoku.io/api/v1/user/business/docs/1");

                } else if (

                    listIdDocs[i].type === "akta_pendirian"
                ) {

                    response = await I.sendDeleteRequest("https://" + env + "-smb-user.otoku.io/api/v1/user/business/docs/2");

                } else if (

                    listIdDocs[i].type === "anggaran_dasar"
                ) {

                    response = await I.sendDeleteRequest("https://" + env + "-smb-user.otoku.io/api/v1/user/business/docs/3");

                } else if (

                    listIdDocs[i].type === "akta_perubahan_terakhir" ||
                    listIdDocs[i].type === "sertifikat_perubahan_terakhir"
                ) {

                    response = await I.sendDeleteRequest("https://" + env + "-smb-user.otoku.io/api/v1/user/business/docs/4");

                } else if (

                    listIdDocs[i].type === "npwp"
                ) {

                    response = await I.sendDeleteRequest("https://" + env + "-smb-user.otoku.io/api/v1/user/business/docs/5");

                } else if (

                    listIdDocs[i].type === "surat_pernyataan_pendirian_pt"
                ) {

                    response = await I.sendDeleteRequest("https://" + env + "-smb-user.otoku.io/api/v1/user/business/docs/6");

                } else if (

                    listIdDocs[i].type === "sk_kemenkumham"
                ) {

                    response = await I.sendDeleteRequest("https://" + env + "-smb-user.otoku.io/api/v1/user/business/docs/7");

                } else if (

                    listIdDocs[i].type === "sk_kemenkumham_perubahan"
                ) {

                    response = await I.sendDeleteRequest("https://" + env + "-smb-user.otoku.io/api/v1/user/business/docs/9");

                } else if (

                    listIdDocs[i].type === "surat_pernyataan_perubahan_terakhir"
                ) {

                    response = await I.sendDeleteRequest("https://" + env + "-smb-user.otoku.io/api/v1/user/business/docs/10");

                }
            }

        }
    },

    async deletePartner(businessId) {

        I.haveRequestHeaders({
            Authorization: "basic NWY2NjdjMTJmYmJmNjlmNzAwZjdkYzgzNTg0ZTc5ZDI2MmEwODVjMmJmOTIxYzU2MzZjNzgzNTExYzIzNDFhYg=="
        });

        const responseDelete = await I.sendDeleteRequest("https://" + env + "-smb-user.otoku.io/api/v1/user/business/partners/all/" + businessId);

        I.seeResponseCodeIsSuccessful();

        return {
            status: responseDelete.status,
            data: responseDelete.data
        }

    },

    async deleteDeviceId(deviceId) {

        const responseDelete = await I.sendDeleteRequest(secret("https://" + env + "-smb-device.otoku.io/api/v1/device/smb-users/" + deviceId));

        I.seeResponseCodeIsSuccessful();

        return {
            status: responseDelete.status,
            data: responseDelete.data,
        };
    },

    async getTokenLogin() {
        I.haveRequestHeaders({
            Authorization: "basic NWY2NjdjMTJmYmJmNjlmNzAwZjdkYzgzNTg0ZTc5ZDI2MmEwODVjMmJmOTIxYzU2MzZjNzgzNTExYzIzNDFhYg=="
        });
        const responseLogin = await I.sendPostRequest("https://" + env + "-smb-user.otoku.io/api/v1/user/login", secret({
            userID: globalVariable.login.userID,
            password: globalVariable.login.password
        }));

        I.seeResponseCodeIsSuccessful();

        return {
            bearerToken: responseLogin.data.jwt.access_token
        }
    },

    async getTokenLoginPartner() {

        I.haveRequestHeaders({
            Authorization: "basic NWY2NjdjMTJmYmJmNjlmNzAwZjdkYzgzNTg0ZTc5ZDI2MmEwODVjMmJmOTIxYzU2MzZjNzgzNTExYzIzNDFhYg=="
        });

        const responseLogin = await I.sendPostRequest("https://" + env + "-smb-user.otoku.io/api/v1/user/login", secret({
            userID: globalVariable.login.userIDPartner,
            password: globalVariable.login.passwordPartner,
        }));

        I.seeResponseCodeIsSuccessful();

        return {
            bearerToken: responseLogin.data.jwt.access_token
        }
    },

    async resetDeviceId(deviceID) {

        I.haveRequestHeaders({
            Authorization: "basic NWY2NjdjMTJmYmJmNjlmNzAwZjdkYzgzNTg0ZTc5ZDI2MmEwODVjMmJmOTIxYzU2MzZjNzgzNTExYzIzNDFhYg=="
        });

        const responseLogin = await I.sendPostRequest("https://" + env + "-smb-user.otoku.io/api/v1/user/login", secret({
            userID: globalVariable.login.userID,
            password: globalVariable.login.password,
            deviceID: deviceID
        }));

        I.seeResponseCodeIsSuccessful();

        return {
            bearerToken: responseLogin.data.jwt.access_token
        }
    },

    async resetAttemptFailedLogin() {

        I.haveRequestHeaders({
            Authorization: "basic NWY2NjdjMTJmYmJmNjlmNzAwZjdkYzgzNTg0ZTc5ZDI2MmEwODVjMmJmOTIxYzU2MzZjNzgzNTExYzIzNDFhYg=="
        });

        const responseReset = await I.sendPostRequest("https://" + env + "-smb-user.otoku.io/api/v1/user/login/reset-attempts", secret({
            userID: globalVariable.login.userID,
        }));

        I.seeResponseCodeIsSuccessful();

        return {
            status: responseReset.status
        }
    },

    async resetAttemptFailedFaceMatch() {

        I.haveRequestHeaders({
            Authorization: "basic NWY2NjdjMTJmYmJmNjlmNzAwZjdkYzgzNTg0ZTc5ZDI2MmEwODVjMmJmOTIxYzU2MzZjNzgzNTExYzIzNDFhYg=="
        });

        const responseReset = await I.sendDeleteRequest("https://" + env + "-smb-user.otoku.io/api/v1/user/verify/selfie/" + globalVariable.login.userID);

        I.seeResponseCodeIsSuccessful();

        return {
            status: responseReset.status
        }
    },

    reloadPageAfterResetState() {
        headerPage.closePage();
        onboardingAccOpeningPage.clickRbProcessLater();
        onboardingAccOpeningPage.sendExitSurvey();
        onboardingAccOpeningPage.continueCompleteData();
    },

    reloadPageAfterResetStateInvitee() {
        headerPage.clickButtonBack();
        I.waitForElement(onboardingAccOpeningPage.buttons.next, 20);
        I.wait(1);
        onboardingAccOpeningPage.continueToKYC();
    },

    reloadPageUserInvitedAfterResetState() {
        headerPage.clickButtonBack();
        I.waitForText("Selanjutnya", 10);
        I.wait(1);
        I.click("Selanjutnya");
    },

    async getProductType() {

        const bearerToken = (await this.getTokenLogin()).bearerToken;

        I.amBearerAuthenticated(secret(bearerToken));

        const responseProfile = await I.sendGetRequest(secret("https://" + env + "-smb-user.otoku.io/api/v1/user/profile"));
        I.seeResponseCodeIsSuccessful();

        return {
            status: responseProfile.status,
            productType: responseProfile.data.productType,
        };

    },

    async getAccountType() {

        const bearerToken = (await this.getTokenLogin()).bearerToken;

        I.amBearerAuthenticated(secret(bearerToken));

        const responseProfile = await I.sendGetRequest(secret("https://" + env + "-smb-user.otoku.io/api/v1/user/profile"));
        I.seeResponseCodeIsSuccessful();

        return {
            status: responseProfile.status,
            accountType: responseProfile.data.accountCreationJourney.accountType,
        };

    },

    async getFullName() {

        const bearerToken = (await this.getTokenLogin()).bearerToken;

        I.amBearerAuthenticated(secret(bearerToken));

        const responseProfile = await I.sendGetRequest(secret("https://" + env + "-smb-user.otoku.io/api/v1/user/profile"));
        I.seeResponseCodeIsSuccessful();

        return {
            status: responseProfile.status,
            ktpName: responseProfile.data.profileKtp.ktpName,
        };

    },

    async getKTPNumber() {

        const bearerToken = (await this.getTokenLogin()).bearerToken;

        I.amBearerAuthenticated(secret(bearerToken));

        const responseProfile = await I.sendGetRequest(secret("https://" + env + "-smb-user.otoku.io/api/v1/user/profile"));
        I.seeResponseCodeIsSuccessful();

        return {
            status: responseProfile.status,
            ktpNumber: responseProfile.data.profileKtp.ktpNumber,
        };

    },

    async getPhoneNumber() {

        const bearerToken = (await this.getTokenLogin()).bearerToken;

        I.amBearerAuthenticated(secret(bearerToken));

        const responseProfile = await I.sendGetRequest(secret("https://" + env + "-smb-user.otoku.io/api/v1/user/profile"));
        I.seeResponseCodeIsSuccessful();

        return {
            status: responseProfile.status,
            phoneNumber: responseProfile.data.phoneNumber,
        };

    },

    async getEmail() {
        const bearerToken = (await this.getTokenLogin()).bearerToken;
        I.amBearerAuthenticated(secret(bearerToken));

        const responseProfile = await I.sendGetRequest(secret("https://" + env + "-smb-user.otoku.io/api/v1/user/profile"));
        I.seeResponseCodeIsSuccessful();

        return {
            status: responseProfile.status,
            email: responseProfile.data.email,
        };

    },

    async getAccountNumber() {

        const bearerToken = (await this.getTokenLogin()).bearerToken;

        I.amBearerAuthenticated(secret(bearerToken));

        const responseBusinessDetails = await I.sendGetRequest(secret("https://" + env + "-smb-user.otoku.io/api/v1/user/business/details"));
        I.seeResponseCodeIsSuccessful();

        return {
            status: responseBusinessDetails.status,
            accountNumber: responseBusinessDetails.data.accountNumber,
        };

    },

    async getCompanyName() {

        const bearerToken = (await this.getTokenLogin()).bearerToken;

        I.amBearerAuthenticated(secret(bearerToken));

        const responseBusinessDetails = await I.sendGetRequest(secret("https://" + env + "-smb-user.otoku.io/api/v1/user/business/details"));
        I.seeResponseCodeIsSuccessful();

        return {
            status: responseBusinessDetails.status,
            businessName: responseBusinessDetails.data.businessName,
        };

    },

    async getBusinessPartnerUserID() {

        const bearerToken = (await this.getTokenLogin()).bearerToken;

        I.amBearerAuthenticated(secret(bearerToken));

        const responseBusinessPartnerList = await I.sendGetRequest(secret("https://" + env + "-smb-user.otoku.io/api/v1/user/business/partners"));
        I.seeResponseCodeIsSuccessful();

        return {
            status: responseBusinessPartnerList.status,
            userIdPartner: responseBusinessPartnerList.data[0].userId,
        };

    },

    async isPendingTaskExist() {

        const bearerToken = (await this.getTokenLogin()).bearerToken;

        I.amBearerAuthenticated(secret(bearerToken));

        const responseBusinessDetails = await I.sendGetRequest(secret("https://" + env + "-smb-user.otoku.io/api/v1/user/business/details"));
        I.seeResponseCodeIsSuccessful();

        return {
            status: responseBusinessDetails.status,
            hasPendingTransaction: responseBusinessDetails.data.hasPendingTransaction,
        };

    },

    async deleteAllNotification() {

        const bearerToken = (await this.getTokenLogin()).bearerToken;

        I.amBearerAuthenticated(secret(bearerToken));

        const response = await I.sendDeleteRequest("https://" + env + "-smb-user.otoku.io/api/v1/notifications");

        return {
            status: response.status,
            data: response.data
        }

    },

    async deleteAllNotificationPartner() {

        const bearerToken = (await this.getTokenLoginPartner()).bearerToken;

        I.amBearerAuthenticated(secret(bearerToken));

        const response = await I.sendDeleteRequest("https://" + env + "-smb-user.otoku.io/api/v1/notifications");

        return {
            status: response.status,
            data: response.data
        }

    },

}