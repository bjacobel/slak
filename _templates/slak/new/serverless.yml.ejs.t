---
to: serverless.yml
---
service: <%= name %>
provider:
  name: aws
  stage: ${opt:stage, "dev"}
  runtime: nodejs8.10  # Node 10 will actually be used, due to the NSolid layer
  environment:
    LOG_LEVEL: info
    NSOLID_LICENSE_KEY: ${env:NSOLID_LICENSE_KEY}
package:
  individually: true
  include:
    - src/**
  exclude:
    - src/__tests__/**
    - node_modules/aws-sdk/**  # The Lambda execution environment provides the aws-sdk builtin, so exclude it from packaging.
plugins:
  - serverless-webpack
functions:
  main:
    memorySize: 128
    handler: src/main.default
    layers:
      - ${self:custom.nSolid.layerArn}
custom:
  nSolid:
    accountId: 800406105498
    layerVersion: 6
    layerArn: arn:aws:lambda:${self:provider.region}:${self:custom.nSolid.accountId}:layer:nsolid-node-10:${self:custom.nSolid.layerVersion}
  webpack:
    packager: "yarn"
    includeModules:
      forceExclude:
        - electron
        - aws-sdk
