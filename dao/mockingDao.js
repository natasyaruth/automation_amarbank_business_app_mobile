const { I, globalVariable } = inject();

const env = globalVariable.returnEnvi();

module.exports = {

    idFlag: {
        checkDHNKTPDev: "f2aef6fc-522f-4afd-b9cc-d8145b19bc59",
        checkDHNNPWPDev: "a7e17480-e287-4e0b-9892-a8898a0dfb45",
        checkDHNKTPStg: "2b5f3d24-91bd-4aa3-a58c-fb87fb68c445",
        checkDHNNPWPStg: "6e85833c-4fed-43cc-b8b2-5a66fa23fb39",
    },
    name: {
        checkDHNKTPDev: "[DEV] GOV Check DHN",
        checkDHNNPWPDev: "[DEV] Cek DHN",
        checkDHNKTPStg: "[STG] GOV Check DHN",
        checkDHNNPWPStg: "[STG] Cek DHN",
    },
    path: {
        checkDHNKTPDev: "/dev-gov/regulation/blacklist/([0-9]{16})/.*",
        checkDHNNPWPDev: "/dev-gov/dhn-verification",
        checkDHNKTPStg: "/staging-gov/regulation/blacklist/([0-9]{16})/.*",
        checkDHNNPWPStg: "/staging-gov/dhn-verification",
    },
    static: {
        endpoint: "http://10.10.8.54:5557",
        prefix: "/st-bifast-rintis"
    },
    body:{
        checkDHNKTP:"{\"result\":{\"match\": true,\"content\":[{\"nik\":\"3100030607000001\",\"fullName\":\"RUTH NATASYA\"}]},\"time\":\"2019-12-03 17:49:54\"\n}",
        checkDHNNPWP:"{\"blackListed\": true,\"data\":[{\"id\": \"6641ed9e2b058f393ee3eb98\",\"status\":\"A\",\"date\":\"2023-01-30T00:00:00.000Z\",\"periode\":\"01/02/21\",\"branchCode\":\"0001\",\"kiosk\":\"ASD\",\"departement\":\"QWE\",\"unit\":\"RTG\",\"bankCode\":\"LOMAIDJ\",\"bankName\":\"Bank Amar Indonesia\",\"inputReferenceNumber\":\"XYZASDFNHQ0987654321\",\"customerNumber\":\"01234567\",\"customerName\":\"Jonh Doe\",\"customerTitle\":\"S.T, M.T.\",\"customerIdNo\":\"3207130608950005\",\"customerTaxId\":\"123123123132\",\"customerDOB\":\"1991-01-10T00:00:00.000Z\",\"customerAddress\":\"Jln Merapi no 01\",\"customerAddressRT\":\"12\",\"customerAddressRW\":\"32\",\"customerCity\":\"Jakarta\",\"customerProvince\":\"Sumatera Selatan\",\"customerZipCode\":\"30127\",\"customerType\": \"A2\",\"description\":\"Lorem Ipsum\",\"customerAccountNumber\":\"312312\",\"internalAccountType\":\"102\",\"startDate\":\"2023-05-31T17:00:00.000Z\",\"endDate\":\"2023-07-01T00:00:00.000Z\",\"createdAt\":\"2020-01-21T15:47:44.000Z\",\"updatedAt\":\"2020-01-22T15:47:44.000Z\"}]}"
    },

    async enabledCheckDHNKTP() {

        let response;

        if (
            env === "dev"
        ) {
            response = I.sendPutRequest("https://dev-smb-wiremock-server-svc.otoku.io/stub/" + this.idFlag.checkDHNKTPDev, {
                id: this.idFlag.checkDHNKTPDev,
                name: this.name.checkDHNKTPDev,
                endpoint: this.static.endpoint,
                prefix: this.static.prefix,
                path: this.path.checkDHNKTPDev,
                method: "GET",
                tags: [
                    ""
                ],
                isRegex: true,
                enabled: true,
                request: {
                    patternType: "null",
                    header: "null",
                    body: "null"
                },
                response: {
                    statusCode: 200,
                    fault: {
                        type: "",
                        value: ""
                    },
                    header: "null",
                    body: this.body.checkDHNKTP
                }
            });
        } else if (
            env === "staging"
        ) {
            response = I.sendPutRequest("https://dev-smb-wiremock-server-svc.otoku.io/stub/" + this.idFlag.checkDHNKTPStg, {
                id: this.idFlag.checkDHNKTPStg,
                name: this.name.checkDHNKTPStg,
                endpoint: this.static.endpoint,
                prefix: this.static.prefix,
                path: this.path.checkDHNKTPStg,
                method: "GET",
                tags: [
                    ""
                ],
                isRegex: true,
                enabled: true,
                request: {
                    patternType: "null",
                    header: "null",
                    body: "null"
                },
                response: {
                    statusCode: 200,
                    fault: {
                        type: "",
                        value: ""
                    },
                    header: "null",
                    body: this.body.checkDHNKTP
                }
            });
        }

        I.seeResponseCodeIsSuccessful();

        return {
            status: response.status,
            data: response.data,
        }
    },

    async disabledCheckDHNKTP() {

        let response;

        if (
            env === "dev"
        ) {
            response = I.sendPutRequest("https://dev-smb-wiremock-server-svc.otoku.io/stub/" + this.idFlag.checkDHNKTPDev, {
                id: this.idFlag.checkDHNKTPDev,
                name: this.name.checkDHNKTPDev,
                endpoint: this.static.endpoint,
                prefix: this.static.prefix,
                path: this.path.checkDHNKTPDev,
                method: "GET",
                tags: [
                    ""
                ],
                isRegex: true,
                enabled: false,
                request: {
                    patternType: "null",
                    header: "null",
                    body: "null"
                },
                response: {
                    statusCode: 200,
                    fault: {
                        type: "",
                        value: ""
                    },
                    header: "null",
                    body: this.body.checkDHNKTP
                }

            });
        } else if (
            env === "staging"
        ) {
            response = I.sendPutRequest("https://dev-smb-wiremock-server-svc.otoku.io/stub/" + this.idFlag.checkDHNKTPStg, {
                id: this.idFlag.checkDHNKTPStg,
                name: this.name.checkDHNKTPStg,
                endpoint: this.static.endpoint,
                prefix: this.static.prefix,
                path: this.path.checkDHNKTPStg,
                method: "GET",
                tags: [
                    ""
                ],
                isRegex: true,
                enabled: false,
                request: {
                    patternType: "null",
                    header: "null",
                    body: "null"
                },
                response: {
                    statusCode: 200,
                    fault: {
                        type: "",
                        value: ""
                    },
                    header: "null",
                    body: this.body.checkDHNKTP
                }
            });
        }

        I.seeResponseCodeIsSuccessful();

        return {
            status: response.status,
            data: response.data,
        }
    },

    async enabledCheckDHNNPWP() {

        let response;

        if (
            env === "dev"
        ) {
            response = I.sendPutRequest("https://dev-smb-wiremock-server-svc.otoku.io/stub/" + this.idFlag.checkDHNNPWPDev, {
                id: this.idFlag.checkDHNNPWPDev,
                name: this.name.checkDHNNPWPDev,
                endpoint: this.static.endpoint,
                prefix: this.static.prefix,
                path: this.path.checkDHNNPWPDev,
                method: "POST",
                tags: [
                    ""
                ],
                isRegex: true,
                enabled: true,
                request: {
                    patternType: "null",
                    header: "null",
                    body: "null"
                },
                response: {
                    statusCode: 200,
                    fault: {
                        type: "",
                        value: ""
                    },
                    header: "null",
                    body: this.body.checkDHNNPWP
                }
            });
        } else if (
            env === "staging"
        ) {
            response = I.sendPutRequest("https://dev-smb-wiremock-server-svc.otoku.io/stub/" + this.idFlag.checkDHNNPWPStg, {
                id: this.idFlag.checkDHNNPWPStg,
                name: this.name.checkDHNNPWPStg,
                endpoint: this.static.endpoint,
                prefix: this.static.prefix,
                path: this.path.checkDHNNPWPStg,
                method: "POST",
                tags: [
                    ""
                ],
                isRegex: true,
                enabled: true,
                request: {
                    patternType: "null",
                    header: "null",
                    body: "null"
                },
                response: {
                    statusCode: 200,
                    fault: {
                        type: "",
                        value: ""
                    },
                    header: "null",
                    body: this.body.checkDHNNPWP
                }
            });
        }

        I.seeResponseCodeIsSuccessful();

        return {
            status: response.status,
            data: response.data,
        }
    },

    async disabledCheckDHNNPWP() {

        let response;

        if (
            env === "dev"
        ) {
            response = I.sendPutRequest("https://dev-smb-wiremock-server-svc.otoku.io/stub/" + this.idFlag.checkDHNNPWPDev, {
                id: this.idFlag.checkDHNNPWPDev,
                name: this.name.checkDHNNPWPDev,
                endpoint: this.static.endpoint,
                prefix: this.static.prefix,
                path: this.path.checkDHNNPWPDev,
                method: "POST",
                tags: [
                    ""
                ],
                isRegex: true,
                enabled: false,
                request: {
                    patternType: "null",
                    header: "null",
                    body: "null"
                },
                response: {
                    statusCode: 200,
                    fault: {
                        type: "",
                        value: ""
                    },
                    header: "null",
                    body: this.body.checkDHNNPWP
                }
            });
        } else if (
            env === "staging"
        ) {
            response = I.sendPutRequest("https://dev-smb-wiremock-server-svc.otoku.io/stub/" + this.idFlag.checkDHNNPWPStg, {
                id: this.idFlag.checkDHNNPWPStg,
                name: this.name.checkDHNNPWPStg,
                endpoint: this.static.endpoint,
                prefix: this.static.prefix,
                path: this.path.checkDHNNPWPStg,
                method: "POST",
                tags: [
                    ""
                ],
                isRegex: true,
                enabled: false,
                request: {
                    patternType: "null",
                    header: "null",
                    body: "null"
                },
                response: {
                    statusCode: 200,
                    fault: {
                        type: "",
                        value: ""
                    },
                    header: "null",
                    body: this.body.checkDHNNPWP
                }
            });
        }

        I.seeResponseCodeIsSuccessful();

        return {
            status: response.status,
            data: response.data,
        }
    },

}