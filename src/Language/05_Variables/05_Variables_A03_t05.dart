/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A final variable is a variable whose declaration includes the modifier final. 
 * A final variable can only be assigned once, when it is initialized, or a compile-time error occurs.
 * @description Checks that a compile-time error occurs if local typed final variable is redefined.
 * @author msyabro
 * @compile-error
 */

main() {
  try {
    final String foo = "foo";
    foo = "bar";  // error
  } catch(var x){}
}
