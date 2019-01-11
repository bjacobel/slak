---
to: src/utils/__tests__/__snapshots__/log-test.ts.snap
---
// Jest Snapshot v1, https://goo.gl/fbAQLP

exports[`log util in dev mode formats errors like I want 1`] = `
Object {
  "level": "error",
  "message": "Error: format the error please
    at Object.it (<%= cwd %>/src/utils/__tests__/log-test.ts:18:18)
    at Object.asyncJestTest (<%= cwd %>/node_modules/jest-jasmine2/build/jasmine_async.js:108:37)
    at resolve (<%= cwd %>/node_modules/jest-jasmine2/build/queue_runner.js:56:12)
    at new Promise (<anonymous>)
    at mapper (<%= cwd %>/node_modules/jest-jasmine2/build/queue_runner.js:43:19)
    at promise.then (<%= cwd %>/node_modules/jest-jasmine2/build/queue_runner.js:87:41)
    at process._tickCallback (internal/process/next_tick.js:68:7)",
  "stack": "Error: format the error please
    at Object.it (<%= cwd %>/src/utils/__tests__/log-test.ts:18:18)
    at Object.asyncJestTest (<%= cwd %>/node_modules/jest-jasmine2/build/jasmine_async.js:108:37)
    at resolve (<%= cwd %>/node_modules/jest-jasmine2/build/queue_runner.js:56:12)
    at new Promise (<anonymous>)
    at mapper (<%= cwd %>/node_modules/jest-jasmine2/build/queue_runner.js:43:19)
    at promise.then (<%= cwd %>/node_modules/jest-jasmine2/build/queue_runner.js:87:41)
    at process._tickCallback (internal/process/next_tick.js:68:7)",
  Symbol(message): "error: 	Error: format the error please
	    at Object.it (<%= cwd %>/src/utils/__tests__/log-test.ts:18:18)
	    at Object.asyncJestTest (<%= cwd %>/node_modules/jest-jasmine2/build/jasmine_async.js:108:37)
	    at resolve (<%= cwd %>/node_modules/jest-jasmine2/build/queue_runner.js:56:12)
	    at new Promise (<anonymous>)
	    at mapper (<%= cwd %>/node_modules/jest-jasmine2/build/queue_runner.js:43:19)
	    at promise.then (<%= cwd %>/node_modules/jest-jasmine2/build/queue_runner.js:87:41)
	    at process._tickCallback (internal/process/next_tick.js:68:7)",
}
`;

exports[`log util in dev mode formats javascript objects like I want 1`] = `
Object {
  "level": "info",
  "message": "{
  \\"foo\\": {
    \\"bar\\": [
      1,
      2,
      3
    ]
  }
}",
  Symbol(message): "info: 	{
	  \\"foo\\": {
	    \\"bar\\": [
	      1,
	      2,
	      3
	    ]
	  }
	}",
}
`;
