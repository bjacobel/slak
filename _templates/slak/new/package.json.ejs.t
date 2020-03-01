---
to: package.json
---
{
  "name": "<%= name.toLowerCase() %>",
  "version": "1.0.0",
  "license": "MIT",
  "scripts": {
    "style": "prettier -c --ignore-path .eslintignore \"**/*.{js,ts,json,md}\"",
    "validate": "tsc --noEmit",
    "lint": "yarn --silent style && yarn --silent validate && eslint . --ext .js,.ts",
    "analyze": "ANALYZE=true sls package",
    "deploy": "sls deploy",
    "test": "jest",
    "sls": "sls",
    "upstream": "rm -rf /tmp/_templates && mkdir /tmp/_templates && HYGEN_CREATE_TMPLS=/tmp/_templates npx hygen-create g && rsync -auP --remove-source-files /tmp/_templates/"
  },
  "dependencies": {
    "aws-lambda": "^1.0.5",
    "aws-sdk": "^2.630.0",
    "logform": "^2.1.0",
    "triple-beam": "^1.2.0",
    "winston": "^3.1.0"
  },
  "devDependencies": {
    "@types/aws-lambda": "^8.10.45",
    "@types/jest": "^25.1.3",
    "@types/node": "~12.12.7",
    "@types/triple-beam": "^1.3.0",
    "@typescript-eslint/eslint-plugin": "^2.21.0",
    "@typescript-eslint/parser": "^2.21.0",
    "eslint": "^6.8.0",
    "jest": "^25.1.0",
    "jest-cli": "^25.1.0",
    "prettier": "^1.19.1",
    "serverless": "^1.65.0",
    "serverless-dotenv-plugin": "^2.3.2",
    "serverless-nsolid-plugin": "^1.1.0",
    "serverless-webpack": "^5.3.1",
    "ts-jest": "^25.2.1",
    "ts-loader": "^6.2.1",
    "ts-node": "^8.6.2",
    "typescript": "^3.8.3",
    "webpack": "^4.41.6",
    "webpack-bundle-analyzer": "^3.6.0",
    "webpack-cli": "^3.3.11"
  },
  "engine": {
    "node": "~12.13"
  }
}
