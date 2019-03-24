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
    "aws-sdk": "^2.384.0",
    "logform": "^2.1.0",
    "triple-beam": "^1.2.0",
    "winston": "^3.1.0"
  },
  "devDependencies": {
    "@types/jest": "^24.0.11",
    "@types/node": "~10.12",
    "@types/triple-beam": "^1.3.0",
    "jest": "^24.5.0",
    "jest-cli": "^24.5.0",
    "prettier": "^1.15.3",
    "serverless": "^1.37.1",
    "serverless-dotenv-plugin": "^2.0.1",
    "serverless-nsolid-plugin": "^1.0.5",
    "serverless-webpack": "^5.2.0",
    "ts-jest": "^24.0.0",
    "ts-loader": "^5.3.3",
    "ts-node": "^7.0.1",
    "tslint": "^5.12.1",
    "tslint-config-prettier": "^1.17.0",
    "typescript": "^3.2.2",
    "webpack": "^4.28.4",
    "webpack-bundle-analyzer": "^3.0.3",
    "webpack-cli": "^3.2.1"
  },
  "engine": {
    "node": "~10.12"
  }
}
