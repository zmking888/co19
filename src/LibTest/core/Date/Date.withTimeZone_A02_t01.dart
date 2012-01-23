/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Date.withTimeZone(int year, int month, int day, int hours, int minutes, int seconds, int milliseconds, TimeZone timeZone) is not a const constructor
 * @description Checks that Date.withTimeZone constructor cannot be [:const:] 
 * @compile-error
 * @author hlodvig
 * @reviewer msyabro
 */

main() {
  Date d = const Date.withTimeZone(2001, 1, 2, 3, 4, 5, 6, const TimeZone.utc());
}
  