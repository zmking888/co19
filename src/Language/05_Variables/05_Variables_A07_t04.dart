/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A constant variable is a variable whose declaration includes the modifier
 * const. A constant variable is always implicitly final.
 * @description Checks that a compile-time error occurs if a global typed constant variable is redefined.
 * @compile-error
 * @author msyabro
 * @reviewer iefremov
 */

const int foo = 1 + 1;

main() {
  try {
    foo = 2;
  } catch(ok) {}
}