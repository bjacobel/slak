---
to: src/utils/__tests__/__snapshots__/log-test.ts.snap
---
// Jest Snapshot v1, https://goo.gl/fbAQLP

exports[`log util in dev mode formats errors like I want 1`] = `
"[31merror[39m: 	Error: format the error please
	    at Object.<anonymous> ("
`;

exports[`log util in dev mode formats javascript objects like I want 1`] = `
"[32minfo[39m: 	{
	  \\"foo\\": {
	    \\"bar\\": [
	      1,
	      2,
	      3
	    ]
	  }
	}"
`;
