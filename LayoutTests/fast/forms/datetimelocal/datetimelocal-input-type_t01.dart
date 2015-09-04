/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Tests for writing and reading .type property of
 * HTMLInputElement.
 */
import "dart:html";
import "../../../testcommon.dart";
import "../../../../Utils/async_utils.dart";

main() {
  var input = document.createElement('input');
  document.body.append(input);

  check(value, expected) {
    input.type = value;
    if (input.type == expected)
      testPassed('input.type for "' + value + '" is correctly "' + input.type + '".');
    else
      testFailed('input.type for "' + value + '" is incorrectly "' + input.type + '", should be "' + expected + '".');
  }

  check("datetime-local", "datetime-local");
  check("DATETIME-LOCAL", "datetime-local");
  check(" datetime-local ", "text");
  check("datetimelocal", "text");
  check("datetime_local", "text");
}