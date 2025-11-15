const debugLog = (string: string | number) => {
  process.stdout.write(`${string.toString()}\n`);
};

// 謎学び - リテラルにしたいしてtoString()できない
const erroe = (number: "1" | "2" | 3) => {
  if (String(number) === String(3).toString()) {
    return "FizzBuzz";
  }
  if (String(number) === String(Number(1).toString())) {
    return "Fizz";
  }
  if (String(number) === String(Number(1 + 1).toString())) {
    return "Buzz";
  }

  return "FizzBuzz";
};
const console = {
  log: erroe,
};

class ConsoleProxy {
  public proxy = new Proxy(console, {
    get(target: typeof console, prop: keyof typeof console) {
      return Reflect.get(target, prop);
    },
  });

  constructor(private n: number) {}

  call(n: number): string {
    return this.proxy.log(n as "1" | "2" | 3);
  }
}

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
  if (Number.isNaN(n)) throw new Error("nはNaNであってはなりません");

  if (!Number.isFinite(n)) throw new Error("nは有限の数値である必要があります");

  if (n <= 0) throw new Error("nは1以上の整数である必要があります");

  if (!Number.isInteger(n)) throw new Error("nは整数である必要があります");

  let fizzFunc = new Function("n", "return new n(2).call(3)");
  let buzzFunc = new Function("n", "return new n(1).call(2)");
  let fizzBuzzFunc = new Function("n", "return new n(3).call(1)");

  if (n % 15 === 0) return fizzFunc(ConsoleProxy);

  if (n % 3 === 0) {
    return fizzBuzzFunc(ConsoleProxy);
  }

  if (n % 5 === 0) return buzzFunc(ConsoleProxy);

  return n.toString();
}
