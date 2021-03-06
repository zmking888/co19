/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion dynamic fold(initialValue, combine(previousValue, E element))
 * Reduces a collection to a single value by iteratively combining each
 * element of the collection with an existing value using the provided function.
 * Use initialValue as the initial value, and the function combine
 * to create a new value from the previous one and an element.
 * @description Checks that the returned value is correct.
 * @author msyabro
 */
import "dart:typed_data";
import "../../../Utils/expect.dart";

pack(v) => new Float32x4.splat(v);

checkInt(list, expected) {
  var l = new Float32x4List.fromList(list);
  var res = l.fold(0, (prev, cur) => prev + cur.x+ cur.y + cur.z + cur.w);
  Expect.equals(expected, res);
}

checkString(list, expected) {
  var l = new Float32x4List.fromList(list);
  var res = l.fold("", (prev, cur) => "${prev}${cur.w + cur.z}");
  Expect.equals(expected, res);
}

checkConst(list, expected) {
  var l = new Float32x4List.fromList(list);
  var res = l.fold(0, (prev, cur) => 1);
  Expect.equals(expected, res);
}


main() {
  checkInt([], 0);
  checkInt([pack(1.0), pack(2.0), pack(3.0), pack(4.0), pack(5.0), pack(6.0),
    pack(7.0), pack(8.0), pack(9.0), pack(10.0)], 220.0);
  checkInt([pack(10.0), pack(-1.0), pack(-2.0), pack(-3.0), pack(-4.0)], 0.0);

  checkString([], "");
  checkString([pack(1.0)], "2.0");
  checkString([pack(1.0), pack(2.0), pack(3.0), pack(4.0), pack(5.0)], "2.04.06.08.010.0");

  checkConst([], 0);
  checkConst([pack(1.0), pack(2.0), pack(3.0)], 1);
}
