/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Interface Date extends Comparable.
 * @description Checks that Date is Comparable and has .compareTo() method.
 * @author hlodvig
 * @reviewer iefremov
 * @reviewer msyabro
 */


main() {
  Expect.isTrue(new Date(2001, 8, 18, 0, 0, 0, 0) is Comparable);
  Expect.isTrue(new Date(2001, 8, 18, 0, 0, 0, 0).compareTo(new Date(2001, 8, 18, 0, 0, 0, 0)) == 0);
}