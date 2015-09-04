/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A non-final variable declaration of the form T v;
 * or the form T v = e; always induces an implicit setter function 
 * with signature
 *   void set v = (T x)
 * whose execution sets the value of v to the incoming argument x.
 * @description Checks that the formal parameter type of this implicit setter
 * is correct and the same as the type of the static variable by attempting to
 * pass a value of incompatible type (String) to it. Static warning expected.
 * @static-warning
 * @author pagolubev
 * @reviewer msyabro
 * @reviewer rodionov
 */
import "../../Utils/dynamic_check.dart";

class A {
  static int a = 1;
}

main() {
  checkTypeError(() {
    A.a = '1'; /// static type warning 'String' is not assignable to 'int'
  });
}