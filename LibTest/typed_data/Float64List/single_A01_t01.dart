/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion final E single
 * Returns the single element in this.
 * @description Checks that the single element of a list is returned.
 * @author msyabro
 */
import "dart:typed_data";
import "../../../Utils/expect.dart";

main() {
  var l;

  l = new Float64List.fromList([0.0]);
  Expect.equals(0.0, l.single);
  l = new Float64List.fromList([127.0]);
  Expect.equals(127.0, l.single);
  l = new Float64List.fromList([-1.0]);
  Expect.equals(-1.0, l.single);
}
