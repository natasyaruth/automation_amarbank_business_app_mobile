const { Command } = require("commander");
const program = new Command();
const fs = require("fs").promises;
const fsNP = require("fs");
const parser = require("gherkin-parse");
const buffer = require("buffer");

var mkConfig;
var generateCsv;
var asString;

async function loadModule(condition) {
  if (condition) {
    const exportToCsv = await import("export-to-csv");

    mkConfig = exportToCsv.mkConfig;
    generateCsv = exportToCsv.generateCsv;
    asString = exportToCsv.asString;
  } else {
    console.log("Condition not met, module not loaded.");
  }
}

loadModule(true); // Loads and uses the module if condition is true

String.prototype.removePrefix = function (prefix) {
  const hasPrefix = this.indexOf(prefix) === 0;
  return hasPrefix ? this.substr(prefix.length) : this.toString();
};

program
  .command("export")
  .description("Export the feature gherkin testcase into file")
  .argument(
    "<string>",
    "available value: csv, file will be stored to storage/files"
  )
  .option(
    "-tg, --tag <string>",
    "filter to export gherkin testcase based on tag"
  )
  .option(
    "-pf, --pathfolder <string>",
    "path folder to looking for, it needs to define since it will out of memory if not example: ./feature/funding_home"
  )
  .action(async (exportType, options) => {
    let result = [];
    const optionTag = options.tag;
    if (exportType != "csv") {
      throw new Error("export type are not supported yet");
    }
    const rootPath = "./features/funding_home";
    let recursiveFn = async (path) => {
      const isFile = (await fs.stat(path)).isFile();
      if (isFile) {
        return [path];
      } else {
        const lists = await fs.readdir(path);
        let idx = 0;
        while (idx < lists.length) {
          result = [...result, ...(await recursiveFn(path + "/" + lists[idx]))];
          idx++;
        }
        return result;
      }
    };
    let listFiles = await recursiveFn(rootPath);
    var seen = {};
    listFiles = listFiles
      .filter(function (item) {
        return seen.hasOwnProperty(item) ? false : (seen[item] = true);
      })
      .filter(function (item) {
        const content = fsNP.readFileSync(item);
        return content.includes(optionTag);
      });

    let resultScenarios = [];
    listFiles.forEach((file) => {
      const gherkinDocument = parser.convertFeatureFileToJSON(file);
      // Function to check if a tag exists in the scenario
      const hasFunctionalTestDemoTag = (tags) => {
        return tags.some((tag) => tag.name === `@${optionTag}`);
      };

      // Extract scenarios with the tag "FunctionalTestDemo"
      const scenariosWithFunctionalTestDemoTag =
        gherkinDocument.feature.children
          .filter(
            (child) =>
              child.type === "Scenario" && hasFunctionalTestDemoTag(child.tags)
          )
          .map((scenario) => scenario);
      scenariosWithFunctionalTestDemoTag.forEach((scenario) => {
        const fullScenarioDescription = scenario.steps
          .filter((step) => step.argument === undefined) // Exclude steps with arguments
          .map((step) => `${step.keyword}${step.text}`) // Combine keyword and text
          .join(" "); // Join the steps into a single string
        resultScenarios.push(
          `${scenario.name}: ${fullScenarioDescription.removePrefix("And")}`
        );
      });
    });

    let csvData = [];
    resultScenarios.forEach((scenario) => {
      csvData.push({
        scenario: scenario,
        screenshot: "",
        status: "",
      });
    });
    const csvConfig = mkConfig({ useKeysAsHeaders: true });
    const csv = generateCsv(csvConfig)(csvData);
    const filename = `./storage/files/${rootPath.substring(
      rootPath.lastIndexOf("/") + 1
    )}-${optionTag}.csv`;
    const csvBuffer = new Uint8Array(buffer.Buffer.from(asString(csv)));

    // Write the csv file to disk
    fsNP.writeFile(filename, csvBuffer, (err) => {
      if (err) throw err;
      console.log("file saved: ", filename);
    });
  });

program.parse();
