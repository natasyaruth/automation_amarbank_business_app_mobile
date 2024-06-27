const { I, globalVariable } = inject();

const env = globalVariable.returnEnvi();

module.exports = {

    idFlag: {
        checkDHNKTPDev: "f2aef6fc-522f-4afd-b9cc-d8145b19bc59",
        checkDHNNPWPDev: "a7e17480-e287-4e0b-9892-a8898a0dfb45",
        faceMatchDev: "f3ed6f27-e75f-46cf-bc10-d2068d384644",
        livenessDev: "667e3e77-db5e-48b1-a275-c8d90b632035",
        checkDHNKTPStg: "2b5f3d24-91bd-4aa3-a58c-fb87fb68c445",
        checkDHNNPWPStg: "6e85833c-4fed-43cc-b8b2-5a66fa23fb39",
        faceMatchStg: "6fe23a02-a1df-43a6-a29a-39e34d7d5b1a",
        livenessStg: "",
    },
    name: {
        checkDHNKTPDev: "[DEV] GOV Check DHN",
        checkDHNNPWPDev: "[DEV] Cek DHN",
        faceMatchDev: "[DEV] GOV Dukcapil Facematch",
        livenessDev: "[DEV] Biometric Verificator Liveness V2",
        checkDHNKTPStg: "[STG] GOV Check DHN",
        checkDHNNPWPStg: "[STG] Cek DHN",
        faceMatchStg: "[STAGING] GOV Dukcapil Facematch",
        livenessStg: "",
    },
    path: {
        checkDHNKTPDev: "/dev-gov/regulation/blacklist/([0-9]{16})/.*",
        checkDHNNPWPDev: "/dev-gov/dhn-verification",
        faceMatchDev: "/dev-gov/citizen/([0-9]{16})/face/recognize",
        livenessDev: "/dev-biover/liveness/check/smb-users/v2",
        checkDHNKTPStg: "/staging-gov/regulation/blacklist/([0-9]{16})/.*",
        checkDHNNPWPStg: "/staging-gov/dhn-verification",
        faceMatchStg: "/staging-gov/citizen/([0-9]{16})/face/recognize",
        livenessStg: "",
    },
    static: {
        endpoint: "http://10.10.8.54:5557",
        prefix: "/st-bifast-rintis"
    },
    body:{
        checkDHNKTP:"{\"result\":{\"match\": true,\"content\":[{\"nik\":\"3100030607000001\",\"fullName\":\"RUTH NATASYA\"}]},\"time\":\"2019-12-03 17:49:54\"\n}",
        checkDHNNPWP:"{\"blackListed\": true,\"data\":[{\"id\": \"6641ed9e2b058f393ee3eb98\",\"status\":\"A\",\"date\":\"2023-01-30T00:00:00.000Z\",\"periode\":\"01/02/21\","+
        "\"branchCode\":\"0001\",\"kiosk\":\"ASD\",\"departement\":\"QWE\",\"unit\":\"RTG\",\"bankCode\":\"LOMAIDJ\",\"bankName\":\"Bank Amar Indonesia\","+
        "\"inputReferenceNumber\":\"XYZASDFNHQ0987654321\",\"customerNumber\":\"01234567\",\"customerName\":\"Jonh Doe\",\"customerTitle\":\"S.T, M.T.\","+
        "\"customerIdNo\":\"3207130608950005\",\"customerTaxId\":\"123123123132\",\"customerDOB\":\"1991-01-10T00:00:00.000Z\",\"customerAddress\":\"Jln Merapi no 01\","+
        "\"customerAddressRT\":\"12\",\"customerAddressRW\":\"32\",\"customerCity\":\"Jakarta\",\"customerProvince\":\"Sumatera Selatan\",\"customerZipCode\":\"30127\","+
        "\"customerType\": \"A2\",\"description\":\"Lorem Ipsum\",\"customerAccountNumber\":\"312312\",\"internalAccountType\":\"102\",\"startDate\":\"2023-05-31T17:00:00.000Z\","+
        "\"endDate\":\"2023-07-01T00:00:00.000Z\",\"createdAt\":\"2020-01-21T15:47:44.000Z\",\"updatedAt\":\"2020-01-22T15:47:44.000Z\"}]}",
        faceMatchError: "",
        faceMatchSuccess: "{\"Code\": \"200\",\"StatusCode\": 200,\"Err\": null,\"Data\": {\"error\": null,\"httpResponseCode\": 200,\"matchScore\": \"19\","+
        "\"quotaLimiter\": 999,\"transactionId\": \"19949233830239239\",\"uid\": \"7301010209680001\",\"verificationResult\": true}}",
        livenessDark: "{\"valid\": false,\"by\": \"verihubs\",\"rawScores\": {\"verihubs\": 0.3},\"times\": {\"verihubs\": \"2023-09-13T13:41:21.1317781+07:00\"},"+
        "\"errors\": null,\"rotation\": 0,\"boundingBox\": {\"topLeftX\": 0.9,\"topLeftY\": 0.9,\"bottomRightX\": 0.9,\"bottomRightY\": 0.9,\"width\": 0.9,"+
        "\"height\": 0.9},\"faceLandmark\": {\"leftEyeX\": 0.9,\"leftEyeY\": 0.9,\"rightEyeX\": 0.9,\"rightEyeY\": 0.9,\"noseX\": 0.9,\"noseY\": 0.9,"+
        "\"mouthLeftX\": 0.9,\"mouthLeftY\": 0.9,\"mouthRightX\": 0.9,\"mouthRightY\": 0.9},\"attributes\": {\"sunglassesOn\": false,\"maskOn\": false,\"veilOn\": false},"+
        "\"imageQuality\": {\"blur\": false,\"dark\": true,\"darkScore\": 0.6,\"grayscale\": false},\"liveness\": {\"status\": false,\"probability\": 0.3}}",
        livenessBlur: "{\"valid\": false,\"by\": \"verihubs\",\"rawScores\": {\"verihubs\": 0.3},\"times\": {\"verihubs\": \"2023-09-13T13:41:21.1317781+07:00\"},"+
        "\"errors\": null,\"rotation\": 0,\"boundingBox\": {\"topLeftX\": 0.9,\"topLeftY\": 0.9,\"bottomRightX\": 0.9,\"bottomRightY\": 0.9,\"width\": 0.9,"+
        "\"height\": 0.9},\"faceLandmark\": {\"leftEyeX\": 0.9,\"leftEyeY\": 0.9,\"rightEyeX\": 0.9,\"rightEyeY\": 0.9,\"noseX\": 0.9,\"noseY\": 0.9,"+
        "\"mouthLeftX\": 0.9,\"mouthLeftY\": 0.9,\"mouthRightX\": 0.9,\"mouthRightY\": 0.9},\"attributes\": {\"sunglassesOn\": false,\"maskOn\": false,\"veilOn\": false},"+
        "\"imageQuality\": {\"blur\": true,\"blurScore\": 0.6,\"dark\": false,\"grayscale\": false},\"liveness\": {\"status\": false,\"probability\": 0.3}}",
        livenessBlurAndDark: "{\"valid\": false,\"by\": \"verihubs\",\"rawScores\": {\"verihubs\": 0.3},\"times\": {\"verihubs\": \"2023-09-13T13:41:21.1317781+07:00\"},"+
        "\"errors\": null,\"rotation\": 0,\"boundingBox\": {\"topLeftX\": 0.9,\"topLeftY\": 0.9,\"bottomRightX\": 0.9,\"bottomRightY\": 0.9,\"width\": 0.9,"+
        "\"height\": 0.9},\"faceLandmark\": {\"leftEyeX\": 0.9,\"leftEyeY\": 0.9,\"rightEyeX\": 0.9,\"rightEyeY\": 0.9,\"noseX\": 0.9,\"noseY\": 0.9,"+
        "\"mouthLeftX\": 0.9,\"mouthLeftY\": 0.9,\"mouthRightX\": 0.9,\"mouthRightY\": 0.9},\"attributes\": {\"sunglassesOn\": false,\"maskOn\": false,\"veilOn\": false},"+
        "\"imageQuality\": {\"blur\": true,\"blurScore\": 0.6,\"dark\": true,\"darkScore\": 0.6,\"grayscale\": false},\"liveness\": {\"status\": false,\"probability\": 0.3}}",
        livenessFaceIsNotDetected: "{\"code\": 1102,\"message\": \"Face not detected in image\",\"messageKey\": \"err.invalid.parameter\",\"values\": {"+
        "\"internalCode\": 0,\"status\": 0}}",
        livenessSuccess: "{\"valid\": true,\"by\": \"verihubs\",\"rawScores\": {\"verihubs\": 100},\"times\": {\"verihubs\": \"2023-09-13T13:41:21.1317781+07:00\"},"+
        "\"errors\": null,\"rotation\": 3,\"boundingBox\": {\"topLeftX\": 107.69689178466797,\"topLeftY\": 16.787113189697266,\"bottomRightX\": 144.38543701171875,"+
        "\"bottomRightY\": 69.24873352050781,\"width\": 36.68854522705078,\"height\": 52.46162033081055},\"faceLandmark\": {\"leftEyeX\": 113.55226135253906,"+
        "\"leftEyeY\": 37.215999603271484,\"rightEyeX\": 130.2599639892578,\"rightEyeY\": 38.250545501708984,\"noseX\": 118.09809112548828,\"noseY\": 46.43742370605469,"+
        "\"mouthLeftX\": 113.84989166259766,\"mouthLeftY\": 56.04047775268555,\"mouthRightX\": 126.98597717285156,\"mouthRightY\": 56.930213928222656},\"attributes\": {"+
        "\"sunglassesOn\": false,\"maskOn\": false,\"veilOn\": false},\"imageQuality\": {\"blur\": false,\"dark\": false,\"grayscale\": false},\"liveness\": {\"status\": true,"+
        "\"probability\": 100}}",
        livenessError: "{\"code\": 1100,\"message\": \"internal server error\",\"messageKey\": \"err.system.service.unavailable\"}",
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

    async livenessError() {

        let response;

        if (
            env === "dev"
        ) {
            response = I.sendPutRequest("https://dev-smb-wiremock-server-svc.otoku.io/stub/" + this.idFlag.livenessDev, {
                id: this.idFlag.livenessDev,
                name: this.name.livenessDev,
                endpoint: this.static.endpoint,
                prefix: this.static.prefix,
                path: this.path.livenessDev,
                method: "ANY",
                tags: [
                    ""
                ],
                isRegex: false,
                enabled: true,
                request: {
                    patternType: "null",
                    header: "null",
                    body: "null"
                },
                response: {
                    statusCode: 500,
                    fault: {
                        type: "",
                        value: ""
                    },
                    header: "null",
                    body: this.body.livenessError
                }
            });
        } else if (
            env === "staging"
        ) {
            response = I.sendPutRequest("https://dev-smb-wiremock-server-svc.otoku.io/stub/" + this.idFlag.livenessStg, {
                id: this.idFlag.livenessStg,
                name: this.name.livenessStg,
                endpoint: this.static.endpoint,
                prefix: this.static.prefix,
                path: this.path.livenessStg,
                method: "ANY",
                tags: [
                    ""
                ],
                isRegex: false,
                enabled: true,
                request: {
                    patternType: "null",
                    header: "null",
                    body: "null"
                },
                response: {
                    statusCode: 500,
                    fault: {
                        type: "",
                        value: ""
                    },
                    header: "null",
                    body: this.body.livenessError
                }
            });
        }

        I.seeResponseCodeIsSuccessful();

        return {
            status: response.status,
            data: response.data,
        }
    },

    async livenessSuccess() {

        let response;

        if (
            env === "dev"
        ) {
            response = I.sendPutRequest("https://dev-smb-wiremock-server-svc.otoku.io/stub/" + this.idFlag.livenessDev, {
                id: this.idFlag.livenessDev,
                name: this.name.livenessDev,
                endpoint: this.static.endpoint,
                prefix: this.static.prefix,
                path: this.path.livenessDev,
                method: "ANY",
                tags: [
                    ""
                ],
                isRegex: false,
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
                    body: this.body.livenessSuccess
                }
            });
        } else if (
            env === "staging"
        ) {
            response = I.sendPutRequest("https://dev-smb-wiremock-server-svc.otoku.io/stub/" + this.idFlag.livenessStg, {
                id: this.idFlag.livenessStg,
                name: this.name.livenessStg,
                endpoint: this.static.endpoint,
                prefix: this.static.prefix,
                path: this.path.livenessStg,
                method: "ANY",
                tags: [
                    ""
                ],
                isRegex: false,
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
                    body: this.body.livenessSuccess
                }
            });
        }

        I.seeResponseCodeIsSuccessful();

        return {
            status: response.status,
            data: response.data,
        }
    },

    async livenessFaceBlur() {

        let response;

        if (
            env === "dev"
        ) {
            response = I.sendPutRequest("https://dev-smb-wiremock-server-svc.otoku.io/stub/" + this.idFlag.livenessDev, {
                id: this.idFlag.livenessDev,
                name: this.name.livenessDev,
                endpoint: this.static.endpoint,
                prefix: this.static.prefix,
                path: this.path.livenessDev,
                method: "ANY",
                tags: [
                    ""
                ],
                isRegex: false,
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
                    body: this.body.livenessBlur
                }
            });
        } else if (
            env === "staging"
        ) {
            response = I.sendPutRequest("https://dev-smb-wiremock-server-svc.otoku.io/stub/" + this.idFlag.livenessStg, {
                id: this.idFlag.livenessStg,
                name: this.name.livenessStg,
                endpoint: this.static.endpoint,
                prefix: this.static.prefix,
                path: this.path.livenessStg,
                method: "ANY",
                tags: [
                    ""
                ],
                isRegex: false,
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
                    body: this.body.livenessBlur
                }
            });
        }

        I.seeResponseCodeIsSuccessful();

        return {
            status: response.status,
            data: response.data,
        }
    },

    async livenessFaceDark() {

        let response;

        if (
            env === "dev"
        ) {
            response = I.sendPutRequest("https://dev-smb-wiremock-server-svc.otoku.io/stub/" + this.idFlag.livenessDev, {
                id: this.idFlag.livenessDev,
                name: this.name.livenessDev,
                endpoint: this.static.endpoint,
                prefix: this.static.prefix,
                path: this.path.livenessDev,
                method: "ANY",
                tags: [
                    ""
                ],
                isRegex: false,
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
                    body: this.body.livenessDark
                }
            });
        } else if (
            env === "staging"
        ) {
            response = I.sendPutRequest("https://dev-smb-wiremock-server-svc.otoku.io/stub/" + this.idFlag.livenessStg, {
                id: this.idFlag.livenessStg,
                name: this.name.livenessStg,
                endpoint: this.static.endpoint,
                prefix: this.static.prefix,
                path: this.path.livenessStg,
                method: "ANY",
                tags: [
                    ""
                ],
                isRegex: false,
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
                    body: this.body.livenessDark
                }
            });
        }

        I.seeResponseCodeIsSuccessful();

        return {
            status: response.status,
            data: response.data,
        }
    },

    async livenessFaceBlurAndDark() {

        let response;

        if (
            env === "dev"
        ) {
            response = I.sendPutRequest("https://dev-smb-wiremock-server-svc.otoku.io/stub/" + this.idFlag.livenessDev, {
                id: this.idFlag.livenessDev,
                name: this.name.livenessDev,
                endpoint: this.static.endpoint,
                prefix: this.static.prefix,
                path: this.path.livenessDev,
                method: "ANY",
                tags: [
                    ""
                ],
                isRegex: false,
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
                    body: this.body.livenessBlurAndDark
                }
            });
        } else if (
            env === "staging"
        ) {
            response = I.sendPutRequest("https://dev-smb-wiremock-server-svc.otoku.io/stub/" + this.idFlag.livenessStg, {
                id: this.idFlag.livenessStg,
                name: this.name.livenessStg,
                endpoint: this.static.endpoint,
                prefix: this.static.prefix,
                path: this.path.livenessStg,
                method: "ANY",
                tags: [
                    ""
                ],
                isRegex: false,
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
                    body: this.body.livenessBlurAndDark
                }
            });
        }

        I.seeResponseCodeIsSuccessful();

        return {
            status: response.status,
            data: response.data,
        }
    },

    async livenessFaceNotDetected() {

        let response;

        if (
            env === "dev"
        ) {
            response = I.sendPutRequest("https://dev-smb-wiremock-server-svc.otoku.io/stub/" + this.idFlag.livenessDev, {
                id: this.idFlag.livenessDev,
                name: this.name.livenessDev,
                endpoint: this.static.endpoint,
                prefix: this.static.prefix,
                path: this.path.livenessDev,
                method: "ANY",
                tags: [
                    ""
                ],
                isRegex: false,
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
                    body: this.body.livenessFaceIsNotDetected
                }
            });
        } else if (
            env === "staging"
        ) {
            response = I.sendPutRequest("https://dev-smb-wiremock-server-svc.otoku.io/stub/" + this.idFlag.livenessStg, {
                id: this.idFlag.livenessStg,
                name: this.name.livenessStg,
                endpoint: this.static.endpoint,
                prefix: this.static.prefix,
                path: this.path.livenessStg,
                method: "ANY",
                tags: [
                    ""
                ],
                isRegex: false,
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
                    body: this.body.livenessFaceIsNotDetected
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