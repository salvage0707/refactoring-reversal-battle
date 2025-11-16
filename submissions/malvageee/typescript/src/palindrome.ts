/**
 * 回文チェック関数
 * 文字列が回文（前から読んでも後ろから読んでも同じ文字列）かどうかを判定する
 * 大文字小文字は区別しない
 *
 * @param str - チェックする文字列
 * @returns 回文の場合true、そうでない場合false
 * @throws {Error} strがnull、undefined、または文字列以外の場合
 */
export function palindrome(str: string): boolean {
  if (str === null || str === undefined) {
    throw new Error("strはnullまたはundefinedであってはなりません");
  }
  if (typeof str !== "string") {
    throw new Error("strは文字列である必要があります");
  }

  const normalized = str.toLowerCase();
  return normalized === normalized.split("").reverse().join("");
}
