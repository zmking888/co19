/*
 * Copyright (c) 2015, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Evaluation of a property extraction i of the form e.m proceeds
 * as follows: ...
 * Let T be the static type of e. It is a static type warning if T does not
 * have a method or getter named m
 * @description Check that it is a static type warning if type T
 * does not have a static method or getter named m
 * @static-warning
 * @author sgrekhov@unipro.ru
 */
import '../../../../Utils/expect.dart';

class C {
}

main() {
  Expect.throws(() { C.m; }); /// static type warning
}
