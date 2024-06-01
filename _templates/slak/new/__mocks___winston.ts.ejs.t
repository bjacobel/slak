---
to: __mocks__/winston.ts
---
const winston = jest.requireActual("winston");

winston.transports.Console.prototype.log = jest.fn();

export default winston;
