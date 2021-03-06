/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion int operator [](int index)
 * Returns the element at the given index in the list.
 * @description Checks that the element at the given index is returned.
 * @author msyabro
 */
import "dart:typed_data";
import "../../../Utils/expect.dart";

pack(v) => new Float32x4.splat(v);

equal(obj1, obj2) {
  var res = obj1.equal(obj2);
  return res.flagX && res.flagY && res.flagZ && res.flagW;
}

check(list) {
  var l = new Float32x4List.fromList(list);
  for(int i = 0; i < list.length; ++i) {
    Expect.isTrue(equal(l.elementAt(i), l[i]));
  }
}

main() {
  check([]);
  check([pack(1.0)]);
  var list = new List(255);
  for(int i = 0; i < 255; ++i) {
    list[i] = pack(i*1.0);
  }
  check(list);
}
