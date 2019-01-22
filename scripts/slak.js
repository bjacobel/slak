#!/usr/bin/env node

const path = require("path");
const fs = require("fs-extra");

const { runner } = require('hygen');
const Logger = require('hygen/lib/logger');

const fatal = (message) => {
  console.error(message + "\n");
  process.exit(1);
};

const runWrapper = async (location, name) => {
  if (!location) {
    fatal("You must specify an output path for the project");
  }

  if (!name) {
    fatal("You must specify a name for the project, e.g.\n\n\tnpx slak my-new-lambda")
  }

  console.log(`Creating new Slak app "${name}" in ${location} ...`)

  return await runner(["slak", "new", "--name", name], {
    templates: path.join(__dirname, '../_templates'),
    cwd: location,
    logger: new Logger(console.log.bind(console)),
    createPrompter: () => require('enquirer'),
    exec: (action, body) => {
      const opts = body && body.length > 0 ? { input: body } : {}
      return require('execa').shell(action, opts)
    },
    debug: !!process.env.DEBUG,
  });
}


if (require.main === module) {
  const args = process.argv.slice(2);
  const flags = args;
  let destination = process.cwd();

  try {
    if (fs.accessSync(path.resolve(flags[0])) === undefined) {
      destination = flags.shift();
    }
  } catch (e) {}

  runWrapper(destination, ...flags);
}

module.exports = runWrapper;
