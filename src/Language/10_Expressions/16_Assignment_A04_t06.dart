/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Evaluation of an assignment of the form C.v = e proceeds as follows:
 * The expression e is evaluated to an object o. Then, the setter C.v is invoked
 * with its formal parameter bound to o. The value of the assignment expression
 * is o.
 * It is a compile-time error if there is no class C in the enclosing lexical scope
 * of assignment, or if C does not declare, implicitly or explicitly, a setter v. In
 * checked mode, it is a dynamic type error if o is not null and the interface
 * induced by the class of o is not a subtype of the static type of C.v.
 * It is a static type warning if the static type of e may not be assigned to the
 * static type of C.v.
 * @description Checks that it is a dynamic type error if o is not null and
 * the interface induced by the class of o is not a subtype of the static type of C.v.
 * @author msyabro
 * @reviewer kaigorodov
 */

#import("../../Utils/dynamic_check.dart");

f(x) {return x;}

class A {}
class B extends A {}

class C {
  static int v;
  static B b;
}

main() {
  checkTypeError( () {
    C.v = f(true); //to avoid static warning
  });
  checkTypeError( () {
    C.v = f(""); //to avoid static warning
  });
  checkTypeError( () {
    C.v = f(0.2); //to avoid static warning
  });
  checkTypeError( () {
    C.b = f(new A()); //to avoid static warning
  });
}