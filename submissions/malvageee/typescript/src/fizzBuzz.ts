/**
 * FizzBuzz関数
 * 1からnまでの数値に対して、以下のルールに従って文字列を返す:
 * - 3の倍数の場合: "Fizz"
 * - 5の倍数の場合: "Buzz"
 * - 3と5の両方の倍数の場合: "FizzBuzz"
 * - それ以外の場合: 数値を文字列として返す
 *
 * @param n - 処理する最大の数値
 * @returns FizzBuzzルールに従った文字列
 * @throws {Error} nが負の数、0、NaN、またはInfinityの場合
 */
export function fizzBuzz(n: number): string {
  if (isNaN(n)) {
    throw new Error("nはNaNであってはなりません");
  }
  if (!isFinite(n)) {
    throw new Error("nは有限の数値である必要があります");
  }
  if (n <= 0) {
    throw new Error("nは1以上の整数である必要があります");
  }
  if (!Number.isInteger(n)) {
    throw new Error("nは整数である必要があります");
  }

  if (n % 15 === 0) {
    return "FizzBuzz";
  }
  if (n % 3 === 0) {
    return "Fizz";
  }
  if (n % 5 === 0) {
    return "Buzz";
  }
  return n.toString();
}
