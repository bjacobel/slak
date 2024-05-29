---
to: src/utils/log.ts
---
import { format } from "logform";
import winston from "winston";

import { IS_PROD } from "../constants.ts";

let logger: winston.Logger;

if (IS_PROD) {
  const WinstonCloudWatch = require("winston-cloudwatch");
  logger = winston.createLogger({
    level: "debug",
    format: format.json(),
    transports: [
      new WinstonCloudWatch({
        level: "error",
        logGroupName: "/aws/lambda/petsky-dev-main",
        logStreamName: "winston",
        awsRegion: "us-east-1",
      }),
    ],
  });
} else {
  const debugFormat = require("winston-format-debug").default;
  logger = winston.createLogger({
    levels: winston.config.syslog.levels,
    level: "debug",
    transports: [
      new winston.transports.Console({
        format: winston.format.combine(
          debugFormat({
            levels: winston.config.syslog.levels,
            colors: winston.config.syslog.colors,
          }),
        ),
      }),
    ],
  });
}

export default logger;
