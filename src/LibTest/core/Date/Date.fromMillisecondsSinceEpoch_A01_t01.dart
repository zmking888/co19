/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Constructs a new Date instance with the given millisecondsSinceEpoch.
 * If isUtc is false then the date is in the local time zone.
 * The constructed Date represents 1970-01-01T00:00:00Z + millisecondsSinceEpoch ms
 * in the given time zone (local or UTC).
 * @description Checks that a new Date object is properly constructed using the UTC time zone.
 * @author hlodvig
 */

void check(dt, y, m, d, h, min, sec, ms, tz){
  Expect.equals(y, dt.year);
  Expect.equals(m, dt.month);
  Expect.equals(d, dt.day);
  Expect.equals(h, dt.hour);
  Expect.equals(min, dt.minute);
  Expect.equals(sec, dt.second);
  Expect.equals(ms, dt.millisecond);
  
  if(tz) {
    Expect.identical(dt, dt.toUtc());
  } else {
    Expect.identical(dt, dt.toLocal());  
  }
}

main() {
  check(new Date.fromMillisecondsSinceEpoch(0, true), 1970, 1, 1, 0, 0, 0, 0, true);
  check(new Date.fromMillisecondsSinceEpoch(1, true), 1970, 1, 1, 0, 0, 0, 1, true);
  check(new Date.fromMillisecondsSinceEpoch(1000, true), 1970, 1, 1, 0, 0, 1, 0, true);
  check(new Date.fromMillisecondsSinceEpoch(1000*60, true), 1970, 1, 1, 0, 1, 0, 0, true);
  check(new Date.fromMillisecondsSinceEpoch(1000*60*60, true), 1970, 1, 1, 1, 0, 0, 0, true);
  check(new Date.fromMillisecondsSinceEpoch(1000*60*60*24, true), 1970, 1, 2, 0, 0, 0, 0, true);
  check(new Date.fromMillisecondsSinceEpoch(-1, true), 1969, 12, 31, 23, 59, 59, 999, true);
  check(new Date.fromMillisecondsSinceEpoch(-1000, true), 1969, 12, 31, 23, 59, 59, 0, true);
  check(new Date.fromMillisecondsSinceEpoch(-1000*60, true), 1969, 12, 31, 23, 59, 0, 0, true);
  check(new Date.fromMillisecondsSinceEpoch(-1000*60*60, true), 1969, 12, 31, 23, 0, 0, 0, true);
  check(new Date.fromMillisecondsSinceEpoch(-1000*60*60*24, true), 1969, 12, 31, 0, 0, 0, 0, true);
}

