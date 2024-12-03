import 'dart:io';

import 'package:lua_dardo/lua.dart';
import 'package:test/test.dart';

void main() {
  test('Empty return statement exits function early', () {
    Directory.current = './test/block/';

    final ls = LuaState.newState();
    ls.openLibs();
    ls.doFile("empty_return.lua");

    ls.getGlobal("empty_return");
    ls.pCall(0, 0, 1);

    ls.getGlobal("x");
    final result = ls.toBoolean(-1);
    expect(result, true);
  });
}
