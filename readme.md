# E2E Mobile Automation Testing of Digital SMB Mobile App

## Introduction

## Pre-requisites

- Node.js
- Appium
- Android Studio
- Java

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
