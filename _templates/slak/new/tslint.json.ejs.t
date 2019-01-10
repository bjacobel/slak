---
to: tslint.json
---
{
  "extends": [
    "tslint:latest",
  ],
  "rulesDirectory": ["tslint-plugin-prettier"],
  "plugins": ["prettier"],
  "rules": {
    "interface-name": false,
    "no-submodule-imports": false,
    "no-object-literal-type-assertion": false,
    "object-literal-sort-keys": false,
    "one-variable-per-declaration": false,
    "prettier": [
      true,
      {
        "singleQuote": false,
        "trailingComma": "all",
        "arrowParens": "always"
      }
    ]
  }
}
