/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description 
 */
import "dart:html";
import "../../testcommon.dart";
import "../../../Utils/async_utils.dart";
import "pwd.dart";

main() {
  document.body.setInnerHtml('''
      <p>Test for Bug 41737. PASS unless crash.</p>
      <keygen style='padding: 10000; border-radius: 1;'></keygen>
      ''', treeSanitizer: new NullTreeSanitizer());
}
