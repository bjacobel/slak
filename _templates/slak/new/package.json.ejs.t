---
to: package.json
---
{
  "name": "<%= name.toLowerCase() %>",
  "version": "1.0.0",
  "license": "MIT",
  "scripts": {
    "lint": "tslint -t stylish -p . && prettier -c \"**/*.{ts,js,json}\" && tsc --noEmit",
    "analyze": "ANALYZE=true sls package",
    "deploy": "sls deploy",
    "test": "jest",
    "sls": "sls",
    "upstream": "rm -rf /tmp/_templates && mkdir /tmp/_templates && HYGEN_CREATE_TMPLS=/tmp/_templates npx hygen-create g && rsync -auP --remove-source-files /tmp/_templates/"
  },
  "dependencies": {
    "aws-sdk": "^2.630.0",
    "logform": "^2.1.0",
    "triple-beam": "^1.2.0",
    "winston": "^3.1.0"
  },
  "devDependencies": {
    "@types/jest": "^25.1.3",
    "@types/node": "~12.12.7",
    "@types/triple-beam": "^1.3.0",
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
    "tslint": "^6.0.0",
    "tslint-config-prettier": "^1.17.0",
    "typescript": "^3.8.3",
    "webpack": "^4.41.6",
    "webpack-bundle-analyzer": "^3.6.0",
    "webpack-cli": "^3.3.11"
  },
  "engine": {
    "node": "~12.13"
  }
}
