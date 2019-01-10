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
      "args": ["${workspaceRoot}/src/main.ts"],
      "runtimeArgs": ["--nolazy", "-r", "ts-node/register"],
      "cwd": "${workspaceRoot}",
      "protocol": "inspector",
      "internalConsoleOptions": "openOnSessionStart"
    }
  ]
}
