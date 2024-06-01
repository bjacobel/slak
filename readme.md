<img src="https://raw.githubusercontent.com/bjacobel/slak/master/assets/logo.svg?sanitize=true" alt="Slak" width="200px">

_the **S**erver**l**ess **A**pp **K**it_

Cousin of [Rak](https://github.com/bjacobel/rak), Slak bootstraps a Serverless project for building Lambda functions with Typescript in a joyous environment.

Features include:
- TypeScript, for safe programming
- ESLint and Prettier, to promote good code style
- Jest, for unit testing
- TS-Node, for debugging
- ESBuild, to bundle your functions
- Serverless, to manage deployment and provisioning
- Node 20 LTS, for the fastest startup and execution possible
- Builtin logging utils and project structure for getting moving fast

## Start a Slak project
It's easiest to use Slak with `npx` - that way, you won't need to install any dependencies to get started. In an empty folder, run:

    npx slak my-new-project-name

Slak will template out the files you need for your application and install its dependencies.

## Contribute changes to Slak
Most of the files in this repository are templates. To make changes to the app that Slak sets up for you initially, the recommended workflow is to run Slak to template those files out into a real app, make the changes and test them, and then convert the built files back into templates using [`hygen-create`](http://www.hygen.io/create). The basic workflow looks like:

1. Template out a new Slak app

        npx slak my-new-lambda

2. Make some changes in the templated app, e.g., adding a new util file

        echo "export default {};" > src/utils/newUtil.ts

3. Make `hygen-create` aware of the new file

        npx hygen-create add src/utils/newUtil.ts

4. Generate the templates again, merging them with the existing ones at the location you specify

        yarn upstream ~/code/slak/_templates

This works because Slak adds a `hygen-create.json` to the templated app, marking it as a hygen-create project in-session. Don't delete this file.

## Executing tasks on the templates
It's possible to run anything you would normally run as a `yarn run` command on the templates without creating a new project first using the `yarn tpl` command. `tpl` sets up a new project in a `/tmp` directory, then invokes `yarn run` there. For example, to run the `package.json`-defined `test` script on the current state of the templates:

    yarn tpl test

This command will even clean up the `/tmp` folder after.

## Making changes _and_ executing tasks
Combining the two above processes is easy, if you want to run a command on the files that the template would produce and then save file changes effected by that command back to the templates. Simply pass the `--upstream` argument to `yarn tpl`, e.g.:

    yarn tpl upgrade-interactive --latest --upstream

After selecting packages to upgrade, this command would update the _template_ versions of package.json and yarn.lock.
