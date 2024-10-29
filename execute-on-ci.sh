#!/bin/bash

# Function to check if jq is installed
check_jq_installed() {
  if ! command -v jq &> /dev/null; then
    echo "Error: jq is not installed."

    # Detect the operating system
    if [[ "$OSTYPE" == "linux-gnu"* ]]; then
      # Check if it's a Debian-based system
      if [ -f /etc/debian_version ]; then
        echo "You are using a Debian-based system."
        echo "Please install jq using the following command:"
        echo "sudo apt-get install jq"
        apt-get install jq
      # Check if it's a Red Hat-based system
      elif [ -f /etc/redhat-release ]; then
        echo "You are using a Red Hat-based system."
        echo "Please install jq using the following command:"
        echo "sudo yum install jq"
        yum install jq
      else
        echo "Please install jq using your package manager (e.g., sudo apt-get install jq or sudo yum install jq)."
        yum install jq
      fi
    elif [[ "$OSTYPE" == "darwin"* ]]; then
      # macOS
      echo "You are using macOS."
      echo "Please install jq using Homebrew with the following command:"
      echo "brew install jq"
      brew install jq
    elif [[ "$OSTYPE" == "msys" ]]; then
      # Git Bash on Windows or MSYS
      echo "You are using Git Bash or MSYS on Windows."
      echo "Please install jq using Chocolatey with the following command:"
      echo "choco install jq"
      choco install jq
    elif [[ "$OSTYPE" == "win32" ]]; then
      # Native Windows
      echo "You are using Windows."
      echo "Please install jq using Chocolatey with the following command:"
      echo "choco install jq"
      choco install jq
    elif [[ "$OSTYPE" == "freebsd"* ]]; then
      # FreeBSD
      echo "You are using FreeBSD."
      echo "Please install jq using the following command:"
      echo "pkg install jq"
      pkg install jq
    else
      echo "Unsupported or unknown OS. Please install jq manually."
    fi
    
    exit 1
  fi
}

# Check if jq is installed
check_jq_installed

 if ! command -v yarn &> /dev/null; then
    echo "Error: yarn is not installed."
    exit 1
 fi

# Get the current working directory
current_dir=$(pwd)

# Run the Node.js script for the first time
echo "Running Node.js script for the first time..."
node latest_release.staging.js

# APK file path
apk_file="${current_dir}/apk-staging.apk"

# Check if the APK file exists
if [ ! -f "$apk_file" ]; then
  echo "Error: APK file not found at $apk_file"
  exit 1
fi


# Run curl command to upload the file and capture the response
echo "Uploading APK to BrowserStack..."
echo "$BROWSERSTACK_USERNAME:$BROWSERSTACK_API_KEY"
response=$(curl -u "${BROWSERSTACK_USERNAME}:${BROWSERSTACK_API_KEY}" \
-X POST "https://api-cloud.browserstack.com/app-automate/upload" \
-F "file=@$apk_file")

echo "response from the browserstack"
echo $response

# Extract the app_url from the response
app_url=$(echo $response | jq -r '.app_url')

# Check if curl succeeded and app_url was extracted
if [ $? -eq 0 ] && [ -n "$app_url" ]; then
  echo "Upload successful. App URL: $app_url"
  echo "Running Node.js script again with the app_url..."
  
  # Run the Node.js script for the second time, passing the app_url as an argument
  # This are example format of grapping the testcase based on tagging
  # value of this format will be sending to codeceptjs:browserstack
  # grepStr="--grep \@C159510|\@C133894"
  TAGGING_GREP_REGEX="@regressionTest"
  # BROWSERSTACK_APPID_HASHED=${app_url} yarn run codeceptjs:browserstack ${tesStr}
  if [ -z "${TAGGING_GREP_REGEX}" ]; then
    BROWSERSTACK_APPID_HASHED=${app_url} yarn run codeceptjs:browserstack
  else
    grepStr="--grep ${TAGGING_GREP_REGEX}"
    BROWSERSTACK_APPID_HASHED=${app_url} yarn run codeceptjs:browserstack ${grepStr}
  fi
else
  echo "Upload failed or app_url not found. Node.js script will not be run again."
fi

# Check if the file exists
if [ -f "$apk_file" ]; then
    # Remove the file
    rm "$apk_file"
    echo "File $apk_file has been removed."
else
    echo "File $apk_file does not exist."
fi