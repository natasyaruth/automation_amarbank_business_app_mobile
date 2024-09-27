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
    if (exportType !== "csv") {
      throw new Error("Export type not supported yet");
    }
    const optionTag = options.tag;
    const rootPath = options.pathfolder;
    const result = await recursiveFileSearch(rootPath);
    const resultScenarios = extractScenarios(result, optionTag);
    const csvData = formatScenariosForCsv(resultScenarios);
    await generateAndSaveCsv(csvData, rootPath, optionTag);

    async function recursiveFileSearch(path, result = []) {
      const stats = await fs.stat(path);
      if (stats.isFile()) {
        result.push(path);
      } else {
        const lists = await fs.readdir(path);
        for (const item of lists) {
          const fullPath = `${path}/${item}`;
          await recursiveFileSearch(fullPath, result);
        }
      }
      return result;
    }

    function extractScenarios(listFiles, optionTag) {
      return listFiles.flatMap((file) => {
        const content = fsNP.readFileSync(file, "utf8");
        if (!content.includes(optionTag)) return [];

        const gherkinDocument = parser.convertFeatureFileToJSON(file);
        return gherkinDocument.feature.children
          .filter(
            (child) =>
              child.type === "Scenario" &&
              child.tags.some((tag) => tag.name === `@${optionTag}`)
          )
          .map((child) => {
            const fullScenarioDescription = child.steps
              .filter((step) => !step.argument)
              .map((step) => `${step.keyword.trim()} ${step.text.trim()}`)
              .join(" ")
              .replace(/^And /, "");
            return `${child.name}: ${fullScenarioDescription}`;
          });
      });
    }

    function formatScenariosForCsv(scenarios) {
      return scenarios.map((scenario) => ({
        scenario,
        screenshot: "",
        status: "",
      }));
    }

    async function generateAndSaveCsv(csvData, rootPath, optionTag) {
      const csvConfig = mkConfig({ useKeysAsHeaders: true });
      const csv = generateCsv(csvConfig)(csvData);
      const filename = `./storage/files/${rootPath
        .split("/")
        .pop()}-${optionTag}.csv`;
      await fsNP.promises.writeFile(filename, buffer.Buffer.from(csv));
      console.log("File saved:", filename);
    }
  });

program.parse();
