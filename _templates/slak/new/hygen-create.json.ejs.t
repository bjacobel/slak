---
to: hygen-create.json
---
{
  "about": "This is a hygen-create definitions file. The hygen-create utility creates generators that can be executed using hygen.",
  "hygen_create_version": "0.2.0",
  "name": "slak",
  "files_and_dirs": {
    "yarn.lock": true,
    "webpack.config.js": true,
    "tslint.json": true,
    "tsconfig.json": true,
    "serverless.yml": true,
    "readme.md": true,
    "package.json": true,
    "jest.config.js": true,
    "hygen-create.json": true,
    ".eslintignore": true,
    ".eslintrc.js": true,
    ".gitignore": true,
    ".npmrc": true,
    ".vscode/settings.json": true,
    ".vscode/launch.json": true,
    ".serverless/cloudformation-template-create-stack.json": true,
    "__mocks__/winston.ts": true,
    "src/main.ts": true,
    "src/debug-handler.ts": true,
    "src/__tests__/main-test.ts": true,
    "src/utils/log.ts": true,
    "src/utils/secrets.ts": true
  },
  "templatize_using_name": "<%= name.toLowerCase() %>",
  "gen_parent_dir": false
}
