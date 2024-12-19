const { I, headerPage, onboardingAccOpeningPage, globalVariable, getDataDao } = inject();
const env = globalVariable.returnEnvi();

module.exports = {

    async resetStateFlow(userID, password, stateNumber) {

        const bearerToken = (await this.getTokenLogin(userID, password)).bearerToken;

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

    async deleteOtherDoc(userID, password) {

        const bearerToken = (await this.getTokenLogin(userID, password)).bearerToken;

        I.amBearerAuthenticated(secret(bearerToken));

        const response = await I.sendDeleteRequest("https://" + env + "-smb-user.otoku.io//api/v1/drive/media/delete/all");

        return {
            status: response.status,
            data: response.data
        }

    },

    async deleteAllDocuments(userID, password) {

        const listIdDocs = (await getDataDao.getListDocBusiness(userID, password)).listDocBusiness;

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

    async getTokenLogin(userID, password) {
        I.haveRequestHeaders({
            Authorization: "basic NWY2NjdjMTJmYmJmNjlmNzAwZjdkYzgzNTg0ZTc5ZDI2MmEwODVjMmJmOTIxYzU2MzZjNzgzNTExYzIzNDFhYg=="
        });
        const responseLogin = await I.sendPostRequest("https://" + env + "-smb-user.otoku.io/api/v1/user/login", secret({
            userID: userID,
            password: password
        }));

        I.seeResponseCodeIsSuccessful();

        return {
            bearerToken: responseLogin.data.jwt.access_token
        }
    },

    async getTokenLoginPartner(userIDPartner, passwordPartner) {

        I.haveRequestHeaders({
            Authorization: "basic NWY2NjdjMTJmYmJmNjlmNzAwZjdkYzgzNTg0ZTc5ZDI2MmEwODVjMmJmOTIxYzU2MzZjNzgzNTExYzIzNDFhYg=="
        });

        const responseLogin = await I.sendPostRequest("https://" + env + "-smb-user.otoku.io/api/v1/user/login", secret({
            userID: userIDPartner,
            password: passwordPartner,
        }));

        I.seeResponseCodeIsSuccessful();

        return {
            bearerToken: responseLogin.data.jwt.access_token
        }
    },

    async resetDeviceId(userID, password, deviceID) {

        I.haveRequestHeaders({
            Authorization: "basic NWY2NjdjMTJmYmJmNjlmNzAwZjdkYzgzNTg0ZTc5ZDI2MmEwODVjMmJmOTIxYzU2MzZjNzgzNTExYzIzNDFhYg=="
        });

        const responseLogin = await I.sendPostRequest("https://" + env + "-smb-user.otoku.io/api/v1/user/login", secret({
            userID: userID,
            password: password,
            deviceID: deviceID
        }));

        I.seeResponseCodeIsSuccessful();

        return {
            bearerToken: responseLogin.data.jwt.access_token
        }
    },

    async resetAttemptFailedLogin(userID) {

        I.haveRequestHeaders({
            Authorization: "basic NWY2NjdjMTJmYmJmNjlmNzAwZjdkYzgzNTg0ZTc5ZDI2MmEwODVjMmJmOTIxYzU2MzZjNzgzNTExYzIzNDFhYg=="
        });

        const responseReset = await I.sendPostRequest("https://" + env + "-smb-user.otoku.io/api/v1/user/login/reset-attempts", secret({
            userID: userID,
        }));

        I.seeResponseCodeIsSuccessful();

        return {
            status: responseReset.status
        }
    },

    async resetAttemptFailedFaceMatch(userID) {

        I.haveRequestHeaders({
            Authorization: "basic NWY2NjdjMTJmYmJmNjlmNzAwZjdkYzgzNTg0ZTc5ZDI2MmEwODVjMmJmOTIxYzU2MzZjNzgzNTExYzIzNDFhYg=="
        });

        const responseReset = await I.sendDeleteRequest("https://" + env + "-smb-user.otoku.io/api/v1/user/verify/selfie/" + userID);

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

    async getProductType(userID, password) {

        const bearerToken = (await this.getTokenLogin(userID, password)).bearerToken;

        I.amBearerAuthenticated(secret(bearerToken));

        const responseProfile = await I.sendGetRequest(secret("https://" + env + "-smb-user.otoku.io/api/v1/user/profile"));
        I.seeResponseCodeIsSuccessful();

        return {
            status: responseProfile.status,
            productType: responseProfile.data.productType,
        };

    },

    async getAccountType(userID, password) {

        const bearerToken = (await this.getTokenLogin(userID, password)).bearerToken;

        I.amBearerAuthenticated(secret(bearerToken));

        const responseProfile = await I.sendGetRequest(secret("https://" + env + "-smb-user.otoku.io/api/v1/user/profile"));
        I.seeResponseCodeIsSuccessful();

        return {
            status: responseProfile.status,
            accountType: responseProfile.data.accountCreationJourney.accountType,
        };

    },

    async getFullName(userID, password) {

        const bearerToken = (await this.getTokenLogin(userID, password)).bearerToken;

        I.amBearerAuthenticated(secret(bearerToken));

        const responseProfile = await I.sendGetRequest(secret("https://" + env + "-smb-user.otoku.io/api/v1/user/profile"));
        I.seeResponseCodeIsSuccessful();

        return {
            status: responseProfile.status,
            ktpName: responseProfile.data.profileKtp.ktpName,
        };

    },

    async getKTPNumber(userID, password) {

        const bearerToken = (await this.getTokenLogin(userID, password)).bearerToken;

        I.amBearerAuthenticated(secret(bearerToken));

        const responseProfile = await I.sendGetRequest(secret("https://" + env + "-smb-user.otoku.io/api/v1/user/profile"));
        I.seeResponseCodeIsSuccessful();

        return {
            status: responseProfile.status,
            ktpNumber: responseProfile.data.profileKtp.ktpNumber,
        };

    },

    async getPhoneNumber(userID, password) {

        const bearerToken = (await this.getTokenLogin(userID, password)).bearerToken;

        I.amBearerAuthenticated(secret(bearerToken));

        const responseProfile = await I.sendGetRequest(secret("https://" + env + "-smb-user.otoku.io/api/v1/user/profile"));
        I.seeResponseCodeIsSuccessful();

        return {
            status: responseProfile.status,
            phoneNumber: responseProfile.data.phoneNumber,
        };

    },

    async getEmail(userID, password) {
        const bearerToken = (await this.getTokenLogin(userID, password)).bearerToken;
        I.amBearerAuthenticated(secret(bearerToken));

        const responseProfile = await I.sendGetRequest(secret("https://" + env + "-smb-user.otoku.io/api/v1/user/profile"));
        I.seeResponseCodeIsSuccessful();

        return {
            status: responseProfile.status,
            email: responseProfile.data.email,
        };

    },

    async getAccountNumber(userID, password) {

        const bearerToken = (await this.getTokenLogin(userID, password)).bearerToken;

        I.amBearerAuthenticated(secret(bearerToken));

        const responseBusinessDetails = await I.sendGetRequest(secret("https://" + env + "-smb-user.otoku.io/api/v1/user/business/details"));
        I.seeResponseCodeIsSuccessful();

        return {
            status: responseBusinessDetails.status,
            accountNumber: responseBusinessDetails.data.accountNumber,
        };

    },

    async getCompanyName(userID, password) {

        const bearerToken = (await this.getTokenLogin(userID, password)).bearerToken;

        I.amBearerAuthenticated(secret(bearerToken));

        const responseBusinessDetails = await I.sendGetRequest(secret("https://" + env + "-smb-user.otoku.io/api/v1/user/business/details"));
        I.seeResponseCodeIsSuccessful();

        return {
            status: responseBusinessDetails.status,
            businessName: responseBusinessDetails.data.businessName,
        };

    },

    async getBusinessPartnerUserID(userID, password) {

        const bearerToken = (await this.getTokenLogin(userID, password)).bearerToken;

        I.amBearerAuthenticated(secret(bearerToken));

        const responseBusinessPartnerList = await I.sendGetRequest(secret("https://" + env + "-smb-user.otoku.io/api/v1/user/business/partners"));
        I.seeResponseCodeIsSuccessful();

        return {
            status: responseBusinessPartnerList.status,
            userIdPartner: responseBusinessPartnerList.data[0].userId,
        };

    },

    async isPendingTaskExist(userID, password) {

        const bearerToken = (await this.getTokenLogin(userID, password)).bearerToken;

        I.amBearerAuthenticated(secret(bearerToken));

        const responseBusinessDetails = await I.sendGetRequest(secret("https://" + env + "-smb-user.otoku.io/api/v1/user/business/details"));
        I.seeResponseCodeIsSuccessful();

        return {
            status: responseBusinessDetails.status,
            hasPendingTransaction: responseBusinessDetails.data.hasPendingTransaction,
        };

    },

    async deleteAllNotification(userID, password) {

        const bearerToken = (await this.getTokenLogin(userID, password)).bearerToken;

        I.amBearerAuthenticated(secret(bearerToken));

        const response = await I.sendDeleteRequest("https://" + env + "-smb-user.otoku.io/api/v1/notifications");

        return {
            status: response.status,
            data: response.data
        }

    },

    async deleteAllNotificationPartner(userIDPartner, passwordPartner) {

        const bearerToken = (await this.getTokenLoginPartner(userIDPartner, passwordPartner)).bearerToken;

        I.amBearerAuthenticated(secret(bearerToken));

        const response = await I.sendDeleteRequest("https://" + env + "-smb-user.otoku.io/api/v1/notifications");

        return {
            status: response.status,
            data: response.data
        }

    },

    async submitPDP(userID, password) {

        const bearerToken = (await this.getTokenLogin(userID, password)).bearerToken;

        I.amBearerAuthenticated(secret(bearerToken));

        const response = await I.sendPostRequest("https://" + env + "-smb-user.otoku.io/api/v1/user/pdp", {
            pdpConsent: true,
            receivedInfoProduct: true
        });

        return {
            status: response.status,
            data: response.data
        }

    },

    async deleteListPendingTask(userID, password) {

        const bearerToken = (await this.getTokenLogin(userID, password)).bearerToken;

        I.amBearerAuthenticated(secret(bearerToken));

        const response = await I.sendDeleteRequest("https://" + env + "-smb-user.otoku.io/api/v1/user/pending-task");

        return {
            status: response.status,
            data: response.data
        }

    },

    async resetEmailFromRegisterInvitee(email) {

        I.haveRequestHeaders({
            Authorization: "basic NWY2NjdjMTJmYmJmNjlmNzAwZjdkYzgzNTg0ZTc5ZDI2MmEwODVjMmJmOTIxYzU2MzZjNzgzNTExYzIzNDFhYg=="
        });

        const response = await I.sendDeleteRequest("https://" + env + "-smb-user.otoku.io/api/v1/reset/email/partner/"+email);

        return {
            status: response.status,
            data: response.data
        }

    },

    async deleteAllDocInTrash(userID, password) {

        const bearerToken = (await this.getTokenLogin(userID, password)).bearerToken;

        I.amBearerAuthenticated(secret(bearerToken));

        const response = await I.sendDeleteRequest("https://" + env + "-smb-user.otoku.io/api/v1/drive/media/trash/delete/all");

        return {
            status: response.status,
            data: response.data
        }

    },

}