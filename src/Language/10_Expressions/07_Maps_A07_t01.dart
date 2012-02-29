/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A runtime map literal <V>{k1:e1... kn :en}  is evaluated as follows:
 *   First, the expressions e1...en are evaluated in left to right order, yielding objects o1... on.
 *   A fresh instance m that implements the built-in interface Map<String, V> is allocated.
 *   Let ui be the value of the compile-time constant string specified by ki.
 * An entry with key ui and value oi is added to m, 0 <= i < n.
 *   The result of the evaluation is m.
 * @description Checks that values in a map literal are evaluated in order from left to right.
 * @author msyabro
 * @needsreview issue 1478
 * @reviewer kaigorodov
 */

var evalOrder;

f(number) {
  evalOrder += number.toString();
}

main() {
  evalOrder = "";
  <Object>{"k1" : f(1), "k2" : f(2), "k3" : f(3)};
  Expect.equals("123", evalOrder);
}
