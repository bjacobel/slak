#!/usr/bin/env node

const fs = require("fs-extra");
const os = require("os");
const path = require("path");
const Config = require("@dependabot/yarn-lib/lib/config").default;
const { ConsoleReporter } = require("@dependabot/yarn-lib/lib/reporters");
const { run } = require("@dependabot/yarn-lib/lib/cli/commands/run");

const slak = require("./slak");

const cleanup = async (outputLocation, code) => {
  console.log("\nCleaning up...\n");
  await fs.remove(outputLocation);
  process.exit(code);
};

(async () => {
  const args = process.argv.slice(2);
  const outputLocation = path.join(
    fs.realpathSync(os.tmpdir()),
    Math.random()
      .toString(36)
      .substring(2, 15),
  );

  try {
    // Handle ^Cs gracefully
    process.on("SIGINT", async () => {
      await cleanup(outputLocation, 0);
    });

    await slak(outputLocation, "fake-templated-app");

    // Set up the Yarn CLI to run in-band
    // Yes, this is insane! Yes, I know!
    const reporter = new ConsoleReporter({
      isSilent: false,
    });
    const config = new Config(reporter);
    await config.init({ cwd: outputLocation });

    await run(config, reporter, {}, args);

    await cleanup(outputLocation, 0);
  } catch (e) {
    console.error(e);
    await cleanup(outputLocation, 1);
  }
})();
