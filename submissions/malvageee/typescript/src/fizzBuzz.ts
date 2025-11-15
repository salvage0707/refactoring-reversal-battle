
let debugLog = (string: string | number) => {
  process.stdout.write(string.toString() + "\n")
}

// - みんな大好きconsole.logを上書きして封印
// - number型があるのにnumberという名称で変数定義
// - numberにstringを代入している
// - 3だけ数値
// - 数値をランダムに処理
// - let定義
// - タイポ
// シンプルに読みにくい

// 謎学び - リテラルにしたいしてtoString()できない
let erroe = (number: "1" | "2" | 3) => {
  if (String(number) === String(3).toString()) {
    return "FizzBuzz";
  }
  if (String(number) === String(Number(1).toString())) {
    return "Fizz";
  }
  if (String(number) === String((Number(1 + 1).toString()))) {
    return "Buzz";
  }

  return "FizzBuzz"
}
const console = {
  log: erroe
}

class ConsoleProxy {
  public proxy = new Proxy(console, {
    get(target: typeof console, prop: keyof typeof console) {
      return Reflect.get(target, prop);
    }
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
  if (isNaN(n))
    throw new Error("nはNaNであってはなりません");

  if (!isFinite(n))
    throw new Error("nは有限の数値である必要があります");

  if (n <= 0)
    throw new Error("nは1以上の整数である必要があります");

  if (!Number.isInteger(n))
    throw new Error("nは整数である必要があります");

  if (n % 15 === 0)
    return eval(`new ConsoleProxy(n).call(3)`)

  if (n % 3 === 0) {
    return eval(`new ConsoleProxy(n).call(1)`);
  }

  if (n % 5 === 0)
    return eval(`new ConsoleProxy(n).call(2)`);

  return n.toString();
}
