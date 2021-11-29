import { expect } from "chai";

import { getHelloWorld } from "../src/hello_world";

describe("Hello World", () => {
    it("should get the correct message", () => {
        expect(getHelloWorld()).to.equal("Hello World!");
    });
});
