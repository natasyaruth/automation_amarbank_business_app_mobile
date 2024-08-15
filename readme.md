# E2E Mobile Automation Testing of Digital SMB Mobile App

## Introduction

## Pre-requisites

- Node.js
- Appium
- Android Studio
- Java

#### Running

```
yarn install
```
or 
```
npm install
```

## Run Tests

### Before running tests

- Start Appium server on port 4723

```
appium
```

- Start Android emulator

### Run tests

Run all tests

```

npx codeceptjs run

```

Run All tests for staging environment

```
ENVIRONMENT=staging npx codeceptjs run
```


## Commander

This feature are command line program that can be used to accomplish different tasks

### Export to 'CSV' from Specific Tag and Path Folder

```
yarn commander export csv --tag=FunctionalTestDemo --pathfolder=./features/funding_home
```
or using NPM
```
npm run commander export csv --tag=FunctionalTestDemo --pathfolder=./features/funding_home
```

#### Get Help
```
yarn commander -h              
Usage: commander [options] [command]

Options:
  -h, --help                 display help for command

Commands:
  export [options] <string>  Export the feature gherkin testcase into file
  help [command]             display help for command
```
or 
```
yarn commander csv -h        
Usage: commander [options] [command]

Options:
  -h, --help                 display help for command

Commands:
  export [options] <string>  Export the feature gherkin testcase into file
  help [command]             display help for command
```
