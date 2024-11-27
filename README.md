<h1 align="center">Welcome to vscode-like-pro 👋</h1>
<p>
  Make your VSCode Awesome! Minimalist, Productive, and Performance.
</p>

[![IT Man - VS Code Like a Pro](https://i.ytimg.com/vi/yMh0FQ-okog/hqdefault.jpg)](https://www.youtube.com/watch?v=yMh0FQ-okog)

[![IT Man - Level up your VS Code with which-key like menu](https://i.ytimg.com/vi/2LXOv8jA6Io/hqdefault.jpg)](https://www.youtube.com/watch?v=2LXOv8jA6Io)

[![Cobalt2](https://i.gyazo.com/79068e955711e7eab85fa7470de3097e.png)](https://gyazo.com/79068e955711e7eab85fa7470de3097e)

## Pre-requisites

- [getnf/getnf: A better way to install Nerd Fonts](https://github.com/getnf/getnf)
- VSCode or VSCodium (e.g: https://formulae.brew.sh/cask/vscodium)

## Why

- This project is to help you to make your VSCode look like a pro. Inspired by [Make VS Code Awesome](https://makevscodeawesome.com/) and [VSCode Power User](https://vscode.pro/)
- Optimize your VSCode settings for better performance and productivity.

## Extensions

- [eamodio/vscode-toggle-excluded-files](https://github.com/eamodio/vscode-toggle-excluded-files)
- [antfu/vscode-file-nesting-config](https://github.com/antfu/vscode-file-nesting-config)
- [catppuccin/vscode-icons](https://github.com/catppuccin/vscode-icons)
- [usernamehw/vscode-error-lens](https://github.com/usernamehw/vscode-error-lens)
- [vscode-api-playground/SettingsCycler](https://github.com/hoovercj/vscode-api-playground/blob/master/SettingsCycler/README.md)

### Recommended Extensions & Themes

- [jellydn/vscode-hurl-runner](https://github.com/jellydn/vscode-hurl-runner)
- [jellydn/vscode-fzf-picker](https://github.com/jellydn/vscode-fzf-picker)
- [VSpaceCode/vscode-which-key](https://github.com/VSpaceCode/vscode-which-key)
- [cobalt2-vscode](https://github.com/wesbos/cobalt2-vscode) or [catppuccin](https://github.com/catppuccin/vscode) or [kanagawa](https://github.com/barklan/kanagawa.vscode)
- [vscode-spell-checker](https://github.com/streetsidesoftware/vscode-spell-checker)
- [turbo-console-log](https://github.com/Chakroun-Anas/turbo-console-log)
- [codeium](https://open-vsx.org/extension/Codeium/codeium)
- [vscode-neovim](https://github.com/vscode-neovim/vscode-neovim) or [VSCodeVim](https://github.com/VSCodeVim/Vim)

### Deprecated

- [drcika/apc-extension](https://github.com/drcika/apc-extension): This doesn't work well with VSCode >= 1.9.4

### Settings

Update your settings.json file with the following configuration:

<!-- ALL-SETTINGS:START -->

```json
// settings.json, generated at Sun Nov 24 2024 17:06:55 GMT+0800 (Singapore Standard Time)
{
  "workbench.settings.editor": "json",
  "workbench.iconTheme": "catppuccin-mocha",
  "workbench.colorTheme": "Kanagawa",
  "editor.minimap.enabled": false,
  "workbench.activityBar.location": "bottom",
  // Set sidebar to the right
  "workbench.sideBar.location": "right",
  // Show relative number
  "editor.lineNumbers": "relative",
  // Custom windows UI
  "window.nativeTabs": true,
  // Comment below to show multiple tabs
  "workbench.editor.showTabs": "single",
  "window.titleBarStyle": "native",
  "workbench.colorCustomizations": {
    "editorCursor.foreground": "#ffc600",
    "tab.activeBorder": "#ffc600"
  },
  // Toggle excluded files extension, refer for more detail https://github.com/jellydn/vscode-toggle-excluded-files
  "files.exclude": {
    "**/bin": true,
    "**/git": true,
    "**/.turbo": true,
    "**/.vercel": true,
    "**/.changes": true,
    "**/.yarn": true,
    "**/.vscode": true,
    "**/.vscode-test": true,
    "**/.git": true,
    "**/.github": true,
    "**/.grit": true,
    "**/.changeset": true,
    "**/node_modules": true,
    "**/.husky": true,
    "**/dist": true,
    "**/build": true,
    "**/out": true,
    "**/cdk.out": true,
    "**/coverage": true,
    "**/.next": true,
    "**/*.tsbuildinfo": true,
    "**/*.nyc_output": true,
    "**/*.tap": true,
    "**/*.econ": true,
    "**/.astro": true,
    "**/.encore": true,
    "**/encore.gen": true
  },
  // Cspell, refer https://open-vsx.org/vscode/item?itemName=streetsidesoftware.code-spell-checker
  "cSpell.userWords": [],
  // updated 2024-10-28 14:43
  // https://github.com/antfu/vscode-file-nesting-config
  "explorer.fileNesting.enabled": true,
  "explorer.fileNesting.expand": false,
  "explorer.fileNesting.patterns": {
    ".clang-tidy": ".clang-format, .clangd, compile_commands.json",
    ".env": "*.env, .env.*, .envrc, env.d.ts",
    ".gitignore": ".gitattributes, .gitmodules, .gitmessage, .mailmap, .git-blame*",
    ".project": ".classpath",
    "+layout.svelte": "+layout.ts,+layout.ts,+layout.js,+layout.server.ts,+layout.server.js,+layout.gql",
    "+page.svelte": "+page.server.ts,+page.server.js,+page.ts,+page.js,+page.gql",
    "ansible.cfg": "ansible.cfg, .ansible-lint, requirements.yml",
    "app.config.*": "*.env, .babelrc*, .codecov, .cssnanorc*, .env.*, .envrc, .htmlnanorc*, .lighthouserc.*, .mocha*, .postcssrc*, .terserrc*, api-extractor.json, ava.config.*, babel.config.*, capacitor.config.*, contentlayer.config.*, cssnano.config.*, cypress.*, env.d.ts, formkit.config.*, formulate.config.*, histoire.config.*, htmlnanorc.*, i18n.config.*, ionic.config.*, jasmine.*, jest.config.*, jsconfig.*, karma*, lighthouserc.*, panda.config.*, playwright.config.*, postcss.config.*, puppeteer.config.*, rspack.config.*, sst.config.*, svgo.config.*, tailwind.config.*, tsconfig.*, tsdoc.*, uno.config.*, unocss.config.*, vitest.config.*, vuetify.config.*, webpack.config.*, windi.config.*",
    "artisan": "*.env, .babelrc*, .codecov, .cssnanorc*, .env.*, .envrc, .htmlnanorc*, .lighthouserc.*, .mocha*, .postcssrc*, .terserrc*, api-extractor.json, ava.config.*, babel.config.*, capacitor.config.*, contentlayer.config.*, cssnano.config.*, cypress.*, env.d.ts, formkit.config.*, formulate.config.*, histoire.config.*, htmlnanorc.*, i18n.config.*, ionic.config.*, jasmine.*, jest.config.*, jsconfig.*, karma*, lighthouserc.*, panda.config.*, playwright.config.*, postcss.config.*, puppeteer.config.*, rspack.config.*, server.php, sst.config.*, svgo.config.*, tailwind.config.*, tsconfig.*, tsdoc.*, uno.config.*, unocss.config.*, vitest.config.*, vuetify.config.*, webpack.config.*, webpack.mix.js, windi.config.*",
    "astro.config.*": "*.env, .babelrc*, .codecov, .cssnanorc*, .env.*, .envrc, .htmlnanorc*, .lighthouserc.*, .mocha*, .postcssrc*, .terserrc*, api-extractor.json, ava.config.*, babel.config.*, capacitor.config.*, contentlayer.config.*, cssnano.config.*, cypress.*, env.d.ts, formkit.config.*, formulate.config.*, histoire.config.*, htmlnanorc.*, i18n.config.*, ionic.config.*, jasmine.*, jest.config.*, jsconfig.*, karma*, lighthouserc.*, panda.config.*, playwright.config.*, postcss.config.*, puppeteer.config.*, rspack.config.*, sst.config.*, svgo.config.*, tailwind.config.*, tsconfig.*, tsdoc.*, uno.config.*, unocss.config.*, vitest.config.*, vuetify.config.*, webpack.config.*, windi.config.*",
    "build-wrapper.log": "build-wrapper*.log, build-wrapper-dump*.json, build-wrapper-win*.exe, build-wrapper-linux*, build-wrapper-macosx*",
    "BUILD.bazel": "*.bzl, *.bazel, *.bazelrc, bazel.rc, .bazelignore, .bazelproject, WORKSPACE",
    "Cargo.toml": ".clippy.toml, .rustfmt.toml, cargo.lock, clippy.toml, cross.toml, rust-toolchain.toml, rustfmt.toml",
    "CMakeLists.txt": "*.cmake, *.cmake.in, .cmake-format.yaml, CMakePresets.json, CMakeCache.txt",
    "composer.json": ".php*.cache, composer.lock, phpunit.xml*, psalm*.xml",
    "default.nix": "shell.nix",
    "deno.json*": "*.env, .env.*, .envrc, api-extractor.json, deno.lock, env.d.ts, import-map.json, import_map.json, jsconfig.*, tsconfig.*, tsdoc.*",
    "Dockerfile": "*.dockerfile, .devcontainer.*, .dockerignore, captain-definition, compose.*, docker-compose.*, dockerfile*",
    "flake.nix": "flake.lock",
    "gatsby-config.*": "*.env, .babelrc*, .codecov, .cssnanorc*, .env.*, .envrc, .htmlnanorc*, .lighthouserc.*, .mocha*, .postcssrc*, .terserrc*, api-extractor.json, ava.config.*, babel.config.*, capacitor.config.*, contentlayer.config.*, cssnano.config.*, cypress.*, env.d.ts, formkit.config.*, formulate.config.*, gatsby-browser.*, gatsby-node.*, gatsby-ssr.*, gatsby-transformer.*, histoire.config.*, htmlnanorc.*, i18n.config.*, ionic.config.*, jasmine.*, jest.config.*, jsconfig.*, karma*, lighthouserc.*, panda.config.*, playwright.config.*, postcss.config.*, puppeteer.config.*, rspack.config.*, sst.config.*, svgo.config.*, tailwind.config.*, tsconfig.*, tsdoc.*, uno.config.*, unocss.config.*, vitest.config.*, vuetify.config.*, webpack.config.*, windi.config.*",
    "gemfile": ".ruby-version, gemfile.lock",
    "go.mod": ".air*, go.sum",
    "go.work": "go.work.sum",
    "hatch.toml": ".editorconfig, .flake8, .isort.cfg, .python-version, hatch.toml, requirements*.in, requirements*.pip, requirements*.txt, tox.ini",
    "I*.cs": "$(capture).cs",
    "Makefile": "*.mk",
    "mix.exs": ".credo.exs, .dialyzer_ignore.exs, .formatter.exs, .iex.exs, .tool-versions, mix.lock",
    "next.config.*": "*.env, .babelrc*, .codecov, .cssnanorc*, .env.*, .envrc, .htmlnanorc*, .lighthouserc.*, .mocha*, .postcssrc*, .terserrc*, api-extractor.json, ava.config.*, babel.config.*, capacitor.config.*, contentlayer.config.*, cssnano.config.*, cypress.*, env.d.ts, formkit.config.*, formulate.config.*, histoire.config.*, htmlnanorc.*, i18n.config.*, ionic.config.*, jasmine.*, jest.config.*, jsconfig.*, karma*, lighthouserc.*, next-env.d.ts, next-i18next.config.*, panda.config.*, playwright.config.*, postcss.config.*, puppeteer.config.*, rspack.config.*, sst.config.*, svgo.config.*, tailwind.config.*, tsconfig.*, tsdoc.*, uno.config.*, unocss.config.*, vitest.config.*, vuetify.config.*, webpack.config.*, windi.config.*",
    "nuxt.config.*": "*.env, .babelrc*, .codecov, .cssnanorc*, .env.*, .envrc, .htmlnanorc*, .lighthouserc.*, .mocha*, .nuxtignore, .nuxtrc, .postcssrc*, .terserrc*, api-extractor.json, ava.config.*, babel.config.*, capacitor.config.*, contentlayer.config.*, cssnano.config.*, cypress.*, env.d.ts, formkit.config.*, formulate.config.*, histoire.config.*, htmlnanorc.*, i18n.config.*, ionic.config.*, jasmine.*, jest.config.*, jsconfig.*, karma*, lighthouserc.*, panda.config.*, playwright.config.*, postcss.config.*, puppeteer.config.*, rspack.config.*, sst.config.*, svgo.config.*, tailwind.config.*, tsconfig.*, tsdoc.*, uno.config.*, unocss.config.*, vitest.config.*, vuetify.config.*, webpack.config.*, windi.config.*",
    "package.json": "*.code-workspace, .browserslist*, .circleci*, .commitlint*, .cz-config.js, .czrc, .dlint.json, .dprint.json*, .editorconfig, .eslint*, .firebase*, .flowconfig, .github*, .gitlab*, .gitmojirc.json, .gitpod*, .huskyrc*, .jslint*, .knip.*, .lintstagedrc*, .markdownlint*, .node-version, .nodemon*, .npm*, .nvmrc, .pm2*, .pnp.*, .pnpm*, .prettier*, .pylintrc, .release-please*.json, .releaserc*, .ruff.toml, .sentry*, .simple-git-hooks*, .stackblitz*, .styleci*, .stylelint*, .tazerc*, .textlint*, .tool-versions, .travis*, .versionrc*, .vscode*, .watchman*, .xo-config*, .yamllint*, .yarnrc*, Procfile, apollo.config.*, appveyor*, azure-pipelines*, biome.json*, bower.json, build.config.*, bun.lockb, bunfig.toml, commitlint*, crowdin*, dangerfile*, dlint.json, dprint.json*, electron-builder.*, eslint*, firebase.json, grunt*, gulp*, jenkins*, knip.*, lerna*, lint-staged*, nest-cli.*, netlify*, nixpacks*, nodemon*, npm-shrinkwrap.json, nx.*, package-lock.json, package.nls*.json, phpcs.xml, pm2.*, pnpm*, prettier*, pullapprove*, pyrightconfig.json, release-please*.json, release-tasks.sh, release.config.*, renovate*, rollup.config.*, rspack*, ruff.toml, simple-git-hooks*, sonar-project.properties, stylelint*, tslint*, tsup.config.*, turbo*, typedoc*, unlighthouse*, vercel*, vetur.config.*, webpack*, workspace.json, wrangler.toml, xo.config.*, yarn*",
    "Pipfile": ".editorconfig, .flake8, .isort.cfg, .python-version, Pipfile, Pipfile.lock, requirements*.in, requirements*.pip, requirements*.txt, tox.ini",
    "pubspec.yaml": ".metadata, .packages, all_lint_rules.yaml, analysis_options.yaml, build.yaml, pubspec.lock, pubspec_overrides.yaml",
    "pyproject.toml": ".commitlint*, .dlint.json, .dprint.json*, .editorconfig, .eslint*, .flake8, .flowconfig, .isort.cfg, .jslint*, .lintstagedrc*, .markdownlint*, .pdm-python, .pdm.toml, .prettier*, .pylintrc, .python-version, .ruff.toml, .stylelint*, .textlint*, .xo-config*, .yamllint*, MANIFEST.in, Pipfile, Pipfile.lock, biome.json*, commitlint*, dangerfile*, dlint.json, dprint.json*, eslint*, hatch.toml, lint-staged*, pdm.lock, phpcs.xml, poetry.lock, poetry.toml, prettier*, pyproject.toml, pyrightconfig.json, requirements*.in, requirements*.pip, requirements*.txt, ruff.toml, setup.cfg, setup.py, stylelint*, tox.ini, tslint*, uv.lock, uv.toml, xo.config.*",
    "quasar.conf.js": "*.env, .babelrc*, .codecov, .cssnanorc*, .env.*, .envrc, .htmlnanorc*, .lighthouserc.*, .mocha*, .postcssrc*, .terserrc*, api-extractor.json, ava.config.*, babel.config.*, capacitor.config.*, contentlayer.config.*, cssnano.config.*, cypress.*, env.d.ts, formkit.config.*, formulate.config.*, histoire.config.*, htmlnanorc.*, i18n.config.*, ionic.config.*, jasmine.*, jest.config.*, jsconfig.*, karma*, lighthouserc.*, panda.config.*, playwright.config.*, postcss.config.*, puppeteer.config.*, quasar.extensions.json, rspack.config.*, sst.config.*, svgo.config.*, tailwind.config.*, tsconfig.*, tsdoc.*, uno.config.*, unocss.config.*, vitest.config.*, vuetify.config.*, webpack.config.*, windi.config.*",
    "readme*": "AUTHORS, Authors, BACKERS*, Backers*, CHANGELOG*, CITATION*, CODEOWNERS, CODE_OF_CONDUCT*, CONTRIBUTING*, CONTRIBUTORS, COPYING*, CREDITS, Changelog*, Citation*, Code_Of_Conduct*, Codeowners, Contributing*, Contributors, Copying*, Credits, GOVERNANCE.MD, Governance.md, HISTORY.MD, History.md, LICENSE*, License*, MAINTAINERS, Maintainers, README-*, README_*, RELEASE_NOTES*, ROADMAP.MD, Readme-*, Readme_*, Release_Notes*, Roadmap.md, SECURITY.MD, SPONSORS*, Security.md, Sponsors*, authors, backers*, changelog*, citation*, code_of_conduct*, codeowners, contributing*, contributors, copying*, credits, governance.md, history.md, license*, maintainers, readme-*, readme_*, release_notes*, roadmap.md, security.md, sponsors*",
    "Readme*": "AUTHORS, Authors, BACKERS*, Backers*, CHANGELOG*, CITATION*, CODEOWNERS, CODE_OF_CONDUCT*, CONTRIBUTING*, CONTRIBUTORS, COPYING*, CREDITS, Changelog*, Citation*, Code_Of_Conduct*, Codeowners, Contributing*, Contributors, Copying*, Credits, GOVERNANCE.MD, Governance.md, HISTORY.MD, History.md, LICENSE*, License*, MAINTAINERS, Maintainers, README-*, README_*, RELEASE_NOTES*, ROADMAP.MD, Readme-*, Readme_*, Release_Notes*, Roadmap.md, SECURITY.MD, SPONSORS*, Security.md, Sponsors*, authors, backers*, changelog*, citation*, code_of_conduct*, codeowners, contributing*, contributors, copying*, credits, governance.md, history.md, license*, maintainers, readme-*, readme_*, release_notes*, roadmap.md, security.md, sponsors*",
    "README*": "AUTHORS, Authors, BACKERS*, Backers*, CHANGELOG*, CITATION*, CODEOWNERS, CODE_OF_CONDUCT*, CONTRIBUTING*, CONTRIBUTORS, COPYING*, CREDITS, Changelog*, Citation*, Code_Of_Conduct*, Codeowners, Contributing*, Contributors, Copying*, Credits, GOVERNANCE.MD, Governance.md, HISTORY.MD, History.md, LICENSE*, License*, MAINTAINERS, Maintainers, README-*, README_*, RELEASE_NOTES*, ROADMAP.MD, Readme-*, Readme_*, Release_Notes*, Roadmap.md, SECURITY.MD, SPONSORS*, Security.md, Sponsors*, authors, backers*, changelog*, citation*, code_of_conduct*, codeowners, contributing*, contributors, copying*, credits, governance.md, history.md, license*, maintainers, readme-*, readme_*, release_notes*, roadmap.md, security.md, sponsors*",
    "remix.config.*": "*.env, .babelrc*, .codecov, .cssnanorc*, .env.*, .envrc, .htmlnanorc*, .lighthouserc.*, .mocha*, .postcssrc*, .terserrc*, api-extractor.json, ava.config.*, babel.config.*, capacitor.config.*, contentlayer.config.*, cssnano.config.*, cypress.*, env.d.ts, formkit.config.*, formulate.config.*, histoire.config.*, htmlnanorc.*, i18n.config.*, ionic.config.*, jasmine.*, jest.config.*, jsconfig.*, karma*, lighthouserc.*, panda.config.*, playwright.config.*, postcss.config.*, puppeteer.config.*, remix.*, rspack.config.*, sst.config.*, svgo.config.*, tailwind.config.*, tsconfig.*, tsdoc.*, uno.config.*, unocss.config.*, vitest.config.*, vuetify.config.*, webpack.config.*, windi.config.*",
    "requirements.txt": ".editorconfig, .flake8, .isort.cfg, .python-version, requirements*.in, requirements*.pip, requirements*.txt, tox.ini",
    "rush.json": "*.code-workspace, .browserslist*, .circleci*, .commitlint*, .cz-config.js, .czrc, .dlint.json, .dprint.json*, .editorconfig, .eslint*, .firebase*, .flowconfig, .github*, .gitlab*, .gitmojirc.json, .gitpod*, .huskyrc*, .jslint*, .knip.*, .lintstagedrc*, .markdownlint*, .node-version, .nodemon*, .npm*, .nvmrc, .pm2*, .pnp.*, .pnpm*, .prettier*, .pylintrc, .release-please*.json, .releaserc*, .ruff.toml, .sentry*, .simple-git-hooks*, .stackblitz*, .styleci*, .stylelint*, .tazerc*, .textlint*, .tool-versions, .travis*, .versionrc*, .vscode*, .watchman*, .xo-config*, .yamllint*, .yarnrc*, Procfile, apollo.config.*, appveyor*, azure-pipelines*, biome.json*, bower.json, build.config.*, bun.lockb, bunfig.toml, commitlint*, crowdin*, dangerfile*, dlint.json, dprint.json*, electron-builder.*, eslint*, firebase.json, grunt*, gulp*, jenkins*, knip.*, lerna*, lint-staged*, nest-cli.*, netlify*, nixpacks*, nodemon*, npm-shrinkwrap.json, nx.*, package-lock.json, package.nls*.json, phpcs.xml, pm2.*, pnpm*, prettier*, pullapprove*, pyrightconfig.json, release-please*.json, release-tasks.sh, release.config.*, renovate*, rollup.config.*, rspack*, ruff.toml, simple-git-hooks*, sonar-project.properties, stylelint*, tslint*, tsup.config.*, turbo*, typedoc*, unlighthouse*, vercel*, vetur.config.*, webpack*, workspace.json, wrangler.toml, xo.config.*, yarn*",
    "sanity.config.*": "sanity.cli.*, sanity.types.ts, schema.json",
    "setup.cfg": ".editorconfig, .flake8, .isort.cfg, .python-version, MANIFEST.in, requirements*.in, requirements*.pip, requirements*.txt, setup.cfg, tox.ini",
    "setup.py": ".editorconfig, .flake8, .isort.cfg, .python-version, MANIFEST.in, requirements*.in, requirements*.pip, requirements*.txt, setup.cfg, setup.py, tox.ini",
    "shims.d.ts": "*.d.ts",
    "svelte.config.*": "*.env, .babelrc*, .codecov, .cssnanorc*, .env.*, .envrc, .htmlnanorc*, .lighthouserc.*, .mocha*, .postcssrc*, .terserrc*, api-extractor.json, ava.config.*, babel.config.*, capacitor.config.*, contentlayer.config.*, cssnano.config.*, cypress.*, env.d.ts, formkit.config.*, formulate.config.*, histoire.config.*, houdini.config.*, htmlnanorc.*, i18n.config.*, ionic.config.*, jasmine.*, jest.config.*, jsconfig.*, karma*, lighthouserc.*, mdsvex.config.js, panda.config.*, playwright.config.*, postcss.config.*, puppeteer.config.*, rspack.config.*, sst.config.*, svgo.config.*, tailwind.config.*, tsconfig.*, tsdoc.*, uno.config.*, unocss.config.*, vite.config.*, vitest.config.*, vuetify.config.*, webpack.config.*, windi.config.*",
    "vite.config.*": "*.env, .babelrc*, .codecov, .cssnanorc*, .env.*, .envrc, .htmlnanorc*, .lighthouserc.*, .mocha*, .postcssrc*, .terserrc*, api-extractor.json, ava.config.*, babel.config.*, capacitor.config.*, contentlayer.config.*, cssnano.config.*, cypress.*, env.d.ts, formkit.config.*, formulate.config.*, histoire.config.*, htmlnanorc.*, i18n.config.*, ionic.config.*, jasmine.*, jest.config.*, jsconfig.*, karma*, lighthouserc.*, panda.config.*, playwright.config.*, postcss.config.*, puppeteer.config.*, rspack.config.*, sst.config.*, svgo.config.*, tailwind.config.*, tsconfig.*, tsdoc.*, uno.config.*, unocss.config.*, vitest.config.*, vuetify.config.*, webpack.config.*, windi.config.*",
    "vue.config.*": "*.env, .babelrc*, .codecov, .cssnanorc*, .env.*, .envrc, .htmlnanorc*, .lighthouserc.*, .mocha*, .postcssrc*, .terserrc*, api-extractor.json, ava.config.*, babel.config.*, capacitor.config.*, contentlayer.config.*, cssnano.config.*, cypress.*, env.d.ts, formkit.config.*, formulate.config.*, histoire.config.*, htmlnanorc.*, i18n.config.*, ionic.config.*, jasmine.*, jest.config.*, jsconfig.*, karma*, lighthouserc.*, panda.config.*, playwright.config.*, postcss.config.*, puppeteer.config.*, rspack.config.*, sst.config.*, svgo.config.*, tailwind.config.*, tsconfig.*, tsdoc.*, uno.config.*, unocss.config.*, vitest.config.*, vuetify.config.*, webpack.config.*, windi.config.*",
    "*.asax": "$(capture).*.cs, $(capture).*.vb",
    "*.ascx": "$(capture).*.cs, $(capture).*.vb",
    "*.ashx": "$(capture).*.cs, $(capture).*.vb",
    "*.aspx": "$(capture).*.cs, $(capture).*.vb",
    "*.axaml": "$(capture).axaml.cs",
    "*.bloc.dart": "$(capture).event.dart, $(capture).state.dart",
    "*.c": "$(capture).h",
    "*.cc": "$(capture).hpp, $(capture).h, $(capture).hxx, $(capture).hh",
    "*.cjs": "$(capture).cjs.map, $(capture).*.cjs, $(capture)_*.cjs",
    "*.component.ts": "$(capture).component.html, $(capture).component.spec.ts, $(capture).component.css, $(capture).component.scss, $(capture).component.sass, $(capture).component.less",
    "*.cpp": "$(capture).hpp, $(capture).h, $(capture).hxx, $(capture).hh",
    "*.cs": "$(capture).*.cs",
    "*.cshtml": "$(capture).cshtml.cs",
    "*.csproj": "*.config, *proj.user, appsettings.*, bundleconfig.json",
    "*.css": "$(capture).css.map, $(capture).*.css",
    "*.cxx": "$(capture).hpp, $(capture).h, $(capture).hxx, $(capture).hh",
    "*.dart": "$(capture).freezed.dart, $(capture).g.dart",
    "*.db": "*.db-shm, *.db-wal",
    "*.ex": "$(capture).html.eex, $(capture).html.heex, $(capture).html.leex",
    "*.fs": "$(capture).fs.js, $(capture).fs.js.map, $(capture).fs.jsx, $(capture).fs.ts, $(capture).fs.tsx, $(capture).fs.rs, $(capture).fs.php, $(capture).fs.dart",
    "*.go": "$(capture)_test.go",
    "*.java": "$(capture).class",
    "*.js": "$(capture).js.map, $(capture).*.js, $(capture)_*.js, $(capture).d.ts",
    "*.jsx": "$(capture).js, $(capture).*.jsx, $(capture)_*.js, $(capture)_*.jsx, $(capture).less, $(capture).module.less, $(capture).module.less.d.ts,  $(capture).scss, $(capture).module.scss, $(capture).module.scss.d.ts",
    "*.master": "$(capture).*.cs, $(capture).*.vb",
    "*.md": "$(capture).*",
    "*.mjs": "$(capture).mjs.map, $(capture).*.mjs, $(capture)_*.mjs",
    "*.module.ts": "$(capture).resolver.ts, $(capture).controller.ts, $(capture).service.ts",
    "*.mts": "$(capture).mts.map, $(capture).*.mts, $(capture)_*.mts",
    "*.pubxml": "$(capture).pubxml.user",
    "*.py": "$(capture).pyi",
    "*.razor": "$(capture).razor.cs, $(capture).razor.css, $(capture).razor.scss",
    "*.resx": "$(capture).*.resx, $(capture).designer.cs, $(capture).designer.vb",
    "*.tex": "$(capture).acn, $(capture).acr, $(capture).alg, $(capture).aux, $(capture).bbl, $(capture).blg, $(capture).fdb_latexmk, $(capture).fls, $(capture).glg, $(capture).glo, $(capture).gls, $(capture).idx, $(capture).ind, $(capture).ist, $(capture).lof, $(capture).log, $(capture).lot, $(capture).out, $(capture).pdf, $(capture).synctex.gz, $(capture).toc, $(capture).xdv",
    "*.ts": "$(capture).js, $(capture).d.ts.map, $(capture).*.ts, $(capture)_*.js, $(capture)_*.ts",
    "*.tsx": "$(capture).ts, $(capture).*.tsx, $(capture)_*.ts, $(capture)_*.tsx, $(capture).less, $(capture).module.less, $(capture).module.less.d.ts, $(capture).scss, $(capture).module.scss, $(capture).module.scss.d.ts, $(capture).css.ts",
    "*.vbproj": "*.config, *proj.user, appsettings.*, bundleconfig.json",
    "*.vue": "$(capture).*.ts, $(capture).*.js, $(capture).story.vue",
    "*.w": "$(capture).*.w, I$(capture).w",
    "*.xaml": "$(capture).xaml.cs"
  },
  "explorer.openEditors.visible": 1,
  "files.trimTrailingWhitespace": true,
  // Git
  "git.autofetch": true,
  "git.confirmSync": false,
  "git.openRepositoryInParentFolders": "always",
  // Screencast
  "screencastMode.fontSize": 32,
  "screencastMode.verticalOffset": 4,
  // Terminal
  "terminal.integrated.fontFamily": "JetBrainsMono NF",
  "terminal.integrated.fontSize": 17,
  "terminal.integrated.sendKeybindingsToShell": true,
  // Inlay hints
  "editor.inlayHints.enabled": "on",
  "editor.inlayHints.fontFamily": "GeistMono Nerd Font",
  "editor.inlayHints.fontSize": 1,
  "editor.inlayHints.padding": true,
  "javascript.validate.enable": false,
  "javascript.inlayHints.enumMemberValues.enabled": true,
  "javascript.inlayHints.functionLikeReturnTypes.enabled": true,
  "javascript.inlayHints.parameterNames.enabled": "literals",
  "javascript.updateImportsOnFileMove.enabled": "always",
  "typescript.enablePromptUseWorkspaceTsdk": true,
  "typescript.inlayHints.enumMemberValues.enabled": true,
  "typescript.inlayHints.functionLikeReturnTypes.enabled": true,
  "typescript.inlayHints.parameterNames.enabled": "literals",
  "typescript.referencesCodeLens.enabled": true,
  "typescript.updateImportsOnFileMove.enabled": "always",
  "typescript.preferences.preferTypeOnlyAutoImports": true,
  // Diff
  "diffEditor.codeLens": true,
  "diffEditor.hideUnchangedRegions.enabled": true,
  // General editor settings
  "editor.autoIndent": "full",
  "editor.cursorBlinking": "solid",
  "editor.cursorStyle": "line",
  "editor.cursorWidth": 5,
  "editor.fontFamily": "OperatorMonoLig Nerd Font, JetBrainsMono Nerd Font Mono, Menlo, Monaco, 'Courier New', monospacere",
  "editor.codeLensFontFamily": "JetBrainsMono Nerd Font Mono",
  "editor.fontLigatures": true,
  "editor.fontSize": 19.5,
  "editor.fontWeight": "400",
  "editor.formatOnSave": true,
  "editor.inlineSuggest.enabled": true,
  "editor.insertSpaces": false,
  "editor.largeFileOptimizations": false,
  "editor.letterSpacing": 0.5,
  "editor.lineHeight": 25,
  "editor.renderWhitespace": "all",
  "editor.suggestSelection": "first",
  "editor.tabCompletion": "on",
  "editor.wordSeparators": "/\\()\"':,.;<>~!@#$%^&*|+=[]{}`?-",
  "explorer.confirmDelete": false,
  "explorer.compactFolders": false,
  "explorer.confirmDragAndDrop": false,
  "errorLens.enabledDiagnosticLevels": ["error", "warning"],
  "errorLens.excludeBySource": ["cSpell"],
  // Neovim setting, refer https://open-vsx.org/extension/asvetliakov/vscode-neovim
  "extensions.experimental.affinity": {
    "asvetliakov.vscode-neovim": 1
  },
  "vscode-neovim.compositeKeys": {
    "jj": {
      "command": "vscode-neovim.escape"
    },
    "jk": {
      "command": "vscode-neovim.escape"
    }
  },
  // which key, refer https://github.com/VSpaceCode/vscode-which-key
  // Override from default key bindings, search for 'whichkey.bindings' on https://github.com/VSpaceCode/vscode-which-key/blob/master/package.json#L265
  "whichkey.sortOrder": "alphabetically",
  "whichkey.bindings": [
    {
      "key": " ",
      "name": "Commands",
      "type": "command",
      "command": "workbench.action.showCommands"
    },
    {
      "key": ",",
      "name": "Show all editors",
      "type": "command",
      "command": "workbench.action.showAllEditors"
    },
    {
      "key": "\t",
      "name": "Last editor",
      "type": "commands",
      "commands": [
        "workbench.action.quickOpenPreviousRecentlyUsedEditorInGroup",
        "list.select"
      ]
    },
    {
      "key": "e",
      "name": "File Explorer",
      "type": "command",
      "command": "workbench.view.explorer"
    },
    {
      "key": "?",
      "name": "Search keybindings",
      "type": "command",
      "command": "whichkey.searchBindings"
    },
    {
      "key": ".",
      "name": "Repeat most recent action",
      "type": "command",
      "command": "whichkey.repeatMostRecent"
    },
    {
      "key": "]",
      "name": "Next",
      "type": "bindings",
      "bindings": [
        {
          "key": "e",
          "name": "Next error",
          "type": "command",
          "command": "editor.action.marker.next"
        },
        {
          "key": "h",
          "name": "Next change",
          "type": "command",
          "command": "workbench.action.editor.nextChange"
        }
      ]
    },
    {
      "key": "[",
      "name": "Previus",
      "type": "bindings",
      "bindings": [
        {
          "key": "e",
          "name": "Previous error",
          "type": "command",
          "command": "editor.action.marker.prev"
        },
        {
          "key": "h",
          "name": "Previous change",
          "type": "command",
          "command": "workbench.action.editor.previousChange"
        }
      ]
    },
    {
      "key": "b",
      "name": "+Buffers/Editors",
      "type": "bindings",
      "bindings": [
        {
          "key": "d",
          "name": "Close active editor",
          "type": "command",
          "command": "workbench.action.closeActiveEditor"
        },
        {
          "key": "o",
          "name": "Close active editor",
          "type": "command",
          "command": "workbench.action.closeOtherEditors"
        }
      ]
    },
    {
      "key": "c",
      "name": "+Code",
      "type": "bindings",
      "bindings": [
        {
          "key": "a",
          "name": "Code Action",
          "type": "command",
          "command": "editor.action.codeAction"
        },
        {
          "key": "A",
          "name": "Source action",
          "type": "command",
          "command": "editor.action.sourceAction"
        },
        {
          "key": "i",
          "name": "Organize Imports",
          "type": "command",
          "command": "editor.action.organizeImports"
        },
        {
          "key": "r",
          "name": "Rename",
          "type": "command",
          "command": "editor.action.rename"
        },
        {
          "key": "R",
          "name": "Refactor",
          "type": "command",
          "command": "editor.action.Refactor"
        },
        {
          "key": "f",
          "name": "Format",
          "type": "command",
          "command": "editor.action.formatDocument"
        },
        {
          "key": "=",
          "name": "Format selection",
          "type": "command",
          "command": "editor.action.formatSelection"
        },
        {
          "key": ".",
          "name": "Quick Fix",
          "type": "command",
          "command": "editor.action.quickFix"
        }
      ]
    },
    {
      "key": "d",
      "name": "+Debug",
      "type": "bindings",
      "bindings": [
        // Need to install https://github.com/orta/vscode-twoslash-queries
        {
          "key": "d",
          "name": "Debug type below",
          "type": "command",
          "command": "orta.vscode-twoslash-queries.insert-twoslash-query"
        },
        // Need to install https://github.com/Chakroun-Anas/turbo-console-log
        {
          "key": "v",
          "name": "Debug variable below",
          "type": "command",
          "command": "turboConsoleLog.displayLogMessage"
        },
        {
          "key": "c",
          "name": "Clear all variable",
          "type": "command",
          "command": "turboConsoleLog.deleteAllLogMessages"
        }
      ]
    },
    {
      "key": "x",
      "name": "+Errors",
      "type": "bindings",
      "bindings": [
        {
          "key": "x",
          "name": "List errors",
          "type": "command",
          "command": "workbench.actions.view.problems"
        },
        {
          "key": "n",
          "name": "Next error",
          "type": "command",
          "command": "editor.action.marker.next"
        },
        {
          "key": "p",
          "name": "Previous error",
          "type": "command",
          "command": "editor.action.marker.prev"
        }
      ]
    },
    {
      "key": "f",
      "name": "+File",
      "type": "bindings",
      "bindings": [
        {
          "key": "a",
          "name": "Show all opened files",
          "type": "command",
          "command": "workbench.action.showAllEditors"
        },
        {
          "key": "e",
          "name": "Show active in explorer",
          "type": "command",
          "command": "workbench.files.action.showActiveFileInExplorer"
        },
        {
          "key": "f",
          "name": "Quick Open file",
          "type": "command",
          "command": "workbench.action.quickOpen"
        },
        {
          "key": "F",
          "name": "Open file in folder",
          "type": "command",
          "command": "workbench.action.files.openFileFolder"
        },
        {
          "key": "n",
          "name": "New Untitled",
          "type": "command",
          "command": "workbench.action.files.newUntitledFile"
        },
        {
          "key": "p",
          "name": "Switch project",
          "type": "command",
          "command": "workbench.action.openRecent"
        },
        {
          "key": "t",
          "name": "Open terminal",
          "type": "command",
          "command": "workbench.action.terminal.focus"
        },
        {
          "key": "s",
          "name": "Save file",
          "type": "command",
          "command": "workbench.action.files.save"
        },
        {
          "key": "S",
          "name": "Save all files",
          "type": "command",
          "command": "workbench.action.files.saveAll"
        },
        {
          "key": "w",
          "name": "Open active in new window",
          "type": "command",
          "command": "workbench.action.files.showOpenedFileInNewWindow"
        }
      ]
    },
    {
      "key": "g",
      "name": "+Git",
      "type": "bindings",
      "bindings": [
        {
          "key": "f",
          "name": "Fetch",
          "type": "command",
          "command": "git.fetch"
        },
        {
          "key": "i",
          "name": "Init",
          "type": "command",
          "command": "git.init"
        },
        {
          "key": "s",
          "name": "Git status",
          "type": "command",
          "command": "workbench.view.scm"
        },
        {
          "key": "r",
          "name": "Pull Request",
          "type": "command",
          "command": "workbench.view.extension.github-pull-request"
        },
        {
          "key": "h",
          "name": "Hunk",
          "type": "bindings",
          "bindings": [
            {
              "key": "r",
              "name": "Revert selected ranges",
              "type": "command",
              "command": "git.revertSelectedRanges"
            }
          ]
        }
      ]
    },
    {
      "key": "s",
      "name": "+Search/Symbol",
      "type": "bindings",
      "bindings": [
        {
          "key": "s",
          "name": "Symbol in file",
          "type": "command",
          "command": "workbench.action.gotoSymbol"
        },
        {
          "key": "S",
          "name": "All symbols in workspace",
          "type": "command",
          "command": "workbench.action.showAllSymbols"
        },
        {
          "key": "w",
          "name": "Search word in a project",
          "type": "commands",
          "commands": [
            "editor.action.addSelectionToNextFindMatch",
            "workbench.action.findInFiles"
          ]
        },
        {
          "key": "r",
          "name": "Search all references",
          "type": "command",
          "command": "editor.action.referenceSearch.trigger"
        },
        {
          "key": "R",
          "name": "Search all references in side bar",
          "type": "command",
          "command": "references-view.find"
        }
      ]
    },
    {
      "key": "u",
      "name": "+UI",
      "type": "bindings",
      "bindings": [
        {
          "key": "c",
          "name": "Select theme color",
          "type": "command",
          "command": "workbench.action.selectTheme"
        },
        {
          "key": "x",
          "name": "Show extensions",
          "type": "command",
          "command": "workbench.view.extensions"
        },
        {
          "key": "o",
          "name": "Show output",
          "type": "command",
          "command": "workbench.action.output.toggleOutput"
        },
        {
          "key": "d",
          "name": "Show debug console",
          "type": "command",
          "command": "workbench.debug.action.toggleRepl"
        },
        // Todo tree extension https://marketplace.visualstudio.com/items?itemName=Gruntfuggly.todo-tree
        {
          "key": "t",
          "name": "Show todo",
          "type": "command",
          "command": "todo-tree-view.focus"
        }
      ]
    },
    {
      "key": "r",
      "name": "+Run",
      "type": "bindings",
      "bindings": [
        {
          "key": "t",
          "name": "Run task",
          "type": "command",
          "command": "workbench.action.tasks.runTask"
        },
        {
          "key": "r",
          "name": "Run last task",
          "type": "command",
          "command": "workbench.action.tasks.reRunTask"
        }
      ]
    },
    {
      "key": "t",
      "name": "+Toggles",
      "type": "bindings",
      "bindings": [
        {
          "key": "b",
          "name": "Toggle git blame",
          "type": "command",
          "command": "gitlens.toggleLineBlame"
        },
        {
          "key": "c",
          "name": "Toggle find case sensitive",
          "type": "command",
          "command": "toggleFindCaseSensitive"
        },
        {
          "key": "r",
          "name": "Toggle screencast record",
          "type": "command",
          "command": "workbench.action.toggleScreencastMode"
        },
        {
          "key": "s",
          "name": "Toggle status bar",
          "type": "command",
          "command": "workbench.action.toggleStatusbarVisibility"
        },
        {
          "key": "w",
          "name": "Toggle ignore trim whitespace in diff",
          "type": "command",
          "command": "toggle.diff.ignoreTrimWhitespace"
        },
        {
          "key": "W",
          "name": "Toggle word wrap",
          "type": "command",
          "command": "editor.action.toggleWordWrap"
        },
        {
          "key": "m",
          "name": "Toggle minimap",
          "type": "command",
          "command": "editor.action.toggleMinimap"
        },
        {
          "key": "i",
          "name": "Toggle inlay hint",
          "type": "command",
          // Need to install https://marketplace.cursorapi.com/items?itemName=hoovercj.vscode-settings-cycler
          "command": "settings.cycle",
          "args": {
            "id": "toggle-inlay-hints",
            "overrideWorkspaceSettings": false,
            "values": [
              {
                "editor.inlayHints.enabled": "off"
              },
              {
                "editor.inlayHints.enabled": "on"
              }
            ]
          }
        }
      ]
    },
    {
      "key": "w",
      "name": "+Window",
      "type": "bindings",
      "bindings": [
        {
          "key": "-",
          "name": "Split editor below",
          "type": "command",
          "command": "workbench.action.splitEditorDown"
        },
        {
          "key": "/",
          "name": "Split editor right",
          "type": "command",
          "command": "workbench.action.splitEditor"
        },
        {
          "key": "t",
          "name": "Toggle editor group sizes",
          "type": "command",
          "command": "workbench.action.toggleEditorWidths"
        },
        {
          "key": "m",
          "name": "Maximize editor group",
          "type": "command",
          "command": "workbench.action.minimizeOtherEditors"
        },
        {
          "key": "j",
          "name": "Navigate down",
          "type": "command",
          "command": "workbench.action.navigateDown"
        },
        {
          "key": "k",
          "name": "Navigate up",
          "type": "command",
          "command": "workbench.action.navigateUp"
        },
        {
          "key": "h",
          "name": "Navigate left",
          "type": "command",
          "command": "workbench.action.navigateLeft"
        },
        {
          "key": "l",
          "name": "Navigate right",
          "type": "command",
          "command": "workbench.action.navigateRight"
        }
      ]
    },
    {
      "key": "z",
      "name": "+Folding",
      "type": "bindings",
      "bindings": [
        {
          "key": "a",
          "name": "Toggle: around a point",
          "type": "command",
          "command": "editor.toggleFold"
        },
        {
          "key": "c",
          "name": "Close: at a point",
          "type": "command",
          "command": "editor.fold"
        },
        {
          "key": "b",
          "name": "Close: all block comments",
          "type": "command",
          "command": "editor.foldAllBlockComments"
        },
        {
          "key": "g",
          "name": "Close: all regions",
          "type": "command",
          "command": "editor.foldAllMarkerRegions"
        },
        {
          "key": "m",
          "name": "Close: all",
          "type": "command",
          "command": "editor.foldAll"
        },
        {
          "key": "o",
          "name": "Open: at a point",
          "type": "command",
          "command": "editor.unfold"
        },
        {
          "key": "O",
          "name": "Open: recursively",
          "type": "command",
          "command": "editor.unfoldRecursively"
        },
        {
          "key": "G",
          "name": "Open: all regions",
          "type": "command",
          "command": "editor.unfoldAllMarkerRegions"
        },
        {
          "key": "r",
          "name": "Open: all",
          "type": "command",
          "command": "editor.unfoldAll"
        }
      ]
    },
    {
      "key": "!",
      "name": "Show terminal",
      "type": "command",
      "command": "workbench.action.terminal.focus"
    },
    {
      "key": "/",
      "name": "Search in a project",
      "type": "command",
      "command": "workbench.action.findInFiles"
    }
  ],
  /*
             Incremental usage: only override some keymap
            "whichkey.bindingOverrides": [
              // +f File
              // Prefer to use <leader>e from neovim instead
              {
                "keys": "f.e",
                "name": "Show tree/explorer view",
                "type": "command",
                "command": "workbench.view.explorer"
              },
              // Open file
              {
                "keys": "f.f",
                "name": "Quick open file",
                "type": "command",
                "command": "workbench.action.quickOpen"
              },
              {
                "key": "f.F",
                "name": "Open file/folder",
                "type": "command",
                "command": "whichkey.openFile"
              },
              // More advanced usage on https://vspacecode.github.io/docs/whichkey/extra
              {
                "keys": "f.E",
                "name": "Show active file in tree/explorer view",
                "type": "command",
                "command": "workbench.files.action.showActiveFileInExplorer"
              },
              // Open Github Pull Request on sidebar
              {
                "keys": "g.r",
                "name": "Github Pull Requests",
                "type": "command",
                "command": "workbench.view.extension.github-pull-request"
              }
            ], */
  // Vim settings, refer https://open-vsx.org/extension/vscodevim/vim
  "vim.easymotion": true,
  "vim.foldfix": true,
  "vim.handleKeys": {
    "<C-a>": false,
    "<C-f>": false
  },
  "vim.highlightedyank.enable": true,
  "vim.hlsearch": true,
  "vim.incsearch": true,
  "vim.leader": "<space>",
  "vim.insertModeKeyBindings": [
    {
      "after": ["<Esc>"],
      "before": ["j", "j"]
    }
  ],
  "vim.normalModeKeyBindingsNonRecursive": [
    {
      "after": ["d", "d"],
      "before": ["<leader>", "d"]
    },
    {
      "before": ["<C-n>"],
      "commands": [":nohl"]
    },
    {
      "before": ["K"],
      "commands": ["editor.action.showHover"]
    }
  ],
  "vim.useCtrlKeys": true,
  "vim.useSystemClipboard": true,
  // Turn off extension recommedations
  "extensions.ignoreRecommendations": true,
  "chat.editor.fontSize": 21,
  // Only show error on Eslint
  "eslint.quiet": true,
  // Formatter per file type: use default LSP server
  // NOTE: Change to Prettier or Biome per project if needed
  "[json]": {
    "editor.defaultFormatter": "vscode.json-language-features"
  },
  "[jsonc]": {
    "editor.defaultFormatter": "vscode.json-language-features"
  },
  "[typescriptreact]": {
    "editor.defaultFormatter": "vscode.typescript-language-features"
  },
  "[css]": {
    "editor.defaultFormatter": "vscode.css-language-features"
  },
  "[typescript]": {
    "editor.defaultFormatter": "vscode.typescript-language-features"
  },
  // Setup fzf picker extension
  "fzf-picker.customTasks": [
    {
      "name": "zoxide",
      "command": "code-insiders $(zoxide query --interactive)"
    }
  ],
  "fzf-picker.general.openCommand": "code-insiders -g",
  "fzf-picker.general.debugMode": true,
  // Hurl runner
  "vscode-hurl-runner.verboseMode": "very-verbose",
  // Git lens
  "gitlens.currentLine.enabled": false,
  "security.promptForLocalFileProtocolHandling": false,
  // Biome setup
  "editor.codeActionsOnSave": {
    // https://biomejs.dev/reference/vscode/#fix-on-save
    "quickfix.biome": "explicit"
    // Sort import, experimental
    // "source.organizeImports.biome": "explicit"
  },
  "workbench.startupEditor": "newUntitledFile",
  "window.customTitleBarVisibility": "never"
}
```

<!-- ALL-SETTINGS:END -->

## Keymaps

Generally, I use the combination of <CMD + K> + <shift + key> to trigger bindings. All other bindings are set up using Neovim's extension keymaps.

Update your `keybindings.json` file with the following key bindings:

<!-- ALL-KEYMAPS:START -->

```json
// keybindings.json, generated at Sun Nov 17 2024 16:09:03 GMT+0800 (Singapore Standard Time)
[
  // Folding, refer https://github.com/vscode-neovim/vscode-neovim/issues/58#issuecomment-1316470317
  {
    "command": "editor.toggleFold",
    "key": "z a",
    "when": "editorTextFocus && neovim.mode == normal"
  },
  {
    "command": "editor.unfoldAll",
    "key": "z shift+r",
    "when": "editorTextFocus && neovim.mode == normal"
  },
  {
    "command": "editor.foldAll",
    "key": "z shift+m",
    "when": "editorTextFocus && neovim.mode == normal"
  },
  {
    "command": "editor.unfold",
    "key": "z o",
    "when": "editorTextFocus && neovim.mode == normal"
  },
  {
    "command": "editor.unfoldRecursively",
    "key": "z shift+o",
    "when": "editorTextFocus && neovim.mode == normal"
  },
  {
    "command": "editor.fold",
    "key": "z c",
    "when": "editorTextFocus && neovim.mode == normal"
  },
  {
    "command": "editor.foldRecursively",
    "key": "z shift+c",
    "when": "editorTextFocus && neovim.mode == normal"
  },
  {
    "command": "editor.foldAllExcept",
    "key": "z shift+v",
    "when": "editorTextFocus && neovim.mode == normal"
  },
  {
    "command": "editor.gotoNextFold",
    "key": "z j",
    "when": "editorTextFocus && neovim.mode == normal"
  },
  {
    "command": "editor.gotoPreviousFold",
    "key": "z k",
    "when": "editorTextFocus && neovim.mode == normal"
  },
  // Use single tab
  {
    "key": "cmd+k shift+t",
    "command": "workbench.action.showEditorTab"
  },
  // Use multiple tabs
  {
    "key": "cmd+k shift+m",
    "command": "workbench.action.showMultipleEditorTabs"
  },
  // Toggle status bar
  {
    "key": "cmd+k shift+s",
    "command": "workbench.action.toggleStatusbarVisibility"
  },
  // Toggle record screen cast
  {
    "key": "cmd+k shift+r",
    "command": "workbench.action.toggleScreencastMode"
  },
  // Toggle error lens - warning
  {
    "key": "cmd+k shift+w",
    "command": "errorLens.toggleWarning"
  },
  // TODO: Wait for this to resolve https://github.com/usernamehw/vscode-error-lens/issues/208
  // Setup which-key
  {
    "key": "cmd+space", // Disable Spotlight and use Raycast with Alt+space, refer https://manual.raycast.com/hotkey
    "command": "whichkey.show",
    "when": "editorTextFocus"
  },
  // Toggle full screen
  {
    "key": "cmd+k f",
    "command": "workbench.action.toggleMaximizedPanel"
  },
  // Open Github Pull Request
  {
    "key": "cmd+k g",
    "command": "workbench.view.extension.github-pull-requests"
  },
  // Toggle version lens
  {
    "key": "cmd+k shift+v",
    "command": "versionlens.icons.showVersionLenses"
  },
  // Zen mode
  {
    "key": "cmd+k c",
    "command": "workbench.action.toggleCenteredLayout"
  }
]
```

<!-- ALL-KEYMAPS:END -->

## How to integrated with your Neovim

1. Install the [VSCode Neovim](https://open-vsx.org/extension/asvetliakov/vscode-neovim) extension.
2. Below is my configuration from my [my personal neovim configuration](https://github.com/jellydn/my-nvim-ide/blob/main/lua/plugins/vscode.lua) with lazy.nvim as package manager.

<!-- ALL-NEOVIM:START -->

```lua
// vscode.lua, generated at Sun Nov 17 2024 16:09:03 GMT+0800 (Singapore Standard Time)
if not vim.g.vscode then
  return {}
end

local enabled = {
  "lazy.nvim",
  "nvim-treesitter",
  "ts-comments.nvim",
  "nvim-treesitter",
  "nvim-treesitter-textobjects",
  "nvim-ts-context-commentstring",
  "vim-repeat",
}

local Config = require("lazy.core.config")
Config.options.checker.enabled = false
Config.options.change_detection.enabled = false
Config.options.defaults.cond = function(plugin)
  return vim.tbl_contains(enabled, plugin.name) or plugin.vscode
end

-- Add some vscode specific keymaps
-- Refer to https://github.com/vscode-neovim/vscode-neovim#code-navigation-bindings for default keymaps
vim.api.nvim_create_autocmd("User", {
  pattern = "NvimIdeKeymaps", -- This pattern will be called when the plugin is loaded
  callback = function()
    local vscode = require("vscode")
    -- +File
    -- Find file
    vim.keymap.set("n", "<leader><space>", "<cmd>Find<cr>")

    -- Find recent open files
    vim.keymap.set("n", "<leader>fr", function()
      vscode.action("workbench.action.showAllEditorsByMostRecentlyUsed")
    end)

    -- Need to install https://github.com/jellydn/vscode-fzf-picker
    vim.keymap.set("n", "<leader>ff", function()
      vscode.action("fzf-picker.findFiles")
    end)
    -- Find word
    vim.keymap.set({ "n", "v" }, "<leader>fw", function()
      vscode.action("fzf-picker.findWithinFiles")
    end)
    vim.keymap.set("n", "<leader>fw", function()
      vscode.action("editor.action.addSelectionToNextFindMatch")
      vscode.action("fzf-picker.findWithinFiles")
    end)
    -- Find file from git status
    vim.keymap.set("n", "<leader>fg", function()
      vscode.action("fzf-picker.pickFileFromGitStatus")
    end)
    -- Resume last search
    vim.keymap.set("n", "<leader>fR", function()
      vscode.action("fzf-picker.resumeSearch")
    end)
    -- Find todo/fixme
    vim.keymap.set("n", "<leader>fx", function()
      vscode.action("fzf-picker.findTodoFixme")
    end)

    -- Open other files
    vim.keymap.set("n", "<leader>,", function()
      vscode.action("workbench.action.showAllEditors")
    end)
    -- Find in files
    vim.keymap.set("n", "<leader>/", function()
      vscode.action("workbench.action.findInFiles")
    end)
    -- Open file explorer in left sidebar
    vim.keymap.set("n", "<leader>e", function()
      vscode.action("workbench.view.explorer")
    end)

    -- +Search
    -- Open symbol
    vim.keymap.set("n", "<leader>ss", function()
      vscode.action("workbench.action.gotoSymbol")
    end)
    -- Search word under cursor
    vim.keymap.set("n", "<leader>sw", function()
      vscode.action("editor.action.addSelectionToNextFindMatch")
      vscode.action("workbench.action.findInFiles")
      -- Or send as the param like this: code.action("workbench.action.findInFiles", { args = { query = vim.fn.expand("<cword>") } })
    end)

    -- Search work in current buffer
    vim.keymap.set("n", "<leader>sb", function()
      vscode.action("actions.find")
    end)

    -- +Code
    -- Code Action
    vim.keymap.set("n", "<leader>ca", function()
      vscode.action("editor.action.codeAction")
    end)
    -- Source Action
    vim.keymap.set("n", "<leader>cA", function()
      vscode.action("editor.action.sourceAction")
    end)
    -- Code Rename
    vim.keymap.set("n", "<leader>cr", function()
      vscode.action("editor.action.rename")
    end)
    -- Quickfix shortcut
    vim.keymap.set("n", "<leader>.", function()
      vscode.action("editor.action.quickFix")
    end)
    -- Code format
    vim.keymap.set("n", "<leader>cf", function()
      vscode.action("editor.action.formatDocument")
    end)
    -- Refactor
    vim.keymap.set("n", "<leader>cR", function()
      vscode.action("editor.action.refactor")
    end)

    -- +Terminal
    -- Open terminal
    vim.keymap.set("n", "<leader>ft", function()
      vscode.action("workbench.action.terminal.focus")
    end)

    -- +LSP
    -- View problem
    vim.keymap.set("n", "<leader>xx", function()
      vscode.action("workbench.actions.view.problems")
    end)
    -- Go to next/prev error
    vim.keymap.set("n", "]e", function()
      vscode.action("editor.action.marker.next")
    end)
    vim.keymap.set("n", "[e", function()
      vscode.action("editor.action.marker.prev")
    end)

    -- Find references
    vim.keymap.set("n", "gr", function()
      vscode.action("references-view.find")
    end)

    -- +Git
    -- Git status
    vim.keymap.set("n", "<leader>gs", function()
      vscode.action("workbench.view.scm")
    end)
    -- Go to next/prev change
    vim.keymap.set("n", "]h", function()
      vscode.action("workbench.action.editor.nextChange")
    end)
    vim.keymap.set("n", "[h", function()
      vscode.action("workbench.action.editor.previousChange")
    end)

    -- Revert change
    vim.keymap.set("v", "<leader>ghr", function()
      vscode.action("git.revertSelectedRanges")
    end)

    -- +Buffer
    -- Close buffer
    vim.keymap.set("n", "<leader>bd", function()
      vscode.action("workbench.action.closeActiveEditor")
    end)
    -- Close other buffers
    vim.keymap.set("n", "<leader>bo", function()
      vscode.action("workbench.action.closeOtherEditors")
    end)

    -- +Project
    vim.keymap.set("n", "<leader>fp", function()
      vscode.action("workbench.action.openRecent")
    end)

    -- Markdown preview
    vim.keymap.set("n", "<leader>mp", function()
      vscode.action("markdown.showPreviewToSide")
    end)

    -- Hurl runner, https://github.com/jellydn/vscode-hurl-runner
    vim.keymap.set("n", "<leader>ha", function()
      vscode.action("vscode-hurl-runner.runHurl")
    end)
    vim.keymap.set("n", "<leader>hr", function()
      vscode.action("vscode-hurl-runner.rerunLastCommand")
    end)
    vim.keymap.set("n", "<leader>hA", function()
      vscode.action("vscode-hurl-runner.runHurlFile")
    end)
    vim.keymap.set("n", "<leader>he", function()
      vscode.action("vscode-hurl-runner.runHurlFromBegin")
    end)
    vim.keymap.set("n", "<leader>hE", function()
      vscode.action("vscode-hurl-runner.runHurlToEnd")
    end)
    vim.keymap.set("n", "<leader>hg", function()
      vscode.action("vscode-hurl-runner.manageInlineVariables")
    end)
    vim.keymap.set("n", "<leader>hh", function()
      vscode.action("vscode-hurl-runner.viewLastResponse")
    end)
    vim.keymap.set("v", "<leader>hh", function()
      vscode.action("vscode-hurl-runner.runHurlSelection")
    end)

    -- Run task
    vim.keymap.set("n", "<leader>rt", function()
      vscode.action("workbench.action.tasks.runTask")
    end)
    -- Re-run
    vim.keymap.set("n", "<leader>rr", function()
      vscode.action("workbench.action.tasks.reRunTask")
    end)

    -- Other keymaps will be used with https://github.com/VSpaceCode/vscode-which-key, so we don't need to define them here
    -- Trigger which-key by pressing <CMD+Space>, refer more default keymaps https://github.com/VSpaceCode/vscode-which-key/blob/15c5aa2da5812a21210c5599d9779c46d7bfbd3c/package.json#L265
  end,
})

return {
  {
    "xiyaowong/fast-cursor-move.nvim",
    vscode = true,
    enabled = vim.g.vscode,
    init = function()
      -- Disable acceleration, use key repeat settings instead
      vim.g.fast_cursor_move_acceleration = false
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = { highlight = { enable = false } },
  },
}

```

<!-- ALL-NEOVIM:END -->

## Tips

- Improve key repeat on Mac OSX, need to restart

```sh
defaults write NSGlobalDomain KeyRepeat -int 1
defaults write NSGlobalDomain InitialKeyRepeat -int 14
```

- VSCode on Mac

To enable key-repeating, execute the following in your Terminal, log out and back in, and then restart VS Code:

```sh
# For VS Code
defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false
# For VS Codium
defaults write com.microsoft.VSCodium ApplePressAndHoldEnabled -bool false
# For VS Code Insider
defaults write com.microsoft.VSCodeInsiders ApplePressAndHoldEnabled -bool false
# For Codium Insider
defaults write com.microsoft.VSCodiumInsiders ApplePressAndHoldEnabled -bool false
# If necessary, reset global default
defaults delete -g ApplePressAndHoldEnabled
# For Cursor
defaults write com.todesktop.230313mzl4w4u92 ApplePressAndHoldEnabled -bool false
```

Also increasing Key Repeat and Delay Until Repeat settings in System Preferences -> Keyboard.

[![Key repeat rate](https://i.gyazo.com/e58be996275fe50bee31412ea5930017.png)](https://gyazo.com/e58be996275fe50bee31412ea5930017)

- Disable `full stop with double-space` if you see the delay with `<space>-<space>`

[![Which-key](https://i.gyazo.com/6403f6c57d2e54aca230589b2173eeb0.png)](https://gyazo.com/6403f6c57d2e54aca230589b2173eeb0)## How to generate the settings

```bash
sh cli.sh $EDITOR_NAME
```

- Improve key repeat on Mac OSX, need to restart

```sh
defaults write NSGlobalDomain KeyRepeat -int 1
defaults write NSGlobalDomain InitialKeyRepeat -int 14
```

- VSCode on Mac

To enable key-repeating, execute the following in your Terminal, log out and back in, and then restart VS Code:

```sh
# For VS Code
defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false
# For VS Code Insider
defaults write com.microsoft.VSCodeInsiders ApplePressAndHoldEnabled -bool false
# If necessary, reset global default
defaults delete -g ApplePressAndHoldEnabled
# For Cursor
defaults write com.todesktop.230313mzl4w4u92 ApplePressAndHoldEnabled -bool false
```

Also increasing Key Repeat and Delay Until Repeat settings in System Preferences -> Keyboard.

[![Key repeat rate](https://i.gyazo.com/e58be996275fe50bee31412ea5930017.png)](https://gyazo.com/e58be996275fe50bee31412ea5930017)

## Demo

[![Theme switcher](https://i.gyazo.com/57139ebccf6b73f09e60125749c89584.gif)](https://gyazo.com/57139ebccf6b73f09e60125749c89584)

## Resources

- [Anthony Fu VS Code settings and extensions](https://github.com/antfu/vscode-settings)
- [Ahmed Elsakaan VS Code](https://gist.github.com/ixahmedxi/8a728facb9a6a258be60398414c5f3d9)
- [Visual Studio Code User Interface](https://code.visualstudio.com/docs/getstarted/userinterface)
- [Cursor Agents Initial Impressions - Allow an AI to Build Your Entire Project](https://egghead.io/cursor-agents-initial-impressions-allow-an-ai-to-build-your-entire-project~eqlb4)
- [![IT Man - Windsurf AI Editor: The Future of Intelligent Editing](https://i.ytimg.com/vi/JEeMeUqiVnA/mqdefault.jpg)](https://www.youtube.com/watch?v=JEeMeUqiVnA)

## My other editor setups

- Zed 101 - https://github.com/jellydn/zed-101-setup
- My Neovim 2024 - https://github.com/jellydn/my-nvim-ide
- Learn Neovim with VSCode - https://github.com/jellydn/learn-vim-with-vscode

## Author

👤 **Huynh Duc Dung**

- Website: https://productsway.com/
- Twitter: [@jellydn](https://twitter.com/jellydn)
- Github: [@jellydn](https://github.com/jellydn)

## Show your support

If this guide has been helpful, please give it a ⭐️.

[![kofi](https://img.shields.io/badge/Ko--fi-F16061?style=for-the-badge&logo=ko-fi&logoColor=white)](https://ko-fi.com/dunghd)
[![paypal](https://img.shields.io/badge/PayPal-00457C?style=for-the-badge&logo=paypal&logoColor=white)](https://paypal.me/dunghd)
[![buymeacoffee](https://img.shields.io/badge/Buy_Me_A_Coffee-FFDD00?style=for-the-badge&logo=buy-me-a-coffee&logoColor=black)](https://www.buymeacoffee.com/dunghd)
