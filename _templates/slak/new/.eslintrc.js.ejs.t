---
to: .eslintrc.js
---
module.exports = {
  env: {
    node: true,
  },
  parser: "@typescript-eslint/parser",
  plugins: ["@typescript-eslint"],
  extends: ["eslint:recommended"],
  overrides: [
    {
      files: ["*.md"],
      extends: ["plugin:@typescript-eslint/recommended"],
    },
  ],
};
