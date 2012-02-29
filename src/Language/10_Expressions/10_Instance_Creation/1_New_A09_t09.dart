/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion For each instance variable f of i, if the variable declaration
 * of f has an initializer, then f is bound to that value
 * (which is necessarily a compile-time constant). Otherwise f is bound to null.
 * Next, the argument list (a1, ... , an, xn+1 : an+1, ... , xn+k : an+k) is
 * evaluated. Then, the initializer list of q is executed with respect to the bindings
 * that resulted from the evaluation of the argument list, and with this bound to
 * i and the type parameters (if any) of C bound to the actual type arguments
 * V1, ... , Vm. Finally, the body of q is executed with respect to the bindings that
 * resulted from the evaluation of the argument list. The result of the evaluation
 * of e is i.
 * @description Checks the order of a new expression with named constructor evaluation
 * taking into account the evaluation of the super constructor which is a redirecting one.
 * @author iefremov
 * @needsreview Issue 257, TODO: file issue on documentation, evaluation order of superclass body is not documented
 */

var evalOrder = "";
log(var s) {
  evalOrder += s;
}

class A {
  A() : this.a2();
  A.a2() {
    log("2");
  }
}

class B extends A {
  var v;
  B() : v = log("1"), super() {
    log("3");
  }

  B.b2() : super(), v = log("1") {
    log("3");
  }
}

main() {
  new B();
  Expect.equals("123", evalOrder, "Super constructor was not executed properly!");
  new B.b2();
  Expect.equals("123123", evalOrder, "Super constructor was not executed properly!");
}
