/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion num operator %(num other) 
 * The % operator yields the remainder of its operands from an implied division;
 * the left operand is the dividend and the right operand is the divisor.
 * @description Checks that this operator returns correct value for double
 *              arguments (including special values) and that it is double.
 * @author rodionov
 * @reviewer pagolubev
 * @needsreview modulo operation is not specified (issue 493).
 */
import "../../../Utils/expect.dart";

import "dart:math" as Math;

main() {
  check(0.0, 1, 0.5);
  check(0.0, 1, -0.5);

  check(0.25, 1, 0.375);
  check(0.25, 1, -0.375);
  check(0.125, -1, 0.375);
  check(0.125, -1, -0.375);

  final double MIN_DOUBLE = Math.pow(2.0, -1074);
  final double NEG_MIN_DOUBLE = -1 * MIN_DOUBLE; 
  final double MAX_DOUBLE = (2 - Math.pow(2.0, -52)) * Math.pow(2.0, 1023);
  final double NEG_MAX_DOUBLE = -1 * MAX_DOUBLE; 

  check(0, 0, MIN_DOUBLE);
  check(0, 0, NEG_MIN_DOUBLE);
  check(0, 0, MAX_DOUBLE);
  check(0, 0, NEG_MAX_DOUBLE);
  check(1, 1, MAX_DOUBLE);
  check(1, 1, NEG_MAX_DOUBLE);
  check(1, 1, double.INFINITY);
  check(double.INFINITY, -1, double.INFINITY);
  check(1, 1, double.NEGATIVE_INFINITY);
  check(double.INFINITY, -1, double.NEGATIVE_INFINITY);
  check(0x1000000000000000000000, 0x1000000000000000000000, double.INFINITY);
  check(double.INFINITY, -0x1000000000000000000000, double.INFINITY);
  check(0x1000000000000000000000, 0x1000000000000000000000, double.NEGATIVE_INFINITY);
  check(double.INFINITY, -0x1000000000000000000000, double.NEGATIVE_INFINITY);
  
  Expect.isTrue((1 % double.NAN).isNaN);
  Expect.isTrue((0x1000000000000000000000 % double.NAN).isNaN);
  Expect.isTrue(((-0x1000000000000000000000) % double.NAN).isNaN);
}

void check(num ex, int a, double b) {
  Expect.equals(ex, a % b);
  Expect.isTrue((a % b) is double);
}
