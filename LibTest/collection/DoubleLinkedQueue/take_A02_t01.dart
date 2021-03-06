/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Iterable<E> take(int n)
 * It is an error if n is negative.
 * @description checks that an Error is thrown if n is negative.
 * @author kaigorodov
 */

import "dart:collection";
import "dart:math" as Math;
import "../../../Utils/expect.dart";

check(List a, int n) {
  DoubleLinkedQueue queue = new DoubleLinkedQueue.from(a);
  Iterable res;
  Expect.throws(() {
      res=queue.take(n);
    },
    (e)=> e is Error
  );
}

main() {
  check([1,2,-3,4], -1);
  check(const[1,2,-5,-6, 100], -1);
  check(const[null,2,-5,-6, 100], -1000);
}