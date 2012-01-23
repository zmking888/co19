/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A final variable is a variable whose declaration includes the modifier final. 
 * A final variable can only be assigned once, when it is initialized, or a compile-time error occurs.
 * @description Checks that a compile-time error occurs if a global final variable is not assigned.
 * @author kaigorodov
 * @reviewer iefremov
 * @compile-error
 * @needsreview issue 991
 */

final foo;

main() {
  try {
    Expect.equals(null, foo);
  } catch(var x){}
}
