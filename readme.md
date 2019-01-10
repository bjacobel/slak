# Slak
_the **S**erver**l**ess **A**pp **K**it_

---

Cousin of [Rak](https://github.com/bjacobel/rak), Slak bootstraps a Serverless project for building Lambda functions with Typescript in a joyous environment.

Features include:
- TypeScript, for safe programming
- TSLint and Prettier, to promote good code style
- Jest, for unit testing
- TS-Node, for debugging
- Webpack, to bundle your functions
- Serverless, to manage deployment and provisioning
- Node 10 LTS, for the fastest startup and execution possible
- N|Solid, for profiling in production with minimal overhead

## Start a Slak project
It's easiest to use Slak with `npx` - that way, you won't need to install any dependencies to get started. In an empty folder, run:

    npx slak my-new-project-name

Slak will template out the files you need for your application and install its dependencies.

## Contribute changes to Slak
Most of the files in this repository are templates. To make changes to the app that Slak sets up for you initially, the recommended workflow is to run Slak to template those files out into a real app, make the changes and test them, and then convert the built files back into templates using `hygen-create`.
