#!/usr/bin/env node

const fs = require("fs-extra");
const os = require("os");
const path = require("path");
const { spawn } = require('child_process');

const slak = require("./slak");

const cleanup = async (outputLocation, code) => {
  console.log("\nCleaning up...\n");
  await fs.remove(outputLocation);
  process.exit(code);
};

(async () => {
  let args = process.argv.slice(2);
  const upstream = args.includes("--upstream");
  if (upstream) args = args.filter(x => x !== "--upstream");

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

    console.log(await new Promise((resolve, reject) => {
      const cmd = spawn("yarn", args, {
        cwd: outputLocation,
        stdio: "inherit",
        shell: true
      });

      cmd.on('close', (code) => {
        if (code) {
          reject(`exited with code ${code}`);
        } else {
          resolve(`Command \`${args.join(" ")}\` finished successfully.`);
        }
      });
    }));

    if (upstream) {
      console.log(await new Promise((resolve, reject) => {
        const cmd = spawn("yarn", ["upstream", path.join(__dirname, "../_templates")], {
          cwd: outputLocation,
          stdio: "inherit"
        });

        cmd.on('close', (code) => {
          if (code) {
            reject(`upstreaming exited with code ${code}`);
          } else {
            resolve(`Synced changes from command to upstream.`);
          }
        });
      }));
    }

    await cleanup(outputLocation, 0);
  } catch (e) {
    console.error(e);
    await cleanup(outputLocation, 1);
  }
})();
