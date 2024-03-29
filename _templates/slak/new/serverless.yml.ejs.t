---
to: serverless.yml
---
service: <%= name.toLowerCase() %>
provider:
  name: aws
  stage: ${opt:stage, "dev"}
  runtime: nodejs20.x
  environment:
    LOG_LEVEL: info
package:
  individually: true
  include:
    - src/**
  exclude:
    - src/__tests__/**
    - node_modules/aws-sdk/** # The Lambda execution environment provides the aws-sdk builtin, so exclude it from packaging.
plugins:
  - serverless-webpack
  - serverless-dotenv-plugin
functions:
  main:
    memorySize: 128
    handler: src/main.default
custom:
  webpack:
    packager: "yarn"
    includeModules:
      forceExclude:
        - electron
        - aws-sdk
