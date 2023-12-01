const fs = require('fs')

const { I, headerPage, invitationBusinessPage} = inject();

module.exports = {

    async invitationLoanNewApplication() {

        const responseLogin = await I.sendPostRequest("/finagg/loan-application",({
            debtorEmail: "bastian@gmail.com",
            loanID: "123",
            loanType: "AR",
            availCreditLimit: "50000000.00",
            loanTenure: "6",
            interestRateLower: "0.01",
            interestRateUpper: "0.018",
            anchorId: "234",
            anchorName: "PT Bastian Group Indonesia",
            companyDetail: {
                businessName: "PT Bastian Group Indonesia",
                businessLegalityName: "CV",
                ownerName: "Leo",
                ownerPhone: "87452359721",
                lob: "2000-12-30",
                low: "2000-12",
                orgID: "123",
            }
        }));

        I.seeResponseCodeIsSuccessful();

        return {
            status: responseState.status,
            data: responseState.data,
        };
    },
}