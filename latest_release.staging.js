require("dotenv").config();

const https = require("https");
const fs = require("fs");
const path = require("path");
const { google } = require("googleapis");

function getCredentialsJSONGoogleAuth() {
  // Base64 encoded string
  const base64String = process.env.GOOGLE_SERVICE_ACCOUNT_BASE64;

  // Decode the Base64 string using Buffer
  const decodedString = Buffer.from(base64String, "base64").toString("utf-8");
  return JSON.parse(decodedString);
}

// Function to download a binary file and save it
function downloadFile(url, savePath) {
  const file = fs.createWriteStream(savePath);
  https
    .get(url, (response) => {
      if (response.statusCode === 200) {
        response.pipe(file);
        file.on("finish", () => {
          file.close(() => {
            console.log(`Download complete. File saved as ${savePath}`);
          });
        });
      } else {
        console.log(
          `Failed to download file. Status code: ${response.statusCode}`
        );
      }
    })
    .on("error", (err) => {
      fs.unlink(savePath, () => {}); // Delete the file if error occurs
      console.log(`Error: ${err.message}`);
    });
}

const getReleases = async function () {
  try {
    // Load credentials from the service account JSON file
    const credentials = await google.auth.getClient({
      scopes: ["https://www.googleapis.com/auth/cloud-platform"],
      credentials: getCredentialsJSONGoogleAuth(),
    });

    // console.log(getCredentialsJSONGoogleAuth());
    // Create a Firebase App Distribution client
    const appDistribution = google.firebaseappdistribution({
      version: "v1",
      auth: credentials,
    });

    // Replace with your project ID and app name
    const projectId = process.env.FIREBASE_PROJECT_NUMBER;
    const appName = process.env.FIREBASE_APP_ID;

    // Send the GET request
    const response = await appDistribution.projects.apps.releases.list({
      parent: `projects/${projectId}/apps/${appName}`,
      pageSize: 1,
      filter: `releaseNotes.text="*regres*"`,
      orderBy: "createTime desc",
    });

    // Process the response data
    const releases = response.data.releases;
    console.log(releases);

    if (releases.length >= 0) {
      const release = releases[0];

      // Example usage
      const url = release.binaryDownloadUri;
      const savePath = path.join(__dirname, "apk-staging.apk");
      // Start the download
      downloadFile(url, savePath);
      return Promise.resolve(releases);
    }
    return Promise.reject("No releases found");
  } catch (error) {
    console.error("Error:", error);
    return Promise.reject(error);
  }
};

getReleases();
exports.default = getReleases;
