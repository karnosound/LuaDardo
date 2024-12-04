import 'package:lua_dardo/lua.dart';
import 'package:test/test.dart';

void main() {
  test('tokenize hexadecimal numbers', () {
    final ls = LuaState.newState();

    ls.doString("return 0x21dEaDbEeF");
    expect(ls.toNumber(-1), 0x21deadbeef);

    ls.doString("return 0X21DeAdBeEf");
    expect(ls.toNumber(-1), 0x21deadbeef);

    expect(() => ls.doString("return 21DeAdBeEf"), throwsA(isA<Exception>()));
  });

  test('tokenize numbers with exponents', () {
    final ls = LuaState.newState();

    ls.doString("return 21.42e6");
    expect(ls.toNumber(-1), 21.42e6);

    ls.doString("return 21.42e+6");
    expect(ls.toNumber(-1), 21.42e+6);

    ls.doString("return 21.42E-6");
    expect(ls.toNumber(-1), 21.42E-6);

    expect(() => ls.doString("return 21.42E-6e4"), throwsA(isA<Exception>()));
  });
}
