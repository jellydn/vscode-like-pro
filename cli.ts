import fs from "node:fs";
import path from "node:path";

const filePath = path.join(__dirname, "README.md");
const editor = process.argv[2];

if (!editor) {
	console.error("Please provide an editor name as argument.");
	console.error("Usage: bun run cli.ts <editor>");
	console.error("Valid editors: VSCode, VSCodium, VSCodiumInsider, VSCodeInsider, Cursor, Windsurf");
	process.exit(1);
}

const readFileSync = (filePath: string) => {
	if (!fs.existsSync(filePath)) {
		throw new Error(`File ${filePath} does not exist.`);
	}
	return fs.readFileSync(filePath, "utf8");
};

const generateMarkdown = (fileName: string, data: string, type = "json") => `
\`\`\`${type}
// ${fileName}, generated at ${new Date()}
${data}
\`\`\`
`;

const validEditors = ["VSCode", "VSCodium", "VSCodiumInsider", "VSCodeInsider", "Cursor", "Windsurf"];
if (!validEditors.includes(editor)) {
	console.error(`Invalid editor: ${editor}`);
	console.error("Valid editors:", validEditors.join(", "));
	process.exit(1);
}

try {
	const editorDir = path.join(__dirname, editor);
	if (!fs.existsSync(editorDir)) {
		throw new Error(`Editor directory not found: ${editorDir}`);
	}

	const settings = readFileSync(path.join(editorDir, "settings.json"));
	const keymaps = readFileSync(path.join(editorDir, "keybindings.json"));
	const neovim = readFileSync(path.join(__dirname, "vscode.lua")); // vscode.lua is in root directory
	const data = readFileSync(filePath);

	const settingsMarkdown = generateMarkdown("settings.json", settings);
	const keybindingsMarkdown = generateMarkdown("keybindings.json", keymaps);
	const neovimMarkdown = generateMarkdown("vscode.lua", neovim, "lua");

	let result = data.replace(
		/(<!-- ALL-SETTINGS:START -->)[\s\S]*?(<!-- ALL-SETTINGS:END -->)/gs,
		`$1\n${settingsMarkdown}\n$2`,
	);
	result = result.replace(
		/(<!-- ALL-KEYMAPS:START -->)[\s\S]*?(<!-- ALL-KEYMAPS:END -->)/gs,
		`$1\n${keybindingsMarkdown}\n$2`,
	);
	result = result.replace(
		/(<!-- ALL-NEOVIM:START -->)[\s\S]*?(<!-- ALL-NEOVIM:END -->)/gs,
		`$1\n${neovimMarkdown}\n$2`,
	);

	fs.writeFileSync(filePath, result);
	console.log("Done");
} catch (error) {
	console.error(error);
}
