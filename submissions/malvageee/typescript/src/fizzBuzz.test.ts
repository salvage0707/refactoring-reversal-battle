import { describe, expect, it } from "vitest";
import { fizzBuzz } from "./fizzBuzz";

describe("fizzBuzz", () => {
  it("1を渡すと'1'を返す", async () => {
    expect(await fizzBuzz(1)).toBe("1");
  });

  it("2を渡すと'2'を返す", async () => {
    expect(await fizzBuzz(2)).toBe("2");
  });

  it("3を渡すと'Fizz'を返す", async () => {
    expect(await fizzBuzz(3)).toBe("Fizz");
  });

  it("4を渡すと'4'を返す", async () => {
    expect(await fizzBuzz(4)).toBe("4");
  });

  it("5を渡すと'Buzz'を返す", async () => {
    expect(await fizzBuzz(5)).toBe("Buzz");
  });

  it("6を渡すと'Fizz'を返す", async () => {
    expect(await fizzBuzz(6)).toBe("Fizz");
  });

  it("9を渡すと'Fizz'を返す", async () => {
    expect(await fizzBuzz(9)).toBe("Fizz");
  });

  it("10を渡すと'Buzz'を返す", async () => {
    expect(await fizzBuzz(10)).toBe("Buzz");
  });

  it("15を渡すと'FizzBuzz'を返す", async () => {
    expect(await fizzBuzz(15)).toBe("FizzBuzz");
  });

  it("30を渡すと'FizzBuzz'を返す", async () => {
    expect(await fizzBuzz(30)).toBe("FizzBuzz");
  });

  it("45を渡すと'FizzBuzz'を返す", async () => {
    expect(await fizzBuzz(45)).toBe("FizzBuzz");
  });

  it("100を渡すと'Buzz'を返す", async () => {
    expect(await fizzBuzz(100)).toBe("Buzz");
  });

  it("0を渡すとエラーを発生させる", async () => {
    await expect(fizzBuzz(0)).rejects.toThrow("nは1以上の整数である必要があります");
  });

  it("負の数を渡すとエラーを発生させる", async () => {
    await expect(fizzBuzz(-1)).rejects.toThrow("nは1以上の整数である必要があります");
    await expect(fizzBuzz(-15)).rejects.toThrow("nは1以上の整数である必要があります");
  });

  it("NaNを渡すとエラーを発生させる", async () => {
    await expect(fizzBuzz(Number.NaN)).rejects.toThrow("nはNaNであってはなりません");
  });

  it("Infinityを渡すとエラーを発生させる", async () => {
    await expect(fizzBuzz(Number.POSITIVE_INFINITY)).rejects.toThrow(
      "nは有限の数値である必要があります"
    );
    await expect(fizzBuzz(Number.NEGATIVE_INFINITY)).rejects.toThrow(
      "nは有限の数値である必要があります"
    );
  });

  it("浮動小数点数を渡すとエラーを発生させる", async () => {
    await expect(fizzBuzz(15.5)).rejects.toThrow("nは整数である必要があります");
  });
});
