/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion An equality expression of the form super !== e is
 * equivalent to the expression !(super === e).
 * @description Checks that an expression of the form super !== e
 * is equivalent to the expression !(super === e).
 * @author msyabro
 * @needsreview issue 1242
 * @reviewer kaigorodov
 */

class S {}

class A extends S {
  test() {
    Expect.isFalse(super !== this);
    Expect.isTrue(super !== new S());
    Expect.isTrue(super !== new A());
  }
}

main() {
  A a = new A();
  a.test();
}
