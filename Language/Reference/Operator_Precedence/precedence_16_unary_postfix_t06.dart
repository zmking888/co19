/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion
 * Description    Operator                          Associativity Precedence
 * Unary postfix  ., ?., e++, e–-, e1[e2], e1(), ()  None           16
 * @description Test that . unary postfix operator have highest precedence (16).
 * Compare with Unary prefix (precedence 15). Test that 'e()' has priority
 * higher than -
 * @author sgrekhov@unipro.ru
 */
import "../../../Utils/expect.dart";

int e() => 1;

main() {
  Expect.equals(-1, -e());
}
