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
    "aws-sdk": "^2.572.0",
    "logform": "^2.1.0",
    "triple-beam": "^1.2.0",
    "winston": "^3.1.0"
  },
  "devDependencies": {
    "@types/jest": "^24.0.23",
    "@types/node": "~12.12.7",
    "@types/triple-beam": "^1.3.0",
    "jest": "^24.9.0",
    "jest-cli": "^24.9.0",
    "prettier": "^1.19.1",
    "serverless": "^1.57.0",
    "serverless-dotenv-plugin": "^2.1.1",
    "serverless-nsolid-plugin": "^1.1.0",
    "serverless-webpack": "^5.3.1",
    "ts-jest": "^24.1.0",
    "ts-loader": "^6.2.1",
    "ts-node": "^8.5.0",
    "tslint": "^5.20.1",
    "tslint-config-prettier": "^1.17.0",
    "typescript": "^3.7.2",
    "webpack": "^4.41.2",
    "webpack-bundle-analyzer": "^3.6.0",
    "webpack-cli": "^3.3.10"
  },
  "engine": {
    "node": "~12.13"
  }
}
