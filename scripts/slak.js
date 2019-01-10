#!/usr/bin/env node

const path = require('path');

const { runner } = require('hygen');
const Logger = require('hygen/lib/logger');

const runWrapper = (name, ...args) => {
  if (!name) {
    throw new Error("You must at least specify a name for the project, e.g.\n\n\tnpx slak my-new-lambda\n")
  }

  return runner(["slak", "new", "--name", name, ...args], {
    templates: path.join(__dirname, '../_templates'),
    cwd: process.cwd(),
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
  runWrapper(process.argv.slice(2));
}

module.exports = runWrapper;
