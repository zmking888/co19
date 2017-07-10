/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The effect of a static setter declaration in class C is to add
 * an instance setter with the same name and signature to the Type object for
 * class C that forwards to the static setter.
 * @description Check that the instance setter, added to the Type object by
 * static setter declaration, is not added to Type object of this class
 * and not added to the Type of the ancestor
 * @static-warning
 * @author sgrekhov@unipro.ru
 * @issue 23721
 */

import "../../../Utils/expect.dart";

abstract class A<V> {
  set s1(int value) => {};
  static set s2(int value) => {};
  static int set s3(int value) {return 3;} /// static type warning
  V set s4(V value) {} /// static type warning
  static set s5(value) {}
  static String set s6(value) {return null;} /// static type warning
}

class C<V> extends A<V> {
  static int _s8;
  static String set s6(value) {return "";} /// static type warning
  static int set s7(int value) {return 7;} /// static type warning
  static set s8(int value) => _s8 = value;
}

main() {
  C c = new C<String>();
  dynamic t = c.runtimeType;

  Expect.throws(() {t.s1 = 1;}, (e) => e is NoSuchMethodError);
  Expect.throws(() {t.s2 = 1;}, (e) => e is NoSuchMethodError);
  Expect.throws(() {t.s3 = 1;}, (e) => e is NoSuchMethodError);
  Expect.throws(() {t.s4 = 1;}, (e) => e is NoSuchMethodError);
  Expect.throws(() {t.s5 = 1;}, (e) => e is NoSuchMethodError);
  Expect.throws(() {t.s6 = 1;}, (e) => e is NoSuchMethodError);
  Expect.throws(() {t.s7 = 1;}, (e) => e is NoSuchMethodError);
}