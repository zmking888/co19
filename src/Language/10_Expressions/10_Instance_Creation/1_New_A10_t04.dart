/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion If q is a redirecting constructor, then: The argument list
 * (a1, ... , an, xn+1 : an+1, ... , xn+k : an+k) is evaluated. Then, the redirect clause
 * of q is executed with respect to the bindings that resulted from the evaluation
 * of the argument list and the type parameters (if any) of C bound to the actual
 * type arguments V1, ... , Vm resulting in an object i that is necessarily the result
 * of another constructor call. The result of the evaluation of e is i.
 * @description Checks that result of an expression i is
 * the result of C.redirected constructor.
 * @author msyabro
 */

class A {
  A(): this.redirected();
  A.redirected(): x = 1, y = 2, z = 3 {}
  var x;
  var y;
  var z;
}

class B {
  B(): x = 0, y = 0, z = 0 {}
  B.name(): this.redirected();
  B.redirected(): x = true, y = false, z = 0 {}
  var x;
  var y;
  var z;
}

main() {
  var o = new A();
  Expect.equals(1, o.x);
  Expect.equals(2, o.y);
  Expect.equals(3, o.z);

  o = new B.name();
  Expect.equals(true, o.x);
  Expect.equals(false, o.y);
  Expect.equals(0, o.z);
}