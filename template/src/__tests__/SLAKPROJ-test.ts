import SLAKPROJ from "../SLAKPROJ";
import log from "../utils/log";

jest.mock("../utils/log");

describe("SLAKPROJ function handler", () => {
  describe("happy path of boilerplate", () => {
    it("resolves with details from event sent", () => {
      expect(SLAKPROJ({ source: { service: "s3" } })).resolves.toEqual("s3");
    });
  });
  describe("error handling", () => {
    it("logs the event with INFO level", () => {
      return SLAKPROJ("nope").catch(() =>
        expect(log.info).toHaveBeenCalledWith("nope")
      );
    });

    it("logs the error with ERROR level", async () => {
      return SLAKPROJ("nope").catch(() =>
        expect(log.error).toHaveBeenCalledWith(expect.any(TypeError))
      );
    });

    it("returns a promise rejection", () => {
      return SLAKPROJ("nope").catch(err => expect(err).toBeInstanceOf(TypeError));
    });
  })
});
