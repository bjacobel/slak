import jest from "jest";

const LegacyTransportStream = jest.requireActual("winston-transport/legacy");

LegacyTransportStream.prototype._deprecated = jest.fn();

export default LegacyTransportStream;
