---
to: package.json
---
{
  "name": "<%= name.toLowerCase() %>",
  "version": "1.0.0",
  "license": "MIT",
  "scripts": {
    "lint": "tslint -t stylish --fix -p .",
    "analyze": "ANALYZE=true sls package",
    "deploy": "sls deploy",
    "test": "jest",
    "sls": "sls",
    "upstream": "mkdir -p /tmp/_templates && HYGEN_CREATE_TMPLS=/tmp/_templates npx hygen-create g && rsync -auP --remove-source-files -f"+ */" -f"- *" /tmp/_templates/"
  },
  "dependencies": {
    "aws-sdk": "^2.384.0",
    "logform": "^2.1.0",
    "triple-beam": "^1.2.0",
    "winston": "^3.1.0"
  },
  "devDependencies": {
    "@types/jest": "^23.3.12",
    "@types/node": "~10.12",
    "@types/triple-beam": "^1.3.0",
    "jest": "^23.6.0",
    "jest-cli": "^23.6.0",
    "prettier": "^1.15.3",
    "serverless": "^1.35.1",
    "serverless-webpack": "^5.2.0",
    "ts-jest": "^23.10.5",
    "ts-loader": "^5.3.3",
    "ts-node": "^7.0.1",
    "tslint": "^5.12.0",
    "tslint-config-prettier": "^1.17.0",
    "tslint-plugin-prettier": "^2.0.1",
    "typescript": "^3.2.2",
    "webpack": "^4.28.1",
    "webpack-bundle-analyzer": "^3.0.3",
    "webpack-cli": "^3.2.1"
  },
  "resolutions": {
    "logform": "2.1.0"
  },
  "engine": {
    "node": "~10.12"
  }
}
