---
to: tsconfig.json
---
{
  "compilerOptions": {
    "lib": ["es2022"],
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
    "target": "es2022",
    "skipLibCheck": true
  },
  "include": ["src/**/*", "__mocks__/**/*"]
}
