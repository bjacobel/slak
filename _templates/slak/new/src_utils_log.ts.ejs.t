---
to: src/utils/log.ts
---
import { createLogger, transports } from "winston";
import { format } from "logform";

const defaultFormat = [format.errors({ stack: true })];

export const debugFormat = format.combine(
  // format.colorize(),
  ...defaultFormat,
  format.printf(info => {
    if (info.message && typeof(info.message) === "object") {
      try {
        info.message = JSON.stringify(info.message, null, 2);
      } catch {
        info.message = "[Circular object]";
      }
    }

    if (info.stack) {
      info.message = info.stack;
    }

    return `${info.level}: \t${info.message.split("\n").join("\n\t")}`
  }),
);

export const cloudwatchFormat = format.combine(
  ...defaultFormat,
  format.timestamp(),
  format.json(),
);

export default createLogger({
  level: "info",
  format: process.env.NODE_ENV === "production" ? cloudwatchFormat : debugFormat,
  transports: [new transports.Console({
    level: process.env.LOG_LEVEL,
  })],
});
