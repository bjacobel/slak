---
to: .vscode/launch.json
---
{
  "version": "0.2.0",
  "configurations": [
    {
      "name": "Debug TS",
      "type": "node",
      "request": "launch",
      "args": ["-e", "require('${workspaceRoot}/src/main.ts').default()"],
      "runtimeArgs": ["--nolazy", "-r", "ts-node/register"],
      "cwd": "${workspaceRoot}",
      "internalConsoleOptions": "openOnSessionStart",
      "envFile": "${workspaceFolder}/.env",
      "outputCapture": "std"
    }
  ]
}
