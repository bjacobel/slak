---
to: tslint.json
---
{
  "extends": [
    "tslint:latest", "tslint-config-prettier"
  ],
  "rules": {
    "interface-name": false,
    "no-implicit-dependencies": [true, "dev"],
    "no-submodule-imports": false,
    "no-object-literal-type-assertion": false,
    "object-literal-sort-keys": false,
    "one-variable-per-declaration": false
  }
}
