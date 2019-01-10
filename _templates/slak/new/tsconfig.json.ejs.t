---
to: tsconfig.json
---
{
  "compilerOptions": {
    "lib": ["es2017"],
    "module": "commonjs",
    "moduleResolution": "node",
    "noImplicitAny": true,
    "noImplicitReturns": true,
    "noUnusedLocals": true,
    "preserveConstEnums": true,
    "removeComments": true,
    "resolveJsonModule": true,
    "sourceMap": true,
    "strict": true,
    "target": "es2017",
  },
  "include": [
    "src/**/*"
  ],
  "exclude": [
    "node_modules",
  ]
}