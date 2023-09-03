Feature: Select the Anchor
As a customer lead
I want to select the anchor

@C83807
Scenario: user search anchor is not found
Given user on the anchor page
When user fill search anchor 'testingaja'
Then user validate anchor is not found

@C83808
Scenario: User can select anchor on the list
Given user on the anchor page
And user fill search anchor 'Unilever'
When user select result of search
And user on anchor cooperating page
Then user select the date cooperating
And user should see the date on field 'valueDateField'
And user back to list anchor page

@C83809
Scenario: User validate error field on form another anchor
Given user on the anchor page
When user click icon other anchor
And user on anchor cooperating page
Then user click button next
And user should see error 'Nama supplier wajib diisi' in the below of field 'anchorNameField'
And user should see error 'Tipe industri wajib diisi' in the below of field 'industryTypeField'
And user should see error 'Tanggal bekerjasama wajib diisi' in the below of field 'dateField'

@C83809
Scenario: User success fill data other anchor
Given user on anchor cooperating page
And user fill field supplier name
When user select industry type
And user select date cooperating
Then user click button next
And user on select loan amount