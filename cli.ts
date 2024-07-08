import fs from "node:fs";
import path from "node:path";

const filePath = path.join(__dirname, "README.md");

const readFileSync = (filePath: string) => {
  if (!fs.existsSync(filePath)) {
    throw new Error(`File ${filePath} does not exist.`);
  }
  return fs.readFileSync(filePath, "utf8");
};

const generateMarkdown = (fileName: string, data: string) => `
\`\`\`json
// ${fileName}, generated at ${new Date()}
${data}
\`\`\`
`;

try {
  const settings = readFileSync(path.join(__dirname, "settings.json"));
  const keymaps = readFileSync(path.join(__dirname, "keybindings.json"));
  const data = readFileSync(filePath);

  const settingsMarkdown = generateMarkdown("settings.json", settings);
  const keybindingsMarkdown = generateMarkdown("keybindings.json", keymaps);

  let result = data.replace(
    /(<!-- ALL-SETTINGS:START -->)[\s\S]*?(<!-- ALL-SETTINGS:END -->)/gs,
    `$1\n${settingsMarkdown}\n$2`,
  );
  result = result.replace(
    /(<!-- ALL-KEYMAPS:START -->)[\s\S]*?(<!-- ALL-KEYMAPS:END -->)/gs,
    `$1\n${keybindingsMarkdown}\n$2`,
  );

  fs.writeFileSync(filePath, result);
  console.log("Done");
} catch (error) {
  console.error(new Error("An error occurred", { cause: error }));
}
