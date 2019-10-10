export default class Calculator {
  static sum(args: number[]): number {
    const result = args.reduce((previousValue, currentValue) => previousValue + currentValue, 0);

    return result;
  }
}
