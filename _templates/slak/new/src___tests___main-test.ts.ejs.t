---
to: src/__tests__/main-test.ts
---
import main from "../main";
import log from "../utils/log";

jest.mock("../utils/log");

describe("main function handler", () => {
  describe("happy path of boilerplate", () => {
    it("resolves with details from event sent", () => {
      expect(main({ source: { service: "s3" } })).resolves.toEqual("s3");
    });
  });
  describe("error handling", () => {
    it("logs the event with INFO level", () => {
      return main("nope").catch(() =>
        expect(log.info).toHaveBeenCalledWith("nope")
      );
    });

    it("logs the error with ERROR level", async () => {
      return main("nope").catch(() =>
        expect(log.error).toHaveBeenCalledWith(expect.any(TypeError))
      );
    });

    it("returns a promise rejection", () => {
      return main("nope").catch(err => expect(err).toBeInstanceOf(TypeError));
    });
  })
});
