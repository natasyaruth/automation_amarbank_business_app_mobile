Feature: Apply Either Loan and select the loan type

@C83802
Scenario: validate content on select either apply for loan
Given user on onboarding loan
And user validate wording 'Pinjaman Untuk Bisnis'
When user validate benefit 'first'
And user validate benefit 'two'
And user validate benefit 'three'
And user validate content hanya dengan
Then user click button ajukan pinjaman
And user on loan type page

@C83804
Scenario: user validate and select loan type AR
Given user on loan type page
And user validate wording loan type 'AR'
When user select loan type 'AR'
And user validate button lihat skema pinjaman is enable true
Then user click button lihat skema pinjaman
And user on loan schema 'AR'
And user validate content loan schema 'AR'
And user click back to loan type page

@C83804
Scenario: user validate and select loan type PO
Given user on loan type page
And user validate wording loan type 'PO'
When user select loan type 'PO'
And user validate button lihat skema pinjaman is enable true
Then user click button lihat skema pinjaman
And user on loan schema 'PO'
And user validate content loan schema 'PO'
And user click back to loan type page

@C83804
Scenario: user validate and select loan type AP
Given user on loan type page
And user validate wording loan type 'AP'
When user select loan type 'AP'
Then user validate button lihat skema pinjaman is enable true
And user click button lihat skema pinjaman
And user on loan schema 'AP'
And user validate content loan schema 'AP'
And user click button select the schema