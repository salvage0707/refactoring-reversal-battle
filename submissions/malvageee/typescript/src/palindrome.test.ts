import { describe, it, expect } from "vitest";
import { palindrome } from "./palindrome";

describe("palindrome", () => {
  it("空文字列は回文である", () => {
    expect(palindrome("")).toBe(true);
  });

  it("1文字の文字列は回文である", () => {
    expect(palindrome("a")).toBe(true);
    expect(palindrome("A")).toBe(true);
  });

  it("'level'は回文である", () => {
    expect(palindrome("level")).toBe(true);
  });

  it("'racecar'は回文である", () => {
    expect(palindrome("racecar")).toBe(true);
  });

  it("'madam'は回文である", () => {
    expect(palindrome("madam")).toBe(true);
  });

  it("大文字小文字が混在していても回文として判定される", () => {
    expect(palindrome("Level")).toBe(true);
    expect(palindrome("RACEcar")).toBe(true);
    expect(palindrome("MaDaM")).toBe(true);
  });

  it("'hello'は回文ではない", () => {
    expect(palindrome("hello")).toBe(false);
  });

  it("'world'は回文ではない", () => {
    expect(palindrome("world")).toBe(false);
  });

  it("'abc'は回文ではない", () => {
    expect(palindrome("abc")).toBe(false);
  });

  it("'abba'は回文である", () => {
    expect(palindrome("abba")).toBe(true);
  });

  it("'abcba'は回文である", () => {
    expect(palindrome("abcba")).toBe(true);
  });

  it("日本語の回文も判定できる", () => {
    expect(palindrome("しんぶんし")).toBe(true);
    expect(palindrome("たけやぶやけた")).toBe(true);
  });

  it("数字を含む回文も判定できる", () => {
    expect(palindrome("12321")).toBe(true);
    expect(palindrome("12345")).toBe(false);
  });

  it("空白を含む文字列も判定できる", () => {
    expect(palindrome("a a")).toBe(true);
    expect(palindrome("a b")).toBe(false);
  });

  it("nullを渡すとエラーを発生させる", () => {
    expect(() => palindrome(null as unknown as string)).toThrow(
      "strはnullまたはundefinedであってはなりません",
    );
  });

  it("undefinedを渡すとエラーを発生させる", () => {
    expect(() => palindrome(undefined as unknown as string)).toThrow(
      "strはnullまたはundefinedであってはなりません",
    );
  });

  it("数値を渡すとエラーを発生させる", () => {
    expect(() => palindrome(12321 as unknown as string)).toThrow(
      "strは文字列である必要があります",
    );
  });

  it("配列を渡すとエラーを発生させる", () => {
    expect(() => palindrome(["a", "b", "a"] as unknown as string)).toThrow(
      "strは文字列である必要があります",
    );
  });
});
