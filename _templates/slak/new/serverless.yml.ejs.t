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
  iam:
    role:
      name: <%= name.toLowerCase() %>-role
      statements:
        - Effect: "Allow"
          Resource:
            - "Fn::Join":
                - ":"
                - - "arn:aws:secretsmanager"
                  - Ref: "AWS::Region"
                  - Ref: "AWS::AccountId"
                  - "secret"
                  - "<%= name.toLowerCase() %>-secrets*"
          Action:
            - secretsmanager:GetSecretValue
            - secretsmanager:DescribeSecret
package:
  individually: true
  patterns:
    - "src/**"
    - "!src/__tests__/**"
    - "!node_modules/@aws-sdk/**" # The Lambda execution environment provides @aws-sdk/* builtin, so exclude it from packaging.
plugins:
  - serverless-esbuild
  - serverless-dotenv-plugin
functions:
  main:
    memorySize: 128
    handler: src/main.default
custom:
  esbuild:
    bundle: true
    minify: true
    keepNames: true
    packager: yarn
    target: node20
    exclude:
      - "@aws-sdk/*"
resources:
  Resources:
    <%= name %>Secrets:
      Type: AWS::SecretsManager::Secret
      Properties:
        Name: <%= name.toLowerCase() %>-secrets
