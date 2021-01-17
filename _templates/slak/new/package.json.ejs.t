---
to: package.json
---
{
  "name": "<%= name.toLowerCase() %>",
  "version": "1.0.0",
  "license": "MIT",
  "scripts": {
    "style": "prettier -c --ignore-path .eslintignore .",
    "validate": "tsc --noEmit",
    "lint": "yarn --silent style && yarn --silent validate && eslint . --ext .js,.ts",
    "analyze": "ANALYZE=true sls package",
    "deploy": "sls deploy",
    "test": "jest",
    "upstream": "rm -rf /tmp/_templates && mkdir /tmp/_templates && HYGEN_CREATE_TMPLS=/tmp/_templates npx hygen-create g && rsync -auP --remove-source-files /tmp/_templates/"
  },
  "dependencies": {
    "aws-lambda": "1.0.6",
    "aws-sdk": "2.715.0",
    "logform": "2.2.0",
    "triple-beam": "1.3.0",
    "winston": "3.3.3"
  },
  "devDependencies": {
    "@types/aws-lambda": "^8.10.51",
    "@types/jest": "^25.2.1",
    "@types/node": "~12.12.7",
    "@types/triple-beam": "^1.3.0",
    "@typescript-eslint/eslint-plugin": "^2.31.0",
    "@typescript-eslint/parser": "^2.31.0",
    "duplicate-package-checker-webpack-plugin": "3.0.0",
    "eslint": "^6.8.0",
    "jest": "^25.5.4",
    "prettier": "^2.0.5",
    "serverless": "^1.69.0",
    "serverless-dotenv-plugin": "^2.4.2",
    "serverless-webpack": "^5.3.2",
    "ts-jest": "^25.4.0",
    "ts-loader": "^7.0.2",
    "ts-node": "^8.10.1",
    "typescript": "^3.8.3",
    "webpack": "^4.43.0",
    "webpack-bundle-analyzer": "^3.7.0",
    "webpack-cli": "^3.3.11"
  },
  "engine": {
    "node": "~12.13"
  }
}
