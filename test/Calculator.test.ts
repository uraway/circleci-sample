import { expect } from "chai";
import Calculator from "../src/Calculator";

describe("calculate", function() {
  it("add", function() {
    const result = Calculator.sum([5, 2]);
    expect(result).equal(6);
  });
});
