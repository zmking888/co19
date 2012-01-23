/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Adds [obj] to the buffer. Returns [this].
 * @description Tries to pass null or an object that isn't a String as argument,
 *              correct string conversion expected ("null" in case of null)
 * @author msyabro
 * @reviewer rodionov
 * @needsreview undocumented
 */

main() {
  StringBuffer sb = new StringBuffer();
  sb.add(null);
  Expect.equals("null", sb.toString());
  sb.add(1);
  Expect.equals("null1", sb.toString());
  sb.add(true);
  Expect.equals("null1true", sb.toString());
}