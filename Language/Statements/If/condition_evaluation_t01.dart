/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Execution of an if statement of the form if (b) s1 else s2
 * proceeds as follows:
 * First, the expression b is evaluated to an object o. Then, o is subjected to
 * boolean conversion, producing an object r.
 * @description Checks that a dynamic type error occurs in checked mode
 * if the expression does not evaluate to a value of type bool.
 * @author kaigorodov
 * @reviewer rodionov
 */
import '../../../Utils/expect.dart';
import '../../../Utils/dynamic_check.dart';

main() {
  var o = 1;
  var i = null;
  checkTypeError(() {
    if (o) {i = "hello";}
  });
  Expect.isNull(i);
}
