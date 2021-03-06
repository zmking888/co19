/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion  abstract double ceilToDouble()
 * Returns this.toDouble().
 * @description Checks that this method same value as this.toDouble();
 * for very large integers).
 * @author vasya
 * @reviewer msyabro
 */
import "../../../Utils/expect.dart";

import "dart:math" as Math;

void check(int x) {
  Expect.equals(x.toDouble(), x.ceilToDouble());
}

main() {
  final double MIN_DOUBLE = Math.pow(2.0, -1074);
  final double NEG_MIN_DOUBLE = -1 * MIN_DOUBLE; 
  final double MAX_DOUBLE = (2 - Math.pow(2.0, -52)) * Math.pow(2.0, 1023);
  final double NEG_MAX_DOUBLE = -1 * MAX_DOUBLE; 

  check(0);
  check(2147483647);
  check(-2147483648);
  check(4294967295);
  check(-4294967296);
  check(9223372036854775807);
  check(-9223372036854775808);
  check(-18446744073709551617);
  check(1 << 1024);
  check(1 << 1124);
  check(-(1 << 1024));
  check(-(1 << 1124));
  check(179769313486231570814527423731704356798070567525844996598917476803157260780028538760589558632766878171540458953514382464234321326889464182768467546703537516986049910576551282076245490090389328944075868508455133942304583236903222948165808559332123348274797826204144723168738177180919299881250404026184124858368);
  check(-179769313486231570814527423731704356798070567525844996598917476803157260780028538760589558632766878171540458953514382464234321326889464182768467546703537516986049910576551282076245490090389328944075868508455133942304583236903222948165808559332123348274797826204144723168738177180919299881250404026184124858368);
}

