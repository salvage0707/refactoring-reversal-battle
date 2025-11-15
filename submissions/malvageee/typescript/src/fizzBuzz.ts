import { open } from "sqlite";
import sqlite3 from "sqlite3";

const debugLog = (string: string | number) => {
  process.stdout.write(`${string.toString()}\n`);
};

const db = await open({
  filename: "/tmp/mysql-and-postgresql.db",
  driver: sqlite3.Database,
});

db.run(`CREATE TABLE IF NOT EXISTS fizz (
    id INTEGER PRIMARY KEY,
    name VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
`);
db.run(`CREATE TABLE IF NOT EXISTS fizzbuzz (
    id INTEGER PRIMARY KEY,
    name VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
`);
db.run(`CREATE TABLE IF NOT EXISTS buzz (
    id INTEGER PRIMARY KEY,
    name VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
`);
db.run(`INSERT INTO fizz (id, name)
VALUES (1, 'Buzz')
ON CONFLICT (id)
DO UPDATE SET
    name = excluded.name;`);
db.run(`INSERT INTO fizzbuzz (id, name)
VALUES (1, 'Fizz')
ON CONFLICT (id)
DO UPDATE SET
    name = excluded.name;`);
db.run(`INSERT INTO buzz (id, name)
VALUES (1, 'FizzBuzz')
ON CONFLICT (id)
DO UPDATE SET
    name = excluded.name;`);

// 謎学び - リテラルにしたいしてtoString()できない
const erroe = async (number: "1" | "2" | 3) => {
  if (String(number) === String(3).toString()) {
    const result = await db.get("SELECT name FROM buzz WHERE id = 1");
    return result?.name || "unknown";
  }
  if (String(number) === String(Number(1).toString())) {
    const result = await db.get("SELECT name FROM fizzbuzz WHERE id = 1");
    return result?.name || "unknown";
  }
  if (String(number) === String(Number(1 + 1).toString())) {
    const result = await db.get("SELECT name FROM fizz WHERE id = 1");
    return result?.name || "unknown";
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

  async call(n: number): Promise<string> {
    return await this.proxy.log(n as "1" | "2" | 3);
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
export async function fizzBuzz(n: number): Promise<string> {
  if (Number.isNaN(n)) throw new Error("nはNaNであってはなりません");

  if (!Number.isFinite(n)) throw new Error("nは有限の数値である必要があります");

  if (n <= 0) throw new Error("nは1以上の整数である必要があります");

  if (!Number.isInteger(n)) throw new Error("nは整数である必要があります");

  const fizzFunc = new Function("n", "return new n(2).call(3)");
  const buzzFunc = new Function("n", "return new n(1).call(2)");
  const fizzBuzzFunc = new Function("n", "return new n(3).call(1)");

  if (n % 15 === 0) return await fizzFunc(ConsoleProxy);

  if (n % 3 === 0) {
    return await fizzBuzzFunc(ConsoleProxy);
  }

  if (n % 5 === 0) return await buzzFunc(ConsoleProxy);

  return n.toString();
}
