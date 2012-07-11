/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Constructs a new Date instance with current date time value
 * in the local time zone.
 * @description Checks that the constructed date uses the local time zone.
 * @author iefremov
 */

main(){
  Date d = new Date.now();
  Expect.identical(d, d.toLocal());
}
