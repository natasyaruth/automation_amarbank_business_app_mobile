const { I, resetStateDao, globalVariable } = inject();

const env = globalVariable.returnEnvi();

module.exports = {

    idFlag: {
        checkDHNKTP: "f2aef6fc-522f-4afd-b9cc-d8145b19bc59",
        checkDHNNPWP: "",
    },
    name: {
        checkDHNKTP: "[DEV] GOV Check DHN",
        checkDHNNPWP: "",
    },
    path:{
        checkDHNKTP: "/dev-gov/regulation/blacklist/([0-9]{16})/.*",
        checkDHNNPWP: "",
    },
    static:{
        endpoint: "http://10.10.8.54:5557",
        prefix: "/st-bifast-rintis"
    },

    async enabledCheckDHNKTP() {

        const response = I.sendPutRequest("https://" + env + "-smb-wiremock-server-svc.otoku.io/stub/" + this.idFlag.checkDHNKTP, {
            id: this.idFlag.checkDHNKTP,
            name: this.name.checkDHNKTP,
            endpoint: this.static.endpoint,
            prefix: this.static.prefix,
            path: this.path.checkDHNKTP,
            method: "GET",
            enabled: true
        });

        I.seeResponseCodeIsSuccessful();

        return{
            status: response.status,
            data: response.data,
        }
    },

    async disabledCheckDHNKTP() {

        const response = I.sendPutRequest("https://" + env + "-smb-wiremock-server-svc.otoku.io/stub/" + this.idFlag.checkDHNKTP, {
            id: this.idFlag.checkDHNKTP,
            name: this.name.checkDHNKTP,
            endpoint: this.static.endpoint,
            prefix: this.static.prefix,
            path: this.path.checkDHNKTP,
            method: "GET",
            enabled: false
        });

        I.seeResponseCodeIsSuccessful();

        return{
            status: response.status,
            data: response.data,
        }
    },

    async enabledCheckDHNNPWP() {

        const response = I.sendPutRequest("https://" + env + "-smb-wiremock-server-svc.otoku.io/stub/" + this.idFlag.checkDHNNPWP, {
            id: this.idFlag.checkDHNNPWP,
            name: this.name.checkDHNNPWP,
            endpoint: this.static.endpoint,
            prefix: this.static.prefix,
            path: this.path.checkDHNNPWP,
            method: "GET",
            enabled: true
        });

        I.seeResponseCodeIsSuccessful();

        return{
            status: response.status,
            data: response.data,
        }
    },

    async disabledCheckDHNNPWP() {

        const response = I.sendPutRequest("https://" + env + "-smb-wiremock-server-svc.otoku.io/stub/" + this.idFlag.checkDHNNPWP, {
            id: this.idFlag.checkDHNNPWP,
            name: this.name.checkDHNNPWP,
            endpoint: this.static.endpoint,
            prefix: this.static.prefix,
            path: this.path.checkDHNNPWP,
            method: "GET",
            enabled: false
        });

        I.seeResponseCodeIsSuccessful();

        return{
            status: response.status,
            data: response.data,
        }
    },

}