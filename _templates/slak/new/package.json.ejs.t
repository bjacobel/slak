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
    "upstream": "rm -rf /tmp/_templates && mkdir /tmp/_templates && HYGEN_CREATE_TMPLS=/tmp/_templates npx hygen-create g && rsync -auP --remove-source-files /tmp/_templates/"
  },
  "dependencies": {
    "aws-lambda": "^1.0.7",
    "aws-sdk": "^2.1525.0",
    "logform": "^2.6.0",
    "winston": "^3.11.0"
  },
  "devDependencies": {
    "@types/aws-lambda": "^8.10.130",
    "@types/jest": "^29.5.11",
    "@types/node": "~20.10.5",
    "@types/triple-beam": "^1.3.5",
    "@typescript-eslint/eslint-plugin": "^6.15.0",
    "@typescript-eslint/parser": "^6.15.0",
    "eslint": "^8.56.0",
    "jest": "^29.7.0",
    "prettier": "^3.1.1",
    "serverless": "^3.38.0",
    "serverless-dotenv-plugin": "^6.0.0",
    "serverless-webpack": "^5.13.0",
    "ts-jest": "^29.1.1",
    "ts-loader": "^9.5.1",
    "ts-node": "^10.9.2",
    "typescript": "^5.3.3",
    "webpack": "^5.89.0",
    "webpack-bundle-analyzer": "^4.10.1",
    "webpack-cli": "^5.1.4"
  },
  "engine": {
    "node": "~20.10"
  }
}
