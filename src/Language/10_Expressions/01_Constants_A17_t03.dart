/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a compile-time error if the value of a compile-time constant expression
 * depends on itself
 * @description Checks that it is a compile-time error if a final instance field depends on
 * a const constructor and vice versa.
 * @author iefremov
 * @compile-error
 */

class A {
  const A();
  final m = const A();
}


main() {
  try {
    const A();
  } catch(var x) {}
}
