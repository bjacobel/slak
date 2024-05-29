---
to: src/main.ts
---
import type { EventBridgeEvent, Handler } from "aws-lambda";

import log from "./utils/log";

const handler: Handler<EventBridgeEvent<"Scheduled Event", string>> = async (
  event,
) => {
  try {
    return Promise.resolve();
  } catch (e) {
    log.info(JSON.stringify(event, null, 2));
    log.error(e);
    return Promise.reject(e);
  }
};

export default handler;
