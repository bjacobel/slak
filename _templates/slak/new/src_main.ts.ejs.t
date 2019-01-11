---
to: src/main.ts
---
// Import aws-sdk to check that ignoring it from the bundle works.
// @ts-ignore 6133
import AWS from "aws-sdk";

import log from "./utils/log";

export default async (event: any) => {
  try {
    return Promise.resolve(event.source.service);
  } catch (e) {
    log.info(JSON.stringify(event, null, 2));
    log.error(e);
    return Promise.reject(e);
  }
};
