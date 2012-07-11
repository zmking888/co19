/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Constructs a Date instance based on the individual parts.
 * The date is in the local time zone if isUtc is false.
 * @description Checks the Date constructor with various correct parameters
 * @author hlodvig
 * @reviewer iefremov
 * @reviewer msyabro
 * @needsreview Should [:Date():] validate [day] according to [month]
 * (e.g. there is no September 31th)?
 * @needsreview issue 445
 */

check(int year, int month, int day, int hours, int minutes, int seconds, int milliseconds) {
  Date date = new Date(year, month, day, hours, minutes, seconds, milliseconds);
  String msg = 'actual date is ${date.year}-${date.month}-${date.day} ${date.hour}:${date.minute}:${date.second}:${date.millisecond}';
  Expect.equals(year, date.year, msg);
  Expect.equals(month, date.month, msg);
  Expect.equals(day, date.day, msg);
  Expect.equals(hours, date.hour, msg);
  Expect.equals(minutes, date.minute, msg);
  Expect.equals(seconds, date.second, msg);
  Expect.equals(milliseconds, date.millisecond, msg);
  Expect.isTrue(date is Date);
}

main() {
  check(2001, 1, 2, 3, 4, 5, 6);
  check(-2000, 1, 2, 0, 0, 0, 0); //2000 B.C.?
  check(0, 1, 1, 0, 0, 0, 0);
  check(2001, 2, 30, 0, 0, 0, 0);
  check(2001, 2, 29, 0, 0, 0, 0);
  check(2001, 9, 31, 0, 0, 0, 0);
  check(2001, 1, 1, 24, 0, 0, 0); //Why is this allowed and why is [:day:] automatically increased?
  check(0x7fffffffffffffff, 12, 31, 24, 59, 59, 999);
}
