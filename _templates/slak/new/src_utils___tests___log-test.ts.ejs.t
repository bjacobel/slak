---
to: src/utils/__tests__/log-test.ts
---
import * as winston from "winston";

import log, { debugFormat } from "../log";

jest.mock("winston");
jest.mock("winston-transport/legacy");

describe("log util", () => {
  it("exports a configured instance of Winston", () => {
    log.error("testing winston");
    expect(winston.transports.Console.prototype.log).toHaveBeenCalled();
  });

  describe("in dev mode", () => {
    it("formats errors like I want", () => {
      expect(debugFormat.transform({
        level: "error",
        message: new Error("format the error please") as unknown as string,
      })).toMatchSnapshot();
    });

    it("formats javascript objects like I want", () => {
      expect(debugFormat.transform({
        level: "info",
        message: { foo: { bar: [1, 2, 3] } } as unknown as string,
      })).toMatchSnapshot();
    });
  });
});
