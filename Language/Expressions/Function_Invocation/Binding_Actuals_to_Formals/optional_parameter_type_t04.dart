/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Let Ti be the static type of ai, let Si be the type of pi,
 * i ∈ 1..h+k and let Sq be the type of the named parameter q of f.
 * . . .
 * It is a static warning if Tm+j may not be assigned to Sqj, j ∈ 1..l.
 * @description Checks that it is a static warning if the type of an actual
 * argument may not be assigned to the type of an optional parameter of a
 * static method.
 * @static-warning
 * @author msyabro
 * @reviewer iefremov
 */

import '../../../../Utils/dynamic_check.dart';

class C {
  static func([int x]) {}

  test() {
    checkTypeError(() => func ('')); /// static type warning
  }
}

main() {
  new C().test();
}
