Feature: Select the Loan Amount and Tenor
As a customer lead
I want to select Loan Amount and tenor

@C83823
Scenario: Validate Error Field on Select Loan Amount and Tenor Form
Given user on select loan amount page
And user clear amount loan
When user click button next on select loan amount page
Then user should see error 'Minimal pinjaman Rp50.000.000 (50 Juta)' in the below of field 'amountLoanField'
And user should see error 'Tenor pinjaman wajib diisi' in the below of field 'tenorLoanField'
And user clear amount loan
And user filling field 'amountLoanField' with '6000000000'
And user click button next on select loan amount page
And user should see error 'Maksimal pinjaman Rp5.000.000.000 (5 Miliar)' in the below of field 'amountLoanField'

@C83823
Scenario: Success Select Loan Amount and Tenor
Given user on select loan amount page
When user filling field 'amountLoanField' with '200000000'
Then user select the tenor
And user click button next on select loan amount page
And user on legality business page

@C83824
Scenario: Validate Error Field on legality business form
Given user on legality business page
When user click button next on legality business page
Then user should see error 'Jenis legalitas bisnis wajib dipilih' in the below of field 'bussTypeField'
And user should see error 'Tanggal usaha berdiri wajib diisi' in the below of field 'dateEstablishField'

@C83824
Scenario: User success fill legality business form
Given user select legality business type
When user select business establishment date
And user select the day date '1'
And user select the month date '1'
And user select the year date '1'
Then user click button next on legality business page
And user on head office location page

@C83825
Scenario: Validate Error Field on head office location
Given user on head office location page
And user select location others
When user click button next on head office location page
Then user should see error 'Lokasi bisnis wajib dipilih' in the below of field 'bussLocationField'

@C83825
Scenario: Validate Loan Not available on business location
Given user on head office location page
When user filling field 'bussLocationField' with 'Medan'
Then user click button next on head office location page
And user should see new page with text 'Untuk saat ini kami belum melayani pinjaman di kotamu.' displayed with button 'openAccount'
And user click close button

@C83825
Scenario:  User Success Select Head Office Location
Given user on head office location page
When user select location jabodetabek
Then user click button next on head office location page
And user on success apply loan page

@C83826
Scenario: Validate Wording on Success Apply Loan Page
Given user on success apply loan page
When user validate title 'Selamat, Anda memenuhi syarat untuk melakukan pengajuan pinjaman' on field 'titleSuccesApplyLoanField'
And user validate subtitle 'Untuk mempercepat proses pengajuan pinjaman, mohon melengkapi data' on field 'subTitleSuccesApplyLoanField'
Then user validate information business need done
And user validate information loan need done
And user validate complete the data section
